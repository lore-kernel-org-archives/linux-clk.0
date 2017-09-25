Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:53476 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933052AbdIYKM0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Sep 2017 06:12:26 -0400
Date: Mon, 25 Sep 2017 18:12:09 +0800
In-Reply-To: <20170925101027.lghnnll4h6inreqm@flea.home>
References: <20170923001531.14285-1-icenowy@aosc.io> <20170925101027.lghnnll4h6inreqm@flea.home>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [PATCH 0/3] Simple DVFS support for Allwinner A64 SoC
To: Maxime Ripard <maxime.ripard@free-electrons.com>
CC: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <27EF78BD-6285-4D8D-AA65-8294D797E2FB@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



于 2017年9月25日 GMT+08:00 下午6:10:27, Maxime Ripard <maxime.ripard@free-electrons.com> 写到:
>Hi,
>
>On Sat, Sep 23, 2017 at 12:15:28AM +0000, Icenowy Zheng wrote:
>> This patchset imports simple DVFS support for Allwinner A64 SoC.
>> 
>> As the thermal sensor driver is not yet implemented and some boards
>> have still no AXP PMIC support, now only two OPPs are present --
>> 648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.
>> 
>> PATCH 1 is a fix to the CCU driver of A64, and the remaining patches
>> set up the device tree bits of the DVFS on Pine64.
>
>How has this been tested?
>
>What tasks did you run, with what governor, etc...

I only tested manual frequency switching between 648MHz and
816MHz, and tested the PLL stuck issue by change the OPPs to
some random value.

>
>Thanks!
>Maxime
