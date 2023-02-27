Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6BEC64ED8
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 14:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjB0O6h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 09:58:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjB0O6f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 09:58:35 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916455262;
        Mon, 27 Feb 2023 06:58:34 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A9DBB80ADF;
        Mon, 27 Feb 2023 15:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677509911;
        bh=xGYDGL1ihg6Ce/sNZWfhcSbVleeZf4hHm/9S/wA1Mr8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=nvkpsLCGCvVSFxM2R65guX5RgTdZm9cMnrFgIPo1+FM9BIiiNKkjiCFHFUGcTITgm
         D+Ilk7NeOoBMQUZD47gyDvZZ2OPIkxli2mEVpfyBhISTvr4jrLlIAEAl4XvkfRzX1Z
         iR0TJkVa0mdWR4CUsBhzNf7/YT+ds14WB71XltMW6JQuiq7nXJt0Q1SBPuhDcYsVe3
         gWn+iMPN4O+Bsz5S6QM2qN9Hzgzz4kosIhYeu7tt6z+mD6ww6hg6eeQwMkWz6VQqO8
         WCspR19qNIOoQlWFQn/XTrgXgWgRRf+uzOr1x0E/6Tg/H7Zb5zVYz/kvPRFhc4ymWX
         IYZWXQ0/Mwecg==
Message-ID: <5073f78d-1c14-ce51-2f77-a94cda38e5f6@denx.de>
Date:   Mon, 27 Feb 2023 14:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/5] clk: Introduce
 devm_clk_hw_register_gate_parent_data()
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-clk@vger.kernel.org
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230223171114.59164-1-marex@denx.de>
 <8196426.T7Z3S40VBb@steina-w>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <8196426.T7Z3S40VBb@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/27/23 09:38, Alexander Stein wrote:

[...]

>> +/**
>> + * devm_clk_hw_register_gate - register a gate clock with the clock
>> framework + * @dev: device that is registering this clock
>> + * @name: name of this clock
>> + * @parent_data: parent clk data
>> + * @flags: framework-specific flags for this clock
>> + * @reg: register address to control gating of this clock
>> + * @bit_idx: which bit in the register controls gating of this clock
>> + * @clk_gate_flags: gate-specific flags for this clock
>> + * @lock: shared register lock for this clock
>> + */
>> +#define devm_clk_hw_register_gate_parent_data(dev, name, parent_data,
>> flags,  \ +					      reg,
> bit_idx, clk_gate_flags,   \
>> +					      lock)		
> 	      \
>> +	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, NULL,	      \
>> +				    (parent_data), (flags), (reg),
> (bit_idx), \
>> +				    (clk_gate_flags), (lock))
>> +
>>   void clk_unregister_gate(struct clk *clk);
>>   void clk_hw_unregister_gate(struct clk_hw *hw);
>>   int clk_gate_is_enabled(struct clk_hw *hw);
> 
> Is it worth to add the parent_data paremeter into existing
> devm_clk_hw_register_gate macro? Just adding this new macro for setting
> parent_data instead of parent_name seems a bit too much. What if someone wants
> to set parent_hw? Add another macro?

Yes, another macro seems to be the accepted practice here.
