Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45420 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752491AbeF1CW7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jun 2018 22:22:59 -0400
MIME-Version: 1.0
In-Reply-To: <20180625120304.7543-17-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-17-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 28 Jun 2018 10:22:36 +0800
Message-ID: <CAGb2v65En4RbVdRu7c6MJUztVhC36dWr0kaO9bqc9PtuXAcsww@mail.gmail.com>
Subject: Re: [PATCH v3 16/24] drm/sun4i: Enable DW HDMI PHY clock
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
> Current DW HDMI PHY code never prepares and enables PHY clock after it is
> created. It's just used as it is. This may work in some cases, but it's
> clearly wrong. Fix it by adding proper calls to enable/disable PHY
> clock.
>
> Fixes: 4f86e81748fe ("drm/sun4i: Add support for H3 HDMI PHY variant")
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

So why does it work on the H3? Because there's only one PLL that the whole
display pipeline uses?

We should probably tag this for stable. So,

Cc: <stable@vger.kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
