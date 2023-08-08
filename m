Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037E1C001DB
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 16:08:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbjHHQIz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbjHHQHD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 12:07:03 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E955372BC
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 08:45:58 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9936b3d0286so873807166b.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 08:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509557; x=1692114357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FqN2Sq9j6IVseScqHZxUGnTrukPTjl33EKA90GBaFU=;
        b=FzTB891reuZd7ZAAXqJa9TzXJfLBybQD37AwWXOA3kbX+6KFkZs2RtlNc93N1WHn8i
         27Admr36v4NVCRs2ctoB0JFO/JwqcDVjN4tc4tFobwqgwEJU6UKVwkT4YNDS+WaA7/ZG
         SFYINbr6amiTL8c7B6XztgTTwJsLH58kGF7L/BOI3smuHPrzj7U7Q1c9CQsFe1pQA0yL
         XKOOo7sDHOLOok2DUbWeBA1JJOc/qaqgO1/il53a5FaEF2DD2vbEiia8jIpnPIaSdIuO
         FT7TljE9ivmtOyx8ce8D9RMubiJs/2CNGkopgzZKGK3OB4FGoj2YWaY5jPueRYUEmS/H
         W7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509557; x=1692114357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FqN2Sq9j6IVseScqHZxUGnTrukPTjl33EKA90GBaFU=;
        b=iX0ZbcUzRwG6dDfgozOOSXuPnRwKMDpgChqGxJO6l/tkO8HidfpXsw3ZtWTq+CuYgu
         wu4psTDZDf3O18p90DVrflUqTS3ZLEn9VmoIVfFc7q1tG/MMq84tx8J4esvgDAM9RMMv
         B1C4X6Gw4WNzonKyOk7R2OKNVfazr7PHGSYJR/LqI7vKs7GiUdPvGLgdZIvKvy81f10e
         gLQuWW+zECxsGzRRvNLlG2Vsb0pS/T4/jxIBnUyEz4GYMT++I4r+y64Sfa+p0+yhU9CM
         7zm+DIG8r7lPXUDjzBG5QpIfvGvdac6zuZUeBqrmg8Jyo5PwZ7RRQSsmf63rzmVP46iO
         HRKA==
X-Gm-Message-State: AOJu0YwEDmGL/C9uS79T8Kq7XMgTXwHQnRBC3t9mEL93k5SxhK1Upgxd
        4uElWH0blY1Rbm8iAWORTE4KdpPQ6lz6bqMyDH8=
X-Google-Smtp-Source: AGHT+IFjkaP4oTfJ0Ri8v7HT5s6bsxs5Tqj1AvIF9Kb+lyIVxIbcmy/tMf8ddbWT77OvdXJajWXRUA==
X-Received: by 2002:a05:6512:1598:b0:4fb:8bea:f5f6 with SMTP id bp24-20020a056512159800b004fb8beaf5f6mr10188044lfb.34.1691495024243;
        Tue, 08 Aug 2023 04:43:44 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:43 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:38 +0200
Subject: [PATCH v3 07/10] interconnect: qcom: qcm2290: Update EBI channel
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-7-dee684d6cdd2@linaro.org>
References: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
In-Reply-To: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=1320;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+JCeGo0Q7sjfDzWjkGg+7ykqgtb42uWuVVMLb5STXRI=;
 b=kP/Ep84xH1Hu5VyTi/X5EdDQntTJIZBSHWF06vlxwCDpZi0bIpkqQ5Da38SWKULLxX6Ar2wu5
 ZB0IYGCkYwDBC4GBGBIEMmpmnalm/DCz4COpfhANKRfGNaIkAba4j/2
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
index 42fa01c66e73..3bd7ad67c569 100644
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
2.41.0

