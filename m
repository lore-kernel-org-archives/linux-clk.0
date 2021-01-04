Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75372C433E6
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 15:31:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46B282225E
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 15:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727623AbhADPbP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jan 2021 10:31:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbhADPbP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jan 2021 10:31:15 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99064C061794
        for <linux-clk@vger.kernel.org>; Mon,  4 Jan 2021 07:30:19 -0800 (PST)
Received: from [192.168.1.101] (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C2C981FFD5;
        Mon,  4 Jan 2021 16:30:13 +0100 (CET)
Subject: Re: [PATCH 4/5] clk: qcom: Add A7 PLL support
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
 <20210104081125.147300-5-manivannan.sadhasivam@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <a880d96f-d879-52d0-48ff-cbcdb88a3f29@somainline.org>
Date:   Mon, 4 Jan 2021 16:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104081125.147300-5-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

could you explicitly state in the probe function (or just in the driver in general, as there's not much more?) and the config structs that the target SoC is X55?

A few more SoCs (MDM9607, MSM8x26 and some others) also use what's known as "A7PLL" downstream, but all of them have a separate configuration for their specific PLLs, which aren't compatible with each other.


Konrad

