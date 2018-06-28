Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f46.google.com ([209.85.208.46]:44716 "EHLO
        mail-ed1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752618AbeF1CmY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jun 2018 22:42:24 -0400
MIME-Version: 1.0
In-Reply-To: <20180625120304.7543-23-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-23-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 28 Jun 2018 10:42:01 +0800
Message-ID: <CAGb2v67DHtUDyPXKykz1LxehGZRJ2PzPC=1G7iW0hoMzD+6Juw@mail.gmail.com>
Subject: Re: [PATCH v3 22/24] drm/sun4i: DW HDMI: Expand algorithm for
 possible crtcs
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

On Mon, Jun 25, 2018 at 8:03 PM, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> drm_of_find_possible_crtcs() doesn't work when DW HDMI encoder is
> connected to TCON (crtc) through mux in TCON TOP.
>
> In that case TCON TOP HDMI mux input port has to be manually traversed
> and checked if it matches any known crtc.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
