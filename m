Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:38005 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752495AbbKWJ1M (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 23 Nov 2015 04:27:12 -0500
Message-ID: <5652DBDD.3070603@rock-chips.com>
Date: Mon, 23 Nov 2015 17:26:53 +0800
From: hl <hl@rock-chips.com>
MIME-Version: 1.0
To: myungjoo.ham@samsung.com, "heiko@sntech.de" <heiko@sntech.de>,
	"dianders@chromium.org" <dianders@chromium.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	=?UTF-8?B?67CV6rK966+8?= <kyungmin.park@samsung.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	"dbasehore@chromium.org" <dbasehore@chromium.org>,
	"linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] clk: rockchip: dmc: support rk3399 dmc clock driver
References: <68719599.130141448266183403.JavaMail.weblogic@epmlwas06a>
In-Reply-To: <68719599.130141448266183403.JavaMail.weblogic@epmlwas06a>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi MyungJoo,

On 23/11/15 16:09, MyungJoo Ham wrote:
>> +static unsigned long rk3399_dmcclk_recalc_rate(struct clk_hw *hw,
>> +					       unsigned long parent_rate)
>> +{
>> +	struct rk3399_dmcclk *dmc = to_rk3399_dmcclk(&hw);
>> +	u32 val;
>> +
>> +	/*
>> +	 * Get parent rate since it changed in this clks set_rate op. The parent
>> +	 * rate passed into this function is cached before set_rate is called in
>> +	 * the common clk code, so we have to get it here.
>> +	 */
>> +	parent_rate = clk_get_rate(clk_get_parent(hw->clk));
>> +
>> +	val = readl(dmc->cru + CRU_CLKSEL6_CON);
>> +	val = (val >> CLK_DDRC_DIV_CON_SHIFT) & CLK_DDRC_DIV_CON_MASK;
>> +
>> +	return parent_rate / (val + 1);
>> +}
>> +
>> +/*
>> + * TODO: set ddr frequcney in dcf which run in ATF
>> + */
>> +static int rk3399_dmcclk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +				  unsigned long parent_rate)
>> +{
>> +	return 0;
>> +}
> Is it correct that you didn't fill this up because your
> Trustzone driver (SMC) is not ready yet?
     Yep, the SMC is not ready yet.
>
> Then, why don't you fill that function assuming that TrustZone is not activated
> and add SMC call functions with if or #if after its TrustZone driver is ready?
>
> Or does your SoC mandate the usage ot TrustZone, restricting the usage
> of CRU_CLKSEL6_CON write? (I don't see why SoC vendors will do this..)
>
>
> I'll be ready to merge the RK3399 devfreq driver if you
> fill this up (assuming that TZ is not enabled) or
> add TZ driver and SMC calls.
     Thank you for your reply,  it is good idea use if or #if to 
distinguish the TrustZone whether ready,
     i will handle it in next version. I may follow Heiko advice to do 
some modify in dmc clock and rk3399 devfreq driver,
     I will upload new version when it's ready.
>
> Cheers,
> MyungJoo
> ps. according to rk339_dmcclk_recalc_rate(), filling rk339_dmcclk_set_rate
> assuming that TZ is not enabled seems trivial.

-- 
Lin Huang


