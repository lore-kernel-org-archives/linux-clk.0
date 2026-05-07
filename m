Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996EC346E75
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142857; cv=none; b=sFv3dTqUruZNk8PMsMrf4I/+qj4miuzJmUwbETcPOQ+v8PaiwOwAwzRM+XwJVSSDTigLP5imZ8DIhM9jKUd2q9PkOKcLwo6U/T3apeZGWtYsTkRBlh31/W40wDsGUcvmnV4lC84fKzwWF3kYehnQCFBny71nHQoVx4ry6ZjlJ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142857; c=relaxed/simple;
	bh=vTU3Z89HA99bN3j6sKV+bw2kMvuJDfIovWMl+GhVzkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2DKO6XV//7+BNnA1gI7O+1lSE8Ap+9nkLqEtszKN9ZoaU9m0tTRXs1pUD5U7QbbcWNL9G7plkfINoFucY07xRRjmxMcYb+8XZlxWdChDSueLg1qhZJcu80YSEPQWClgsduWUOlyzSYx8AWOi4LrVMwIAYP1Hc/YXvAdAU2G0DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3qBq5hc; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3qBq5hc"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7bd65714dcaso5160467b3.3
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142851; x=1778747651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uAlkVZEBZAqm8F3pW/2Zom25vwxBzMU/2m2hGNPbhw=;
        b=X3qBq5hcMy3JxJaxDz605ax93ByTCCh6fE6rUQM/fuNy2k+xsqjXkK3+bczf0W/LBI
         KSBRkloYYxYw7LUp8hPpfQ8R0X3ZrJdTHLvXQyvXfhJTNYGJWBQK8rG2Vk9jC9TZHqo4
         iv+bN4AlbMs3S1IlzQOcJcrlQgMePuxgqg6tW/ZoRcgBbpp2+mPYXzM2PpCIH+iKgvnr
         RRYLKVzn+LtCTRhwoFc0YyfleoNsn6qXMIeTAyFRCKdFtNfZSsIPATyhu1XSJrrd0boP
         Vbk6rZo611HEbmdzmxNODUrrwab8Rq0tdq2Bs98N/73b/jeW9PxnoY6QDLs7K2aWuib0
         fXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142851; x=1778747651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4uAlkVZEBZAqm8F3pW/2Zom25vwxBzMU/2m2hGNPbhw=;
        b=GWGKVMNiCvBGnM4GLAutTKMEXeKZJ2JXE3yJqCZtaMDBhD3HM6FylJoN5L4lSP+Hjq
         0RGU6MZf9+Bse70WTA9Sv7/xWZ+UnQXlBMcDfLQek5q1d4c54BTEigAiR4nkwxvyghkD
         m7deZcgEskEFssSkvPITfKJcV3jWaq4FT5iLD9frGnXpHJNPKat/ZS3Ib43XT6lcurxw
         eNcSnJBIQlr4ORNgroHghEFVjHWol4i8yieEY2gcz9t/07iV6k5FcwvPaG0m9HKgsi4C
         x6rIAvbthuxDSbClexa5mb5+NI2MCuSPcdQMLfa1VqEdKRcXBIZiUDTzp0n2FS92Oc3m
         asvg==
X-Forwarded-Encrypted: i=1; AFNElJ/iteZPIykvftDj2EJ4kgUn2sXDz91qsP54iQlreBZ1Wn1yDRriP3HeOeZPp+LiRA+tcOx8NzRtedM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ2CcEto+6lo/sPUtsYkcDzzQbH5zILtLfcFGeOFq74S5Z9X9j
	G3slralxWMj42HyWv14lC13I7ujtqiy4tqhUV9D8MjKuib/8eABRgV3P
X-Gm-Gg: AeBDieuRu2/NC9KJhiY2lOoHM0LaASU+8MQckIMlEOI2o2GGJHnHn9+S3U2AzIqqAzI
	6bZyjicOCuaaIik8plwWhy5udNwXzycMHUT8oGVPxPWkXMaNTybPF+hR57o58kruMg+MFI78oPR
	Hw6UsvtcdJHVNcVZfxzZcgdupR29CDcZ5JqjTFDLj3wYIy3jIlTXFpbLzmwNnToTXo9RTJl2zq/
	qzR83sAflHLx5csFFfBzst3srMlaO8SlDGj6qR5B9sI7ziCBcSlp4JPETPAHnL4pxGx76QUR7vW
	8UD9k+UqCQ2M8ZLib+RImJKOdl/iekLybEHb3RzhHAGfvU5YIAiYnRb2AeoA8qHhY3nsCq7DiG0
	rTsROAvRD3RIOyOsBJ3SsVk3pIFmTQTiP14BHI8FpRSizKt0zV9ge7Hbsvs/YEqNdYse2HWrr9+
	ilEJ4g6vEeMC16OzmoQT+d3M5piqXoakHSVfJ4
