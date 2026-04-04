# AimaneCouissi_HyvaBoxicons

[![Latest Stable Version](http://poser.pugx.org/aimanecouissi/module-hyva-boxicons/v)](https://packagist.org/packages/aimanecouissi/module-hyva-boxicons) [![Total Downloads](http://poser.pugx.org/aimanecouissi/module-hyva-boxicons/downloads)](https://packagist.org/packages/aimanecouissi/module-hyva-boxicons) [![Magento Version Require](https://img.shields.io/badge/magento-~2.4.0-E68718)](https://packagist.org/packages/aimanecouissi/module-hyva-boxicons) [![License](http://poser.pugx.org/aimanecouissi/module-hyva-boxicons/license)](https://packagist.org/packages/aimanecouissi/module-hyva-boxicons) [![PHP Version Require](http://poser.pugx.org/aimanecouissi/module-hyva-boxicons/require/php)](https://packagist.org/packages/aimanecouissi/module-hyva-boxicons) [![Hyvä Compatibility](https://img.shields.io/badge/hyv%C3%A4-compatible-99004D)](https://packagist.org/packages/aimanecouissi/module-hyva-boxicons)

Integrates the **[Boxicons](https://boxicons.com/)** free SVG icon set into **Hyvä Themes**, exposing `basic`, `filled`, and `brands` styles as dedicated `SvgIcons` view models. Browse the included icons in [the SVG directory](https://github.com/aimanecouissi/magento2-module-hyva-boxicons/tree/main/view/frontend/web/svg) or preview them at [boxicons.com](https://boxicons.com/icons?free=true).

> [!NOTE]
> This module only includes the **free** Boxicons set.

## Installation
```bash
composer require aimanecouissi/module-hyva-boxicons
bin/magento module:enable AimaneCouissi_HyvaSvgIcons AimaneCouissi_HyvaBoxicons
bin/magento setup:upgrade
bin/magento cache:flush
```

## Usage

### In Hyvä PHTML templates

Require the view models for the styles you need and call their helper methods to render icons:
```php
<?php

use AimaneCouissi\HyvaBoxicons\ViewModel\BoxiconsBasic;
use AimaneCouissi\HyvaBoxicons\ViewModel\BoxiconsBrands;
use AimaneCouissi\HyvaBoxicons\ViewModel\BoxiconsFilled;
use Hyva\Theme\Model\ViewModelRegistry;

/** @var ViewModelRegistry $viewModels */

$boxiconsBasic  = $viewModels->require(BoxiconsBasic::class);
$boxiconsFilled = $viewModels->require(BoxiconsFilled::class);
$boxiconsBrands = $viewModels->require(BoxiconsBrands::class);
?>
```
```php
<?= $boxiconsBasic->cartHtml('w-6 h-6', 24, 24, ['aria-label' => 'Cart']) ?>
<?= $boxiconsFilled->starHtml('w-5 h-5 text-yellow-400', 20, 20, ['aria-hidden' => 'true']) ?>
<?= $boxiconsBrands->instagramHtml('w-6 h-6', 24, 24, ['aria-label' => 'Instagram']) ?>
```

Methods are generated from SVG filenames and fully documented via PHPDoc on each view model, so your IDE can autocomplete them.

### In CMS content

The module registers three icon prefixes for Hyvä `SvgIcons`: `boxicons-basic`, `boxicons-filled`, and `boxicons-brands`. Icons can be used directly in CMS pages, blocks, and widgets:
```txt
{{icon "boxicons-basic/cart" classes="inline-block w-6 h-6" width=24 height=24}}
{{icon "boxicons-filled/star" classes="inline-block w-5 h-5 text-yellow-400" width=20 height=20}}
{{icon "boxicons-brands/instagram" classes="inline-block w-6 h-6" width=24 height=24}}
```

## Uninstall
```bash
bin/magento module:disable AimaneCouissi_HyvaBoxicons
composer remove aimanecouissi/module-hyva-boxicons
bin/magento setup:upgrade
bin/magento cache:flush
```

## Changelog

See [CHANGELOG](CHANGELOG.md) for all recent changes, including icon set version updates.

## License

The Boxicons SVG icons are created by [Boxicons](https://github.com/box-icons/boxicons) and licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

> [!WARNING]
> Individual brand icons may be subject to their own trademark and usage guidelines. Trademark usage is the responsibility of the end user. Please consult individual brand guidelines before displaying logos in commercial contexts.

This module's source code is separately licensed under [MIT](LICENSE).
