Return-Path: <alim.akhtar@samsung.com>
Message-id: <5710E082.2050303@samsung.com>
Date: Fri, 15 Apr 2016 18:07:22 +0530
From: Alim Akhtar <alim.akhtar@samsung.com>
MIME-version: 1.0
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, s.nawrocki@samsung.com
Cc: thomas.ab@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 sboyd@codeaurora.org, mturquette@baylibre.com, tomasz.figa@gmail.com
Subject: Re: [PATCH] clk: samsung: exynos7: Don't gate CMU_{CCORE,
 FSYS0} blocks clock
References: <1460608972-13878-1-git-send-email-alim.akhtar@samsung.com>
 <570F4BE0.1010102@samsung.com>
In-reply-to: <570F4BE0.1010102@samsung.com>
Content-type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 04/14/2016 01:20 PM, Krzysztof Kozlowski wrote:
> On 04/14/2016 06:42 AM, Alim Akhtar wrote:
>> This patch adds CLK_IS_CRITICAL flag to ACLK_CCORE_133 and ACLK_FSYS0_200
>> clocks. These clocks are critical for accessing CMU_CCORE and CMU_FSYS0
>> blocks registers. Let these clocks to be enabled all the time.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos7.c |    5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
Thanks Krzysztof,
Sylwester, do you have any concern here?

> Best regards,
> Krzysztof
>
>
