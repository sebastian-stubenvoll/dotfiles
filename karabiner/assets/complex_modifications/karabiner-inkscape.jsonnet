local arr = [
              [x, y, z]  // 24x
              for x in ['s', 'd', 'e']  // solid, dotted, dashed
              for y in ['f', 'w', 'a', 'x']  // gray, white, arrow, double-arrow
              for z in ['g', 'v']  // thick, very thick
            ] +
            [
              [x, y]  // 18x
              for x in ['s', 'd', 'e']  // solid, dotted, dashed
              for y in ['f', 'w', 'g', 'v', 'a', 'x']
            ] +
            [
              ['spacebar', x]  // 6x
              for x in ['s', 'd', 'e', 'f', 'b', 'w']  // solid, dotted, dashed, gray, black, white
            ];

{
  title: 'Apply quickly essential shape or line styles in Inkscape using hammerspoon (Gilles Castel, 2019)',
  rules: [
    {
      description: 'Apply quickly essential shape or line styles in Inkscape using hammerspoon (Gilles Castel, 2019)',
      manipulators: [
        {
          local str = std.join('+', el),
          type: 'basic',
          from: {
            simultaneous: [{ key_code: i } for i in el],
            simultaneous_options: {
              key_up_when: 'all',
            },
          },
          to: [{ shell_command: "/usr/local/bin/hs -c 'create_svg_and_paste({\"" + std.join('","', el) + "\"});'" }],
          conditions: [{ type: 'frontmost_application_if', bundle_identifiers: ['org.inkscape.Inkscape'] }],
        }
        for el in arr
      ] + [
        {
          type: 'basic',
          from: {
            "modifiers": {
              "mandatory": [
                "left_control"
              ]
            },
            "key_code": "t",
          },
          to: [{ shell_command: "export PATH=\"/usr/local/bin:$PATH\" && ~/.config/inkscape/inkscape_vim"}],
          conditions: [{ type: 'frontmost_application_if', bundle_identifiers: ['org.inkscape.Inkscape'] }],
        },
        {
          type: 'basic',
          from: {
            "modifiers": {
              "mandatory": [
                "left_control"
              ]
            },
            "key_code": "s",
          },
          to: [{ shell_command: "SVGNAME=$(echo '‎'|/usr/local/bin/choose -m) && /usr/local/bin/hs -c \"save_style(\\\"$SVGNAME\\\");\""}],
          conditions: [{ type: 'frontmost_application_if', bundle_identifiers: ['org.inkscape.Inkscape'] }],
        },
        {
          type: 'basic',
          from: {
            "modifiers": {
              "mandatory": [
                "left_control"
              ]
            },
            "key_code": "a",
          },
          to: [{ shell_command: "SVGNAME=$(echo '‎'|/usr/local/bin/choose -m) && /usr/local/bin/hs -c \"save_object(\\\"$SVGNAME\\\");\""}],
          conditions: [{ type: 'frontmost_application_if', bundle_identifiers: ['org.inkscape.Inkscape'] }],
        },
        {
          type: 'basic',
          from: {
            "modifiers": {
              "mandatory": [
                "left_control"
              ]
            },
            "key_code": "w",
          },
          to: [{ shell_command: "SVGNAME=$(ls ~/.config/inkscape/styles|sed -e 's/\\.[^.]*$//'|/usr/local/bin/choose) && /usr/local/bin/hs -c \"paste_style(\\\"$SVGNAME\\\");\""}],
          conditions: [{ type: 'frontmost_application_if', bundle_identifiers: ['org.inkscape.Inkscape'] }],
        },
        {
          type: 'basic',
          from: {
            "modifiers": {
              "mandatory": [
                "left_control"
              ]
            },
            "key_code": "q",
          },
          to: [{ shell_command: "SVGNAME=$(ls ~/.config/inkscape/objects|sed -e 's/\\.[^.]*$//'|/usr/local/bin/choose) && /usr/local/bin/hs -c \"paste_object(\\\"$SVGNAME\\\");\""}],
          conditions: [{ type: 'frontmost_application_if', bundle_identifiers: ['org.inkscape.Inkscape'] }],
        }
      ],
    },
  ],
}
