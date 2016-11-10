Return-Path: <rnayak@codeaurora.org>
Message-ID: <5823DC3E.2060106@codeaurora.org>
Date: Thu, 10 Nov 2016 08:02:30 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Sricharan <sricharan@codeaurora.org>,
 'Stephen Boyd' <sboyd@codeaurora.org>
CC: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stanimir.varbanov@linaro.org
Subject: Re: [PATCH 3/3] clk: qcom: Set BRANCH_HALT_DELAY flags for venus
 core0/1 clks
References: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org> <1477304297-5248-4-git-send-email-sricharan@codeaurora.org> <20161103203418.GA16026@codeaurora.org> <006701d2367b$19a6ba00$4cf42e00$@codeaurora.org> <20161104201836.GE16026@codeaurora.org> <58201597.6010207@codeaurora.org> <20161108223336.GK16026@codeaurora.org> <000301d23aaa$3f5dd110$be197330$@codeaurora.org>
In-Reply-To: <000301d23aaa$3f5dd110$be197330$@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>


[]..

>>
>> The proper sequence sounds like it should be:
>>
>> 	1. Enable GDSC for main domain
>> 	2. Enable clocks for main domain (video_{core,maxi,ahb,axi}_clk)
>> 	3. Write the two registers to assert hw signal for subdomains
>> 	4. Enable GDSCs for two subdomains
>> 	5. Enable clocks for subdomains (video_subcore{0,1}_clk)
>>
[]..

> 
> So the above is the sequence which is actually carried out on the
> firmware side. The same can be done in host as well.

By the 'above sequence is done on firmware side', I hope you don;t mean *all* 5 steps.
I guess you mean only step 3 is done by firmware?

> The clocks stuck issue indeed is not there with this. But with the
> above sequence we need to add a step to do inverse of STEP3
> above (ie write the registers to de-assert hw_signal), to keep
> the subdomains in off, till firmware uses it. So the above sequence
> helps to avoid masking the halt check, although the host really
> does not wants to use these clocks, except setting it up for the
> firmware.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
