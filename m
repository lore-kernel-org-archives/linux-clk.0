Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20170222151854.3280-5-icenowy@aosc.xyz>
References: <20170222151854.3280-1-icenowy@aosc.xyz>
 <20170222151854.3280-5-icenowy@aosc.xyz>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 23 Feb 2017 17:44:54 +0000
Message-ID: <CACvgo5117BB+o429cH=X0t3xz_5=XZ65YCEdE=ro+895a9e=RA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/sun4i: add support for sun8i DE2 mixers and
 display engines
To: Icenowy Zheng <icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Jean-Francois Moine <moinejf@free.fr>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On 22 February 2017 at 15:18, Icenowy Zheng <icenowy@aosc.xyz> wrote:
> Allwinner have a new "Display Engine 2.0" in there new SoCs, which comes
> in a new "Display Engine" (mixers instead of old backends and
> frontends).
>
> Add support for the mixer on Allwinner V3s SoC; it's the simplest one.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  drivers/gpu/drm/sun4i/Kconfig       |   8 +
>  drivers/gpu/drm/sun4i/Makefile      |   1 +
>  drivers/gpu/drm/sun4i/sun4i_crtc.c  |   6 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c   |  38 +++-
>  drivers/gpu/drm/sun4i/sun4i_drv.h   |   1 +
>  drivers/gpu/drm/sun4i/sun4i_layer.c |  92 ++++++--
>  drivers/gpu/drm/sun4i/sun4i_layer.h |   1 +
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 417 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 133 ++++++++++++
>  9 files changed, 674 insertions(+), 23 deletions(-)
Silly question:

Does this series cover the same functionality/hardware as the separate
sun8i driver proposed a few months back ?
The diff stat looks quite different (~1.6k vs ~0.6k), although that
could be due to reusing the existing sun4i code.

Thanks
Emil

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
