Return-Path: <absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Fri, 28 Jul 2017 15:12:17 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, david.brown@linaro.org,
 rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC 01/12] clk: qcom: support for register offsets from rcg2
 clock node
In-Reply-To: <4b660d7f-17ba-e5a6-3f48-13eeb1d9f02c@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
 <1501153825-5181-2-git-send-email-absahu@codeaurora.org>
 <4b660d7f-17ba-e5a6-3f48-13eeb1d9f02c@codeaurora.org>
Message-ID: <115a73ba35bd764b4842060bac1050b4@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2017-07-28 00:14, Stephen Boyd wrote:
> On 07/27/2017 04:10 AM, Abhishek Sahu wrote:
>> The current driver hardcodes the RCG2 register offsets. Some of
>> the RCG2’s use different offsets from the default one.
>> 
>> This patch adds the support to provide the register offsets array in
>> RCG2 clock node. If RCG2 clock node contains the register offsets
>> then this will be used instead of default one.
>> 

  <snip>

>> @@ -43,22 +41,34 @@
>>  #define CFG_MODE_MASK		(0x3 << CFG_MODE_SHIFT)
>>  #define CFG_MODE_DUAL_EDGE	(0x2 << CFG_MODE_SHIFT)
>> 
>> -#define M_REG			0x8
>> -#define N_REG			0xc
>> -#define D_REG			0x10
>> +#define rcg2_cmd(rcg, offsets)	(rcg->cmd_rcgr)
>> +#define rcg2_cfg(rcg, offsets)	(rcg->cmd_rcgr + 
>> offsets[CLK_RCG2_CFG])
>> +#define rcg2_m(rcg, offsets)	(rcg->cmd_rcgr + offsets[CLK_RCG2_M])
>> +#define rcg2_n(rcg, offsets)	(rcg->cmd_rcgr + offsets[CLK_RCG2_N])
>> +#define rcg2_d(rcg, offsets)	(rcg->cmd_rcgr + offsets[CLK_RCG2_D])
>> +
>> +#define to_rcg2_offsets(rcg)	(rcg->offsets ?		\
>> +				 rcg->offsets : rcg2_default_offsets)
>> 
>>  enum freq_policy {
>>  	FLOOR,
>>  	CEIL,
>>  };
>> 
>> +static const u8 rcg2_default_offsets[] = {
>> +	[CLK_RCG2_CFG] = 0x4,
>> +	[CLK_RCG2_M] = 0x8,
>> +	[CLK_RCG2_N] = 0xc,
>> +	[CLK_RCG2_D] = 0x10,
>> +};
> 
> It looks like the two UBI clks that messed this up don't have an MN
> counter, so instead of doing this maddness, just add a flag like

  I have given example for one of the RCG. IPQ8074 have more clocks for
  which the offsets are not continuous and some of the clocks have
  mn counter also (NSS Crypto and PCIE AUX)

  GCC_NSS_UBI0_CMD_RCGR 0x1868100
  GCC_NSS_UBI0_CFG_RCGR 0x1868108
  GCC_NSS_UBI1_CMD_RCGR 0x1868120
  GCC_NSS_UBI1_CFG_RCGR 0x1868128

  GCC_NSS_CRYPTO_CMD_RCGR 0x1868140
  GCC_NSS_CRYPTO_CFG_RCGR 0x1868148
  GCC_NSS_CRYPTO_M 0x186814C
  GCC_NSS_CRYPTO_N 0x1868150
  GCC_NSS_CRYPTO_D 0x1868154

  GCC_PCIE0_AUX_CMD_RCGR	0x1875020
  GCC_PCIE0_AUX_CFG_RCGR	0x1875028
  GCC_PCIE0_AUX_M 0x187502C
  GCC_PCIE0_AUX_N 0x1875030
  GCC_PCIE0_AUX_D 0x1875034

  GCC_PCIE0_AXI_CMD_RCGR 0x1875050
  GCC_PCIE0_AXI_CFG_RCGR 0x1875058

  Similarly for PCIE1 also.

> m_is_cfg and then make a rcg2_crmd() function that checks this flag and
> returns cmd_rcg + CFG_REG or cmd_rgcr + M_REG depending on the flag. We

  The original idea was to make this generic so in future for all the 
cases
  it will work. If we can make function and since some clocks have MN
  counter, so could we make function for CMD reg itself instead of CFG 
reg.
  For this, pass cmd_rcgr as + 4 from GCC driver and when this flag is 
set
  then do minus 4 for all CMD_REG

> can also optimize further, and ifdef this whole branch out unless the
> specific IPQ GCC driver is enabled. Also only update the generic RCG
> code, and not the display/gpu specific ones. Then the diff is much
> smaller, and we can go yell at hardware team to never do this again.

-- 
Abhishek Sahu
