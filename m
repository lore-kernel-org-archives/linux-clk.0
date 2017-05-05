Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:38100 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751592AbdEEDOt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2017 23:14:49 -0400
MIME-Version: 1.0
In-Reply-To: <20170504114858.9008-8-icenowy@aosc.io>
References: <20170504114858.9008-1-icenowy@aosc.io> <20170504114858.9008-8-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 May 2017 11:14:25 +0800
Message-ID: <CAGb2v64GYR=S1eTBzvG3jzJBa8EDO9ZupChkfo05JCxP73d6Cw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v6 07/13] drm/sun4i: add a Kconfig option
 for sun4i-backend
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 4, 2017 at 7:48 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> As sun4i-backend is now a dedicated module, add an Kconfig option for
> it to make it optional, since some build may only use other engines.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Splited out patch.
>
>  drivers/gpu/drm/sun4i/Kconfig  | 10 ++++++++++
>  drivers/gpu/drm/sun4i/Makefile |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
> index a4b357db8856..5a8227f37cc4 100644
> --- a/drivers/gpu/drm/sun4i/Kconfig
> +++ b/drivers/gpu/drm/sun4i/Kconfig
> @@ -12,3 +12,13 @@ config DRM_SUN4I
>           Choose this option if you have an Allwinner SoC with a
>           Display Engine. If M is selected the module will be called
>           sun4i-drm.
> +
> +config DRM_SUN4I_BACKEND
> +       tristate "Support for Allwinner A10 Display Engine Backend"
> +       depends on DRM_SUN4I
> +       default DRM_SUN4I
> +       help
> +         Choose this option if you have an Allwinner SoC with the
> +         original Allwinner Display Engine, which has a backend to
> +         do some alpha blending and feed graphics to TCON. If M is
> +         selected the module will be called sun4i-backend.
> diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
> index a251fb36c951..a08df56759e3 100644
> --- a/drivers/gpu/drm/sun4i/Makefile
> +++ b/drivers/gpu/drm/sun4i/Makefile
> @@ -9,6 +9,6 @@ sun4i-tcon-y += sun4i_crtc.o
>  sun4i-backend-y += sun4i_backend.o sun4i_layer.o
>
>  obj-$(CONFIG_DRM_SUN4I)                += sun4i-drm.o sun4i-tcon.o
> -obj-$(CONFIG_DRM_SUN4I)                += sun4i-backend.o
> +obj-$(CONFIG_DRM_SUN4I_BACKEND)                += sun4i-backend.o
>  obj-$(CONFIG_DRM_SUN4I)                += sun6i_drc.o
>  obj-$(CONFIG_DRM_SUN4I)                += sun4i_tv.o

Can you move sun4i-backend to the bottom in a separate section? The idea
is to have a bunch of core or common stuff, then platform specific modules.

Thanks
ChenYu
