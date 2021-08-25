Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA23C432BE
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 21:23:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C8E1610CB
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 21:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhHYVYg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Aug 2021 17:24:36 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:37179 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhHYVYg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 17:24:36 -0400
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id F155E1FEF7;
        Wed, 25 Aug 2021 23:23:47 +0200 (CEST)
Subject: Re: [PATCH v2] clk: qcom: gcc-sdm660: Replace usage of parent_names
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        angelogioacchino.delregno@somainline.org
References: <20210825204517.1278130-1-bjorn.andersson@linaro.org>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <f46e9c0a-970b-9391-66d4-70cf514fd93b@somainline.org>
Date:   Wed, 25 Aug 2021 23:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825204517.1278130-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Bjorn,

On 8/25/21 10:45 PM, Bjorn Andersson wrote:
> Using parent_data and parent_hws, instead of parent_names, does protect
> against some cases of incompletely defined clock trees. While it turns
> out that the bug being chased this time was totally unrelated, this
> patch converts the SDM660 GCC driver to avoid such issues.
> 
> The "xo" fixed_factor clock is unused within the gcc driver, but
> referenced from the DSI PHY. So it's left in place until the DSI driver
> is updated.
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Added "xo" back to avoid regression in the DSI PHY


Tested again on the XA2 Ultra just to be sure, all is good now. Thanks!

- Marijn
