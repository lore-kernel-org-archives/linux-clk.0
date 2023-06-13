Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D5BEB64D0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 14:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242804AbjFMOFS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 10:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242760AbjFMOEn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 10:04:43 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A8A1FEA
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 07:04:08 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b203360d93so68736671fa.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 07:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686665030; x=1689257030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qU3PsWp7eyQ365/L4SeRXZt91LYg+Uxa+3QC5+dItDQ=;
        b=OAJpaV8f4nY0mxIKPisU8e737i+f452b1IuL+0E4t0PnaeMZNWfncO0Vod31cr/sbV
         S4ZnsLx1JS/1PlH8LBjgnBDzjXyNKVPyabvbZzAqVP+LpqGp8E/+7ieEbRWxb66ZnL9Q
         NyQRjEMtgs4WqfqzBV5AVAzS9pISHzomjlRdKvsP5ncdMz4Tb6rMADBzmsn/W4p0TjbX
         oluZWm2J2K7O/YJ45WYKf7nVgCELHlFC93z4HIFesO9AdlM1taDjhKrbKDVN+Vu0DEOZ
         7RKsyXqNTD4U4ePQjly+vw3J3mFekijP7pMpf0KttjcU92WbtISz6XwcUExhtttQB+xF
         8syQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686665030; x=1689257030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qU3PsWp7eyQ365/L4SeRXZt91LYg+Uxa+3QC5+dItDQ=;
        b=dEL58wn6pZzqf+yN267oMe+hYmKFug00d7x4zuS+vlEiomcMp9gj7KFaySf4Czrg02
         wgJKIOl9gnaIpxgMPnieBAVtmt2vE0KJcM8rQxkijBk8RNqfip1RdnFaIJHAcU7SmwpY
         M5C9OTnw8fMPQ7c1009VilOH/ZBSvH6FYfwcy6GL3udyxiHEmnBz1gt2yduFH20Ehqc4
         0fAhCTXuAvAgzFvbGIxQpVqO5tSkWitBGrPV3JUEpc06pfKNwOArJ2lnpO/H3GvFSi1C
         PbLqa0aDCI9QB6PZP6X22eUJ2ju2utdsaqrPnC4/rHFf/OzQfDOQYudmxH3WjBI6iuaI
         FYKQ==
X-Gm-Message-State: AC+VfDz2NeZfeaYkt1HPBjAwJFCVUxl2ILQU2Kxd7uiRmj0l6U59w9Xw
        8Dslv4R2rSvRtYBlB1zDP2YqCA==
X-Google-Smtp-Source: ACHHUZ4lLJ3kBLDXJtDf6chdlqS5CYtSUwOwvn8l5Uhx5QDy+XeixIf7VKwgF/a9KtpF0genbV49tQ==
X-Received: by 2002:a2e:9181:0:b0:2ad:99b6:1728 with SMTP id f1-20020a2e9181000000b002ad99b61728mr4716325ljg.24.1686665030393;
        Tue, 13 Jun 2023 07:03:50 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a18-20020a05651c011200b002b32af2e9c6sm901490ljb.116.2023.06.13.07.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 07:03:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 13 Jun 2023 16:03:21 +0200
Subject: [PATCH v4 21/22] interconnect: qcom: icc-rpm: Set correct
 bandwidth through RPM bw req
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v4-21-5ba82b6fbba2@linaro.org>
References: <20230526-topic-smd_icc-v4-0-5ba82b6fbba2@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v4-0-5ba82b6fbba2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686664985; l=1241;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Q9/6KMxGdJPIAQ+0+jt4qxe5bQSiRUT9Q5Mk5kx1brc=;
 b=LF2Gol1quPiJEn/PLuw6sr+ScVC36bjeKzWCan4mn9v17cWsDbSWDO0ATv7QEFMb4gcDyK2Rs
 g9wjybLqej6BTNimv8fYelbfnzbiNA5hRfpGt5dHqaMibx35a8S48oB
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently, we're setting the aggregated-on-provider bandwidth on each
node, individually. That is of course incorrect and results in far too
high votes. Use the correct values to ensure we're not wasting power.

Fixes: 30c8fa3ec61a ("interconnect: qcom: Add MSM8916 interconnect provider driver")
Reported-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 4dd53777dbaf..34e0580f1ffe 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -355,12 +355,12 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 
 	qcom_icc_bus_aggregate(provider, agg_avg, agg_peak, &max_agg_avg);
 
-	ret = qcom_icc_rpm_set(src_qn, agg_avg);
+	ret = qcom_icc_rpm_set(src_qn, src_qn->sum_avg);
 	if (ret)
 		return ret;
 
 	if (dst_qn) {
-		ret = qcom_icc_rpm_set(dst_qn, agg_avg);
+		ret = qcom_icc_rpm_set(dst_qn, dst_qn->sum_avg);
 		if (ret)
 			return ret;
 	}

-- 
2.41.0

