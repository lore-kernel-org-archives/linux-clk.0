Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55DC49D0.1030608@linaro.org>
Date: Tue, 25 Aug 2015 16:26:16 +0530
From: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
MIME-Version: 1.0
To: Lee Jones <lee.jones@linaro.org>
CC: linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	mturquette@baylibre.com, k.kozlowski@samsung.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH-v2 1/5] mfd: 88pm800: Fix tabbing issue
References: <1440442594-3102-1-git-send-email-vaibhav.hiremath@linaro.org> <1440442594-3102-3-git-send-email-vaibhav.hiremath@linaro.org> <20150825075246.GF19409@x1> <55DC2C4D.1040304@linaro.org> <20150825103546.GQ19409@x1>
In-Reply-To: <20150825103546.GQ19409@x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On Tuesday 25 August 2015 04:05 PM, Lee Jones wrote:
> On Tue, 25 Aug 2015, Vaibhav Hiremath wrote:
>
>>
>>
>> On Tuesday 25 August 2015 01:22 PM, Lee Jones wrote:
>>> On Tue, 25 Aug 2015, Vaibhav Hiremath wrote:
>>>
>>>> Driver had coding style issues where spaces were used instead
>>>> of tabs. This patch fixes them all.
>>>>
>>>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
>>>> ---
>>>>   drivers/mfd/88pm800.c | 125 ++++++++++++++++++++++++--------------------------
>>>>   1 file changed, 61 insertions(+), 64 deletions(-)
>>>
>>> Same comment as before.
>>>
>>> How similar is this file to the other one?
>>
>> I believe you are referring to include/linux/mfd/88pm80x.h
>>
>>>
>>> Can you reduce the size by having shared register defines?
>>>
>>
>> Not sure whether I understand your comment here,
>> They are common defines.
>
> I guess the question was a little convoluted.
>
> How about; why are the extra defines in the driver?  Why aren't all of
> them in the header file?  What is the difference between the defines
> in the C file compared with the ones defined in the header?
>


I do not see any difference and need of having defines separately in C
file.
That's the cleanup I was referring to in another email.

I will walk through the whole driver code and try to cleanup all such
coding related issues. Probably expect separate series here.

Thanks,
Vaibhav
