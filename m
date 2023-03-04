Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0A6C678DB
	for <linux-clk@archiver.kernel.org>; Sat,  4 Mar 2023 13:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbjCDN3F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 Mar 2023 08:29:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjCDN2k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Mar 2023 08:28:40 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9058613DCC
        for <linux-clk@vger.kernel.org>; Sat,  4 Mar 2023 05:28:04 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f18so7050064lfa.3
        for <linux-clk@vger.kernel.org>; Sat, 04 Mar 2023 05:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCdcLmpO8Goo5antdKGZz8iakSfWM1kJytihOCcOfRQ=;
        b=FJqjwJmitDjP/0gHWpSs7Guef4XdlmHJX8DoP7gr3FR+CUHukqQpU2n1NhoVZZUWlI
         JDfKtcf4mFMcgA3DTbvxrzODd9b6fPgmNnKc/U7D79BrjJzjB8LoYQ0BuTzDIskif/sB
         IW3B88/utV4Gnat89EerrXJmttsUIUo/rQhJzpeYdob/ykTecCZridWS6rEqE8xfgj7Y
         uCNEmKCsYMjoZBI66ZZUnJYfPqd1Bjdw2ylOBGxfqkHKlJoSO/GG/h+h/5WyuEvkN2MH
         4B986J9UQIAdkw8robqpg2BGCbSZf8Du2bbexIQbdhuzVTonR3M0vlPR6qTMuNO+mqBi
         NdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCdcLmpO8Goo5antdKGZz8iakSfWM1kJytihOCcOfRQ=;
        b=ErNs2V6qzMH6PM6mtMNImc3HdBR8v6sBulQQwncFEgulYXCSB3wB0od3Bp0XHfGNMt
         QzmsdB/e4Wy1VCbmEV9M+hmJNNdFNZQxBDoHlygG3xha0T6prKIRxpK44CUwWCgwvL5x
         Z8JcKBPzs6egMM68dOA35obLYt7er1oxJCYSsPz5HQTtMzXppKbTKv1ExxE1NqXqjmBY
         6SE4UkarGFodlvOLChWnbsyafeDfvT+bYY5wHZ6Gfe+zmdBKrUV2/eLuTpAMWbpTuuy1
         IqpyS66B39v74Zpy9PwkbOxdYD4WiX+/e6ZUPfcA8cXBItD5Msfx6tptmzchH7o0akyz
         qK2g==
X-Gm-Message-State: AO0yUKUnpVUVOkDP8KLOPOpRLkjPvKCZ0M7enXaby9LIue+vngjS3Ik3
        j9h/o1yELSLBDIxh+N7Ky18b/A==
X-Google-Smtp-Source: AK7set8P2yoFlcX2pQPUAq9KNmjkTyWs7R0Wzc99Rfc1wK2fqznv6fqfSoUqeo5p00D2ZcCwuZ36Iw==
X-Received: by 2002:a19:7406:0:b0:4d8:5e8e:b138 with SMTP id v6-20020a197406000000b004d85e8eb138mr1424745lfe.14.1677936483796;
        Sat, 04 Mar 2023 05:28:03 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:28:03 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:54 +0100
Subject: [PATCH RFT 19/20] clk: qcom: smd-rpm: Add keepalive_clks for
 QCM2290
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-19-d9cfaf9b27a7@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=815;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=8naJyecqQklf10++bIijL/ZoCGk8UDKNEUfnObmFBi4=;
 b=4Jh2Uh7XT953o0LPAYr592Sss349Om2Ubjzd+BJSR0KFRot2Om2JqQftiChbwDlsUej8sRYyrajE
 8jw1K7fZCNu0uv26MLk3lN4DKcVBhMq5H7l06wsoxjI3Yp4dtZr7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

QCM2290 requires that the CNoC&SNoC clocks always get an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index c3ab882de7ff..2d0efe2cb1f5 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1278,6 +1278,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
 	.clks = qcm2290_clks,
 	.num_clks = ARRAY_SIZE(qcm2290_clks),
+	.keepalive_clks = cnoc_snoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(cnoc_snoc_keepalive_clks),
 };
 
 static const struct of_device_id rpm_smd_clk_match_table[] = {

-- 
2.39.2