X-Received: by 2002:a05:690c:6d81:b0:7bd:5cc4:1961 with SMTP id 00721157ae682-7bdf5eac2c6mr67476427b3.37.1778142851217;
        Thu, 07 May 2026 01:34:11 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:34:09 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:21 +0300
Subject: [PATCH v5 6/8] media: qcom: venus: add power domain enable logic
 for Venus cores
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-msm8939-venus-rfc-v5-6-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 149 ++++++++++++++++++++++++-
 1 file changed, 145 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..5ed7cbef8149 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -297,10 +297,31 @@ static int load_scale_v1(struct venus_inst *inst)
 	return ret;
 }
 
+static int vcodec_domains_get_v1(struct venus_core *core)
+{
+	struct device *dev = core->dev;
+	const struct venus_resources *res = core->res;
+	const struct dev_pm_domain_attach_data vcodec_data = {
+		.pd_names = res->vcodec_pmdomains,
+		.num_pd_names = res->vcodec_pmdomains_num,
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
+
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	return dev_pm_domain_attach_list(dev, &vcodec_data,
+					 &core->pmdomains);
+}
+
 static int core_get_v1(struct venus_core *core)
 {
 	int ret;
 
+	ret = vcodec_domains_get_v1(core);
+	if (ret < 0)
+		return ret;
+
 	ret = core_clks_get(core);
 	if (ret)
 		return ret;
@@ -319,12 +340,128 @@ static void core_put_v1(struct venus_core *core)
 static int core_power_v1(struct venus_core *core, int on)
 {
 	int ret = 0;
+	struct device *pd_dev = core->res->vcodec_pmdomains ?
+		core->pmdomains->pd_devs[0] : NULL;
 
-	if (on == POWER_ON)
+	if (on == POWER_ON) {
+		if (pd_dev) {
+			ret = pm_runtime_resume_and_get(pd_dev);
+			if (ret)
+				return ret;
+		}
 		ret = core_clks_enable(core);
-	else
+		if (ret) {
+			pm_runtime_put_sync(pd_dev);
+			return ret;
+		}
+	} else {
+		if (pd_dev)
+			pm_runtime_put_sync(pd_dev);
 		core_clks_disable(core);
+	}
+
+	return 0;
+}
+
+static int vcodec_domains_enable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 1, ret;
+
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	for (; i < res->vcodec_pmdomains_num; i++) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		ret = pm_runtime_resume_and_get(pd_dev);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+err:
+	while (i-- > 1)
+		pm_runtime_put_sync(core->pmdomains->pd_devs[i]);
+	return ret;
+}
+
+static void vcodec_domains_disable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 1;
+
+	if (!res->vcodec_pmdomains)
+		return;
+
+	for (; i < res->vcodec_pmdomains_num; i++) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		pm_runtime_put_sync(pd_dev);
+	}
+}
+
+static int vdec_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, core->dev, core->vcodec0_clks,
+			       core->res->vcodec0_clks);
+}
+
+static int vdec_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	if (on == POWER_ON) {
+		ret = vcodec_domains_enable(core);
+		if (ret)
+			return ret;
+
+		ret = vcodec_clks_enable(core, core->vcodec0_clks);
+		if (ret)
+			goto err;
+	} else {
+		vcodec_domains_disable(core);
+		vcodec_clks_disable(core, core->vcodec0_clks);
+	}
+
+	return 0;
+err:
+	vcodec_domains_disable(core);
+	return ret;
+}
 
+static int venc_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, core->dev, core->vcodec1_clks,
+			       core->res->vcodec1_clks);
+}
+
+static int venc_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	if (on == POWER_ON) {
+		ret = vcodec_domains_enable(core);
+		if (ret)
+			return ret;
+
+		ret = vcodec_clks_enable(core, core->vcodec1_clks);
+		if (ret)
+			goto err;
+	} else {
+		vcodec_domains_disable(core);
+		vcodec_clks_disable(core, core->vcodec1_clks);
+	}
+
+	return 0;
+err:
+	vcodec_domains_disable(core);
 	return ret;
 }
 
@@ -332,6 +469,10 @@ static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
+	.vdec_get = vdec_get_v1,
+	.vdec_power = vdec_power_v1,
+	.venc_get = venc_get_v1,
+	.venc_power = venc_power_v1,
 	.load_scale = load_scale_v1,
 };
 
@@ -875,7 +1016,7 @@ static int venc_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int vcodec_domains_get(struct venus_core *core)
+static int vcodec_domains_get_v4(struct venus_core *core)
 {
 	int ret;
 	struct device *dev = core->dev;
@@ -993,7 +1134,7 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
-	ret = vcodec_domains_get(core);
+	ret = vcodec_domains_get_v4(core);
 	if (ret)
 		return ret;
 

-- 
2.54.0

