Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD6BC6FD18
	for <linux-clk@archiver.kernel.org>; Sat,  4 Mar 2023 13:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjCDN2C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 Mar 2023 08:28:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjCDN2B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Mar 2023 08:28:01 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD3F1E287
        for <linux-clk@vger.kernel.org>; Sat,  4 Mar 2023 05:27:51 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id i9so7025270lfc.6
        for <linux-clk@vger.kernel.org>; Sat, 04 Mar 2023 05:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0QoQUCwZ4517scsxI8XcPjm+YClZabP+eyHX2AdjqU=;
        b=fmHnCN6R3YH7slYJhITKJTZxd9LSPHvRpsLBtrEVzRcLmlwFBLCtWnvy3SMO0W8SfR
         6IvyDbziVFTc229wIFU7yfqx2nHvIfAhv7mHI7h0iINRdLbnmmMFMbNMvUvKbPE++LS4
         1tdN36MiQHKgT+2Hdb99QZscv/GP7dEEvpZYIlF9f51bu+r8Y1zN/eIKic0PJ8sNPAC3
         DKnjEpLs9xmCq4vU5qRYo15EQPJVwlsxB8ta2BMDW+4Y3vqXgjpC+sLtdjknhePmD0qr
         mxMNZb1i35zPv8Yg9eY1M80zdmp9VPBpCFVjjPK+C5CsmKhVoj75xn3lLv1S4iuiSibT
         9IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0QoQUCwZ4517scsxI8XcPjm+YClZabP+eyHX2AdjqU=;
        b=SAcjcr3G6tUXxh6YxWZxhXgwjOxfzlsMqg64vTVR+souRWk2OGjfWHgGrfoku5ve+P
         ukSBjkD9O89rKnuRO17T2z1SSZ7vRpNcYI+MCxk8JxNKTs/1pIYv8aC6wTwmF9QINe9a
         kAhFexFTIyND/p+PmYtHlhen/am7x8X46enUmD7hjB/W/VhOLp2+hjaOrRBj1JXeLGUe
         m6LQfTzoz2VzQ2Ca4izZ4/rQ2pQMyBzXmSxAxeS2lj9X/a6T66YnB8BEOjEU5n97Rf4d
         9q6H3Ht645yPEzj5Tx8pFwtWsSwhZAArBII9UfV7B1zqWhoW3BsFLstF/dFR1Te0AqB4
         Tf0g==
X-Gm-Message-State: AO0yUKVnhoSoSSIUepZGfbEIulRBS0QK/ACdUCAMEke5DXye08ysCRke
        QWfNfJiyCDgtsH54b5EkwfWfpA==
X-Google-Smtp-Source: AK7set8x6jBrzbsFAUpsrsbu2ojFfuc0nzvZBHNMjPAKBiVPa1uI8Kt7/Ja7nW5+obTxvjLy3QbaGw==
X-Received: by 2002:ac2:5103:0:b0:4db:3848:86af with SMTP id q3-20020ac25103000000b004db384886afmr1425258lfb.12.1677936471099;
        Sat, 04 Mar 2023 05:27:51 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:27:50 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:42 +0100
Subject: [PATCH RFT 07/20] clk: qcom: smd-rpm: Add keepalive_clks for
 MSM8916
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-7-d9cfaf9b27a7@linaro.org>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=782;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=EjzJfBH80ZIEoJ+Wq0ik7Jj0/K7SI5Dj0zTT4DnJWEY=;
 b=gdzYNGD+fq1qcjQ/lc2oztJ9Fd9WHhUJgwc6ExEsJc1B31oDkehB50+0HGwTI9OsLUgDHvc9GS9x
 FG24puwMDKHhXLnPGygqD/JciwzP7fTy7LLNLSOsuJwItigty5fl
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8916 requires that the PCNoC clock always gets an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 1a678a962770..a93b4575f44f 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -596,6 +596,8 @@ static struct clk_smd_rpm *msm8916_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
 	.clks = msm8916_clks,
 	.num_clks = ARRAY_SIZE(msm8916_clks),
+	.keepalive_clks = pnoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(pnoc_keepalive_clks),
 };
 
 static struct clk_smd_rpm *msm8936_clks[] = {

-- 
2.39.2

