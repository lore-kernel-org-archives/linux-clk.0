Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35587 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932090AbeF1CUS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jun 2018 22:20:18 -0400
MIME-Version: 1.0
In-Reply-To: <20180625120304.7543-16-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-16-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 28 Jun 2018 10:19:55 +0800
Message-ID: <CAGb2v66ytOrjMOK067URknens34jvYxJ1XoYmGMi4Ji0LYt9sQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/24] dt-bindings: display: sun4i-drm: Add description
 of A64 HDMI PHY
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
> A64 HDMI PHY is similar to H3 HDMI PHY except it has two possible PLL
> clock parents. It is compatible to other HDMI PHYs, like that found in
> R40.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> index 84fe38dbb900..dc83f21ef188 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> @@ -101,6 +101,7 @@ DWC HDMI PHY
>
>  Required properties:
>    - compatible: value must be one of:
> +    * allwinner,sun50i-a64-hdmi-phy
>      * allwinner,sun8i-a83t-hdmi-phy
>      * allwinner,sun8i-h3-hdmi-phy

Nit: the list is sorted by family first, then SoC name, so it should
be the last on the list.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

>    - reg: base address and size of memory-mapped region
> @@ -111,8 +112,9 @@ Required properties:
>    - resets: phandle to the reset controller driving the PHY
>    - reset-names: must be "phy"
>
> -H3 HDMI PHY requires additional clock:
> +H3 and A64 HDMI PHY require additional clocks:
>    - pll-0: parent of phy clock
> +  - pll-1: second possible phy clock parent (A64 only)
>
>  TV Encoder
>  ----------
> --
> 2.18.0
>
