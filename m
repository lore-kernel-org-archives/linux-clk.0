Return-Path: <daniel.lezcano@linaro.org>
Return-Path: <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V3 2/2] ARM64: dts: hi6220-hikey: Add clock binding for
 the pmic mfd
To: Stephen Boyd <sboyd@codeaurora.org>, lee.jones@linaro.org
References: <1492449567-31399-1-git-send-email-daniel.lezcano@linaro.org>
 <1492449567-31399-2-git-send-email-daniel.lezcano@linaro.org>
 <20170422020233.GA7065@codeaurora.org>
Cc: mturquette@baylibre.com, xuwei5@hisilicon.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <370c36f9-e6fc-416c-776b-edc1e42d7ddc@linaro.org>
Date: Sat, 22 Apr 2017 16:09:45 +0200
MIME-Version: 1.0
In-Reply-To: <20170422020233.GA7065@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 22/04/2017 04:02, Stephen Boyd wrote:
> On 04/17, Daniel Lezcano wrote:
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt | 6 ++++++
>>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts             | 1 +
>>  2 files changed, 7 insertions(+)
>>
> 
> I take it this goes through arm-soc? Not sure why I'm on To:
> line.

Probably it should go through Lee's tree.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
