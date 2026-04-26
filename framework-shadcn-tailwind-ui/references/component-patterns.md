# Shadcn + Tailwind Component Patterns

## Token Pass

Start with product tokens before page composition:

- radius scale for buttons, inputs, cards, dialogs, and tables
- foreground/background/muted/border/accent variables
- density choices for dashboards, tables, forms, and marketing sections
- motion durations and reduced-motion behavior

## Components To Prefer

- `Button` for commands and CTA hierarchy.
- `Input`, `Textarea`, `Select`, `Checkbox`, `Switch`, and field wrappers for forms.
- `Dialog`, `Sheet`, `Popover`, and `DropdownMenu` for layered interactions.
- `Table` for dense operational data instead of card grids.
- `Tabs` and segmented controls for mode switches.
- `Toast` or inline status regions for save and async feedback.

## Variant Guidance

Create or reuse variants when a visual state repeats:

- `intent`: primary, secondary, danger, quiet
- `density`: compact, default, spacious
- `state`: loading, invalid, selected, disabled
- `surface`: plain, raised, inset, highlighted

## Accessibility Checks

- Invalid fields need visible error text and `aria-invalid`.
- Icon buttons need accessible names.
- Dialogs and sheets need focus management.
- Menus and popovers must work by keyboard.
- Tables need headers and selection state that is announced.

## Verification Targets

- desktop and mobile screenshots
- hover and focus states for primary controls
- invalid and disabled states for forms
- empty and loading states for data views
- no horizontal overflow at common mobile widths
