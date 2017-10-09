Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:33737 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750790AbdJIHWz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Oct 2017 03:22:55 -0400
Date: Mon, 09 Oct 2017 15:22:50 +0800
In-Reply-To: <20171009071809.jte47cd2mt4iv6y7@flea.lan>
References: <20171006063333.12345-1-icenowy@aosc.io> <20171009071809.jte47cd2mt4iv6y7@flea.lan>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [PATCH 0/2] Add a regmap to Allwinner R40 CCU to export GMAC register
To: linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime.ripard@free-electrons.com>
CC: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <14505033-D960-4287-92F2-554E2EDDFC59@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



于 2017年10月9日 GMT+08:00 下午3:18:09, Maxime Ripard <maxime.ripard@free-electrons.com> 写到:
>On Fri, Oct 06, 2017 at 06:33:31AM +0000, Icenowy Zheng wrote:
>> In the CCU of the Allwinner R40 SoC, there's a GMAC configuration
>register,
>> which is intended to be accessed by the dwmac-sun8i driver. On SoCs
>already
>> supported by the driver the register is placed in the syscon rather
>than
>> the CCU.
>> 
>> As CCU is a critical part of the SoC, so write to it should be
>strictly
>> limited. A regmap with restricted write permission is created by the
>R40
>> CCU driver, and can be get with dev_get_regmap. In order to tie the
>regmap
>> to the CCU device, the R40 CCU is now a platform driver, so a
>platform
>> device is created for it (and then tied with the regmap).
>> 
>> The first patch does the conversion of the driver to a platform
>driver,
>> and the second patch adds the regmap.
>
>I'd like to see first what you want to do with it.

Export the GMAC configuration register to dwmac-sun8i.

>
>Maxime
