# AimaneCouissi_HyvaBoxicons

Add Boxicons SVG icon pack to **Hyvä Themes**, with separate **solid** and **outline** styles exposed as `SvgIcons` view
models.

> This module is built specifically for **Hyvä** frontends and assumes you already have a working Hyvä theme.

## Installation

```bash
composer require aimanecouissi/module-hyva-boxicons
bin/magento module:enable AimaneCouissi_HyvaBoxicons
bin/magento setup:upgrade
bin/magento cache:flush
```

## Usage

### In Hyvä PHTML templates

Require the solid and outline view models and render icons via their helper methods:

```php
<?php

use AimaneCouissi\HyvaBoxicons\ViewModel\BoxiconsOutline;
use AimaneCouissi\HyvaBoxicons\ViewModel\BoxiconsSolid;
use Hyva\Theme\Model\ViewModelRegistry;

/** @var ViewModelRegistry $viewModels */
/** @var BoxiconsSolid $boxiconsSolid */
/** @var BoxiconsOutline $boxiconsOutline */

$boxiconsSolid = $viewModels->require(BoxiconsSolid::class);
$boxiconsOutline = $viewModels->require(BoxiconsOutline::class);
?>
```

```php
<?= $boxiconsSolid->homeHtml('w-6 h-6', 24, 24, ['aria-label' => 'Home (solid)']) ?>
<?= $boxiconsOutline->searchHtml('w-5 h-5', 20, 20, ['aria-label' => 'Search (outline)']) ?>
```

The available methods are generated from the SVG filenames and documented in the PHPDoc on each view model, so your IDE
can autocomplete them.

### In CMS content

If you configure Hyvä’s `SvgIcons` path prefixes to point to this module, you can also use Boxicons in CMS content:

```txt
{{icon "boxicons-solid/home" classes="inline-block w-6 h-6" width=24 height=24}}
{{icon "boxicons-outline/search" classes="inline-block w-5 h-5" width=20 height=20}}
```

## Uninstall

```bash
bin/magento module:disable AimaneCouissi_HyvaBoxicons
composer remove aimanecouissi/module-hyva-boxicons
bin/magento setup:upgrade
bin/magento cache:flush
```

## License

[MIT](LICENSE)
