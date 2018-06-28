Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38541 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752780AbeF1CJP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jun 2018 22:09:15 -0400
MIME-Version: 1.0
In-Reply-To: <20180625120304.7543-12-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-12-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 28 Jun 2018 10:08:51 +0800
Message-ID: <CAGb2v64VJ2Mxq7jS=rtUNFwE6BccdDcHPN7MvG0dLHnKoMNJow@mail.gmail.com>
Subject: Re: [PATCH v3 11/24] drm/sun4i: Don't check for LVDS and RGB when
 TCON has only ch1
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> LVDS and RGB interfaces are always connected to TCONs which have channel
> 0. It doesn't make sense to try to init them on TV TCONs.
>
> Add a check if TCON has channel 0 before trying to init LVDS or RGB
> interface.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Though I think at some point we could just have separate functions
to handle channel 0 and channel 1.

ChenYu
