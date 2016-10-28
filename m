Return-Path: <xuejiancheng@hisilicon.com>
Subject: Re: [RESEND PATCH v2] clk: hisilicon: add CRG driver for Hi3798CV200
 SoC
To: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
References: <1477013830-11481-1-git-send-email-xuejiancheng@hisilicon.com>
 <20161027134833.vdtd5t5hx33o3ahb@rob-hp-laptop>
 <20161028002548.GN26139@codeaurora.org>
CC: <mturquette@baylibre.com>, <mark.rutland@arm.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <bin.chen@linaro.org>,
        <elder@linaro.org>, <hermit.wangheming@hisilicon.com>,
        <yanhaifeng@hisilicon.com>, <wenpan@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Message-ID: <bc6bced1-e0cb-4239-7543-0302d00bde4e@hisilicon.com>
Date: Fri, 28 Oct 2016 09:19:38 +0800
MIME-Version: 1.0
In-Reply-To: <20161028002548.GN26139@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>



在 2016/10/28 8:25, Stephen Boyd 写道:
> On 10/27, Rob Herring wrote:
>> On Fri, Oct 21, 2016 at 09:37:10AM +0800, Jiancheng Xue wrote:
>>> Add CRG driver for Hi3798CV200 SoC. CRG(Clock and Reset
>>> Generator) module generates clock and reset signals used
>>> by other module blocks on SoC.
>>>
>>> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
>>> ---
>>> change log
>>> v2:
>>> - Fixed compiling error when compiled as a module.
>>> - Fixed issues pointed by Stephen Boyd.
>>> - Added prefix HISTB for clock index macro definitions.
>>
>> What Stephen asked for is send this and the Hi3516CV300 series as one 
>> series since there is a dependency.
> 
> Exactly. Please resend both parts, along with Rob's ack on this
> one. I can review it all then and hopefully Rob will be ok with
> the other binding change.
> 

I planed to send the Hi3516CV300 patch after this patch is accepted.

It's also OK to combine them as one series. I'll resend them.

Thanks,
Jiancheng
