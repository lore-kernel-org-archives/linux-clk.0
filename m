Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21D13B635F
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 21:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707579; cv=none; b=sYkNy4s8CEZ7j8+74voAJEL0JjY568yHXcX33tWZ0T0IBxV48y+q7XOapYH/1M+3dgjz2qBeNfQCF6g7CDiLvOE9kSxjGm2Vw/BcByU94wGIS8LCdAJAjQngD6Wm6NPX8xepv1LH0q8QlyGS0HPgTjbyVvf41Tga/TPWk5rbXG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707579; c=relaxed/simple;
	bh=xxsBYbgCrys4H+BvHwSVx3l2TsVI0XR29+Wzv97Td+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ako+vJoLeL9Y9NS/vEfYy6h2UEOP34r5R1JbgVezRp5o3/TN4LNxehvwxJKFBTpxl0C+P1JyJ15A+hqi3VDrkgY6/Q4mvk/s3xYml18eGe8OGSPI/A4eDgbossW/yOO99/735GJtAilzAdcsBaUGCeXhkpxrcgXZZyO5c/+YXiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCN2cVqq; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCN2cVqq"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65dead17c24so2684698d50.2
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707576; x=1779312376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IoZKGUKQ1B6oVE7EGxKgFyb6h2h0PuRsH58z7LxcLI=;
        b=dCN2cVqq+QC8wf92Us1Rk7j01tpv9vwLeOmBkpWgOed+BZOYM9GhSIlUDYUIlqjrxv
         PI3Y0DN6evWV4lMOEGR4q+XJLTss/xdPRsjOkxXpkxQ53PymfAf057cLWw0+4Tt7jSI6
         tqzH4D+0GvZZtUGECPqZo0/aAfZeB/jair8Dr1oh5RyTPoDrq4/Gxyin8UcI+exG+Wtw
         iiHCWez+bK+aSHcOgmpX+n4HleUKCjjM1UO9xFOXxGo1tFDWkosf2ZX1LC1z3pGzRUkT
         Ui1A7lcU5nWbslz4qFwlJyyHuI/3I6ax5fFr7Fw+fA3zIkhFybMRC3v2qR8FFekf2SaN
         Q53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707576; x=1779312376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0IoZKGUKQ1B6oVE7EGxKgFyb6h2h0PuRsH58z7LxcLI=;
        b=WKvPbTq1yjGuVbc1riYr7Z4J7xKWXxsvuBZGoAXgkL/f8CIfJ9x4iyurjmUJ70CRsp
         ZWIwW3eV8KrBwzgN0hEfzeu+i6zONoVzI9wtXJXrXc3o34rCTpQDg7b9oiBTTXUMI4AH
         GJC6CgBgjb3BO0mpxHrdaW9K/jng9nJxBxxXW6IlukdChq6gvURJEiO7jAOdQilib5gp
         A1EdMcFdxsUxbisNoEq3EfdOfKTWMOAbwamQ13i3xFTo1fe4J2spVvFPNxDRGef/63Ob
         ClzkypFlOW5RVKazoQP+gqVnc45E/nvklG7wvng4H31vOGghWEwxpqGH+ov/4gXCx1VQ
         8vGw==
X-Forwarded-Encrypted: i=1; AFNElJ95YwRWri7wDUVLwLN1mWXsvWxd+oWMDsvmdgI+j3J/Nhe+wqW9EyaYHkBOCL8R14qM+6LSagDwNWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyulNbpZTHMCGZk1bFWT2pVBn4S1OMrJ5yMnfIs+4qQY4KAUGna
	daGKE7jdpW915y4vIBjkoCQMDPq88DW43ahNZh2MJ0X3c7I114q9uU+K
X-Gm-Gg: Acq92OGJJO9UeClP0gTccBOFRY7bqslci/6Uri0MvyEQ4u6EHQ1qMdkeJg0PJnQp0Fo
	+8KIwAAWF1axYEocYSrrNMTw2owAORE7PCLCEujuEyP/Gp7Wz9j+UkPC5apdXTXUkpkNoFhKAWm
	rRMIQu6I1Y8L2wkFMv/MUjUGfExNGii+YveXfMegYCgW8HKs1s953jmszNFEM7WjKIsvUTgoRlA
	ArOznhDwsNaN2Z6wN9ac8fBMf1tYhK8uP1+TKo7dpF+vMhZWjoAFWFa/6Mwb+hgKpXH6BvT58wV
	DuL8G3Yql7AVexl8CQbDe+77u06u3jDdgo1Sdkd3OBH0S10Le1pHNb6X95v27ZWu6/ikhTx54My
	9A4ttZ9YEqWZQ+hpnkUAgE8tmyKpZTJSpJzpP3SiFI3dpSxD3uU3SdMGRU1sXSfRZq+QtAQWnBY
	8yjlyM0m2EK0s51FYPosgPRbJCrQ==
X-Received: by 2002:a05:690c:c513:b0:7b8:926e:3f0d with SMTP id 00721157ae682-7c6ada4b583mr57213767b3.26.1778707575666;
        Wed, 13 May 2026 14:26:15 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:14 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:35 +0300
