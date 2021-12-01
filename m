Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3A4C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  1 Dec 2021 15:38:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351048AbhLAPlf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Dec 2021 10:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351041AbhLAPle (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Dec 2021 10:41:34 -0500
X-Greylist: delayed 67 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Dec 2021 07:38:13 PST
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC7FC061574
        for <linux-clk@vger.kernel.org>; Wed,  1 Dec 2021 07:38:12 -0800 (PST)
Received: from [192.168.1.101] (83.6.166.111.neoplus.adsl.tpnet.pl [83.6.166.111])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 159FB3F6E2;
        Wed,  1 Dec 2021 16:38:11 +0100 (CET)
Message-ID: <ba9a02e6-5139-8d4e-c6a0-386c10c99f13@somainline.org>
Date:   Wed, 1 Dec 2021 16:38:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/4] clk: qcom: rpmh: add support for SM8450 rpmh clocks
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211201072310.3968679-1-vkoul@kernel.org>
 <20211201072310.3968679-5-vkoul@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211201072310.3968679-5-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 01.12.2021 08:23, Vinod Koul wrote:
> This adds the RPMH clocks present in SM8450 SoC
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

