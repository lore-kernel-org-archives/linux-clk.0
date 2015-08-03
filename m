Return-Path: <jim2101024@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20150723183240.642.94435@quantum>
References: <1431728556-620-1-git-send-email-jim2101024@gmail.com>
	<20150523193321.9817.1715@quantum>
	<CANCKTBsZr-Ew97TX60u416Lhw4tEBfMkDUGn1yw13ThMrz3z9Q@mail.gmail.com>
	<5567316A.9030003@linaro.org>
	<20150723183240.642.94435@quantum>
Date: Mon, 3 Aug 2015 17:40:28 -0400
Message-ID: <CANCKTBuVNW2oL3s49Yeo+dQTp2WLT6BegZLcMDn04xfZhzwExQ@mail.gmail.com>
Subject: Re: [PATCH] clk: export function clk_disable_unused()
From: Jim Quinlan <jim2101024@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>, linux-clk@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 23, 2015 at 2:32 PM, Michael Turquette
<mturquette@linaro.org> wrote:
> Quoting Grygorii.Strashko@linaro.org (2015-05-28 08:16:58)
>> On 05/28/2015 05:21 PM, Jim Quinlan wrote:
>>
>> > We are currently doing [1].  We'd like to change this so that we are
>> > the same as upstream barring a small syscore driver that will call
>> > clk_disable_unused() on S2/S3 resume.  My patch reflects the
>> > suggestion found in [2], which says, "... It could still be generic by
>> > exporting the clk_disable_unused() function to drivers...".
>> >
>> > We do not have the general problems you are alluding to.  With few
>> > exceptions, we do not yet use power domains or runtime PM, although of
>> > course this may change.  Our drivers  use either syscore calls or
>> > SIMPLE_DEV_PM_OPS() to turn off/on clocks as needed during S2/S3
>> > suspend/resume.  The problem we have is when the software stack omits
>> > a driver or we have a new HW block which has no driver.  On boot,
>> > clk_disable_unused() turns off the clocks that these missing drivers
>> > would normally use*.  But on resumption of S2/S3, these clocks get
>> > turned on by HW, and all I am asking is that clk_disable_unused() be
>> > exported so a driver may invoke it to do the same thing it does during
>> > boot.
>>
>> This issue is much more simpler then saving/restoring of clocks state, so
>> may be it can be solved first.
>>
>> Taking to the account comments from [2] I think that could be
>> done inside clk core using PM notifiers,
>> and sysfs/module parameter can be used to enable/disable this feature, like:
>>  PM_POST_SUSPEND:
>>  PM_POST_HIBERNATION:
>>  PM_RESTORE_PREPARE:
>>         if (clk_disable_unused_on_suspend)
>>                 clk_disable_unused();
>>
>>
>> Mike, What do you think?
>
> I've chewed on this a bit and I do not think that the framework core
> should be doing this suspend/resume stuff. I think that suspend/resume
> should be handled by the drivers, as it usually is.
>
> Regarding clk_disable_unused(), I think that function is causing a
> variety of problems today and should be revisited. Instead of exposing
> it to drivers or calling it as a resume callback from the framework
> core, I think we should consider alternatives.
>
> For example, would it be more useful to have a simple interface that
> lets a clock driver query the prepare_count and enable_count of a clock,
> and compare that to the physical hardware state? Given a list of clocks
> that are "owned" by that clock driver, then it can make the right
> decision itself, perhaps in a .resume callback. But the logic to do this
> could migrate to clock drivers and out of the framework core.
>
> What information would your clock driver need from the framework core to
> be able to handle your use cases?
>
> Regards,
> Mike

Hi Mike,
My position is that if clk_disalbe_unused() exists and it is called in
early boot, then it should be available for invoking on S2/S3 resume.
I see you are questioning its existence and role in the first place.
For our situation -- which we don't yet employ PM domains --  I would
also need a way to iterate through all of the root clocks.
Basically, I would just reconstruct an "outside" version of
clk_disable_unused().  The reason it must be exhaustive is that some
clocks are not be governed by a driver at all for reasons out of our
control.

Thanks,
Jim Quinlan
Broadcom

>
>>
>> >
>> > * Why the HW turns these clocks on in the first place is a question I
>> > cannot answer.
>> > [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/311568.html
>> > [2] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/311575.html
>> >
>> > On Sat, May 23, 2015 at 3:33 PM, Michael Turquette
>> > <mturquette@linaro.org> wrote:
>> >> Quoting Jim Quinlan (2015-05-15 15:22:36)
>> >>> For Broadcom STB chips, clocks may come up after resume in an "on"
>> >>> state, so calling clk_disable_unused() again will turn off unused
>> >>> clocks.  This commit exports clk_disable_unused() so it may be
>> >>> called in such cases.
>> >>
>> >> Jim,
>> >>
>> >> Thanks for the patch.
>> >>
>> >> I think a more general solution to the problem might be needed. E.g. how
>> >> do we solve for the opposite case where after a low-power suspend/resume
>> >> we turn on clocks that were enabled by drivers before suspending, but
>> >> are disabled out of reset/post-transition?
>> >>
>> >> Additionally, it would be helpful to see your driver changes and how
>> >> exactly you plan to use this newly exported function.
>> >>
>> >> I've Cc'd Grygorii Strashko from TI. I faintly recall that he had an
>> >> out-of-tree solution to add some .suspend/.resume callbacks to struct
>> >> clk_ops. I didn't like that solution at the time either, but maybe we
>> >> can figure out a more natural way to handle these cases.
>> >>
>> >> (Grygorii: sorry in advance if this is a case of mistaken identity. I
>> >> could not find the code in question from my email archive)
>> >>
>> >> Regards,
>> >> Mike
>>
>>
>>
>> --
>> regards,
>> -grygorii
