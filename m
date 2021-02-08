Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D315C433E6
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 17:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F36164E28
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 17:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235068AbhBHRzF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 12:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234978AbhBHRxj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Feb 2021 12:53:39 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80D7C0617A9;
        Mon,  8 Feb 2021 09:52:42 -0800 (PST)
Received: from [192.168.1.101] (abad44.neoplus.adsl.tpnet.pl [83.6.167.44])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3CA171F50F;
        Mon,  8 Feb 2021 18:52:35 +0100 (CET)
Subject: Re: [PATCH] clk: qcom: smd: Add missing RPM clocks for msm8992/4
To:     Stephen Boyd <sboyd@kernel.org>, phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210118161442.104660-1-konrad.dybcio@somainline.org>
 <161280662401.76967.11809752025480357094@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <03daf7af-309d-8b32-eb7e-1f03e35bdc42@somainline.org>
Date:   Mon, 8 Feb 2021 18:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161280662401.76967.11809752025480357094@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 08.02.2021 18:50, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2021-01-18 08:14:41)
>> This was omitted when first adding the clocks for these SoCs.
>>
> I believe they were omitted because the system crashed if they were
> touched. Is that still the case?

No, rpmcc XO seems to work fine, no crashes around. I just forgot about these the first time around.


>> Fixes: b4297844995 ("clk: qcom: smd: Add support for MSM8992/4 rpm clocks")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> ---
>>  drivers/clk/qcom/clk-smd-rpm.c         | 16 ++++++++++++++++
>>  include/dt-bindings/clock/qcom,rpmcc.h |  2 ++
>>  include/linux/soc/qcom/smd-rpm.h       |  1 +
>>  3 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>> index 0e1dfa89489e..91d610042a5d 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -624,6 +624,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
>>  };
>>  
>>  /* msm8992 */
>> +DEFINE_CLK_SMD_RPM_BRANCH(msm8992, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0,
>> +                                                               19200000);
> This rate should come from some parent clk specified in the board DTS
> file as a fixed rate clock.

The hardcoded-by-design xo_board is 19.2 MHz too, so that matches.


Konrad

