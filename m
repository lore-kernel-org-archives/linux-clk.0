Return-Path: <grygorii.strashko@linaro.org>
Return-Path: <grygorii.strashko@linaro.org>
From: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Message-ID: <55646503.2060502@linaro.org>
Date: Tue, 26 May 2015 15:20:19 +0300
MIME-Version: 1.0
To: Michael Turquette <mturquette@linaro.org>,
 Jim Quinlan <jim2101024@gmail.com>,
 linux-clk@vger.kernel.org
CC: bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] clk: export function clk_disable_unused()
References: <1431728556-620-1-git-send-email-jim2101024@gmail.com> <20150523193321.9817.1715@quantum>
In-Reply-To: <20150523193321.9817.1715@quantum>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,
On 05/23/2015 10:33 PM, Michael Turquette wrote:
> Quoting Jim Quinlan (2015-05-15 15:22:36)
>> For Broadcom STB chips, clocks may come up after resume in an "on"
>> state, so calling clk_disable_unused() again will turn off unused
>> clocks.  This commit exports clk_disable_unused() so it may be
>> called in such cases.
> 
> Jim,
> 
> Thanks for the patch.
> 
> I think a more general solution to the problem might be needed. E.g. how
> do we solve for the opposite case where after a low-power suspend/resume
> we turn on clocks that were enabled by drivers before suspending, but
> are disabled out of reset/post-transition?
> 
> Additionally, it would be helpful to see your driver changes and how
> exactly you plan to use this newly exported function.
> 
> I've Cc'd Grygorii Strashko from TI. I faintly recall that he had an
> out-of-tree solution to add some .suspend/.resume callbacks to struct
> clk_ops. I didn't like that solution at the time either, but maybe we
> can figure out a more natural way to handle these cases.
> 
> (Grygorii: sorry in advance if this is a case of mistaken identity. I
> could not find the code in question from my email archive)

I've copied links here FYI:

[1] http://git.ti.com/ti-linux-kernel/ti-linux-kernel/commit/31bdb0f10c7129a157e238fde12390dae8e08d92
[2-fix] http://git.ti.com/ti-linux-kernel/ti-linux-kernel/commit/bdb1402837ae5232748ce79fc1f286b4c2b0b2ac

It looks like this is a little bit different problem from one side
 - some clocks can be enabled unconditionally by HW or FW on restore/resume.
And, seems, possible way to solve it is to use PM notifiers in
clk driver/core (I hate PM notifiers;), but I don't see another generic way,
because CLKs are not devices):
 PM_POST_SUSPEND:
	if (!hw->clk->enable_count)
		hw->clk->ops->disable(hw);
 - or - 
	clk_disable_unused();
        ^^ then this patch is reasonable :)

>From another side, It might be solved for gate clocks case with mentioned above
.restore_context() callback... theoretically.

Also there are few comments from our internal discussion, FYI:

=== Mike == :
"As per our discussion, your objection was that if we will
- introduce per-clocks  .save_context/restore_context callbacks
- perform clks restore during system suspend resume/hibernation restore
  using depth-first-pre-order tree traversal algorithm

then at some point we might get situation when DPLL's rate has been
changed already, but some Divider clock still configured using default
values. This may lead to the fact that unsafe frequency will be
generated  for the corresponding subtree during some period of time
(potentially short) until context of this Divider clock will be
restored.

proposition was:
- save/restore clock's HW context all at once (PM domains +
clockdomains + clocks registers)"

== Tero Kristo == :
"The problem with per/clock save/restore context is also that it will potentially
 read/write same registers multiple times, where it would be sufficient to combine these
 to a single access. Consider for example omap3, where we have a single FCLKEN / ICLKEN register,
 which contains enable bits for 20+ clocks. This can be optimized to a single access instead of 20+.

 Personally I think the save-restore should be done on lower level, for example by the PRCM drivers
 that are providing the register space for the clocks. This way we can more easily handle all the corner
 cases also, or do a simple save-restore for a range of registers. It might be necessary to do callbacks
 to clock code in some cases, like DPLLs which are rather complex to control.

 I think this sounds pretty similar to what Mike was proposing looking at the comment below."

=== Mike == :
"Correct. My main concern talking to Grygorii at HKG15 was that putting
tree traversal logic into the clock core for doing context
save/restore was fixing a problem in the place and in the wrong way.
The driver that maps onto the range of registers that lose context
should manage this stuff. If that is not working today then it should
be fixed, but the solution is not to put this stuff into the clock
framework core."

-- 
regards,
-grygorii
