Return-Path: <rnayak@codeaurora.org>
Subject: Re: [RFC 1/3] clk: inherit display clocks enabled by bootloader
To: Rob Clark <robdclark@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Archit Taneja <architt@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
References: <20170711182008.28298-1-robdclark@gmail.com>
 <20170711182008.28298-2-robdclark@gmail.com>
 <0da0ad07-2af2-5993-81c9-a232a67af455@codeaurora.org>
 <CAF6AEGv-UN3EMYFWkHypBP8EYh7Q9jN71nsniqZBXGphA9oSGQ@mail.gmail.com>
From: "Nayak, Rajendra" <rnayak@codeaurora.org>
Message-ID: <f0053867-f077-35c2-fcae-a3e8730077eb@codeaurora.org>
Date: Mon, 17 Jul 2017 15:07:33 +0530
MIME-Version: 1.0
In-Reply-To: <CAF6AEGv-UN3EMYFWkHypBP8EYh7Q9jN71nsniqZBXGphA9oSGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 7/14/2017 4:13 PM, Rob Clark wrote:
> On Fri, Jul 14, 2017 at 12:52 AM, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>> Hi Rob,
>>
>> On 07/11/2017 11:50 PM, Rob Clark wrote:
>>> The goal here is to support inheriting a display setup by bootloader,
>>> although there may also be some non-display related use-cases.
>>>
>>> Rough idea is to add a flag for clks and power domains that might
>>> already be enabled when kernel starts, and make corresponding fixups
>>> to clk enable/prepare_count and power-domain state so that these are
>>> not automatically disabled late in boot.
>>>
>>> If bootloader is enabling display, and kernel is using efifb before
>>> real display driver is loaded (potentially from kernel module after
>>> userspace starts, in a typical distro kernel), we don't want to kill
>>> the clocks and power domains that are used by the display before
>>> userspace starts.
>>>
>>> Second part is for drm/msm to check if display related clocks are
>>> enabled when it is loaded, and if so read back hw state to sync
>>> existing display state w/ software state, and skip the initial
>>> clk_enable's and otherwise fixing up clk/regulator/etc ref counts
>>> (skipping the normal display-enable codepaths), therefore inheriting
>>> the enable done by bootloader.
>>>
>>> Obviously this should be split up into multiple patches and many
>>> TODOs addressed.  But I guess this is enough for now to start
>>> discussing the approach, and in particular how drm and clock/pd
>>> drivers work together to handle handover from bootloader.
>>>
>>> The CLK_INHERIT_BOOTLOADER and related gsdc flag should only be set
>>> on leaf nodes.
>>> ---
>>
>> []..
>>
>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>> index d523991c945f..90b698c910d0 100644
>>> --- a/drivers/clk/qcom/common.c
>>> +++ b/drivers/clk/qcom/common.c
>>> @@ -11,6 +11,7 @@
>>>    * GNU General Public License for more details.
>>>    */
>>>
>>> +#include <linux/clk.h>
>>>   #include <linux/export.h>
>>>   #include <linux/module.h>
>>>   #include <linux/regmap.h>
>>> @@ -258,6 +259,33 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>>>        if (ret)
>>>                return ret;
>>>
>>> +     /* Check which of clocks that we inherit state from bootloader
>>> +      * are enabled, and fixup enable/prepare state (as well as that
>>> +      * of it's parents).
>>> +      *
>>> +      * TODO can we assume that parents coming from another clk
>>> +      * driver are already registered?
>>> +      */
>>> +     for (i = 0; i < num_clks; i++) {
>>> +             struct clk_hw *hw;
>>> +
>>> +             if (!rclks[i])
>>> +                     continue;
>>> +
>>> +             hw = &rclks[i]->hw;
>>> +
>>> +             if (!(hw->init->flags & CLK_INHERIT_BOOTLOADER))
>>> +                     continue;
>>> +
>>> +             if (!clk_is_enabled_regmap(hw))
>>> +                     continue;
>>> +
>>> +             dev_dbg(dev, "%s is enabled from bootloader!\n",
>>> +                       hw->init->name);
>>> +
>>> +             clk_inherit_enabled(hw->clk);
>>
>> how about just calling a clk_prepare_enable(hw->clk) instead of adding a new API?
>> The flag could also be something qcom specific and then we avoid having to add
>> anything in generic CCF code and its all handled in the qcom clock drivers.
> 
> Hmm, I could try that..  I *guess* it doesn't hurt to enable an
> already enabled clk..

yes, ideally it shouldn't hurt.

> 
> beyond that, I wonder if this is something that other platforms would
> want, so maybe I should be doing the check for enabled in CCF core?
> If not, making this a qcom specific flag makes sense.

I think most previous attempts to solve this were done trying to keep
it very generic and they didn't go too far.
So I was thinking maybe we could deal with it within qcom drivers for
now, and if others come up with something similar, then look to
consolidate at a generic CCF level.

> 
>>> +     }
>>> +
>>>        reset = &cc->reset;
>>>        reset->rcdev.of_node = dev->of_node;
>>>        reset->rcdev.ops = &qcom_reset_ops;
>>
>> [] ..
>>
>>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>>> index a4f3580587b7..440d819b2d9d 100644
>>> --- a/drivers/clk/qcom/gdsc.c
>>> +++ b/drivers/clk/qcom/gdsc.c
>>> @@ -291,6 +291,12 @@ static int gdsc_init(struct gdsc *sc)
>>>        if ((sc->flags & VOTABLE) && on)
>>>                gdsc_enable(&sc->pd);
>>>
>>> +     if ((sc->flags & INHERIT_BL) && on) {
>>> +             pr_debug("gdsc: %s is enabled from bootloader!\n", sc->pd.name);
>>> +             gdsc_enable(&sc->pd);
>>> +             sc->pd.flags |= GENPD_FLAG_ALWAYS_ON;
>>
>> Would this not prevent the powerdomain from ever getting disabled?
> 
> Yeah, this is a hack, because I couldn't figure out something better.
> The problem is that gdsc/powerdomain doesn't have it's own
> enable_count but this is tracked at the device level (afaict.. maybe
> I'm miss-understanding something).  I guess we could add our own
> enable_count within gdsc?  Suggestions welcome, since I don't know
> these parts of the code so well.

One way to deal with it would be to tell the genpd core, that the gdsc
isn't really enabled, so it does not go ahead and disable it thinking
its unused.

Once the display driver comes up, it runtime enables/disables it.
I am guessing, if the bootloader turns on the gdsc, there will also
be a kernel driver to handle it.

So I am basically saying,
         if ((sc->flags & INHERIT_BL) && on)
                 on = !on; /* Prevent genpd from thinking its unsued */

> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
