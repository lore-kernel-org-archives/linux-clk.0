Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 9 Aug 2017 19:18:09 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 01/13] dt-bindings: update the binding for Allwinner H3
 DE2 support
Message-ID: <20170810001809.6xhloimtgwsg5j5d@rob-hp-laptop>
References: <20170801131304.7741-1-icenowy@aosc.io>
 <20170801131304.7741-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170801131304.7741-2-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 01, 2017 at 09:12:52PM +0800, Icenowy Zheng wrote:
> Allwinner H3 features a "Display Engine 2.0".
> 
> Add device tree bindings for the following parts:
> - H3 TCONs
> - H3 Mixers
> - H3 Display engine
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../bindings/display/sunxi/sun4i-drm.txt           | 25 ++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
