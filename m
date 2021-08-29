Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E69C432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 19:55:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 405F860F44
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 19:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235998AbhH2T4D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 15:56:03 -0400
Received: from relay03.th.seeweb.it ([5.144.164.164]:38123 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235920AbhH2Tz7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Aug 2021 15:55:59 -0400
Received: from [192.168.1.101] (83.6.166.149.neoplus.adsl.tpnet.pl [83.6.166.149])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 74B341F741;
        Sun, 29 Aug 2021 21:55:01 +0200 (CEST)
Subject: Re: [PATCH RESEND v2 2/9] clk: qcom: gcc-msm8994: Modernize the
 driver
To:     Stephen Boyd <sboyd@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210829193617.4105-1-konrad.dybcio@somainline.org>
 <20210829193617.4105-2-konrad.dybcio@somainline.org>
 <163026676931.2676726.9571008952095354229@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <16ef9f50-57f5-1dc0-0cf5-94960124d6db@somainline.org>
Date:   Sun, 29 Aug 2021 21:55:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163026676931.2676726.9571008952095354229@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 29.08.2021 21:52, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2021-08-29 12:36:09)
>> Switch to the newer-style parent_data and remove the hardcoded
>> xo clock.
> This is OK because nothing else is using the hardcoded name of "xo",
> like another clk driver on this SoC?

8994 only has RPMCC and MMCC* apart from GCC and both are prepared for this.



*not counting DEBUGCC and CPUCC for obvious reasons (they are missing upstream)


Konrad

