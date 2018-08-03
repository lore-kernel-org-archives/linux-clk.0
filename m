Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36990 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbeHCNBF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Aug 2018 09:01:05 -0400
Date: Fri, 3 Aug 2018 14:05:11 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: kbuild-all@01.org, lee.jones@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, eballetbo@gmail.com,
        linus.walleij@linaro.org, mazziesaccount@gmail.com,
        dmitry.torokhov@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, broonie@kernel.org, linux-input@vger.kernel.org,
        mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
Subject: Re: [PATCH v11 1/2] mfd: bd71837: mfd driver for ROHM BD71837 PMIC
Message-ID: <20180803110511.GB20907@localhost.localdomain>
References: <77184f651e5cefb112f1061bc682b759f88144c6.1532946848.git.matti.vaittinen@fi.rohmeurope.com>
 <201808031831.TJYSQ80i%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <201808031831.TJYSQ80i%fengguang.wu@intel.com>
To: unlisted-recipients:; (no To-header on input)
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Aug 03, 2018 at 06:10:21PM +0800, kbuild test robot wrote:
> smatch warnings:
> drivers/mfd/rohm-bd718x7.c:163 bd71837_i2c_probe() warn: unsigned 'button.irq' is never less than zero.
> 
>    160		button.irq = regmap_irq_get_virq(bd71837->irq_data,
>    161						  BD71837_INT_PWRBTN_S);
>    162	
>  > 163		if (button.irq < 0) {
>    164			dev_err(&i2c->dev, "Failed to get the IRQ\n");
>    165			return button.irq;
>    166		}

Comparing unsiged to smaller-than-zero. These tools are handy! I'll fix
the errno check and send v12 in a minute... (or a bit more - but soonish
in any case =])

Br,
	Matti Vaittinen
