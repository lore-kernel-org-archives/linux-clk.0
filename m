Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 25 Jun 2018 11:33:17 -0600
From: Rob Herring <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: maxime.ripard@bootlin.com, wens@csie.org, airlied@linux.ie,
        gustavo@padovan.org, maarten.lankhorst@linux.intel.com,
        seanpaul@chromium.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 04/24] dt-bindings: display: sunxi-drm: Add TCON TOP
 description
Message-ID: <20180625173317.GA3691@rob-hp-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
 <20180625120304.7543-5-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180625120304.7543-5-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 25, 2018 at 02:02:44PM +0200, Jernej Skrabec wrote:
> TCON TOP main purpose is to configure whole display pipeline. It
> determines relationships between mixers and TCONs, selects source TCON
> for HDMI, muxes LCD and TV encoder GPIO output, selects TV encoder
> clock source and contains additional TV TCON and DSI gates.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../bindings/display/sunxi/sun4i-drm.txt      | 56 +++++++++++++++++++
>  include/dt-bindings/clock/sun8i-tcon-top.h    | 11 ++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 include/dt-bindings/clock/sun8i-tcon-top.h

Reviewed-by: Rob Herring <robh@kernel.org>
