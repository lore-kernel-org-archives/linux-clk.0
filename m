Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39314 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbeG3M0V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jul 2018 08:26:21 -0400
Date: Mon, 30 Jul 2018 13:51:52 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        eballetbo@gmail.com, linus.walleij@linaro.org,
        mazziesaccount@gmail.com, dmitry.torokhov@gmail.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org, broonie@kernel.org,
        linux-input@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com,
        heikki.haikola@fi.rohmeurope.com
Subject: Re: [PATCH v11 1/2] mfd: bd71837: mfd driver for ROHM BD71837 PMIC
Message-ID: <20180730105152.GC8862@localhost.localdomain>
References: <cover.1532946848.git.matti.vaittinen@fi.rohmeurope.com>
 <77184f651e5cefb112f1061bc682b759f88144c6.1532946848.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <77184f651e5cefb112f1061bc682b759f88144c6.1532946848.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jul 30, 2018 at 01:43:34PM +0300, Matti Vaittinen wrote:
> ROHM BD71837 PMIC MFD driver providing interrupts and support
> for three subsystems:
> - clk
> - Regulators
> - input/power-key
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Please note that I maintained the acked-by line from Enric because the
patch version 11 mostly contains only trivial changes - and is not
touching the points Enric was originally concerned. Enric, please
let us know if this is not Ok for you.

Br,
	Matti Vaittinen

