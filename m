Return-Path: <vaibhav.hiremath@linaro.org>
Return-Path: <vaibhav.hiremath@linaro.org>
Message-ID: <55DC2C4D.1040304@linaro.org>
Date: Tue, 25 Aug 2015 14:20:21 +0530
From: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
MIME-Version: 1.0
To: Lee Jones <lee.jones@linaro.org>
CC: linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 mturquette@baylibre.com, k.kozlowski@samsung.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH-v2 1/5] mfd: 88pm800: Fix tabbing issue
References: <1440442594-3102-1-git-send-email-vaibhav.hiremath@linaro.org> <1440442594-3102-3-git-send-email-vaibhav.hiremath@linaro.org> <20150825075246.GF19409@x1>
In-Reply-To: <20150825075246.GF19409@x1>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On Tuesday 25 August 2015 01:22 PM, Lee Jones wrote:
> On Tue, 25 Aug 2015, Vaibhav Hiremath wrote:
>
>> Driver had coding style issues where spaces were used instead
>> of tabs. This patch fixes them all.
>>
>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
>> ---
>>   drivers/mfd/88pm800.c | 125 ++++++++++++++++++++++++--------------------------
>>   1 file changed, 61 insertions(+), 64 deletions(-)
>
> Same comment as before.
>
> How similar is this file to the other one?

I believe you are referring to include/linux/mfd/88pm80x.h

>
> Can you reduce the size by having shared register defines?
>

Not sure whether I understand your comment here,
They are common defines.

PM860 only defines are named as

PM860_XXXX

Similarly,
PM805 only defines are named as

PM805_XXXX


and PM800_xxx should be common.

Thanks,
Vaibhav
