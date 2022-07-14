Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD733C43334
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jul 2022 10:04:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237842AbiGNKEA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jul 2022 06:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237685AbiGNKD5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jul 2022 06:03:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5888462D3
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 03:03:56 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id n18so1990582lfq.1
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JTKBL6Aor4zd0gi9+YpsM0tS+Wh8c3Pxgu/O7VusGAc=;
        b=XSP18C8zz0oix63kSQznFfQcyuoXYYWwuSlLN7U2taqc6gNNJA2Akk295PvVJrUFLI
         PvF5aU+Ardnwb0jXkCd26K062PKDvC/MhXCWuGfr3HQ3dZY0Ny9oe/2jHvNxZ3xRY/ry
         nfhn+eSKy77dIO+TrXCvq8Fj6txV4LIJMkSeIvv9H54vWSPHvoPXd084ISjTn555DS6k
         w/74DnRfX7RSicmZiadRQ5bDq1c+5prRL3rt+tGzA8egyHB5UNvAd44Fud1N0TfkhDSf
         K0ID+CAXsRNZ6Zsx/8TuuNSyP6rk6JGEwVnk+M0UFPwRMJA8tx5wwAnUqOD5aS2c0YLp
         P7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JTKBL6Aor4zd0gi9+YpsM0tS+Wh8c3Pxgu/O7VusGAc=;
        b=fdNJZupEX9m0fs47vhJnbRZ9+1SfM5Mh1rdkOimaJYMze/914FDTiygevJ1T4tRt1M
         Lmrp0ngKfWNxeWZPrM00ZO5rYgn8wwInDlpsvN0NpaqXtUY+QTMdaLwI0fHSZ5EmIG2Z
         Tkzse6JWYQdFtuRo3ZzSm/Z52m/z0aGmNcsY8KvVm41OsSkjSyl2G/kP5KK8Y9uqzEnU
         LG0s9Mc/yGwM2TncY6C90IFMZ8u8yXQuLNJ9KKu14fLuQIQNVbbkro63o8CUtTpAKEik
         qG2QGGQbyPGVNleaxL/EEZQ8Nw2EXDOS8Tq8RBCJtiBpD/nSHZQlfxc3ecAu/VBVEjbH
         mo9A==
X-Gm-Message-State: AJIora8KXMGibXIadM2SSuo3HOgxr4o/CXdp54P4X+o405s8mvLfNxaP
        Te+MmaydAfVg5yk7pxOAfGEzL1MsxVki5g==
X-Google-Smtp-Source: AGRyM1uxX9d1GQ16nOwzfxzni70OBrd8AJiy3hVmto0DyaAUNXDchl1mlionWd+uV2qy9epbN9i60g==
X-Received: by 2002:a05:6512:2610:b0:47f:74dc:3205 with SMTP id bt16-20020a056512261000b0047f74dc3205mr4497506lfb.429.1657793034742;
        Thu, 14 Jul 2022 03:03:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512074900b00489c92779f8sm273355lfs.184.2022.07.14.03.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:03:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 2/6] clk: qcom: cpu-8996: switch to devm_clk_notifier_register
Date:   Thu, 14 Jul 2022 13:03:47 +0300
Message-Id: <20220714100351.1834711-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to using devres-managed version of clk_notifier_register(). This
allows us to drop driver's remove() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 708a8ad0c933..ff90cd5b4fba 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -425,27 +425,12 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	clk_prepare_enable(pwrcl_alt_pll.clkr.hw.clk);
 	clk_prepare_enable(perfcl_alt_pll.clkr.hw.clk);
 
-	clk_notifier_register(pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux.nb);
-	clk_notifier_register(perfcl_pmux.clkr.hw.clk, &perfcl_pmux.nb);
+	devm_clk_notifier_register(dev, pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux.nb);
+	devm_clk_notifier_register(dev, perfcl_pmux.clkr.hw.clk, &perfcl_pmux.nb);
 
 	return ret;
 }
 
-static int qcom_cpu_clk_msm8996_unregister_clks(void)
-{
-	int ret = 0;
-
-	ret = clk_notifier_unregister(pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux.nb);
-	if (ret)
-		return ret;
-
-	ret = clk_notifier_unregister(perfcl_pmux.clkr.hw.clk, &perfcl_pmux.nb);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 #define CPU_AFINITY_MASK 0xFFF
 #define PWRCL_CPU_REG_MASK 0x3
 #define PERFCL_CPU_REG_MASK 0x103
@@ -544,11 +529,6 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
 }
 
-static int qcom_cpu_clk_msm8996_driver_remove(struct platform_device *pdev)
-{
-	return qcom_cpu_clk_msm8996_unregister_clks();
-}
-
 static const struct of_device_id qcom_cpu_clk_msm8996_match_table[] = {
 	{ .compatible = "qcom,msm8996-apcc" },
 	{}
@@ -557,7 +537,6 @@ MODULE_DEVICE_TABLE(of, qcom_cpu_clk_msm8996_match_table);
 
 static struct platform_driver qcom_cpu_clk_msm8996_driver = {
 	.probe = qcom_cpu_clk_msm8996_driver_probe,
-	.remove = qcom_cpu_clk_msm8996_driver_remove,
 	.driver = {
 		.name = "qcom-msm8996-apcc",
 		.of_match_table = qcom_cpu_clk_msm8996_match_table,
-- 
2.35.1

