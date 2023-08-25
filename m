Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF11CEE49BD
	for <linux-clk@archiver.kernel.org>; Fri, 25 Aug 2023 15:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343890AbjHYPjC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Aug 2023 11:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343905AbjHYPin (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Aug 2023 11:38:43 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740DB2704
        for <linux-clk@vger.kernel.org>; Fri, 25 Aug 2023 08:38:36 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe8c16c1b4so1575662e87.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Aug 2023 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692977914; x=1693582714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azTsgBM86+GM9sSp42BUI1s8412oPMCgpH7RHDGWmLw=;
        b=i9hivS1oUlHEda/POH/lLTO9SB2ZhHbDNnbg9QGKhCuzidjynDn7kYqQQRBMaxOFFp
         44uWmeDTl6fjdqvRQ9gsaWdTm8XNWalwNkS9r4rg05ZYYC/jv9bU6H9K2HzYQjQQtJgS
         afRJ+OnwYDKKMAB6L4Z92+/O4+GjJGdSQ40ch6PnofT0m06GKweUPvO1VO8IReYIbzsw
         0tioSrBGuNjiiWIso/1D1wbkEtDRjD3l0rMBgt7mTGNZzUSMYi1mnpOIFsxMEyLTNYCG
         MIx526z7krjhugm6JNLDxJUWTrWLUFtuFnbAHEZR1imRge2DklUzNNPcfOKte0c1GuL0
         1aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692977914; x=1693582714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azTsgBM86+GM9sSp42BUI1s8412oPMCgpH7RHDGWmLw=;
        b=LGV0gdwXKqw/9ahQX8RaHNTVKms7bj08X6h/OyXrh/dwltolZKJHYFEUDjEx56WcTj
         4YpkYJY1hTgiOguIv51xo4YslL7nf4BVglTUENd8X+AK/Ex2Hasnz+4r6tfJyGHOhgVD
         s+B4CJBQEintfHmzdPVRKzc5lc/wwwel3RuGs8QM7mODqYBSEtZYp4vFg1uAXdEmd0t2
         9WwI/qsRFaHXPRklesro6oZdU++zLqQfI1QBop7drYqJj9CVgd3nQHBmWxWvDtakNCG1
         cPTG1vKyghDSFl0JSPjEtJJrd4++KAvc4H2GkNuB8h9XUB7/7SwC21b9JZzYGCqGqXkP
         w4Yw==
X-Gm-Message-State: AOJu0Yx0KjoVY8W7YFAMrtxjmIB0KUN33bJ/9M0bOu6xp9XAZfe/P7rD
        YMK+b4O2EOYTPpy6y+GnpFBaiQ==
X-Google-Smtp-Source: AGHT+IFpC7f2GKEeP17lWZafcyaLyk7hJMxrz3ESx1Rz4tEHInZrUawfmikVewSTSsESxFiozjT9kw==
X-Received: by 2002:a19:6d1c:0:b0:4fd:c83b:a093 with SMTP id i28-20020a196d1c000000b004fdc83ba093mr11919849lfc.1.1692977914620;
        Fri, 25 Aug 2023 08:38:34 -0700 (PDT)
Received: from [192.168.1.101] (abxh59.neoplus.adsl.tpnet.pl. [83.9.1.59])
        by smtp.gmail.com with ESMTPSA id y17-20020a197511000000b004fe432108absm326002lfe.182.2023.08.25.08.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 08:38:34 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 25 Aug 2023 17:38:29 +0200
Subject: [PATCH v4 07/10] interconnect: qcom: qcm2290: Update EBI channel
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v4-7-c04b60caa467@linaro.org>
References: <20230726-topic-icc_coeff-v4-0-c04b60caa467@linaro.org>
In-Reply-To: <20230726-topic-icc_coeff-v4-0-c04b60caa467@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692977905; l=1320;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Y3uMer9xOocejP5QFGPjFGimfPx5QRm0vyhaJFgmIts=;
 b=J8kGgkMIcFdUnllOtWiO18kvfFZhO5gtE0bKmGCVA2lUur90VBvqeYmMaLqgPp1SMjC6rXJ11
 XPwIZ5sMI2kDjabqVKuJ0Zql/RyizxHLEPqngv7zBQ1Mdg4FxI8tYEK
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

QCM2290 can support two memory configurations: single-channel, 32-bit
wide LPDDR3 @ up to 933MHz (bus clock) or dual-channel, 16-bit wide
LPDDR4X @ up to 1804 MHz. The interconnect driver in its current form
seems to gravitate towards the first one, however there are no LPDDR3-
equipped boards upstream and we still don't have a great way to discern
the DDR generations on the kernel side.

To make DDR scaling possible on the only currently-supported 2290
board, stick with the LPDDR4X config by default. The side effect on any
potential LPDDR3 board would be that the requested bus clock rate is
too high (but still capped to the firmware-configured FMAX).

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/qcm2290.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index 7abc0c449220..b88cf9a022e0 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -678,7 +678,8 @@ static struct qcom_icc_node mas_gfx3d = {
 static struct qcom_icc_node slv_ebi1 = {
 	.name = "slv_ebi1",
 	.id = QCM2290_SLAVE_EBI1,
-	.buswidth = 8,
+	.buswidth = 4,
+	.channels = 2,
 	.mas_rpm_id = -1,
 	.slv_rpm_id = 0,
 };

-- 
2.42.0

