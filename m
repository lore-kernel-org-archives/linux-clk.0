Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:31975 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751081AbcKNBYh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 13 Nov 2016 20:24:37 -0500
Subject: Re: [PATCH 2/2] clk: hisilicon: add CRG driver for Hi3516CV300 SoC
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1477721618-10809-1-git-send-email-xuejiancheng@hisilicon.com>
 <1477721618-10809-3-git-send-email-xuejiancheng@hisilicon.com>
 <20161112000415.GE5177@codeaurora.org>
CC: <mturquette@baylibre.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <bin.chen@linaro.org>, <elder@linaro.org>,
        <hermit.wangheming@hisilicon.com>, <yanhaifeng@hisilicon.com>,
        <wenpan@hisilicon.com>, <howell.yang@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Message-ID: <0c3b49a4-f58c-253a-fd87-ab52b0b26010@hisilicon.com>
Date: Mon, 14 Nov 2016 09:24:17 +0800
MIME-Version: 1.0
In-Reply-To: <20161112000415.GE5177@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 2016/11/12 8:04, Stephen Boyd wrote:
> On 10/29, Jiancheng Xue wrote:
> 
> Should be a From: Pan Wen here?
> 
>> Add CRG driver for Hi3516CV300 SoC. CRG(Clock and Reset
>> Generator) module generates clock and reset signals used
>> by other module blocks on SoC.
>>
>> Signed-off-by: Pan Wen <wenpan@hisilicon.com>
> 
> And you should have signed it off? Care to resend or state that
> this is incorrectly attributed to you instead of Pan Wen?
> 

Pan Wen is the main author of this patch. I just made some small modification
with agreement from him. Do I need to resend this patch if it's better to add my
signed-off?

Thanks,
Jiancheng

