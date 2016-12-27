Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1482832070-22668-7-git-send-email-ping.bai@nxp.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com> <1482832070-22668-7-git-send-email-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Dec 2016 14:01:53 +0100
Message-ID: <CACRpkdZYH-X=SG7AfCOgKA9U0WL9941e-zo_tgUF74mdns2_7Q@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] driver: pinctrl: imx: Add pinctrl driver support
 for imx6sll
To: Bai Ping <ping.bai@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, jacky.baip@gmail.com
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Dec 27, 2016 at 10:47 AM, Bai Ping <ping.bai@nxp.com> wrote:

> Add pinctrl driver support for imx6sll.
>
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
(...)
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -514,6 +514,7 @@ config SOC_IMX6SL
>
>  config SOC_IMX6SLL
>         bool "i.MX6 SoloLiteLite support"
> +       select PINCTRL_IMX6SLL

This needs to be separate so I can merge the pure pin control patch
to my tree.

Apart from that, look into using generic pinconf.

Yours,
Linus Walleij
