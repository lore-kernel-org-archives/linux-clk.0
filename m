Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854BBC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 16 Feb 2022 16:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236709AbiBPQwu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Feb 2022 11:52:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236712AbiBPQwu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Feb 2022 11:52:50 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0959A94975;
        Wed, 16 Feb 2022 08:52:35 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id D4226810F3;
        Wed, 16 Feb 2022 17:52:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1645030353;
        bh=nkHR9J9jq4jtJGORfFcUwAWp0vCgYi0vjG/zzB9UHSs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VndKBErmHtwuwgvqPBCGOdqWtRVY2TK1xxj2FTQhZ8MgBTzWmr3qVVH8QeMr8A6tQ
         T136dg3MeI9mFPItBbrcrq3nwHa0IqBPmxZmxXYXomVS80HlSCZHUO8/HLBRZZFYHE
         LKrH44npTHnrgQpQSXQNUzmvibTDsXQ6Z6rzEZipRxPvp2DcTHYmpKLJK8fr+WsAB3
         YCiyRdCQm3x63T4hkNjfOWs+AWaeuJr9FRtB/8jp+vDpm/Mqre2mQ190vQXQnAiAlK
         jg0G+aARUyRFZvBBy0jGqkMcNYmCy9+ftTkz21PL43RI0LM4PUddHy6DPtklQk5DWJ
         byLwO/1OdzHOw==
Message-ID: <8083fbfb-d039-a7c8-7c08-c57ebf9e3b56@denx.de>
Date:   Wed, 16 Feb 2022 17:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
Content-Language: en-US
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@rohmsemiconductoreurope.onmicrosoft.com>
References: <20220215084412.8090-1-marex@denx.de>
 <20220215084412.8090-2-marex@denx.de>
 <c1fce212-4d9e-06fe-e3fe-6d0f2ab29489@fi.rohmeurope.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <c1fce212-4d9e-06fe-e3fe-6d0f2ab29489@fi.rohmeurope.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/16/22 13:06, Vaittinen, Matti wrote:

Hi,

[...]

>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 8de6a22498e70..1e1686fa76e01 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -3872,6 +3872,45 @@ static void clk_core_free_parent_map(struct clk_core *core)
>>    	kfree(core->parents);
>>    }
>>    
>> +static void
>> +__clk_register_critical_clock(struct device_node *np, struct clk_core *core,
>> +			      struct clk_hw *hw)
>> +{
>> +	struct of_phandle_args clkspec;
>> +	u32 clksize, clktotal;
>> +	int ret, i, index;
>> +
>> +	if (!np)
>> +		return;
>> +
>> +	if (!core->ops->match_clkspec)
>> +		return;
>> +
>> +	if (of_property_read_u32(np, "#clock-cells", &clksize))
>> +		return;
>> +
>> +	/* Clock node with #clock-cells = <0> uses critical-clocks; */
>> +	if (clksize == 0) {
>> +		if (of_property_read_bool(np, "critical-clocks") &&
>> +		    !core->ops->match_clkspec(hw, &clkspec))
> 
> I think this is never true as there is
> if (!core->ops->match_clkspec)
> 	return;
> 
> above.

If the driver implements match_clkspec() callback, then the callback 
gets used here to determine whether the clock match this clkspec.

> Anyways, seeing you added a dummy bd71837_match_clkspec in a follow-up
> patch for BD71837 - which has only single clock - I wonder if there is a
> way to omit that dummy callback in controllers which really provide only
> one clock?

Yes, I think we can omit the match_clkspec call for clock controllers 
with clock-cells == 0 altogether.
