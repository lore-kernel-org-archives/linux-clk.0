Return-Path: <sricharan@codeaurora.org>
From: "Sricharan" <sricharan@codeaurora.org>
To: "'Rajendra Nayak'" <rnayak@codeaurora.org>,
	"'Stephen Boyd'" <sboyd@codeaurora.org>
Cc: <mturquette@baylibre.com>,
	<linux-clk@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<stanimir.varbanov@linaro.org>
References: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org> <1477304297-5248-4-git-send-email-sricharan@codeaurora.org> <20161103203418.GA16026@codeaurora.org> <006701d2367b$19a6ba00$4cf42e00$@codeaurora.org> <20161104201836.GE16026@codeaurora.org> <58201597.6010207@codeaurora.org> <20161108223336.GK16026@codeaurora.org> <000301d23aaa$3f5dd110$be197330$@codeaurora.org> <5823DC3E.2060106@codeaurora.org>
In-Reply-To: <5823DC3E.2060106@codeaurora.org>
Subject: RE: [PATCH 3/3] clk: qcom: Set BRANCH_HALT_DELAY flags for venus core0/1 clks
Date: Thu, 10 Nov 2016 08:58:13 +0530
Message-ID: <001701d23b02$7bf7daa0$73e78fe0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Rajendra,
>
>>>
>>> The proper sequence sounds like it should be:
>>>
>>> 	1. Enable GDSC for main domain
>>> 	2. Enable clocks for main domain (video_{core,maxi,ahb,axi}_clk)
>>> 	3. Write the two registers to assert hw signal for subdomains
>>> 	4. Enable GDSCs for two subdomains
>>> 	5. Enable clocks for subdomains (video_subcore{0,1}_clk)
>>>
>[]..
>
>>
>> So the above is the sequence which is actually carried out on the
>> firmware side. The same can be done in host as well.
>
>By the 'above sequence is done on firmware side', I hope you don;t mean *all* 5 steps.
>I guess you mean only step 3 is done by firmware?
>

Yes, only step 3.

Regards,
 Sricharan
