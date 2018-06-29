Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailoutvs47.siol.net ([185.57.226.238]:50459 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753026AbeF2TQg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Jun 2018 15:16:36 -0400
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>
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
Subject: Re: [linux-sunxi] [PATCH v3 06/24] drm/sun4i: Fix releasing node when enumerating enpoints
Date: Fri, 29 Jun 2018 21:15:06 +0200
Message-ID: <3837144.KdEe8HRubn@jernej-laptop>
In-Reply-To: <CAGb2v65dNvqcWa7MUMesrEeDGfEmd0xPpKQmbqJ60_FHe=Y_JA@mail.gmail.com>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-7-jernej.skrabec@siol.net> <CAGb2v65dNvqcWa7MUMesrEeDGfEmd0xPpKQmbqJ60_FHe=Y_JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Dne četrtek, 28. junij 2018 ob 03:53:36 CEST je Chen-Yu Tsai napisal(a):
> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec@siol.net> 
wrote:
> > sun4i_drv_add_endpoints() has a memory leak since it uses of_node_put()
> > when remote is equal to NULL and does nothing when remote has a valid
> > pointer.
> > 
> > Invert the logic to fix memory leak.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> Given this is a fix, it should have Fixes and stable tags.

How should be this handled given that the patch is already merged and cannot 
be dropped?

Best regards,
Jernej



