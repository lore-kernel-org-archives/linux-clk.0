Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAD7C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 09:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241079AbhLOJCD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 04:02:03 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42005 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241019AbhLOJB4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 04:01:56 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 4F2C65C047F;
        Wed, 15 Dec 2021 04:01:55 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Wed, 15 Dec 2021 04:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type:content-transfer-encoding; s=fm3; bh=bc
        Lh8FdB/EzdKixkI4/m9+v42eyIkKJ9jSmgTB8Ubsk=; b=JV0mC18+yemFr9qxZa
        AQTHc69Fl3nT/SL3Ie4liDalyKVjSLkXOv8SFd5e2Rqb4BWp0N6ODPRrwpwHBJDf
        wSLUwBqlpRh8ngxuZc9uF4MY4y4t1LwvolOaErd6WYe/zEFkEkDzAzgv5ctheQWW
        2z7AHo0/s1FblfbJRNI3DE4ugrknaK9lKBxyXprrWFhtTG75+A+lQtMINW3lv5A/
        u5KlChb7DQyYlNLUTHO3mWikvbGyRl2+HUrGw8+O8nC6BGLsFz8r0jTFG5IKGAP0
        KAQmmrhxis58j6gepxPzX3vLFPuT78ACd6EEZ1ONaOqUkVoIDdCl5b2NgvYlQOG1
        6BUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=bcLh8FdB/EzdKixkI4/m9+v42eyIkKJ9jSmgTB8Ub
        sk=; b=dMT6adbyxWwTjaLi3zvgFRVAYEUimuJKH3N1Xn1BDxdXrX8na2SW+uOkQ
        gjZFWhoY3WBzPbLvG3dWFnbUf/ubh+Fvtm0X8jrP9IgyG74aPIy18h/bNRWJu+Oh
        msD+OqOJC1plcGpBhQ6eGdGo/lWwtAnOXUGM2bUx1w/CgQ2p1oStGYzuOn/hm0k7
        J+XOJenT1CDb1JjEWSKUex+EVzV59Vq+wqcsNJaSqZ7goFU2x/bBtbkpraebflsd
        zYzHuCqBy4tTrs6spNhNK5prH+Q5DSZcla8M8JfmUjrM+CiIW6AaZWBn+lpVqHyr
        nUX0Gu+OdIYeOzrmZ/havwz6/ZBqQ==
X-ME-Sender: <xms:A6-5YRfzwG3GtGUgG3tLrKk0339ESggC8--M1LzH5afiD7_di4IQ_A>
    <xme:A6-5YfNGuGgQFD5WnsRjJd3enWbpCDiYhSMFoMGHPYPajTKjRjB0eZpNdiBijkYpN
    fmT28GR0C7y1pAEOgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledugdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepteeuudelteefueelvdelheehieevvdfhkeehjeejudfhieelffffudfh
    keeileegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:A6-5YajfmD9AycKKn4i-RJ3C_KaCPJsOarYe65uMtr3avBG13Yyrgg>
    <xmx:A6-5Ya-Wy5AOArpP8bk9To3FLEAlmaCJFSSRGQgAT26RsWsFQ8O9fQ>
    <xmx:A6-5YdsmqHcmJg0Kh6oCr4emkEySLTUJwwWf18ILy8GZjj8iY-W_zg>
    <xmx:A6-5YbV4RVmsOHQ4JyEu2gVVAsdCKYaHSzh8WLNxE_EbITrlhLbMPg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 0ADD0274065C; Wed, 15 Dec 2021 04:01:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4524-g5e5d2efdba-fm-20211214.001-g5e5d2efd
Mime-Version: 1.0
Message-Id: <636844df-968b-4145-b7a9-261504384a98@www.fastmail.com>
In-Reply-To: <20211214120213.15649-3-povik@protonmail.com>
References: <20211214120213.15649-1-povik@protonmail.com>
 <20211214120213.15649-3-povik@protonmail.com>
Date:   Wed, 15 Dec 2021 10:01:34 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Cc:     "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        "Mark Kettenis" <kettenis@openbsd.org>,
        "Hector Martin" <marcan@marcan.st>
Subject: Re: [PATCH 2/2] clk: clk-apple-nco: Add driver for Apple NCO
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Thanks for working on the entire audio stack! I don't know much
about the clock framework and just have a few nits below.

