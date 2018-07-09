Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:29636 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933416AbeGIPzI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jul 2018 11:55:08 -0400
Subject: Re: [PATCH v5 2/5] clk: at91: add I2S clock mux driver
To: Stephen Boyd <sboyd@kernel.org>, <alexandre.belloni@bootlin.com>,
        <alsa-devel@alsa-project.org>, <boris.brezillon@bootlin.com>,
        <broonie@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <nicolas.ferre@microchip.com>, <robh+dt@kernel.org>
CC: <Cristian.Birsan@microchip.com>
References: <20180618141239.10892-1-codrin.ciubotariu@microchip.com>
 <20180618141239.10892-3-codrin.ciubotariu@microchip.com>
 <153090076533.143105.11588903392800697432@swboyd.mtv.corp.google.com>
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Message-ID: <b7a379b3-0cfe-7a8e-fa13-3d152beb5e32@microchip.com>
Date: Mon, 9 Jul 2018 18:55:01 +0300
MIME-Version: 1.0
In-Reply-To: <153090076533.143105.11588903392800697432@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06.07.2018 21:12, Stephen Boyd wrote:
> Quoting Codrin Ciubotariu (2018-06-18 07:12:36)
>> This driver is a simple muxing driver that controls the
>> I2S's clock input by using syscon/regmap to change the parent.
>> The available inputs can be peripheral clock and generated clock.
>>
>> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
>> ---
> 
> Applied to clk-next
> 
> But I had to fix:
> 
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> #56: FILE: drivers/clk/at91/clk-i2s-mux.c:1:
> +/* SPDX-License-Identifier: GPL-2.0 */
> 
> so I did. Please run checkpatch next time.
> 

Sorry about that. I did run checkpatch, but I saw some files that 
commented the License-Identifier the same way I did. Didn't notice back 
then that were only the headers...
Thank you for applying my patches.

Best regards,
Codrin
