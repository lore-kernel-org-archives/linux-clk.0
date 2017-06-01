Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Jun 2017 01:05:40 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5 v2] clk: qcom: Implement RPM clocks for
 MSM8660/APQ8060
Message-ID: <20170601080540.GA20170@codeaurora.org>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <20170419091326.11226-3-linus.walleij@linaro.org>
 <20170527200008.GM12920@tuxbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170527200008.GM12920@tuxbook>
List-ID: <linux-clk.vger.kernel.org>

On 05/27, Bjorn Andersson wrote:
> On Wed 19 Apr 02:13 PDT 2017, Linus Walleij wrote:
> 
> > The RPM clocks were missing for MSM8660/APQ8060. For this to be
> > completed we need to add a special fixed rate RPM clock that is used
> > for the PLL4 on these SoCs. The rest of the clocks are pretty
> > similar to the other supported platforms.
> > 
> > The "active" clock pattern is mirrored in all the clocks. I guess
> > that the PLL4 that clocks the LPASS is actually never used as
> > "active only" since the low-power audio subsystem should be left
> > on when the system suspends, so it can be used as a stand-alone
> > MP3 player type of device.
> > 
> > As we do not have firmware for the LPASS we will probably only use
> > this clock when the system is up and running (not suspended) for now,
> > so that will be using the "active" clock.
> > 
> 
> Note that "active" vs "sleep" is not related to the Linux suspend state,
> but rather the CPU idle state; at the bottom of the CPU idle path the
> RPM will react and reconfigure resources to their sleep state (if one is
> configured) and then reconfigured based on the active state before
> returning from the idle.
> 
> The PLL4 seems to be enabled only on behalf of the booting LPASS Hexagon
> - which will cast its own vote once its booted - and as such we only
> configure the active state (meaning both states will have same
> configuration).  The result is that PLL4 will be on from prepare() to
> unprepare() regardless of what the application CPU does.
> 
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > ChangeLog v1->v2:
> > - Add the small hunk to the clk_rpm_handoff() function that just
> >   skip over this for the fixed PLL4 clock. This accidentally
> >   ended up in another patch.
> > ---
> >  drivers/clk/qcom/clk-rpm.c | 106 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 106 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
> > index df3e5fe8442a..61c67e93bea3 100644
> > --- a/drivers/clk/qcom/clk-rpm.c
> > +++ b/drivers/clk/qcom/clk-rpm.c
> > @@ -56,6 +56,30 @@
> >  		},							      \
> >  	}
> >  
> > +#define DEFINE_CLK_RPM_FIXED(_platform, _name, _active, r_id, r)	      \
> 
> Is there a reason why you don't use DEFINE_CLK_RPM_PXO_BRANCH() for
> PLL4?
> 
> Looking at the downstream code PLL4 is explicitly handled differently
> and is only exposing one state. So if you're seeing issues with reusing
> the PXO_BRANCH() I think you should slim this down further and only
> register a single clk_rpm from this.

True. Except we would need a slight variant on PXO_BRANCH,
because PXO_BRANCH would be better if it returned the parent rate
from recalc_rate(), by just not having a recalc rate op set. The
parent is pxo_board/cxo_board and that will have the correct rate
for the board we're running on. In the PLL4 case, we want to
return the magic frequency that we know the PLL is running at
because that was the only configuration supported. So we would
need a special recalc op for that one clk here. But otherwise yes
it should be able to use most of the other code.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
