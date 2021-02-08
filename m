Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F300C4332E
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 13:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F34A64E8C
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 13:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbhBHNwP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 08:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhBHNwL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Feb 2021 08:52:11 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5119C06178A;
        Mon,  8 Feb 2021 05:51:12 -0800 (PST)
Received: from [192.168.1.101] (abad44.neoplus.adsl.tpnet.pl [83.6.167.44])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 98BCB1F4A2;
        Mon,  8 Feb 2021 14:51:08 +0100 (CET)
Subject: Re: [PATCH v2 3/9] clk: qcom: Add SDM660 Multimedia Clock Controller
 (MMCC) driver
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
 <20210113183817.447866-4-angelogioacchino.delregno@somainline.org>
 <2453cbae-bd30-416c-4432-9b27754670e1@linaro.org>
 <6ba8ac3c-d33b-3ab2-5855-f99d431b397a@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <01dac47b-2bc1-ee5d-960b-187385f7c108@somainline.org>
Date:   Mon, 8 Feb 2021 14:51:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6ba8ac3c-d33b-3ab2-5855-f99d431b397a@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Any chance we could still get this in for 5.12? A LOT of features that we had ready for a few months heavily depend on MMCC and we can't proceed upstreaming them without this very driver.


Konrad

