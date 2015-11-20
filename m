Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <1447948788-21105-2-git-send-email-p.zabel@pengutronix.de>
References: <1447948788-21105-1-git-send-email-p.zabel@pengutronix.de> <1447948788-21105-2-git-send-email-p.zabel@pengutronix.de>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Fri, 20 Nov 2015 08:56:47 +0800
Message-ID: <CAGS+omC=ygnAHKzN7w3O6ZH-9rwFpYqrngY89pJ=-tmm-8XZQg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: mediatek: make dpi0_sel and hdmi_sel not
 propagate rate changes
To: Philipp Zabel <p.zabel@pengutronix.de>, Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, James Liao <jamesjj.liao@mediatek.com>,
	"Joe.C" <yingjoe.chen@mediatek.com>, Sasha Hauer <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Caesar Wang <wxt@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

+Heiko and +dianders who worked so hard to get the multi-stage HDMI
clocks behaving well for the rk3288.

On Thu, Nov 19, 2015 at 11:59 PM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> These muxes are supposed to select a fitting divider after the PLL
> is already set to the correct rate.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/clk/mediatek/clk-mt8173.c | 4 ++--
>  drivers/clk/mediatek/clk-mtk.h    | 7 +++++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
> index 227e356..b305fa2 100644
> --- a/drivers/clk/mediatek/clk-mt8173.c
> +++ b/drivers/clk/mediatek/clk-mt8173.c
> @@ -558,7 +558,7 @@ static const struct mtk_composite top_muxes[] __initconst = {
>         MUX_GATE(CLK_TOP_ATB_SEL, "atb_sel", atb_parents, 0x0090, 16, 2, 23),
>         MUX_GATE(CLK_TOP_VENC_LT_SEL, "venclt_sel", venc_lt_parents, 0x0090, 24, 4, 31),
>         /* CLK_CFG_6 */
> -       MUX_GATE(CLK_TOP_DPI0_SEL, "dpi0_sel", dpi0_parents, 0x00a0, 0, 3, 7),
> +       MUX_GATE_FLAGS(CLK_TOP_DPI0_SEL, "dpi0_sel", dpi0_parents, 0x00a0, 0, 3, 7, 0),
>         MUX_GATE(CLK_TOP_IRDA_SEL, "irda_sel", irda_parents, 0x00a0, 8, 2, 15),
>         MUX_GATE(CLK_TOP_CCI400_SEL, "cci400_sel", cci400_parents, 0x00a0, 16, 3, 23),
>         MUX_GATE(CLK_TOP_AUD_1_SEL, "aud_1_sel", aud_1_parents, 0x00a0, 24, 2, 31),
> @@ -569,7 +569,7 @@ static const struct mtk_composite top_muxes[] __initconst = {
>         MUX_GATE(CLK_TOP_SCAM_SEL, "scam_sel", scam_parents, 0x00b0, 24, 2, 31),
>         /* CLK_CFG_12 */
>         MUX_GATE(CLK_TOP_SPINFI_IFR_SEL, "spinfi_ifr_sel", spinfi_ifr_parents, 0x00c0, 0, 3, 7),
> -       MUX_GATE(CLK_TOP_HDMI_SEL, "hdmi_sel", hdmi_parents, 0x00c0, 8, 2, 15),
> +       MUX_GATE_FLAGS(CLK_TOP_HDMI_SEL, "hdmi_sel", hdmi_parents, 0x00c0, 8, 2, 15, 0),
>         MUX_GATE(CLK_TOP_DPILVDS_SEL, "dpilvds_sel", dpilvds_parents, 0x00c0, 24, 3, 31),
>         /* CLK_CFG_13 */
>         MUX_GATE(CLK_TOP_MSDC50_2_H_SEL, "msdc50_2_h_sel", msdc50_2_h_parents, 0x00d0, 0, 3, 7),
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 32d2e45..b607996 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -83,7 +83,7 @@ struct mtk_composite {
>         signed char num_parents;
>  };
>
> -#define MUX_GATE(_id, _name, _parents, _reg, _shift, _width, _gate) {  \
> +#define MUX_GATE_FLAGS(_id, _name, _parents, _reg, _shift, _width, _gate, _flags) {    \
>                 .id = _id,                                              \
>                 .name = _name,                                          \
>                 .mux_reg = _reg,                                        \
> @@ -94,9 +94,12 @@ struct mtk_composite {
>                 .divider_shift = -1,                                    \
>                 .parent_names = _parents,                               \
>                 .num_parents = ARRAY_SIZE(_parents),                    \
> -               .flags = CLK_SET_RATE_PARENT,                           \
> +               .flags = _flags,                                        \
>         }
>
> +#define MUX_GATE(_id, _name, _parents, _reg, _shift, _width, _gate)    \
> +       MUX_GATE_FLAGS(_id, _name, _parents, _reg, _shift, _width, _gate, CLK_SET_RATE_PARENT)
> +
>  #define MUX(_id, _name, _parents, _reg, _shift, _width) {              \
>                 .id = _id,                                              \
>                 .name = _name,                                          \
> --
> 2.6.2
>
