Return-Path: <xuejiancheng@hisilicon.com>
Subject: Re: [PATCH 2/2] clk: hisilicon: add CRG driver for Hi3516CV300 SoC
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1477721618-10809-1-git-send-email-xuejiancheng@hisilicon.com>
 <1477721618-10809-3-git-send-email-xuejiancheng@hisilicon.com>
 <20161112000415.GE5177@codeaurora.org>
 <0c3b49a4-f58c-253a-fd87-ab52b0b26010@hisilicon.com>
 <20161114200359.GM5177@codeaurora.org>
CC: <mturquette@baylibre.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <bin.chen@linaro.org>,
        <elder@linaro.org>, <hermit.wangheming@hisilicon.com>,
        <yanhaifeng@hisilicon.com>, <wenpan@hisilicon.com>,
        <howell.yang@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Message-ID: <85a91eb4-73bb-582f-b68d-960d423210ef@hisilicon.com>
Date: Tue, 15 Nov 2016 09:58:07 +0800
MIME-Version: 1.0
In-Reply-To: <20161114200359.GM5177@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>



On 2016/11/15 4:03, Stephen Boyd wrote:
> On 11/14, Jiancheng Xue wrote:
>> Hi Stephen,
>>
>> On 2016/11/12 8:04, Stephen Boyd wrote:
>>> On 10/29, Jiancheng Xue wrote:
>>>
>>> Should be a From: Pan Wen here?
>>>
>>>> Add CRG driver for Hi3516CV300 SoC. CRG(Clock and Reset
>>>> Generator) module generates clock and reset signals used
>>>> by other module blocks on SoC.
>>>>
>>>> Signed-off-by: Pan Wen <wenpan@hisilicon.com>
>>>
>>> And you should have signed it off? Care to resend or state that
>>> this is incorrectly attributed to you instead of Pan Wen?
>>>
>>
>> Pan Wen is the main author of this patch. I just made some small modification
>> with agreement from him. Do I need to resend this patch if it's better to add my
>> signed-off?
>>
> 
> Sure I'll apply the resent one. But you should also make sure to
> retain Pan Wen's authorship. I'll go do that when applying it.
> 

OK. I have resent this patch. Please check it. Thank you, Stephen.

Regards,
Jiancheng