On Tue, Dec 14, 2021, at 13:02, Martin Povi=C5=A1er wrote:
> Add a common clock driver for NCO blocks found on Apple SoCs where they
> are typically the generators of audio clocks.
>
> Signed-off-by: Martin Povi=C5=A1er <povik@protonmail.com>
> ---
>  drivers/clk/Kconfig         |   9 ++
>  drivers/clk/Makefile        |   1 +
>  drivers/clk/clk-apple-nco.c | 299 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 309 insertions(+)
>  create mode 100644 drivers/clk/clk-apple-nco.c
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c5b3dc97396a..d2b3d40de29d 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -390,6 +390,15 @@ config COMMON_CLK_K210
>  	help
>  	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
>
> +config COMMON_CLK_APPLE_NCO
> +	bool "Clock driver for Apple SoC NCOs"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	default ARCH_APPLE
> +	help
> +	  This driver supports NCO (Numerically Controlled Oscillator) blocks
> +	  found on Apple SoCs such as t8103 (M1). The blocks are typically
> +	  generators of audio clocks.
> +
>  source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/baikal-t1/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 6afe36bd2c0a..0f39db8664cc 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -17,6 +17,7 @@ endif
>
>  # hardware specific clock types
>  # please keep this section sorted lexicographically by file path name
> +obj-$(CONFIG_COMMON_CLK_APPLE_NCO)  	+=3D clk-apple-nco.o
>  obj-$(CONFIG_MACH_ASM9260)		+=3D clk-asm9260.o
>  obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)	+=3D clk-axi-clkgen.o
>  obj-$(CONFIG_ARCH_AXXIA)		+=3D clk-axm5516.o
> diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
> new file mode 100644
> index 000000000000..152901f6a40d
> --- /dev/null
> +++ b/drivers/clk/clk-apple-nco.c
> @@ -0,0 +1,299 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple NCO (Numerically Controlled Oscillator) clock driver
> + *
> + * Driver for an SoC block found on t8103 (M1) and other Apple chips
> + *
> + * Copyright (C) The Asahi Linux Contributors
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_clk.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +
> +#define NCO_CHANNEL_STRIDE	0x4000
> +
> +#define REG_CTRL	0
> +#define CTRL_ENABLE	BIT(31)
> +#define REG_DIV		4
> +#define DIV_FINE	GENMASK(1, 0)
> +#define DIV_COARSE	GENMASK(12, 2)
> +#define REG_INC1	8
> +#define REG_INC2	12
> +#define REG_ACCINIT	16
> +
> +struct nco_tables;
> +
> +struct nco_channel {
> +	void __iomem *base;
> +	struct nco_tables *tbl;
> +	struct clk_hw hw;
> +};
> +
> +#define to_nco_channel(_hw) container_of(_hw, struct nco_channel, hw)
> +
> +#define LFSR_POLY	0xa01
> +#define LFSR_INIT	0x7ff
> +#define LFSR_LEN	11
> +#define LFSR_PERIOD	((1 << LFSR_LEN) - 1)
> +#define LFSR_TBLSIZE	(1 << LFSR_LEN)
> +
> +/* The minimal attainable coarse divisor (first value in table) */
> +#define COARSE_DIV_OFFSET 2
> +
> +struct nco_tables {
> +	u16 fwd[LFSR_TBLSIZE];
> +	u16 inv[LFSR_TBLSIZE];
> +};
> +
> +static int nco_enable(struct clk_hw *hw);
> +static void nco_disable(struct clk_hw *hw);
> +static int nco_is_enabled(struct clk_hw *hw);

I think you can drop these forward-declarations if you move these
functions a bit to the top.

