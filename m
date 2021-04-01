Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87965C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 20:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25DEF610D0
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 20:17:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbhDAURQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 16:17:16 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:55163 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234489AbhDAURP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 16:17:15 -0400
Received: from [192.168.1.101] (abae153.neoplus.adsl.tpnet.pl [83.6.168.153])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D33303F5DD;
        Thu,  1 Apr 2021 22:17:12 +0200 (CEST)
Subject: Re: [PATCH 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC
 driver
To:     Stephen Boyd <sboyd@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210313021919.435332-1-konrad.dybcio@somainline.org>
 <161730597895.2260335.4437139498852095330@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <407789fb-bb43-874b-af4b-a3c1fa74a1bc@somainline.org>
Date:   Thu, 1 Apr 2021 22:17:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <161730597895.2260335.4437139498852095330@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


> Isn't this already documented in
> Documentation/devicetree/bindings/clock/qcom,gcc.yaml


I wanted to document the custom property for the SONY SDHCI quirk, but if it's not necessary, we can just omit this patch.


Konrad

