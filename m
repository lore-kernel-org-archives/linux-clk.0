Return-Path: <alim.akhtar@samsung.com>
Message-id: <55F7E5C7.40802@samsung.com>
Date: Tue, 15 Sep 2015 15:02:55 +0530
From: Alim Akhtar <alim.akhtar@samsung.com>
MIME-version: 1.0
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com,
 mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com,
 sboyd@codeaurora.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 00/12] clk: samsung: exynos7: Cleanup of clock file
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
 <55F7E422.4080203@samsung.com>
In-reply-to: <55F7E422.4080203@samsung.com>
Content-type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Sylwester,

On 09/15/2015 02:55 PM, Sylwester Nawrocki wrote:
> On 10/09/15 10:44, Alim Akhtar wrote:
>> Currently there are lots of ambiguity between clock names in clock file
>> and in user manual, which leads to lots of confusion for the reviewers.
>> This series attempts to cleanup the exynos7 clock file as per
>> user manual naming convention.
>> This also adds some of the missing Gate clocks which are needed
>> to complete the clock tree.
>
> The whole series applied, thanks.
>
Thanks!!
