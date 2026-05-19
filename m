Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FEB4F7993
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203612; cv=none; b=KnEIfi4sP+lykpfu4WMobAeTlwtlQqMIIQ7MquK2zLK4jOJOEKmp7hZF4ZDwYaN5rU7vridJcwnR9PkaxMdNcdCT6rKFZas4ZT4kGsddzNs0MfNnerMSeNtIB1fIESG2bxZAlhGQCBF1r9mUzIYR37ltwBQTaIUASMAMAPzH5BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203612; c=relaxed/simple;
	bh=lC1eXNo8nXdqtGecajxttKwFEKsEp/pJGrr+0jPeGWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rTxGD24Uqo2XdnqnSlg5DZwpqzALD6f3wHDFGz7QuiPjSsgjNnH1+PN+DpkYkJFkUS5gtbGQg9CSg5LucLADlUNY48xAsfW/cfgDjNguQFK5fS4PsYLiH0nSNefjR6zXa/XtnhlGs3RCXLbXzPF9b9onI4YdZh+MhzoPQKDGjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oz8shUh3; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oz8shUh3"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso8385752a12.0
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203609; x=1779808409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBuI6uIVySCfaA8WGdHyLuyoU4BibZti3IKN8m8riaQ=;
        b=oz8shUh3Ld8c4D6w0wbNyp1EAUueA6KoXJp/hO65v23Ve3GrR0evXaiorLfXwzepIq
         FUwLoQLb4Hj3TZQaWNYio1qmRPW1ASHNUsUOqCB33cYe3X25QlhookVPr9KJ3FSMNC9n
         7D1MCtlHUv5/AJYuDoEhvXlUJuTfZAQtY/6VL4dl5HDqDtTHmI4rPVJMP3T1lvTtzSoV
         e1HEa5knagzvaAPb2gD3XIiOpPhrsFqfsyqvnRjnjHMwdMG6mi5YWLhSP0O1zeXdaLG1
         A2L6LzBKytmIBWgKbpAPz5XoHw0yhpmdn90WRGPBFsCjL7XNFKSP9zb51hL7zTpyvr3/
         y7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203609; x=1779808409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lBuI6uIVySCfaA8WGdHyLuyoU4BibZti3IKN8m8riaQ=;
        b=C5ke6/MerMejBjj3PBAA5U45q4EBfBfmZ84zDrqqOyHEsVwJwtEEaMI69KZckjqQlv
         R3Yj7dUDyjVSe0LKyMsuBpRyDFKo0Iu9V7gJQpmCcpmfuX8Q62RIMgv45SMaQLYG5OGA
         EvZ087/maJKGhF1f3goe66i8nn+CHnKchlWh1ScjjuxdBCH/Wbl6ASilleeJwfEAiFKz
         9vlPzciPjfR62S0TAn5hlQ2SpvS4hlzjn60LXx1vhRjQ+0z8LAN9tmrDuswojeoq02cs
         mVzcZfIdKrmxF7sintoO/MQOzMUugUJmgQFQgvBc68vutcO5IZSJq/c0jzQuT0sqqaJz
         EwGg==
X-Forwarded-Encrypted: i=1; AFNElJ9efzMsrv/v2ZrKXk2jHaSbPwl8GZ8rxtKWTUSSJnPTEqlhk6Jq/yokVej6RN4T+oQtV4m5cmbxoYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFQ6Xy22GrS6TcH9/3IwUdx1m5QaXqVQOdyoSPk7Jb1sYQmpbG
	yntTzXCKgR4jUAAQd6m3b8JHidLkvQZQ7nwcuiYlyDdC0UcU1J0CZguD
X-Gm-Gg: Acq92OEp12m5jJLJs2VkJWVjy0I5SlxQQF8jqbNmq00cD/FS3tZsXyMUkLUzkfeb4eM
	0ayvhTpT4hCvUnYTP6Prnk4DAoTIrwIBLtrsHjP1N+t8kNCjKL7ZzYqU2lI3Pp8GBwOBCf1wV5u
	8R2VIEPxoWwxEhxcFMPsqjbD7QrrnXAjLkBG8vaKpt8gjk9dKQ6QuJ8EZ91Z5yoFjXaP0kYFRFG
	ftkFOycJIeQBcccewkWxtOVf2Hp4XZ5vdLzjBiKh4Rgyy84n5ELN3i8z4lzA9mDZx/1bzoo1hYu
	4cvmfD3HvoIPaccI9pIQozB1jSjm2HXaqb8Xc29cEqjXPJfIubF45Tqi7pYQT5qd7CL4fD3Qwtf
	fL6+LOjxfyGSWlnl/2h1/bL+T1qEoxyNvIbbuJrkKxxzs/WlFmf/Nwf4drE1vqFD2OiAINFSX9M
	Ilj1CEFyzcwzeFihep3JTHwchgqsrr7p4scpYJ
X-Received: by 2002:a05:6402:234c:b0:67d:afe0:da6b with SMTP id 4fb4d7f45d1cf-683bdb98490mr10996326a12.22.1779203608690;
        Tue, 19 May 2026 08:13:28 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:26 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:48 +0300
Subject: [PATCH v8 3/9] media: qcom: venus: add power domain enable logic
 for Venus cores
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-msm8939-venus-rfc-v8-3-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started.

Vcodec clocks are added and enabled to the core Venus device both for
vcodec0 and vcodec1. To ensure they are added only once, introduce a new
property "vcodec_clks", which is an array of clocks which are enabled
both during decode and encode and is retrieved from the device tree only
once.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h       |   3 +
 drivers/media/platform/qcom/venus/pm_helpers.c | 124 ++++++++++++++++++++++++-
 2 files changed, 122 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 03804c30808e..c1603eebd757 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -79,6 +79,7 @@ struct venus_resources {
 	const struct hfi_ubwc_config *ubwc_conf;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
 	unsigned int clks_num;
+	const char * const vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
@@ -143,6 +144,7 @@ struct venus_format {
  * @aon_base:	AON base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
+ * @vcodec_clks: an array of vcodec struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
@@ -197,6 +199,7 @@ struct venus_core {
 	void __iomem *aon_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
+	struct clk *vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 14a4e8311a64..123b4661873a 100644
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
@@ -309,7 +343,63 @@ static int core_get_v1(struct venus_core *core)
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
+	return 0;
+}
+
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
+		if (ret && ret != -EOPNOTSUPP) {
+			pm_runtime_put_sync(pd_dev);
+			goto err;
+		}
+	}
+
 	return 0;
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
 }
 
 static void core_put_v1(struct venus_core *core)
@@ -320,11 +410,35 @@ static int core_power_v1(struct venus_core *core, int on)
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
+		if (!core->res->vcodec_pmdomains)
+			return 0;
+
+		ret = vcodec_clks_enable(core, core->vcodec_clks);
+		if (ret)
+			goto fail_core_clks;
+
+	} else {
+		if (core->res->vcodec_pmdomains)
+			vcodec_clks_disable(core, core->vcodec_clks);
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
 
@@ -875,7 +989,7 @@ static int venc_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int vcodec_domains_get(struct venus_core *core)
+static int vcodec_domains_get_v4(struct venus_core *core)
 {
 	int ret;
 	struct device *dev = core->dev;
@@ -999,7 +1113,7 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
-	ret = vcodec_domains_get(core);
+	ret = vcodec_domains_get_v4(core);
 	if (ret)
 		return ret;
 

-- 
2.54.0

