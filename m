Return-Path: <rklein@nvidia.com>
Message-ID: <554A3CF7.6070503@nvidia.com>
Date: Wed, 6 May 2015 12:10:31 -0400
From: Rhyland Klein <rklein@nvidia.com>
MIME-Version: 1.0
To: Thierry Reding <thierry.reding@gmail.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette
	<mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd
	<sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 00/20] Tegra210 Clock Support
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com> <20150505131419.GA11535@ulmo.nvidia.com> <5548E7E9.3040802@nvidia.com> <20150506133748.GD9421@ulmo>
In-Reply-To: <20150506133748.GD9421@ulmo>
Content-Type: text/plain; charset="windows-1252"
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 5/6/2015 9:37 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, May 05, 2015 at 11:55:21AM -0400, Rhyland Klein wrote:
>> On 5/5/2015 9:14 AM, Thierry Reding wrote:
>>>> Old Signed by an unknown key
>>>
>>> On Mon, May 04, 2015 at 12:37:20PM -0400, Rhyland Klein wrote:
>>>> This patch series updates the tegra common clock driver and adds
>>>> support for the Tegra210 clocks. The clocks in Tegra210 changed
>>>> significantly in some ways from earlier generations, so to support
>>>> them, we need to extend our base framework a bit and add some new
>>>> features.
>>>>
>>>> Some patches here also address issues found while adding features
>>>> and other cleanup type work.
>>>>
>>>> v4:
>>>>   - Fixed minor checkpatch errors and other typos
>>>>   - Rebased ontop of linux-next 20150504
>>>
>>> Are you sure about this? It still doesn't apply cleanly to next-20150504
>>> for me.
>>
>> It is based off c9256b89d92154cffd36697b412d0a0176a8e2d2 "Add linux-next
>> specific files for 20150504"
>>
>> What types of problems are you running into?
> 
> I get this when applying the first patch:
> 
> 	Applying: clk: tegra: Modify tegra_audio_clk_init to accept more plls
> 	error: patch failed: drivers/clk/tegra/clk.h:258
> 	error: drivers/clk/tegra/clk.h: patch does not apply
> 	Patch failed at 0001 clk: tegra: Modify tegra_audio_clk_init to accept more plls
> 	The copy of the patch that failed is found in:
> 	   /home/thierry.reding/src/kernel/linux-work.git/.git/rebase-apply/patch
> 	When you have resolved this problem, run "git am --continue".
> 	If you prefer to skip this patch, run "git am --skip" instead.
> 	To restore the original branch and stop patching, run "git am --abort".
> 
> Comparing again and looking at your internal tree it seems that in
> addition to next-20150504 you also have this patch in your tree:
> 
> 	clk: tegra: Fix comments for structure definitions
> 
> After applying that I can apply the series without problems. I've picked
> that patch up and will carry it in the Tegra clock branch. Hopefully the
> Tegra210 clock patches will be ready in time for v4.2 so that I can take
> them into the same branch.
> 
> Thierry

Ahh yes. I sent that patch a while back and Peter added his ack, but it
isn't present in linux-next, and I had it in my tree. Sorry for the
confusion.

-rhyland

> 
> * Unknown Key
> * 0x7F3EB3A1
> 


-- 
nvpublic
