Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1512991637.334.28.camel@baylibre.com>
Subject: Re: [PATCH v6 4/6] clk: meson: make the spinlock naming more
 specific
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>,  Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>,  Qiufang Dai
 <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20171211064853.32111-5-yixun.lan@amlogic.com>
References: <20171211064853.32111-1-yixun.lan@amlogic.com>
	 <20171211064853.32111-5-yixun.lan@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 11 Dec 2017 12:27:17 +0100
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2017-12-11 at 14:48 +0800, Yixun Lan wrote:
>                 .ops = &clk_gate_ops,
> diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
> index 1629da9b4141..87f06a801a4d 100644
> --- a/drivers/clk/meson/clkc.h
> +++ b/drivers/clk/meson/clkc.h
> @@ -134,7 +134,7 @@ struct meson_clk_audio_divider {
>  struct clk_gate _name = {                                              \
>         .reg = (void __iomem *) _reg,                                   \
>         .bit_idx = (_bit),                                              \
> -       .lock = &clk_lock,                                              \
> +       .lock = &meson_clk_lock,                                                \

Something is not right here, line is over 80 characters
Remember to run checkpatch on your series please.

>         .hw.init = &(struct clk_init_data) {                            \
>                 .name = #_name,                                 \
>                 .ops = &clk_gate_ops,                                   \
