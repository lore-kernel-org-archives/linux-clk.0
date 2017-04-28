Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 28 Apr 2017 12:52:57 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v5 01/11] dt-bindings: add binding for the Allwinner DE2
 CCU
Message-ID: <20170428175257.iob2i33fjfyrg7cv@rob-hp-laptop>
References: <20170423103754.50012-1-icenowy@aosc.io>
 <20170423103754.50012-2-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170423103754.50012-2-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, Apr 23, 2017 at 06:37:44PM +0800, Icenowy Zheng wrote:
> Allwinner "Display Engine 2.0" contains some clock controls in it.
> 
> In order to add them as clock drivers, we need a device tree binding.
> Add the binding here.
> 
> Also add the device tree binding headers.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v5:
> - Moved dt-binding headers here.
> - Changed dt-binding headers' license header to SPDX license.
> Changes in v4:
> - Dropped the leading 0 in clock at 1000000 .
> Changes in v3:
> - Fill the address space length of DE2 CCU to 0x100000, just reach the start of mixer0.
> 
>  .../devicetree/bindings/clock/sun8i-de2.txt        | 31 ++++++++++++++++++++++
>  include/dt-bindings/clock/sun8i-de2.h              | 18 +++++++++++++
>  include/dt-bindings/reset/sun8i-de2.h              | 14 ++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt
>  create mode 100644 include/dt-bindings/clock/sun8i-de2.h
>  create mode 100644 include/dt-bindings/reset/sun8i-de2.h

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
