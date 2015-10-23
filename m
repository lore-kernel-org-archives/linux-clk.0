Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38229 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752008AbbJWLzm (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 23 Oct 2015 07:55:42 -0400
MIME-version: 1.0
Content-type: text/plain; charset=utf-8; format=flowed
Message-id: <562A203B.7060505@samsung.com>
Date: Fri, 23 Oct 2015 20:55:39 +0900
From: Inki Dae <inki.dae@samsung.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH 10/10] drm/exynos/decon5433: add support for DECON-TV
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
 <1445332961-25419-11-git-send-email-a.hajda@samsung.com>
In-reply-to: <1445332961-25419-11-git-send-email-a.hajda@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Andrzej,


2015년 10월 20일 18:22에 Andrzej Hajda 이(가) 쓴 글:
> DECON-TV IP is responsible for generating video stream which is transferred
> to HDMI IP. It is almost fully compatible with DECON IP.
>
> The patch is based on initial work of Hyungwon Hwang.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 154 ++++++++++++++++----------
>   include/video/exynos5433_decon.h              |  29 +++++
>   2 files changed, 122 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 3c9aa4e..fbe1b31 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -13,6 +13,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/clk.h>
>   #include <linux/component.h>
> +#include <linux/of_device.h>
>   #include <linux/of_gpio.h>
>   #include <linux/pm_runtime.h>
>
> @@ -37,6 +38,12 @@ static const char * const decon_clks_name[] = {
>   	"sclk_decon_eclk",
>   };
>
> +enum decon_iftype {
> +	IFTYPE_RGB,
> +	IFTYPE_I80,
> +	IFTYPE_HDMI
> +};
> +
>   enum decon_flag_bits {
>   	BIT_CLKS_ENABLED,
>   	BIT_IRQS_ENABLED,
> @@ -53,7 +60,8 @@ struct decon_context {
>   	struct clk			*clks[ARRAY_SIZE(decon_clks_name)];
>   	int				pipe;
>   	unsigned long			flags;
> -	bool				i80_if;
> +	enum decon_iftype		out_type;
> +	int				first_win;
>   };
>
>   static const uint32_t decon_formats[] = {
> @@ -80,7 +88,7 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
>
>   	if (test_and_set_bit(BIT_IRQS_ENABLED, &ctx->flags)) {
>   		val = VIDINTCON0_INTEN;
> -		if (ctx->i80_if)
> +		if (ctx->out_type == IFTYPE_I80)
>   			val |= VIDINTCON0_FRAMEDONE;
>   		else
>   			val |= VIDINTCON0_INTFRMEN;
> @@ -104,8 +112,11 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
>
>   static void decon_setup_trigger(struct decon_context *ctx)
>   {
> -	u32 val = TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
> -			TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN;
> +	u32 val = (ctx->out_type != IFTYPE_HDMI)
> +		? TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
> +		  TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN
> +		: TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
> +		  TRIGCON_HWTRIGMASK_I80_RGB | TRIGCON_HWTRIGEN_I80_RGB;
>   	writel(val, ctx->addr + DECON_TRIGCON);
>   }
>
> @@ -118,13 +129,22 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
>   	if (test_bit(BIT_SUSPENDED, &ctx->flags))
>   		return;
>
> +	if (ctx->out_type == IFTYPE_HDMI) {
> +		m->crtc_hsync_start = m->crtc_hdisplay + 10;
> +		m->crtc_hsync_end = m->crtc_htotal - 92;
> +		m->crtc_vsync_start = m->crtc_vdisplay + 1;
> +		m->crtc_vsync_end = m->crtc_vsync_start + 1;
> +	}
> +
> +	decon_set_bits(ctx, DECON_VIDCON0, VIDCON0_ENVID, 0);
> +
>   	/* enable clock gate */
>   	val = CMU_CLKGAGE_MODE_SFR_F | CMU_CLKGAGE_MODE_MEM_F;
>   	writel(val, ctx->addr + DECON_CMU);
>
>   	/* lcd on and use command if */
>   	val = VIDOUT_LCD_ON;
> -	if (ctx->i80_if)
> +	if (ctx->out_type == IFTYPE_I80)
>   		val |= VIDOUT_COMMAND_IF;
>   	else
>   		val |= VIDOUT_RGB_IF;
> @@ -134,7 +154,7 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
>   		VIDTCON2_HOZVAL(m->hdisplay - 1);
>   	writel(val, ctx->addr + DECON_VIDTCON2);
>
> -	if (!ctx->i80_if) {
> +	if (ctx->out_type != IFTYPE_I80) {
>   		val = VIDTCON00_VBPD_F(
>   				m->crtc_vtotal - m->crtc_vsync_end - 1) |
>   			VIDTCON00_VFPD_F(
> @@ -159,15 +179,9 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
>   	decon_setup_trigger(ctx);
>
>   	/* enable output and display signal */
> -	val = VIDCON0_ENVID | VIDCON0_ENVID_F;
> -	writel(val, ctx->addr + DECON_VIDCON0);
> +	decon_set_bits(ctx, DECON_VIDCON0, VIDCON0_ENVID | VIDCON0_ENVID_F, ~0);
>   }
>
> -#define COORDINATE_X(x)		(((x) & 0xfff) << 12)
> -#define COORDINATE_Y(x)		((x) & 0xfff)
> -#define OFFSIZE(x)		(((x) & 0x3fff) << 14)
> -#define PAGEWIDTH(x)		((x) & 0x3fff)
> -
>   static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
>   				 struct drm_framebuffer *fb)
>   {
> @@ -238,6 +252,10 @@ static void decon_atomic_begin(struct exynos_drm_crtc *crtc,
>   	decon_shadow_protect_win(ctx, plane->zpos, true);
>   }
>
> +#define BIT_VAL(x, e, s) (((x) & ((1 << ((e) - (s) + 1)) - 1)) << (s))
> +#define COORDINATE_X(x) BIT_VAL((x), 23, 12)
> +#define COORDINATE_Y(x) BIT_VAL((x), 11, 0)
> +
>   static void decon_update_plane(struct exynos_drm_crtc *crtc,
>   			       struct exynos_drm_plane *plane)
>   {
> @@ -271,8 +289,12 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
>   	val = plane->dma_addr[0] + pitch * plane->crtc_h;
>   	writel(val, ctx->addr + DECON_VIDW0xADD1B0(win));
>
> -	val = OFFSIZE(pitch - plane->crtc_w * bpp)
> -		| PAGEWIDTH(plane->crtc_w * bpp);
> +	if (ctx->out_type != IFTYPE_HDMI)
> +		val = BIT_VAL(pitch - plane->crtc_w * bpp, 27, 14)
> +			| BIT_VAL(plane->crtc_w * bpp, 13, 0);
> +	else
> +		val = BIT_VAL(pitch - plane->crtc_w * bpp, 29, 15)
> +			| BIT_VAL(plane->crtc_w * bpp, 14, 0);
>   	writel(val, ctx->addr + DECON_VIDW0xADD2(win));
>
>   	decon_win_set_pixfmt(ctx, win, state->fb);
> @@ -314,7 +336,7 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc,
>
>   	decon_shadow_protect_win(ctx, plane->zpos, false);
>
> -	if (ctx->i80_if)
> +	if (ctx->out_type == IFTYPE_I80)
>   		set_bit(BIT_WIN_UPDATED, &ctx->flags);
>   }
>
> @@ -339,6 +361,17 @@ static void decon_swreset(struct decon_context *ctx)
>   	}
>
>   	WARN(tries == 0, "failed to software reset DECON\n");
> +
> +	if (ctx->out_type != IFTYPE_HDMI)
> +		return;
> +
> +	writel(VIDCON0_CLKVALUP | VIDCON0_VLCKFREE, ctx->addr + DECON_VIDCON0);
> +	decon_set_bits(ctx, DECON_CMU,
> +		       CMU_CLKGAGE_MODE_SFR_F | CMU_CLKGAGE_MODE_MEM_F, ~0);
> +	writel(VIDCON1_VCLK_RUN_VDEN_DISABLE, ctx->addr + DECON_VIDCON1);
> +	writel(CRCCTRL_CRCEN | CRCCTRL_CRCSTART_F | CRCCTRL_CRCCLKEN,
> +	       ctx->addr + DECON_CRCCTRL);
> +	decon_setup_trigger(ctx);
>   }
>
>   static void decon_enable(struct exynos_drm_crtc *crtc)
> @@ -387,7 +420,7 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
>   	 * suspend that connector. Otherwise we might try to scan from
>   	 * a destroyed buffer later.
>   	 */
> -	for (i = 0; i < WINDOWS_NR; i++)
> +	for (i = ctx->first_win; i < WINDOWS_NR; i++)
>   		decon_disable_plane(crtc, &ctx->planes[i]);
>
>   	decon_swreset(ctx);
> @@ -461,25 +494,30 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>   	struct drm_device *drm_dev = data;
>   	struct exynos_drm_private *priv = drm_dev->dev_private;
>   	struct exynos_drm_plane *exynos_plane;
> +	enum exynos_drm_output_type out_type;
>   	enum drm_plane_type type;
> -	unsigned int zpos;
> +	unsigned int win;
>   	int ret;
>
>   	ctx->drm_dev = drm_dev;
>   	ctx->pipe = priv->pipe++;
>
> -	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
> -		type = exynos_plane_get_type(zpos, CURSOR_WIN);
> -		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
> +	for (win = ctx->first_win; win < WINDOWS_NR; win++) {
> +		int tmp = (win == ctx->first_win) ? 0 : win;

AFAIK, DECON TV for Exynos5433 SoC has four hardware overlays so I guess 
you used ctx->first_win to initialize four planes in case of IFTYPE_HDMI.

However, with IFTYPE_HDMI ctx->first_win has 1, as a result, 
ctx->planes[] will have 0, 2nd, 3rd and 4th planes and this means we 
should use 0, 2nd ~ 4th hardware overlay excepting 1st overlay. Is this 
your intention?
Shouldn't ctx->planes[] have 1st, 2nd ,3rd and 4th planes so that we can 
use 1st ~ 4th hardware overlay for DECON TV?

DECON TV for Exynos5433 SoC can use only 1st ~ 4th hardware overlays.

And other thing, it may be trivial but I think it'd be better to use 
'ovl' instead of 'tmp.

Thanks,
Inki Dae