Subject: [PATCH v7 6/8] media: qcom: venus: add power domain enable logic
 for Venus cores
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-6-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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

Vcodev clocks are added and enabled to the core Venus device both for
vcodec0 and vcodec1. To ensure they are added only once, introduce a new
property "vcodec_clks", which is an array of clocks which are enabled
both during decode and encode and is retrieved from the device tree only
once.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h       |   3 +
 drivers/media/platform/qcom/venus/pm_helpers.c | 118 +++++++++++++++++++++++--
 2 files changed, 116 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..ff9174a4e8c1 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -77,6 +77,7 @@ struct venus_resources {
 	const struct hfi_ubwc_config *ubwc_conf;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
 	unsigned int clks_num;
+	const char * const vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
@@ -140,6 +141,7 @@ struct venus_format {
  * @aon_base:	AON base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
+ * @vcodec_clks: an array of vcodec struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
@@ -194,6 +196,7 @@ struct venus_core {
 	void __iomem *aon_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
+	struct clk *vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..be705d4d64b5 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -89,12 +89,23 @@ static void core_clks_disable(struct venus_core *core)
 
 static int core_clks_set_rate(struct venus_core *core, unsigned long freq)
 {
-	int ret;
+	const struct venus_resources *res = core->res;
+	int ret, i;
 
 	ret = dev_pm_opp_set_rate(core->dev, freq);
 	if (ret)
 		return ret;
 
+	if (!res->vcodec_clks_num)
+		goto set_rates;
+
+	for (i = 0; i < res->vcodec_clks_num; i++) {
+		ret = clk_set_rate(core->vcodec_clks[i], freq);
+		if (ret)
+			return ret;
+	}
+
+set_rates:
 	ret = clk_set_rate(core->vcodec0_clks[0], freq);
 	if (ret)
 		return ret;
@@ -297,10 +308,33 @@ static int load_scale_v1(struct venus_inst *inst)
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
+	return devm_pm_domain_attach_list(dev, &vcodec_data,
+					  &core->pmdomains);
+}
+
 static int core_get_v1(struct venus_core *core)
 {
+	const struct venus_resources *res = core->res;
+	struct device *dev = core->dev;
 	int ret;
 
+	ret = vcodec_domains_get_v1(core);
+	if (ret < 0)
+		return ret;
+
 	ret = core_clks_get(core);
 	if (ret)
 		return ret;
@@ -309,9 +343,63 @@ static int core_get_v1(struct venus_core *core)
 	if (ret)
 		return ret;
 
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	ret = vcodec_clks_get(core, dev, core->vcodec_clks,
+			      res->vcodec_clks);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
+static int vcodec_domains_enable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 0, ret;
+
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	for (; i < res->vcodec_pmdomains_num; i++) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		ret = pm_runtime_resume_and_get(pd_dev);
+		if (ret)
+			goto err;
+
+		ret = dev_pm_genpd_set_hwmode(pd_dev, true);
+		if (ret && ret != -EOPNOTSUPP)
+			goto err;
+	}
+
+	return 0;
+err:
+	while (i--) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		dev_pm_genpd_set_hwmode(pd_dev, false);
+		pm_runtime_put_sync(pd_dev);
+	}
+	return ret;
+}
+
+static void vcodec_domains_disable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = res->vcodec_pmdomains_num;
+
+	if (!res->vcodec_pmdomains)
+		return;
+
+	while (i--) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		dev_pm_genpd_set_hwmode(pd_dev, false);
+		pm_runtime_put_sync(pd_dev);
+	}
+}
+
 static void core_put_v1(struct venus_core *core)
 {
 }
@@ -320,11 +408,31 @@ static int core_power_v1(struct venus_core *core, int on)
 {
 	int ret = 0;
 
-	if (on == POWER_ON)
+	if (on == POWER_ON) {
+		ret = vcodec_domains_enable(core);
+		if (ret)
+			return ret;
+
 		ret = core_clks_enable(core);
-	else
+		if (ret)
+			goto fail_pmdomains;
+
+		ret = vcodec_clks_enable(core, core->vcodec_clks);
+		if (ret)
+			goto fail_core_clks;
+
+	} else {
+		vcodec_clks_disable(core, core->vcodec_clks);
 		core_clks_disable(core);
+		vcodec_domains_disable(core);
+	}
+
+	return 0;
 
+fail_core_clks:
+	core_clks_disable(core);
+fail_pmdomains:
+	vcodec_domains_disable(core);
 	return ret;
 }
 
@@ -875,7 +983,7 @@ static int venc_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int vcodec_domains_get(struct venus_core *core)
+static int vcodec_domains_get_v4(struct venus_core *core)
 {
 	int ret;
 	struct device *dev = core->dev;
@@ -993,7 +1101,7 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
-	ret = vcodec_domains_get(core);
+	ret = vcodec_domains_get_v4(core);
 	if (ret)
 		return ret;
 

-- 
2.54.0

