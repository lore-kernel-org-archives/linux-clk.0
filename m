Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1521106668.4264.50.camel@baylibre.com>
Subject: Re: [GIT PULL v2] Amlogic clock driver updates for 4.17
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>,  mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Date: Thu, 15 Mar 2018 10:37:48 +0100
In-Reply-To: <152106708246.85099.11923483552201514869@swboyd.mtv.corp.google.com>
References: <73587ed8-923d-e123-29a1-b6c3b710a0eb@baylibre.com>
	 <152106708246.85099.11923483552201514869@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2018-03-14 at 15:38 -0700, Stephen Boyd wrote:
> Quoting Neil Armstrong (2018-03-13 02:30:38)
> > Dear clock maintainers,
> > 
> > Below is a request to pull a 1st batch of Amlogic clock driver updates for this
> > cycle.
> > The PR is composed of 3 series :
> > - pll fixes for GXBB, GXL and AXG
> > - use regmap in clock controllers for GXBB, GXL and AXG
> > - general clock updates for Meson8, GXBB, GXL and AXG
> > 
> > These 2 last series were depending on patches merged on the clk-helpers
> > topic branch, thus based on this branch.
> > 
> 
> Thanks. Pulled into clk-next. Also, marked some things static and
> dropped a local variable that was causing a warning.
> 
> WARNING: 'Tested-by:' is the preferred signature form
> #18: 
> Tested-By: David Lechner <david@lechnology.com>
> 
> drivers/clk/meson/meson8b.c:512:19: warning: symbol 'meson8b_mpeg_clk_div' was not declared. Should it be static?
> drivers/clk/meson/meson8b.c:526:19: warning: symbol 'meson8b_clk81' was not declared. Should it be static?
> drivers/clk/meson/meson8b.c:540:19: warning: symbol 'meson8b_cpu_in_sel' was not declared. Should it be static?
> drivers/clk/meson/meson8b.c:591:19: warning: symbol 'meson8b_cpu_scale_div' was not declared. Should it be static?
> drivers/clk/meson/meson8b.c:608:19: warning: symbol 'meson8b_cpu_scale_out_sel' was not declared. Should it be static?
> drivers/clk/meson/meson8b.c:626:19: warning: symbol 'meson8b_cpu_clk' was not declared. Should it be static?
> drivers/clk/meson/gxbb.c:392:27: warning: symbol 'gxbb_gp0_init_regs' was not declared. Should it be static?
> drivers/clk/meson/gxbb.c:439:27: warning: symbol 'gxl_gp0_init_regs' was not declared. Should it be static?
> drivers/clk/meson/axg.c:195:27: warning: symbol 'axg_gp0_init_regs' was not declared. Should it be static?
> drivers/clk/meson/axg.c:248:27: warning: symbol 'axg_hifi_init_regs' was not declared. Should it be static?
> drivers/clk/meson/meson8b.c: In function 'meson8b_clkc_probe':
> drivers/clk/meson/meson8b.c:1052:14: warning: unused variable 'clk' [-Wunused-variable]

Thanks for fixing and letting us know Stephen !
We'll be more careful next time

> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
