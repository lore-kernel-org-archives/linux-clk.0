Return-Path: <s.nawrocki@samsung.com>
Message-id: <554747A6.7030605@samsung.com>
Date: Mon, 04 May 2015 12:19:18 +0200
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
MIME-version: 1.0
To: Michael Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Subject: Re: [GIT PULL] clk/samsung fixes for 4.1
References: <554105AC.8060800@samsung.com> <20150429231820.16410.26690@quantum>
In-reply-to: <20150429231820.16410.26690@quantum>
Content-type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hello Mike,

On 30/04/15 01:18, Michael Turquette wrote:
> Quoting Sylwester Nawrocki (2015-04-29 09:24:12)

>> ----------------------------------------------------------------
>> clk/samsung fixes for 4.1
>>
>> Fixes of clk definitions in recently added clock controller driver for
>> exynos5433 SoC and enhancements for DVFS, proper system sleep and secure
>> monitor calls support in this SoC. The exynos5420 patch fixes a serious
>> system sleep regression introduced in 3.19.
>>
>> ----------------------------------------------------------------

>>       clk: exynos5433: Add CLK_SET_RATE_PARENT to support DVFS for big.LITTLE core
> 
> Above patch doesn't look like a fix for an introduced regression.

>> Hyungwon Hwang (1):
>>       clk: exynos5433: Add DIV_CPIF to the list of stored registers on suspend
> 
> Above patch doesn't look like a fix for an introduced regression.

>>       clk: exynos5433: Add CLK_IGNORE_UNUSED flag to clocks for SMC
> 
> Above patch doesn't look like a fix for an introduced regression.

>> Joonyoung Shim (1):
>>       clk: exynos5433: Add clock flag to support the DVFS of GPU
> 
> Above patch doesn't look like a fix for an introduced regression.

Apologies for mixing them up, I'm going to resend above 4 patches
for 4.2. The DVFS related patches are indeed not critical, I thought
especially the second and third patch above are good for early -rc,
since they fix bugs in a driver which was first added in 4.1-rc1.
Anyway, I'll resend the dropped patches for 4.2, thanks for queueing
the remaining ones.

-- 
Regards,
Sylwester
