Return-Path: <sboyd@codeaurora.org>
Date: Fri, 7 Aug 2015 15:40:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Chao Xie <chao.xie@marvell.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Tero Kristo <t-kristo@ti.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 02/26] clk: Replace __clk_get_num_parents with
 clk_hw_get_num_parents()
Message-ID: <20150807224051.GC16477@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
 <1438362246-6664-3-git-send-email-sboyd@codeaurora.org>
 <55C31653.7070000@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <55C31653.7070000@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/06, Sylwester Nawrocki wrote:
> On 31/07/15 19:03, Stephen Boyd wrote:
> > diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
> > index 665cb6794639..8653e555c920 100644
> > --- a/drivers/clk/mmp/clk-mix.c
> > +++ b/drivers/clk/mmp/clk-mix.c
> > @@ -63,7 +63,7 @@ static unsigned int _get_div(struct mmp_clk_mix *mix, unsigned int val)
> >  
> >  static unsigned int _get_mux(struct mmp_clk_mix *mix, unsigned int val)
> >  {
> > -	int num_parents = __clk_get_num_parents(mix->hw.clk);
> > +	int num_parents = clk_hw_get_num_parents(hw);
> 
> Shouldn't this be:
> 	int num_parents = clk_hw_get_num_parents(&mix->hw);

Yes thanks! I really gotta fix that script....

Here's the interdiff for this file:


diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
index 979e2cfc07c2..403a8b2839c4 100644
--- a/drivers/clk/mmp/clk-mix.c
+++ b/drivers/clk/mmp/clk-mix.c
@@ -63,7 +63,7 @@ static unsigned int _get_div(struct mmp_clk_mix *mix, unsigned int val)
 
 static unsigned int _get_mux(struct mmp_clk_mix *mix, unsigned int val)
 {
-	int num_parents = clk_hw_get_num_parents(hw);
+	int num_parents = clk_hw_get_num_parents(&mix->hw);
 	int i;
 
 	if (mix->mux_flags & CLK_MUX_INDEX_BIT)
@@ -116,7 +116,7 @@ static void _filter_clk_table(struct mmp_clk_mix *mix,
 	struct clk_hw *parent, *hw;
 	unsigned long parent_rate;
 
-	hw = &mix->hw
+	hw = &mix->hw;
 
 	for (i = 0; i < table_size; i++) {
 		item = &table[i];

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
