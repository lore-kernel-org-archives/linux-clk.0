Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:51012 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbeIDNIw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 4 Sep 2018 09:08:52 -0400
Date: Tue, 04 Sep 2018 16:44:30 +0800
In-Reply-To: <CAGb2v65y1W=52SAFFqyCOnHd80nx+oPHUDeysHWBy7o8_g=eeQ@mail.gmail.com>
References: <20180902072643.4917-1-jernej.skrabec@siol.net> <20180902072643.4917-3-jernej.skrabec@siol.net> <CAGb2v65y1W=52SAFFqyCOnHd80nx+oPHUDeysHWBy7o8_g=eeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [linux-sunxi] Re: [PATCH 02/27] arm64: allwinner: h6: add system controller device tree node
To: wens@csie.org, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
CC: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <9915D9F1-1C60-4AEF-9074-CE040FCD7BF0@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



于 2018年9月4日 GMT+08:00 下午4:40:56, Chen-Yu Tsai <wens@csie.org> 写到:
>On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec@siol.net>
>wrote:
>>
>> From: Icenowy Zheng <icenowy@aosc.io>
>>
>> As we have already binding for the H6 system controller, add its node
>> to the device tree.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> [fixed compatible string]
>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>
>Reviewed-by: Chen-Yu Tsai <wens@csie.org>

By the way can these patches be applied first? (patches
related to syscon).

They're also needed for EMAC.
