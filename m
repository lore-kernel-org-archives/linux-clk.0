Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB4FC49361
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:37:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDD77613CB
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbhFQTja (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 15:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbhFQTj3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jun 2021 15:39:29 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B22C061574
        for <linux-clk@vger.kernel.org>; Thu, 17 Jun 2021 12:37:16 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4D5B11F977;
        Thu, 17 Jun 2021 21:37:13 +0200 (CEST)
Subject: Re: [RFC v1 06/11] clk: qcom: Add display clock controller driver for
 SM8350
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Taniya Das <tdas@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Vinod Koul <vinod.koul@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
 <20210616141107.291430-7-robert.foss@linaro.org>
 <ca6ff020-cd13-e242-ab74-085958e9fc82@somainline.org>
 <CAG3jFysRuF=xkTaPK3efDW20cQ3hXLqqsT7J5YVgYvO1dmFOvA@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <243ab835-bc91-6cc6-a9ce-7be6763dc89e@somainline.org>
Date:   Thu, 17 Jun 2021 21:37:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFysRuF=xkTaPK3efDW20cQ3hXLqqsT7J5YVgYvO1dmFOvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

>>> +
>>> +static struct pll_vco vco_table[] = {
>>> +     { 249600000, 1750000000, 0 },
>>> +};
>>> +
>>> +static const struct alpha_pll_config disp_cc_pll0_config = {
>>> +     .l = 0x47,
>> Is the ".cal_l = 0x44," part from downstream not necessary?
> Yes it is. I went back and forth about  'cal_l', but in the end the
> only value it is ever set to is 0x44, which is also what the default
> value is. So there is no need for representing it explicitly at the
> moment.

Interesting, maybe it'll be required for next SoCs..



>>> +};
>>> +
>>> +static const struct alpha_pll_config disp_cc_pll1_config = {
>>> +     .l = 0x1F,
>> Ditto
> Sorry, ditto what?

Aah, sorry I cut out a ".cal_l  = 0x44" line while adding my comments..



Konrad