> +
> +static void nco_compute_tables(struct nco_tables *tbl)
> +{
> +	int i;
> +	u32 state =3D LFSR_INIT;
> +
> +	/*
> +	 * Go through the states of a galois LFSR and build
> +	 * a coarse divisor translation table.
> +	 */
> +	for (i =3D LFSR_PERIOD; i > 0; i--) {
> +		if (state & 1)
> +			state =3D (state >> 1) ^ (LFSR_POLY >> 1);
> +		else
> +			state =3D (state >> 1);
> +		tbl->fwd[i] =3D state;
> +		tbl->inv[state] =3D i;
> +	}
> +
> +	/* Zero value is special-cased */
> +	tbl->fwd[0] =3D 0;
> +	tbl->inv[0] =3D 0;
> +}
> +
> +static bool nco_div_check(int div)
> +{
> +	int coarse =3D div / 4;
> +	return coarse >=3D COARSE_DIV_OFFSET &&
> +		coarse < COARSE_DIV_OFFSET + LFSR_TBLSIZE;
> +}
> +
> +static u32 nco_div_translate(struct nco_tables *tbl, int div)
> +{
> +	int coarse =3D div / 4;
> +
> +	if (WARN_ON(!nco_div_check(div)))
> +		return 0;
> +
> +	return FIELD_PREP(DIV_COARSE, tbl->fwd[coarse - COARSE_DIV_OFFSET]) |
> +			FIELD_PREP(DIV_FINE, div % 4);
> +}
> +
> +static int nco_div_translate_inv(struct nco_tables *tbl, int regval)
> +{
> +	int coarse, fine;
> +
> +	coarse =3D tbl->inv[FIELD_GET(DIV_COARSE, regval)] + COARSE_DIV_OFFS=
ET;
> +	fine =3D FIELD_GET(DIV_FINE, regval);
> +
> +	return coarse * 4 + fine;
> +}
> +
> +static int nco_set_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long parent_rate)
> +{
> +	struct nco_channel *chan =3D to_nco_channel(hw);
> +	u32 div;
> +	s32 inc1, inc2;
> +	bool was_enabled;
> +
> +	was_enabled =3D nco_is_enabled(hw);
> +	nco_disable(hw);
> +
> +	div =3D 2 * parent_rate / rate;
> +	inc1 =3D 2 * parent_rate - div * rate;
> +	inc2 =3D -((s32) (rate - inc1));
> +
> +	if (!nco_div_check(div))
> +		return -EINVAL;
> +
> +	div =3D nco_div_translate(chan->tbl, div);

You end up doing nco_div_check twice here and this is also the only
place you use nco_div_translate.
Maybe just drop the check above, remove the WARN_ON in nco_div_translate
and use if (!div) return -EINVAL; here.

> +
> +	writel_relaxed(div,  chan->base + REG_DIV);
> +	writel_relaxed(inc1, chan->base + REG_INC1);
> +	writel_relaxed(inc2, chan->base + REG_INC2);
> +	writel_relaxed(1 << 31, chan->base + REG_ACCINIT);

What does that magic number 1 << 31 represent?

> +
> +	if (was_enabled)
> +		nco_enable(hw);
> +
> +	return 0;
> +}
> +
> +static unsigned long nco_recalc_rate(struct clk_hw *hw,
> +				unsigned long parent_rate)
> +{
> +	struct nco_channel *chan =3D to_nco_channel(hw);
> +	u32 div;
> +	s32 inc1, inc2, incbase;
> +
> +	div =3D nco_div_translate_inv(chan->tbl,
> +			readl_relaxed(chan->base + REG_DIV));
> +
> +	inc1 =3D readl_relaxed(chan->base + REG_INC1);
> +	inc2 =3D readl_relaxed(chan->base + REG_INC2);
> +
> +	/*
> +	 * We don't support wraparound of accumulator
> +	 * nor the edge case of both increments being zero
> +	 */
> +	if (inc1 < 0 || inc2 > 0 || (inc1 =3D=3D 0 && inc2 =3D=3D 0))
> +		return 0;
> +
> +	/* Scale both sides of division by incbase to maintain precision */
> +	incbase =3D inc1 - inc2;
> +
> +	return div_u64(((u64) parent_rate) * 2 * incbase,
> +			((u64) div) * incbase + inc1);
> +}
> +
> +static long nco_round_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long *parent_rate)
> +{
> +	unsigned long lo =3D *parent_rate / (COARSE_DIV_OFFSET + LFSR_TBLSIZ=
E) + 1;
> +	unsigned long hi =3D *parent_rate / COARSE_DIV_OFFSET;
> +
> +	return clamp(rate, lo, hi);
> +}
> +
> +static int nco_enable(struct clk_hw *hw)
> +{
> +	struct nco_channel *chan =3D to_nco_channel(hw);
> +	u32 val;
> +
> +	val =3D readl_relaxed(chan->base + REG_CTRL);
> +	writel_relaxed(val | CTRL_ENABLE, chan->base + REG_CTRL);
> +	return 0;
> +}
> +
> +static void nco_disable(struct clk_hw *hw)
> +{
> +	struct nco_channel *chan =3D to_nco_channel(hw);
> +	u32 val;
> +
> +	val =3D readl_relaxed(chan->base + REG_CTRL);
> +	writel_relaxed(val & ~CTRL_ENABLE, chan->base + REG_CTRL);
> +}
> +
> +static int nco_is_enabled(struct clk_hw *hw)
> +{
> +	struct nco_channel *chan =3D to_nco_channel(hw);
> +
> +	return (readl_relaxed(chan->base + REG_CTRL) & CTRL_ENABLE) !=3D 0;
> +}
> +
> +static const struct clk_ops nco_ops =3D {
> +	.set_rate =3D nco_set_rate,
> +	.recalc_rate =3D nco_recalc_rate,
> +	.round_rate =3D nco_round_rate,
> +	.enable =3D nco_enable,
> +	.disable =3D nco_disable,
> +	.is_enabled =3D nco_is_enabled,
> +};
> +
> +static int apple_nco_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct clk_init_data init;
> +	struct clk_hw_onecell_data *onecell_data;
> +	const char *parent_name;
> +	void __iomem *regs;
> +	struct nco_tables *tbl;
> +	int nchannels;
> +	int ret, i;
> +
> +	ret =3D of_property_read_u32(np, "apple,nchannels", &nchannels);
> +	if (ret) {
> +		dev_err(&pdev->dev, "missing or invalid apple,nchannels property\n"=
);
> +		return -EINVAL;
> +	}
> +
> +	regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	if (of_clk_get_parent_count(np) !=3D 1)
> +		return -EINVAL;
> +	parent_name =3D of_clk_get_parent_name(np, 0);
> +	if (!parent_name)
> +		return -EINVAL;
> +
> +	onecell_data =3D devm_kzalloc(&pdev->dev, struct_size(onecell_data, =
hws,
> +							nchannels), GFP_KERNEL);
> +	if (!onecell_data)
> +		return -ENOMEM;
> +	onecell_data->num =3D nchannels;
> +
> +	tbl =3D devm_kzalloc(&pdev->dev, sizeof(*tbl), GFP_KERNEL);
> +	if (!tbl)
> +		return -ENOMEM;
> +	nco_compute_tables(tbl);

