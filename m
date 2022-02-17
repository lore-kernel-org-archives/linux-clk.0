Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA74C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 17 Feb 2022 13:44:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241400AbiBQNof (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 08:44:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241282AbiBQNoW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 08:44:22 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5335D2B1A92;
        Thu, 17 Feb 2022 05:43:36 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2D4DC83B8D;
        Thu, 17 Feb 2022 14:43:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1645105413;
        bh=vqgVYgx+FqpP/4BNm4tNeIMdW4wMCTTuVxwKgzkTfpE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=EDOv8XGOOQ/2mZKJRDd7OZmnV+/ui2sKBvWzQ5Ii5o3q17FYcdDTnkHbnBMZtO7EP
         alg6IeLAKoaS9/a4iHMNCDR1izWKjhlQvV+GVRxIh9uDTcTi8G4uAZXIb6pX90TViM
         vyzQaC70XuGk214eJKk5mZUmutgsr0KaADJlxO5PAJG+yP4qxs6F7+WfIXe62P81wK
         wqotLM1dF5DvOhHtL1eOV/+SZJ9ifrC/0ESsFE9fBCAUf8EWKPrAsrksb2YVELLFmE
         DMg+HlNX7LZDzLMnH5+65STFMZxJM6H7jKpJ0jbyipah2+8rPTjhOpo1UlMvYSAW9K
         S65qlnioeWQng==
Message-ID: <8b179fe1-55e4-e811-1ac2-46ac726c22d9@denx.de>
Date:   Thu, 17 Feb 2022 14:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
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
 <8083fbfb-d039-a7c8-7c08-c57ebf9e3b56@denx.de>
 <88ee0a11-359e-60a5-4d96-54fef6514e69@fi.rohmeurope.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <88ee0a11-359e-60a5-4d96-54fef6514e69@fi.rohmeurope.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[...]

>>> Anyways, seeing you added a dummy bd71837_match_clkspec in a follow-up
>>> patch for BD71837 - which has only single clock - I wonder if there is a
>>> way to omit that dummy callback in controllers which really provide only
>>> one clock?
>>
>> Yes, I think we can omit the match_clkspec call for clock controllers
>> with clock-cells == 0 altogether.
> 
> That would mean you could probably drop the bd718x7 driver patch, right?

Yes

I'm just waiting for feedback from Stephen on 2/3, then I'll send V2.
