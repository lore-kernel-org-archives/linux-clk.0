Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63345C001E0
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 17:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjGBRn0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 13:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjGBRnC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 13:43:02 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DF9E67
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 10:43:00 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b5e7dba43cso57630791fa.1
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319779; x=1690911779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qDJV6KZlD2L8q+lvpBd+sQYG0dJyxpwpj9hrg9x4FU=;
        b=rmSskxAcWgN+iuIoaiuFI53lzHsrFV/8b05dxisx7ZACO/jsJGaGXHolhRkaePtOne
         90opSZSPUvFSufJPb/q3siXavwC7hV/UnU18+vrV4Daj0uiEehLddqqrxMDzTu6KNLrn
         23SD+V2fdtXCqr0mTEOBCVo+UaWEi0FVRoS8kWZH7bXKpy2pfGIw68PPN7bQi6dpp+OO
         PkPEXoZ4AnmQhNKAE9f4JUlwYE4GShZENw06nLHeGviSlJzw/uhM6HFAiWEYHrmVDghN
         hhvBU6IlS8O90/3mudQbMRdsCgVkyyv7TCBeWtc+GLNJmDCSiIg85olFq0WjqAdh2RXT
         uEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319779; x=1690911779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qDJV6KZlD2L8q+lvpBd+sQYG0dJyxpwpj9hrg9x4FU=;
        b=bMMJ7VIyaLJUer3gEwH6HsdXXih4mLF7un7l1C055A+QHCuHltpY9kck4/umvIkDuP
         +F0CI671Vk9xQwdCuj8nn6hZggJ3GtNTF0n15NKOAcmpIYsjYv+fVSSZN592lVGJGhM/
         8v7A2S2Fx+KYgXgf4afEYM2zy/HNQSobRLkd1BUF+TQgzeaTSJLGhz4Qcl+yMA4niKbv
         5NY4lZ90s0vjLkBINQPLsgk8MoIvg5E5XyKo+ByEqrdmTDtkHHhqWgv6Kzhr/4nYSA5X
         wUO7CbyhFvNhVrPCdpDP4FoLyhHKM9XM7XwM3dps3Ss86QOitgSTXvtIGTppU2vKrpvL
         AbFg==
X-Gm-Message-State: ABy/qLbwL4uBUJe8Uxom56xFjns1Ex5Sxqgv5FgKIrwlGXPjlSd9uGtk
        Q7D/TMQ8To+3rT1CG4GmIkiaLQ==
X-Google-Smtp-Source: APBJJlFbhE9Z5RbuoyTeBi5mlX2jiYDUTw/+JoDYyCHAkmkcZ87TP5EFx7HAiWcy9J0LWCY7hKLG0g==
X-Received: by 2002:a2e:9d44:0:b0:2b6:df23:2117 with SMTP id y4-20020a2e9d44000000b002b6df232117mr2098665ljj.43.1688319779060;
        Sun, 02 Jul 2023 10:42:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:42:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v3 12/28] cpufreq: qcom-nvmem: provide separate configuration data for apq8064
Date:   Sun,  2 Jul 2023 20:42:30 +0300
Message-Id: <20230702174246.121656-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

APQ8064 can scale core voltage according to the frequency needs. Rather
than reusing the A/B format multiplexer, use a simple fuse parsing
function and configure required regulator.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 49 ++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 792423590279..422fd8ca8a00 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -26,6 +26,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/smem.h>
 
@@ -39,6 +40,7 @@ struct qcom_cpufreq_match_data {
 			   char **pvs_name,
 			   struct qcom_cpufreq_drv *drv);
 	const char **genpd_names;
+	const char * const *regulator_names;
 };
 
 struct qcom_cpufreq_drv {
@@ -203,6 +205,34 @@ static int qcom_cpufreq_krait_name_version(struct device *cpu_dev,
 	return ret;
 }
 
+static int qcom_cpufreq_apq8064_name_version(struct device *cpu_dev,
+					     struct nvmem_cell *speedbin_nvmem,
+					     char **pvs_name,
+					     struct qcom_cpufreq_drv *drv)
+{
+	int speed = 0, pvs = 0;
+	u8 *speedbin;
+	size_t len;
+	int ret = 0;
+
+	speedbin = nvmem_cell_read(speedbin_nvmem, &len);
+	if (IS_ERR(speedbin))
+		return PTR_ERR(speedbin);
+
+	if (len != 4)
+		return -EINVAL;
+
+	get_krait_bin_format_a(cpu_dev, &speed, &pvs, speedbin);
+
+	snprintf(*pvs_name, sizeof("speedXX-pvsXX"), "speed%d-pvs%d",
+		 speed, pvs);
+
+	drv->versions = (1 << speed);
+
+	kfree(speedbin);
+	return ret;
+}
+
 static const struct qcom_cpufreq_match_data match_data_kryo = {
 	.get_version = qcom_cpufreq_kryo_name_version,
 };
@@ -217,6 +247,16 @@ static const struct qcom_cpufreq_match_data match_data_qcs404 = {
 	.genpd_names = qcs404_genpd_names,
 };
 
+static const char * apq8064_regulator_names[] = {
+	"vdd-core",
+	NULL
+};
+
+static const struct qcom_cpufreq_match_data match_data_apq8064 = {
+	.get_version = qcom_cpufreq_apq8064_name_version,
+	.regulator_names = apq8064_regulator_names,
+};
+
 static int qcom_cpufreq_probe(struct platform_device *pdev)
 {
 	struct qcom_cpufreq_drv *drv;
@@ -304,7 +344,12 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
 			config.virt_devs = NULL;
 		}
 
-		if (config.supported_hw || config.genpd_names) {
+		if (drv->data->regulator_names)
+			config.regulator_names = drv->data->regulator_names;
+
+		if (config.supported_hw ||
+		    config.genpd_names ||
+		    config.regulator_names) {
 			drv->opp_tokens[cpu] = dev_pm_opp_set_config(cpu_dev, &config);
 			if (drv->opp_tokens[cpu] < 0) {
 				ret = drv->opp_tokens[cpu];
@@ -363,7 +408,7 @@ static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
 	{ .compatible = "qcom,msm8996", .data = &match_data_kryo },
 	{ .compatible = "qcom,qcs404", .data = &match_data_qcs404 },
 	{ .compatible = "qcom,ipq8064", .data = &match_data_krait },
-	{ .compatible = "qcom,apq8064", .data = &match_data_krait },
+	{ .compatible = "qcom,apq8064", .data = &match_data_apq8064 },
 	{ .compatible = "qcom,msm8974", .data = &match_data_krait },
 	{ .compatible = "qcom,msm8960", .data = &match_data_krait },
 	{},
-- 
2.39.2

