Return-Path: <robdclark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0da0ad07-2af2-5993-81c9-a232a67af455@codeaurora.org>
References: <20170711182008.28298-1-robdclark@gmail.com> <20170711182008.28298-2-robdclark@gmail.com>
 <0da0ad07-2af2-5993-81c9-a232a67af455@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 14 Jul 2017 06:43:04 -0400
Message-ID: <CAF6AEGv-UN3EMYFWkHypBP8EYh7Q9jN71nsniqZBXGphA9oSGQ@mail.gmail.com>
Subject: Re: [RFC 1/3] clk: inherit display clocks enabled by bootloader
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-clk <linux-clk@vger.kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Archit Taneja <architt@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 14, 2017 at 12:52 AM, Rajendra Nayak <rnayak@codeaurora.org> wrote:
> Hi Rob,
>
> On 07/11/2017 11:50 PM, Rob Clark wrote:
>> The goal here is to support inheriting a display setup by bootloader,
>> although there may also be some non-display related use-cases.
>>
>> Rough idea is to add a flag for clks and power domains that might
>> already be enabled when kernel starts, and make corresponding fixups
>> to clk enable/prepare_count and power-domain state so that these are
>> not automatically disabled late in boot.
>>
>> If bootloader is enabling display, and kernel is using efifb before
>> real display driver is loaded (potentially from kernel module after
>> userspace starts, in a typical distro kernel), we don't want to kill
>> the clocks and power domains that are used by the display before
>> userspace starts.
>>
>> Second part is for drm/msm to check if display related clocks are
>> enabled when it is loaded, and if so read back hw state to sync
>> existing display state w/ software state, and skip the initial
>> clk_enable's and otherwise fixing up clk/regulator/etc ref counts
>> (skipping the normal display-enable codepaths), therefore inheriting
>> the enable done by bootloader.
>>
>> Obviously this should be split up into multiple patches and many
>> TODOs addressed.  But I guess this is enough for now to start
>> discussing the approach, and in particular how drm and clock/pd
>> drivers work together to handle handover from bootloader.
>>
>> The CLK_INHERIT_BOOTLOADER and related gsdc flag should only be set
>> on leaf nodes.
>> ---
>
> []..
>
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index d523991c945f..90b698c910d0 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -11,6 +11,7 @@
>>   * GNU General Public License for more details.
>>   */
>>
>> +#include <linux/clk.h>
>>  #include <linux/export.h>
>>  #include <linux/module.h>
>>  #include <linux/regmap.h>
>> @@ -258,6 +259,33 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>>       if (ret)
>>               return ret;
>>
>> +     /* Check which of clocks that we inherit state from bootloader
>> +      * are enabled, and fixup enable/prepare state (as well as that
>> +      * of it's parents).
>> +      *
>> +      * TODO can we assume that parents coming from another clk
>> +      * driver are already registered?
>> +      */
>> +     for (i = 0; i < num_clks; i++) {
>> +             struct clk_hw *hw;
>> +
>> +             if (!rclks[i])
>> +                     continue;
>> +
>> +             hw = &rclks[i]->hw;
>> +
>> +             if (!(hw->init->flags & CLK_INHERIT_BOOTLOADER))
>> +                     continue;
>> +
>> +             if (!clk_is_enabled_regmap(hw))
>> +                     continue;
>> +
>> +             dev_dbg(dev, "%s is enabled from bootloader!\n",
>> +                       hw->init->name);
>> +
>> +             clk_inherit_enabled(hw->clk);
>
> how about just calling a clk_prepare_enable(hw->clk) instead of adding a new API?
> The flag could also be something qcom specific and then we avoid having to add
> anything in generic CCF code and its all handled in the qcom clock drivers.

Hmm, I could try that..  I *guess* it doesn't hurt to enable an
already enabled clk..

beyond that, I wonder if this is something that other platforms would
want, so maybe I should be doing the check for enabled in CCF core?
If not, making this a qcom specific flag makes sense.

>> +     }
>> +
>>       reset = &cc->reset;
>>       reset->rcdev.of_node = dev->of_node;
>>       reset->rcdev.ops = &qcom_reset_ops;
>
> [] ..
>
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index a4f3580587b7..440d819b2d9d 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -291,6 +291,12 @@ static int gdsc_init(struct gdsc *sc)
>>       if ((sc->flags & VOTABLE) && on)
>>               gdsc_enable(&sc->pd);
>>
>> +     if ((sc->flags & INHERIT_BL) && on) {
>> +             pr_debug("gdsc: %s is enabled from bootloader!\n", sc->pd.name);
>> +             gdsc_enable(&sc->pd);
>> +             sc->pd.flags |= GENPD_FLAG_ALWAYS_ON;
>
> Would this not prevent the powerdomain from ever getting disabled?

Yeah, this is a hack, because I couldn't figure out something better.
The problem is that gdsc/powerdomain doesn't have it's own
enable_count but this is tracked at the device level (afaict.. maybe
I'm miss-understanding something).  I guess we could add our own
enable_count within gdsc?  Suggestions welcome, since I don't know
these parts of the code so well.

BR,
-R

> regards,
> Rajendra
>
>> +     }
>> +
>>       if (on || (sc->pwrsts & PWRSTS_RET))
>>               gdsc_force_mem_on(sc);
>>       else
>> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
>> index 39648348e5ec..3b5e64b060c2 100644
>> --- a/drivers/clk/qcom/gdsc.h
>> +++ b/drivers/clk/qcom/gdsc.h
>> @@ -53,6 +53,7 @@ struct gdsc {
>>  #define VOTABLE              BIT(0)
>>  #define CLAMP_IO     BIT(1)
>>  #define HW_CTRL              BIT(2)
>> +#define INHERIT_BL   BIT(3)
>>       struct reset_controller_dev     *rcdev;
>>       unsigned int                    *resets;
>>       unsigned int                    reset_count;
>> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
>> index c59c62571e4f..4d5505f92329 100644
>> --- a/include/linux/clk-provider.h
>> +++ b/include/linux/clk-provider.h
>> @@ -35,6 +35,7 @@
>>  #define CLK_IS_CRITICAL              BIT(11) /* do not gate, ever */
>>  /* parents need enable during gate/ungate, set rate and re-parent */
>>  #define CLK_OPS_PARENT_ENABLE        BIT(12)
>> +#define CLK_INHERIT_BOOTLOADER       BIT(13) /* clk may be enabled from bootloader */
>>
>>  struct clk;
>>  struct clk_hw;
>> diff --git a/include/linux/clk.h b/include/linux/clk.h
>> index 91bd464f4c9b..461991fc57e2 100644
>> --- a/include/linux/clk.h
>> +++ b/include/linux/clk.h
>> @@ -391,6 +391,15 @@ void clk_disable(struct clk *clk);
>>  void clk_bulk_disable(int num_clks, const struct clk_bulk_data *clks);
>>
>>  /**
>> + * clk_inherit_enabled - update the enable/prepare count of a clock and it's
>> + * parents for clock enabled by bootloader.
>> + *
>> + * Intended to be used by clock drivers to inform the clk core of a clock
>> + * that is already running.
>> + */
>> +void clk_inherit_enabled(struct clk *clk);
>> +
>> +/**
>>   * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
>>   *             This is only valid once the clock source has been enabled.
>>   * @clk: clock source
>>
>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> hosted by The Linux Foundation
