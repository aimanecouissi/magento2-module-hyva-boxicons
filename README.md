# AimaneCouissi_HyvaBoxicons

[![Latest Stable Version](http://poser.pugx.org/aimanecouissi/module-hyva-boxicons/v)](https://packagist.org/packages/aimanecouissi/module-hyva-boxicons) [![Total Downloads](http://poser.pugx.org/aimanecouissi/module-hyva-boxicons/downloads)](https://packagist.org/packages/aimanecouissi/module-hyva-boxicons) [![Latest Unstable Version](http://poser.pugx.org/aimanecouissi/module-hyva-boxicons/v/unstable)](https://packagist.org/packages/aimanecouissi/module-hyva-boxicons) [![License](http://poser.pugx.org/aimanecouissi/module-hyva-boxicons/license)](https://packagist.org/packages/aimanecouissi/module-hyva-boxicons) [![PHP Version Require](http://poser.pugx.org/aimanecouissi/module-hyva-boxicons/require/php)](https://packagist.org/packages/aimanecouissi/module-hyva-boxicons)

Add Boxicons 3.0 SVG icon pack to **Hyvä Themes**, with separate **solid** and **outline** styles exposed as `SvgIcons` view
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

The module registers two icon prefixes for Hyvä `SvgIcons` (`boxicons-solid` and `boxicons-outline`). You can use Boxicons directly in CMS pages, blocks, and widgets:

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
