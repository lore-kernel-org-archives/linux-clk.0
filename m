Return-Path: <Yixun.Lan@amlogic.com>
Subject: Re: [PATCH v2 2/2] clk: meson-axg: add clocks required by pcie driver
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<narmstrong@baylibre.com>
References: <20180702213118.19222-1-yixun.lan@amlogic.com>
 <20180702213118.19222-3-yixun.lan@amlogic.com>
 <1530609862.2900.187.camel@baylibre.com>
CC: <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione
	<carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu
	<jian.hu@amlogic.com>, Jianxin Qin <jianxin.qin@amlogic.com>,
	<linux-clk@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: Yixun Lan <yixun.lan@amlogic.com>
Message-ID: <7c8b47a9-67bc-b685-8c90-084299631fb0@amlogic.com>
Date: Tue, 3 Jul 2018 18:17:00 +0800
MIME-Version: 1.0
In-Reply-To: <1530609862.2900.187.camel@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Return-Path: yixun.lan@amlogic.com
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome:


On 07/03/18 17:24, Jerome Brunet wrote:
> On Mon, 2018-07-02 at 21:31 +0000, Yixun Lan wrote:
>> Adding clocks for the pcie driver. Due to the ASIC design,
>> the pcie controller re-use part of the mipi clock logic,
>> so the mipi clock is also added.
>>
>> Tested-by: Jianxin Qin <jianxin.qin@amlogic.com>
>> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>> ---
>>  drivers/clk/meson/axg.c | 148 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/meson/axg.h |   6 +-
>>  2 files changed, 153 insertions(+), 1 deletion(-)
>>
>>
> 
> [...]
> 
>> +
>> +/* skip the partent 0, it's for debug only */
>> +static u32 mux_table_pcie_ref[]	= { 1 };
>> +static const char * const pcie_ref_parent_names[] = { "pcie_mux" };
> 
> Dropped these symbols.
> 
>> +
>> +static struct clk_regmap axg_pcie_ref = {
>> +	.data = &(struct clk_regmap_mux_data){
>> +		.offset = HHI_PCIE_PLL_CNTL6,
>> +		.mask = 0x1,
>> +		.shift = 1,
>> +		.table = mux_table_pcie_ref,
> 
> Replaced with the table itself
> 
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "pcie_ref",
>> +		.ops = &clk_regmap_mux_ops,
>> +		.parent_names = pcie_ref_parent_names,
>> +		.num_parents = ARRAY_SIZE(pcie_ref_parent_names),
> 
> Replaced with the table itself and applied. Thx
> 
>> +		.flags = CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +

I'm seeing you already applied this patch, so would you like to
fix/amend the patch for me, or want me send another patch version?

thanks
