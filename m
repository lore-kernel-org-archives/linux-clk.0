Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailoutvs60.siol.net ([185.57.226.251]:44541 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730198AbeGZTLI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jul 2018 15:11:08 -0400
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: linux-sunxi@googlegroups.com, icenowy@aosc.io
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH v3.1 01/10] clk: sunxi-ng: a64: Add minimal rate for video PLLs
Date: Thu, 26 Jul 2018 19:53:08 +0200
Message-ID: <3702695.8LDZkQ7hxA@jernej-laptop>
In-Reply-To: <20180726171257.6688-2-icenowy@aosc.io>
References: <20180726171257.6688-1-icenowy@aosc.io> <20180726171257.6688-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Dne četrtek, 26. julij 2018 ob 19:12:48 CEST je Icenowy Zheng napisal(a):
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> According to documentation and experience with other similar SoCs, video
> PLLs don't work stable if their output frequency is set below 192 MHz.
> 
> Because of that, set minimal rate to both A64 video PLLs to 192 MHz.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>


