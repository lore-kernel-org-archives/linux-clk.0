Return-Path: <sboyd@codeaurora.org>
Date: Tue, 18 Jul 2017 16:16:14 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: "Nayak, Rajendra" <rnayak@codeaurora.org>
Cc: Rob Clark <robdclark@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Archit Taneja <architt@codeaurora.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [RFC 1/3] clk: inherit display clocks enabled by bootloader
Message-ID: <20170718231614.GH18179@codeaurora.org>
References: <20170711182008.28298-1-robdclark@gmail.com>
 <20170711182008.28298-2-robdclark@gmail.com>
 <0da0ad07-2af2-5993-81c9-a232a67af455@codeaurora.org>
 <CAF6AEGv-UN3EMYFWkHypBP8EYh7Q9jN71nsniqZBXGphA9oSGQ@mail.gmail.com>
 <f0053867-f077-35c2-fcae-a3e8730077eb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <f0053867-f077-35c2-fcae-a3e8730077eb@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/17, Nayak, Rajendra wrote:
> 
> 
> On 7/14/2017 4:13 PM, Rob Clark wrote:
> >On Fri, Jul 14, 2017 at 12:52 AM, Rajendra Nayak <rnayak@codeaurora.org> wrote:
> >>Hi Rob,
> >>
> >>On 07/11/2017 11:50 PM, Rob Clark wrote:
> >>
> >>>diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> >>>index d523991c945f..90b698c910d0 100644
> >>>--- a/drivers/clk/qcom/common.c
> >>>+++ b/drivers/clk/qcom/common.c
> >>>@@ -11,6 +11,7 @@
> >>>   * GNU General Public License for more details.
> >>>   */
> >>>
> >>>+#include <linux/clk.h>
> >>>  #include <linux/export.h>
> >>>  #include <linux/module.h>
> >>>  #include <linux/regmap.h>
> >>>@@ -258,6 +259,33 @@ int qcom_cc_really_probe(struct platform_device *pdev,
> >>>       if (ret)
> >>>               return ret;
> >>>
> >>>+     /* Check which of clocks that we inherit state from bootloader
> >>>+      * are enabled, and fixup enable/prepare state (as well as that
> >>>+      * of it's parents).
> >>>+      *
> >>>+      * TODO can we assume that parents coming from another clk
> >>>+      * driver are already registered?
> >>>+      */
> >>>+     for (i = 0; i < num_clks; i++) {
> >>>+             struct clk_hw *hw;
> >>>+
> >>>+             if (!rclks[i])
> >>>+                     continue;
> >>>+
> >>>+             hw = &rclks[i]->hw;
> >>>+
> >>>+             if (!(hw->init->flags & CLK_INHERIT_BOOTLOADER))
> >>>+                     continue;
> >>>+
> >>>+             if (!clk_is_enabled_regmap(hw))
> >>>+                     continue;
> >>>+
> >>>+             dev_dbg(dev, "%s is enabled from bootloader!\n",
> >>>+                       hw->init->name);
> >>>+
> >>>+             clk_inherit_enabled(hw->clk);
> >>
> >>how about just calling a clk_prepare_enable(hw->clk) instead of adding a new API?
> >>The flag could also be something qcom specific and then we avoid having to add
> >>anything in generic CCF code and its all handled in the qcom clock drivers.
> >
> >Hmm, I could try that..  I *guess* it doesn't hurt to enable an
> >already enabled clk..
> 
> yes, ideally it shouldn't hurt.

It hurts when you enable a PLL when it's already enabled. I
recall having to add code specifically for this reason to avoid
enabling a PLL that is already enabled out of the bootloader. But
that's because the enable sequence for a PLL is multiple writes
that first keep the output off and then turn it back on after
things stabilize. For RCGs this isn't the case.

> 
> >
> >beyond that, I wonder if this is something that other platforms would
> >want, so maybe I should be doing the check for enabled in CCF core?
> >If not, making this a qcom specific flag makes sense.
> 
> I think most previous attempts to solve this were done trying to keep
> it very generic and they didn't go too far.
> So I was thinking maybe we could deal with it within qcom drivers for
> now, and if others come up with something similar, then look to
> consolidate at a generic CCF level.

We know that other SoC vendors need handoff features as well, so
there will definitely be a point where we need to consolidate at
the framework level. Working something up that works for qcom
would be good to try out though to find edge cases, etc.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
