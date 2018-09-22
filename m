Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42460 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730087AbeIVT0F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Sep 2018 15:26:05 -0400
MIME-Version: 1.0
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
 <20180902072643.4917-10-jernej.skrabec@siol.net> <5b9f3f4d.1c69fb81.c776b.ee42@mx.google.com>
In-Reply-To: <5b9f3f4d.1c69fb81.c776b.ee42@mx.google.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 22 Sep 2018 21:32:13 +0800
Message-ID: <CAGb2v67yHpV042LW=iwBBNV7krauwCGX8CFh23nTNFsHkHXQqQ@mail.gmail.com>
Subject: Re: [PATCH 09/27] dt-bindings: display: sun4i-drm: Add H6 display
 engine compatibles
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        Archit Taneja <architt@codeaurora.org>,
        devicetree <devicetree@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Sep 17, 2018 at 1:44 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun,  2 Sep 2018 09:26:25 +0200, Jernej Skrabec wrote:
> > This commit adds compatibles used in H6 display pipeline, namely for
> > display engine, mixer and TV TCON.
> >
> > H6 display engine is somewhat similar to R40, just less TCONs and
> > mixer support more features.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> >  .../devicetree/bindings/display/sunxi/sun4i-drm.txt          | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
