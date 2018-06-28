Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailoutvs57.siol.net ([185.57.226.248]:59210 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751059AbeF1Er0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jun 2018 00:47:26 -0400
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
Subject: Re: [PATCH v3 09/24] drm/sun4i: Don't skip TCONs if they don't have channel 0
Date: Thu, 28 Jun 2018 06:45:56 +0200
Message-ID: <2676604.ZYCNkuCdbT@jernej-laptop>
In-Reply-To: <CAGb2v64EkVK+AEngEuadBzAZagyU7eyOhHhBh0iFrxS+-BbCYQ@mail.gmail.com>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-10-jernej.skrabec@siol.net> <CAGb2v64EkVK+AEngEuadBzAZagyU7eyOhHhBh0iFrxS+-BbCYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Dne četrtek, 28. junij 2018 ob 03:51:31 CEST je Chen-Yu Tsai napisal(a):
> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec@siol.net> 
wrote:
> > TV TCONs (channel 1 only) are always connected to TV or HDMI encoder.
> > Because of that, all output endpoints on such TCON node will point to a
> > encoder which is part of component framework.
> > 
> > Correct current graph traversing algorithm in such way that it doesn't
> > skip output enpoints with id 0 on TV TCONs.
> 
> No. Our bindings say that endpoint 0 _is_ channel 0. For TCONs that don't
> have channel 0, it must be skipped.

I'm not sure where this is stated. I read TCON binding again. Can you please 
point me to it?

So on TV TCONs on R40 (without channel 0) TVE would be endpoint 1 and HDMI 
endpoint 2 (or the other way around)?

Best regards,
Jernej



