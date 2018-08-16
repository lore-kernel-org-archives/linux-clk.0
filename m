Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37378 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390163AbeHPMDV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Aug 2018 08:03:21 -0400
Received: by mail-wm0-f68.google.com with SMTP id n11-v6so3613749wmc.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Aug 2018 02:06:14 -0700 (PDT)
Date: Thu, 16 Aug 2018 10:06:10 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, eballetbo@gmail.com,
        linus.walleij@linaro.org, mazziesaccount@gmail.com,
        dmitry.torokhov@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, broonie@kernel.org, linux-input@vger.kernel.org,
        mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
Subject: Re: [PATCH v12 1/2] mfd: bd71837: mfd driver for ROHM BD71837 PMIC
Message-ID: <20180816090610.GC10054@dell>
References: <cover.1533292711.git.matti.vaittinen@fi.rohmeurope.com>
 <4f49022ed8e4fa357bf5d213c57ad57752e72aa4.1533292711.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <4f49022ed8e4fa357bf5d213c57ad57752e72aa4.1533292711.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, 03 Aug 2018, Matti Vaittinen wrote:

> ROHM BD71837 PMIC MFD driver providing interrupts and support
> for three subsystems:
> - clk
> - Regulators
> - input/power-key
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  drivers/mfd/Kconfig              |  13 ++
>  drivers/mfd/Makefile             |   1 +
>  drivers/mfd/rohm-bd718x7.c       | 211 +++++++++++++++++++++++++
>  include/linux/mfd/rohm-bd718x7.h | 332 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 557 insertions(+)
>  create mode 100644 drivers/mfd/rohm-bd718x7.c
>  create mode 100644 include/linux/mfd/rohm-bd718x7.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