Technically probe could be called multiple times (possibly even in paral=
lel
I think). Might make sense to make sure these tables are only calculated=
 once
for the entire driver.

> +
> +	for (i =3D 0; i < nchannels; i++) {
> +		struct nco_channel *chan;
> +
> +		chan =3D devm_kzalloc(&pdev->dev, sizeof(*chan), GFP_KERNEL);
> +		if (!chan)
> +			return -ENOMEM;
> +		chan->base =3D regs + NCO_CHANNEL_STRIDE*i;
> +		chan->tbl =3D tbl;
> +
> +		memset(&init, 0, sizeof(init));
> +		init.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
> +						"%s-%d", np->name, i);
> +		init.ops =3D &nco_ops;
> +		init.num_parents =3D 1;
> +		init.parent_names =3D &parent_name;
> +		init.flags =3D 0;
> +
> +		chan->hw.init =3D &init;
> +		ret =3D devm_clk_hw_register(&pdev->dev, &chan->hw);
> +		if (ret)
> +			return ret;
> +
> +		onecell_data->hws[i] =3D &chan->hw;
> +	}
> +
> +	ret =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_ge=
t,
> +							onecell_data);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

just returning devm_of_clk_add_hw_provider(...); does the same thing her=
e and is=20
a bit more concise :-)

> +}
> +
> +static const struct of_device_id apple_nco_ids[] =3D {
> +	{ .compatible =3D "apple,nco" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, apple_nco_ids)
> +
> +static struct platform_driver apple_nco_driver =3D {
> +	.driver =3D {
> +		.name =3D "apple-nco",
> +		.of_match_table =3D apple_nco_ids,
> +	},
> +	.probe =3D apple_nco_probe,
> +};
> +module_platform_driver(apple_nco_driver);
> +
> +MODULE_AUTHOR("Martin Povi=C5=A1er <povik@protonmail.com>");
> +MODULE_DESCRIPTION("Clock driver for NCO blocks on Apple SoCs");
> +MODULE_LICENSE("GPL v2");
> --
> 2.33.0


Thanks,


Sven
