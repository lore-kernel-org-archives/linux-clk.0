Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:50508 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731961AbeGaAuC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jul 2018 20:50:02 -0400
Date: Mon, 30 Jul 2018 17:12:44 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3.1 08/10] dt-bindings: sun4i-drm: add HDMI VCC supply
 property for sun8i-dw-hdmi
Message-ID: <20180730231244.GA3966@rob-hp-laptop>
References: <20180726171257.6688-1-icenowy@aosc.io>
 <20180726171257.6688-9-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180726171257.6688-9-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 27, 2018 at 01:12:55AM +0800, Icenowy Zheng wrote:
> Allwiner SoCs with DesignWare HDMI controller all come with a "HVCC"
> pin, which is the VCC of HDMI part.
> 
> Add a supply property to specify HVCC's regulator in the device tree.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v3.1:
> - New patch.
> 
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> index fdb8fb29033f..cb4769913e89 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> @@ -97,6 +97,9 @@ Required properties:
>      first port should be the input endpoint. The second should be the
>      output, usually to an HDMI connector.
>  
> +Optional properties:
> +  - hdmi-supply: the VCC power supply of the controller

"hdmi" doesn't sound like the name of the supply. "hvcc" or just "vcc" 
would be more appropriate.

Rob
