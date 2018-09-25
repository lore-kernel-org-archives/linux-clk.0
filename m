Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35874 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbeIYQg4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Sep 2018 12:36:56 -0400
MIME-Version: 1.0
References: <20180925084940.27903-1-jagan@amarulasolutions.com>
In-Reply-To: <20180925084940.27903-1-jagan@amarulasolutions.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 25 Sep 2018 18:29:48 +0800
Message-ID: <CAGb2v64vzD5y5PMRscfWkdh+7b=KUJFf0chvOpsrw6XTg+_YYg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: allwinner: a64: Add display pipeline
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.io>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Sep 25, 2018 at 4:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Allwinner A64 have a display pipeline with 2 mixers/TCONs, the first
> TCON is connected to LCD and the second is to HDMI.
>
> The HDMI controller/PHY pair is similar to the one on H3/H5.
>
> Add all required device tree nodes of the display pipeline, including
> the TCON0 LCD one and the TCON1 HDMI one.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> [Icenowy: refactor commit message and add 1st pipeline]
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Merged both patches for 4.20. Thanks.
