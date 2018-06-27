Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:53548 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752011AbeF0UWF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Jun 2018 16:22:05 -0400
Date: Thu, 28 Jun 2018 04:21:30 +0800
In-Reply-To: <20180627183721.jmmsmp3u3mq4drvb@flea>
References: <20180622122615.55836-1-icenowy@aosc.io> <20180627183721.jmmsmp3u3mq4drvb@flea>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [PATCH v2 0/7] Allwinner A64 DE2 CCU support with dedicated DE2 bus driver
To: linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
CC: devicetree@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        linux-clk@vger.kernel.org
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <EB513C5E-4BBD-46B2-9B61-18ED0B14C0E4@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



于 2018年6月28日 GMT+08:00 上午2:37:21, Maxime Ripard <maxime.ripard@bootlin.com> 写到:
>On Fri, Jun 22, 2018 at 08:26:08PM +0800, Icenowy Zheng wrote:
>> This patchset tries to implement the Allwinner A64 DE2 as a bus
>driver,
>> in order to model the fact that the SRAM claim controls the access to
>> the whole DE2 memory space.
>> 
>> PATCH 1 and PATCH 4 are for the CCU part.
>> 
>> PATCH 2 is the device tree binding for the A64 DE2 bus, and PATCH 3
>> implements the bus driver.
>> 
>> PATCH 5 adds the DE2 CCU device tree node, with the DE2 bus node.
>> 
>> PATCH 6 and 7 are HDMI simplefb patches for A64. They're present as a
>> test to this patchset.
>
>Applied all the patches with the minor modifications Chen-Yu and I
>suggested.
>
>The threading was broken on your serie though, so you probably want to
>check your git configuration.

In fact I think I should check my ISP configuration.

The breakage is introduced due to too long delay between aosc.io
mail server and my computer, so I must start to send the
remaining patches again.

>
>Thanks!
>Maxime
