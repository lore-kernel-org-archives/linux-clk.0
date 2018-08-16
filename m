Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:40668 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390270AbeHPMD3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Aug 2018 08:03:29 -0400
Received: by mail-wm0-f65.google.com with SMTP id y9-v6so3640948wma.5
        for <linux-clk@vger.kernel.org>; Thu, 16 Aug 2018 02:06:22 -0700 (PDT)
Date: Thu, 16 Aug 2018 10:06:19 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, eballetbo@gmail.com,
        linus.walleij@linaro.org, mazziesaccount@gmail.com,
        dmitry.torokhov@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, broonie@kernel.org, linux-input@vger.kernel.org,
        mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
Subject: Re: [PATCH v12 2/2] mfd: bd71837: Devicetree bindings for ROHM
 BD71837 PMIC
Message-ID: <20180816090619.GD10054@dell>
References: <cover.1533292711.git.matti.vaittinen@fi.rohmeurope.com>
 <d053f54e5ce726ffaa95fbd9c20962a49dd1ee07.1533292711.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <d053f54e5ce726ffaa95fbd9c20962a49dd1ee07.1533292711.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, 03 Aug 2018, Matti Vaittinen wrote:

> Document devicetree bindings for ROHM BD71837 PMIC MFD.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt  | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
