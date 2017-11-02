Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:37360 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750836AbdKBHtO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 2 Nov 2017 03:49:14 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Thu, 02 Nov 2017 15:49:13 +0800
From: Icenowy Zheng <icenowy@aosc.io>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add a regmap to Allwinner R40 CCU to export GMAC
 register
In-Reply-To: <20171102071125.GL30645@codeaurora.org>
References: <20171006063333.12345-1-icenowy@aosc.io>
 <20171009071809.jte47cd2mt4iv6y7@flea.lan>
 <14505033-D960-4287-92F2-554E2EDDFC59@aosc.io>
 <20171102071125.GL30645@codeaurora.org>
Message-ID: <30ef499cba17ed6ccefcc22444fbf271@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

在 2017-11-02 15:11，Stephen Boyd 写道：
> On 10/09, Icenowy Zheng wrote:
>> 
>> 
>> 于 2017年10月9日 GMT+08:00 下午3:18:09, Maxime Ripard 
>> <maxime.ripard@free-electrons.com> 写到:
>> >On Fri, Oct 06, 2017 at 06:33:31AM +0000, Icenowy Zheng wrote:
>> >> In the CCU of the Allwinner R40 SoC, there's a GMAC configuration
>> >register,
>> >> which is intended to be accessed by the dwmac-sun8i driver. On SoCs
>> >already
>> >> supported by the driver the register is placed in the syscon rather
>> >than
>> >> the CCU.
>> >>
>> >> As CCU is a critical part of the SoC, so write to it should be
>> >strictly
>> >> limited. A regmap with restricted write permission is created by the
>> >R40
>> >> CCU driver, and can be get with dev_get_regmap. In order to tie the
>> >regmap
>> >> to the CCU device, the R40 CCU is now a platform driver, so a
>> >platform
>> >> device is created for it (and then tied with the regmap).
>> >>
>> >> The first patch does the conversion of the driver to a platform
>> >driver,
>> >> and the second patch adds the regmap.
>> >
>> >I'd like to see first what you want to do with it.
>> 
>> Export the GMAC configuration register to dwmac-sun8i.
>> 
> 
> Is this series going to be reposted?

Yes, thanks.
