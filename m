Return-Path: <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v5 6/9] coresight: add support for CPU debug module
To: Leo Yan <leo.yan@linaro.org>
References: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
 <1490466197-29163-7-git-send-email-leo.yan@linaro.org>
 <31be033f-514e-e48a-3ba2-a5c5cd477548@arm.com>
 <20170329030735.GA23889@leoy-linaro>
 <5584203e-cb19-a5d2-45b1-3e78d3482c55@arm.com>
 <20170329102740.GA20804@leoy-linaro>
 <89b6c6c7-0da0-6891-312a-c9221851c20a@arm.com>
 <20170329103712.GA22480@leoy-linaro>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>,
 David Brown <david.brown@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, mike.leach@linaro.org, sudeep.holla@arm.com
From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Message-ID: <c167e6d7-e02d-3dfb-7194-0754eeaf0863@arm.com>
Date: Wed, 29 Mar 2017 16:50:43 +0100
MIME-Version: 1.0
In-Reply-To: <20170329103712.GA22480@leoy-linaro>
Content-Type: text/plain; charset=us-ascii; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 29/03/17 11:37, Leo Yan wrote:
> On Wed, Mar 29, 2017 at 11:31:03AM +0100, Suzuki K Poulose wrote:
>> On 29/03/17 11:27, Leo Yan wrote:
>>> On Wed, Mar 29, 2017 at 10:07:07AM +0100, Suzuki K Poulose wrote:
>>>
>>> [...]
>>>
>>>>>>> +	if (mode == EDDEVID_IMPL_NONE) {
>>>>>>> +		drvdata->edpcsr_present  = false;
>>>>>>> +		drvdata->edcidsr_present = false;
>>>>>>> +		drvdata->edvidsr_present = false;
>>>>>>> +	} else if (mode == EDDEVID_IMPL_EDPCSR) {
>>>>>>> +		drvdata->edpcsr_present  = true;
>>>>>>> +		drvdata->edcidsr_present = false;
>>>>>>> +		drvdata->edvidsr_present = false;
>>>>>>> +	} else if (mode == EDDEVID_IMPL_EDPCSR_EDCIDSR) {
>>>>>>> +		if (!IS_ENABLED(CONFIG_64BIT) &&
>>>>>>> +			(pcsr_offset == EDDEVID1_PCSR_NO_OFFSET_DIS_AARCH32))
>>>>>>> +			drvdata->edpcsr_present = false;
>>>>>>> +		else
>>>>>>> +			drvdata->edpcsr_present = true;
>>>>>>
>>>>>> Sorry, I forgot why we do this check only in this mode. Shouldn't this be
>>>>>> common to all modes (of course which implies PCSR is present) ?
>>>>>
>>>>> No. PCSROffset is defined differently in ARMv7 and ARMv8; So finally we
>>>>> simplize PCSROffset value :
>>>>> 0000 - Sample offset applies based on the instruction state (indicated by PCSR[0])
>>>>> 0001 - No offset applies.
>>>>> 0010 - No offset applies, but do not use in AArch32 mode!
>>>>>
>>>>> So we need handle the corner case is when CPU runs AArch32 mode and
>>>>> PCSRoffset = 'b0010. Other cases the pcsr should be present.
>>>>
>>>> I understand that reasoning. But my question is, why do we check for PCSROffset
>>>> only when mode == EDDEVID_IMPL_EDPCSR_EDCIDSR and not for say mode == EDDEVID_IMPL_EDPCSR or
>>>> any other mode where PCSR is present.
>>>
>>> Sorry I misunderstood your question.
>>>
>>> I made mistake when I analyzed the possbile combination for mode and
>>> PCSROffset so I thought it's the only case should handle:
>>> { EDDEVID_IMPL_EDPCSR_EDCIDSR, EDDEVID1_PCSR_NO_OFFSET_DIS_AARCH32 }
>>>
>>> Below three combinations are possible to exist; so you are right, I
>>> should move this out for the checking:
>>> { EDDEVID_IMPL_NONE,           EDDEVID1_PCSR_NO_OFFSET_DIS_AARCH32 }
>>
>> That need not be covered, as IMPL_NONE says PCSR is not implemented hence you
>> don't worry about anything as the functionality is missing. This should rather be:
>> EDDEVID_IMPL_EDPCSR, where only PCSR is implemented.
>
> I think below combination doesn't really exist:
> { EDDEVID_IMPL_EDPCSR, EDDEVID1_PCSR_NO_OFFSET_DIS_AARCH32 };
>
> EDDEVID_IMPL_EDPCSR is only defined in ARMv7 ARM, and
> EDDEVID1_PCSR_NO_OFFSET_DIS_AARCH32 is only defined in ARMv8 ARM.

It is not wrong to check the PCSROffset in all cases where PCSR is available, as if
we hit PCSR on ARMv7 then PCSROffset shouldn't be DIS_AARCH32. And in fact that
would make the code a bit more cleaner. Anyways, I am not particular about this.

Suzuki
