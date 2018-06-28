Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f53.google.com ([209.85.208.53]:37312 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751958AbeF1Bvy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jun 2018 21:51:54 -0400
MIME-Version: 1.0
In-Reply-To: <20180625120304.7543-10-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-10-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 28 Jun 2018 09:51:31 +0800
Message-ID: <CAGb2v64EkVK+AEngEuadBzAZagyU7eyOhHhBh0iFrxS+-BbCYQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/24] drm/sun4i: Don't skip TCONs if they don't have
 channel 0
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
> TV TCONs (channel 1 only) are always connected to TV or HDMI encoder.
> Because of that, all output endpoints on such TCON node will point to a
> encoder which is part of component framework.
>
> Correct current graph traversing algorithm in such way that it doesn't
> skip output enpoints with id 0 on TV TCONs.

No. Our bindings say that endpoint 0 _is_ channel 0. For TCONs that don't
have channel 0, it must be skipped.

ChenYu
