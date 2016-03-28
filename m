Return-Path: <zhengxing@rock-chips.com>
Message-ID: <56F8CB01.2070709@rock-chips.com>
Date: Mon, 28 Mar 2016 14:11:13 +0800
From: Xing Zheng <zhengxing@rock-chips.com>
MIME-Version: 1.0
To: Heiko Stuebner <heiko@sntech.de>
CC: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
 jay.xu@rock-chips.com, elaine.zhang@rock-chips.com,
 dianders@chromium.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/4] clk: rockchip: add clock controller for the RK3399
References: <1458974276-10325-1-git-send-email-zhengxing@rock-chips.com> <1458974276-10325-5-git-send-email-zhengxing@rock-chips.com> <9181730.v9nyazlRXy@phil>
In-Reply-To: <9181730.v9nyazlRXy@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Heiko,

On 2016年03月28日 08:13, Heiko Stuebner wrote:
> Hi Xing,
>
> Am Samstag, 26. März 2016, 14:37:56 schrieb Xing Zheng:
>> Add the clock tree definition for the new RK3399 SoC.
>>
>> Signed-off-by: Xing Zheng<zhengxing@rock-chips.com>
>> ---
> [...]
>
>> +	/*
>> +	 * We use pclkin_cifinv by default GRF_SOC_CON20[9] (GSC20_9) setting in
>> system, +	 * so we ignore the mux and make clocks nodes as following,
>> +	 *
>> +	 * pclkin_cifinv --|-------\
>> +	 *                 |GSC20_9|-- pclkin_cifmux
>> +	 * pclkin_cif    --|-------/
>> +	 */
>> +	GATE(PCLK_ISP1_WRAPPER, "pclkin_isp1_wrapper", "pclkin_cifmux",
> please name that source clock pclkin_cif as in the TRM.
> pclkin_cif is the actual input clock - if I'm reading the TRM correctly and
> the inverter is part of the soc or so?
>
> That we currently hide / hardcode the phase-handling should not be part of
> our outside connection - which should be stable even if we implement this
> later.
>
>
Yes, I think I will modify them like this:

GATE(PCLK_ISP1_WRAPPER, "pclkin_isp1_wrapper", "pclkin_cif", 
CLK_IGNORE_UNUSED,
RK3399_CLKGATE_CON(27), 6, GFLAGS),

Thanks.

-- 
- Xing Zheng
