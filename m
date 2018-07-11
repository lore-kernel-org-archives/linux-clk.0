Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1531316752.2708.113.camel@baylibre.com>
Subject: Re: [PATCH 3/3] clk: meson-g12a: Add EE Clock controller driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>, Martin
	Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, qianggui.song@amlogic.com,
 sboyd@kernel.org, khilman@baylibre.com, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, bo.yang@amlogic.com, qiufang.dai@amlogic.com,
  linux-arm-kernel@lists.infradead.org, carlo@caione.org,
 linux-amlogic@lists.infradead.org, sunny.luo@amlogic.com,
 linux-clk@vger.kernel.org, xingyu.chen@amlogic.com, Rob Herring
 <robh@kernel.org>
Date: Wed, 11 Jul 2018 15:45:52 +0200
In-Reply-To: <454887b2-6d29-4fe9-ee34-400363671746@amlogic.com>
References: <1531134767-29927-1-git-send-email-jian.hu@amlogic.com>
	 <1531134767-29927-4-git-send-email-jian.hu@amlogic.com>
	 <CAFBinCBB9N_p6S_-dfiV=zDCf-RYnA3C-ir6oNLC7JAfdOqqiw@mail.gmail.com>
	 <ec49c089-bccf-9aac-5d0f-43bc27770ad9@amlogic.com>
	 <1531216472.2708.71.camel@baylibre.com>
	 <454887b2-6d29-4fe9-ee34-400363671746@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2018-07-11 at 21:41 +0800, Jian Hu wrote:
> > > > > +static struct clk_regmap g12a_mpll0 = {
> > > > > +       .data = &(struct clk_regmap_gate_data){
> > > > > +               .offset = HHI_MPLL_CNTL1,
> > > > > +               .bit_idx = 31,
> > > > > +       },
> > > > > +       .hw.init = &(struct clk_init_data){
> > > > > +               .name = "mpll0",
> > > > > +               .ops = &clk_regmap_gate_ops,
> > > > > +               .parent_names = (const char *[]){ "mpll0_div" },
> > > > > +               .num_parents = 1,
> > > > > +               .flags = CLK_SET_RATE_PARENT,
> > > > > +       },
> > > > > +};
> > 
> > The previous had a predivider (1 or 2) in front of these mpll. Even if the
> > predivider is usually set to be a passthrough, it is better to model the tree
> > correctly.
> > 
> > Is this SoC any different ?
> > 
> 
> I am not sure the difference, I will confirm with IC design guys.

I suggest that you have a look at the (upstream) axg and gxbb clock driver for
this

Same goes for the fdiv gates.

Last, please trim your replies a bit. It will make easier to see what you are
replying to. 
