Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F69C7EE29
	for <linux-clk@archiver.kernel.org>; Mon,  1 May 2023 12:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbjEAM5Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 May 2023 08:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232680AbjEAM5W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 May 2023 08:57:22 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106A6E43
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 05:57:20 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f0025f4686so3114901e87.3
        for <linux-clk@vger.kernel.org>; Mon, 01 May 2023 05:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682945838; x=1685537838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVxPqZEZqxT/xble5HJfq8Vj9DqelOFd4DLS6YwEQRk=;
        b=qAwu+pVrhIlLgf33SSBK3DoiYgjhCcfLThZcPo0eXws58slERBFYB7TmvXZLNqBbum
         GDigKGjE/m87a2yBWbzTcliEntbid58PWp03W7mC674y6S9p9Z3L/hu3evKT/Ig/m5xn
         E5D2jxk5IoBkNyuycWgmf4JRZsbM2xdRMsHoZQX3rLvWiodt1C2GyzWlFk0R/atiXXXX
         F/sFUOz50S+8FtYsCzpSekCdpzvHPHpE477hJvXJcSq2vtQcpGMs+2uY+ZVYfJzfnPTD
         fDsjqXf+lQ7/+v/5hs70g5iUxRyfh5a5I1BdZtlXIrvNSa1OFK/lViVvL91diGUGjfLJ
         0Rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682945838; x=1685537838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVxPqZEZqxT/xble5HJfq8Vj9DqelOFd4DLS6YwEQRk=;
        b=A3ghI//8u1U6REoxstyWmQMmZCida4Aruqj290QtOyIzCiuDY888Eipq5VdcXdNXrd
         +Nh/fFiTwNYXsJZokRA50p9M1zorenz8WI3T27zD5Zz0Ugn/cIlEYvvM+fSaJ5kmxTBk
         LRkoA2uDuMPKN+/GHjHX8oQS5OhcFLd8/MW+Ve9vnmT0u8rsUtX4KVPBrM0iPdBzCgtn
         USLUjsxcgPQ59EewAb5+c48lObRc4fTAx9HqTKGyzb5rk76ZRylYr8ocSyB/pKeFiILi
         iOvNsObcokv/DV1EAygePXTNwJJ6XjCAWDefT9Sa3szyUKgC4Q1KFErARD5aJFXF8v1q
         EL8A==
X-Gm-Message-State: AC+VfDwSamom3t+d0bTUAefx19kXumZU8vr0F4B9fl+BmfuSt27Cc5xD
        s1Nap9gao7+sZLHGnPmfJeMA9Q==
X-Google-Smtp-Source: ACHHUZ7FWE59lx7yU+Wa2gadJl0mGy4rdJrhFE4r17mW/89mIM8KAeaBV6pHzRuhk32djHcDpc2AbA==
X-Received: by 2002:ac2:4c8c:0:b0:4ef:e6a1:6cc2 with SMTP id d12-20020ac24c8c000000b004efe6a16cc2mr4290688lfl.47.1682945838345;
        Mon, 01 May 2023 05:57:18 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id y6-20020a2e95c6000000b002a77ab1d73dsm58332ljh.96.2023.05.01.05.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:57:18 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 01 May 2023 14:57:13 +0200
Subject: [PATCH 3/3] clk: qcom: smd-rpm: Make BI_TCXO_AO critical
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230501-topic-rpmcc_xo_a-v1-3-93f18e47b607@linaro.org>
References: <20230501-topic-rpmcc_xo_a-v1-0-93f18e47b607@linaro.org>
In-Reply-To: <20230501-topic-rpmcc_xo_a-v1-0-93f18e47b607@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682945834; l=1210;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=l8l7+8uAcDF71yxaJqogJmWLjOCgIdZPw3YgQE8kOBk=;
 b=A0ur+z7Q0fpXelwJBH7Z48fWErgxHPy74GDXgwcZ1IjmPo+Fao6wDfDdxyTt0aiYs8jNGG0gQzEF
 dR2R0BvDBkQ+uhidoh10ufW1jQPXcK8hqKJBTAsxyhWNMRKlQsUS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We should never let go of the active-only XO vote, as otherwise the
RPM may decide that there are no online users and it can be shut down,
resulting in a total, uncontrolled system collapse.

Guarantee this through adding the CLK_IS_CRITICAL flag.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index e00889fddc7b..9649f4644d71 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -439,7 +439,8 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 
-DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000, 0);
+/* Disabling BI_TCXO_AO could gate the root clock source of the entire system. */
+DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000, CLK_IS_CRITICAL);
 DEFINE_CLK_SMD_RPM_BRANCH(qdss, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
 DEFINE_CLK_SMD_RPM_QDSS(qdss, QCOM_SMD_RPM_MISC_CLK, 1);
 DEFINE_CLK_SMD_RPM_BRANCH_A(bimc_freq_log, QCOM_SMD_RPM_MISC_CLK, 4, 1, 0);

-- 
2.40.1

