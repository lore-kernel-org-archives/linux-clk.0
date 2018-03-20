Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: David Lechner <david@lechnology.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1521168778-27236-3-git-send-email-david@lechnology.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org,
 David Lechner <david@lechnology.com>
References: <1521168778-27236-1-git-send-email-david@lechnology.com>
 <1521168778-27236-3-git-send-email-david@lechnology.com>
Message-ID: <152156501473.183971.10164660837276962553@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v8 02/42] clk: davinci: New driver for davinci PLL clocks
Date: Tue, 20 Mar 2018 09:56:54 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting David Lechner (2018-03-15 19:52:18)
> +
> +static int davinci_pll_debug_init(struct clk_hw *hw, struct dentry *dent=
ry)
> +{
> +       struct davinci_pll_clk *pll =3D to_davinci_pll_clk(hw);
> +       struct debugfs_regset32 *regset;
> +       struct dentry *d;
> +
> +       regset =3D kzalloc(sizeof(regset), GFP_KERNEL);

Should be sizeof(*regset)?

I squashed this in:

diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
index 588a48927436..89d30bf95102 100644
--- a/drivers/clk/davinci/pll.c
+++ b/drivers/clk/davinci/pll.c
@@ -882,7 +882,7 @@ static int davinci_pll_debug_init(struct clk_hw *hw, st=
ruct dentry *dentry)
 	struct debugfs_regset32 *regset;
 	struct dentry *d;
 =

-	regset =3D kzalloc(sizeof(regset), GFP_KERNEL);
+	regset =3D kzalloc(sizeof(*regset), GFP_KERNEL);
 	if (!regset)
 		return -ENOMEM;
=20
