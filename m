Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81D1C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 19:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 864D164F86
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 19:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234383AbhBYTPZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 14:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234517AbhBYTNQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 14:13:16 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182D5C0617AB
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 11:12:45 -0800 (PST)
Received: from [192.168.1.101] (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 891011F678;
        Thu, 25 Feb 2021 20:09:16 +0100 (CET)
Subject: Re: [PATCH 5/6] clk: qcom: gcc-sdm660: Account for needed adjustments
 in probe function
To:     Stephen Boyd <sboyd@kernel.org>, phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210220155618.176559-1-konrad.dybcio@somainline.org>
 <20210220155618.176559-5-konrad.dybcio@somainline.org>
 <161404077336.1254594.15002572465360321874@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <3917fba4-e5b0-911f-9220-f401a90aac38@somainline.org>
Date:   Thu, 25 Feb 2021 20:09:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161404077336.1254594.15002572465360321874@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi and sorry for the late reply,


>> +
>> +       /* Keep bimc gfx clock port on all the time */
>> +       clk_prepare_enable(gcc_bimc_gfx_clk.clkr.hw.clk);
>> +
> Preferably just set these various bits with regmap_update_bits() during
> probe. Also, please do it before regsitering the clks, not after.

To be fair, now I think that simply adding CLK_IS_CRITICAL flag to the clocks in question is the smartest thing to do. Magic writes don't tell a whole lot.


>> +       /* Set the HMSS_GPLL0_SRC for 300MHz to CPU subsystem */
>> +       clk_set_rate(hmss_gpll0_clk_src.clkr.hw.clk, 300000000);
> Is this not already the case?


This is a mission-critical clock and we cannot trust the bootloader with setting it. Otherwise dragons might appear.


Konrad


