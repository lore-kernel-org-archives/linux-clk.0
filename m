Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AC33FB074
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802308; cv=none; b=drAY4RS5MAOvJi7w6zNjcvz2fTHxWt7IpoUCCWTplUeqtZZB2DAmT5T5W0kZvjiEELCVzGmKzwyOIZFDOM0qyjeUnpibYa9a+12ATiuSzeS07e6W//cSIghGzgkVttXOKGdgwvNF/53l230ABM588QeZ2lQC5CgT4qQF4g2O0Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802308; c=relaxed/simple;
	bh=ve5QswCUqMNw/19+nCfSVDiR4F3B0CHIO3H7j8FQmQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDaKJ04zn90zue24v4Y0KvuasjI81pTDTYiXWlgZTv/upAZEyhTOMYhU9D1UMmCpqzLO7sYNhaDoQWuJlXmJbJR6WsNoPnEOAMDFnBAsOTjPsXOwdguh1s3Lmn49zVsu2fV2bZQVA8fmlbi2Az312zb/zHj2auw2FXMXZeRCNlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9BCR1AU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9BCR1AU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49050bfe053so8169945e9.3
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802298; x=1780407098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wZDIcxhNgq8EiTwrgXOkvw460/44BNB66HgpB9Og4E=;
        b=J9BCR1AUWs1hQLGxvUNrQfH/GRxa+c2+EmI+eunWh5QfYe8lmrTi7pJUpZ0WvDIU+F
         yX8wj+Vhwq6eeYMhkwRN8dki6YK8fbn4cL4m6N8aoZj+VnFfxiUNlw5zFN2PSopjPGbs
         3uevWJf1XLww0mDjzoREiZOg0TNTxPAX4j1bpzigsizTPt3FJ33W4oLcTUbuaOnGpytR
         MfYbrrQBktB0QUhRdfr7OJkXz2sBZ81kDVvIdl1q+xIW/AsjzpdvXkIY95LiCF4Kgp38
         1ayNmGKPPPhkxsAIiMHT5ZCTxLt3TSWstLVoluyVAKVA3QiBHk7LL+jWfiDT0LaHbQtJ
         Qhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802298; x=1780407098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3wZDIcxhNgq8EiTwrgXOkvw460/44BNB66HgpB9Og4E=;
        b=BoLvMjntXZyHVhn9+UDdaygoFvUYoW1yfGp1wePtd7ijCOBSkB0K15AJQL6fZW7Z46
         C66m48rsDAa+4wByfmLUG7AbiuMgAf8A0Z3+VBoNH9dNNUATTTDlF9NYrmsofYD/0WF4
         n/gBoZ8LZ8OqljqXZdey5vR5CzI//sFjGamtLkbYdngCh49JBhfsBrw7CpiuBarPL7b1
         dWEawvyDPJMgfA3SGjopcyGT/dzHagYUp4h2vwb/BTaXtdEvn/GYOiB/a2Zi+4pPUxE5
         nwjlkiWg77CWk+6DBU0UR6JgSsGCRrZgKduhGJO7kxOMifGE0OdpSIXuPmUEqwQbrHoi
         wD5A==
X-Forwarded-Encrypted: i=1; AFNElJ9YCtP1H/PwV7gs3UuwEYWMsBQa948bLSNOb7iPKXc2ZHGcJ7lIDtBLoCVXJCfvGo6gUKTMU1esJwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza5OV1utbfd+sTZjYItGF0qsfjwGwsQyN6/Znfq9s1tPKNYBRr
	MORhAjkh2X7MIRcHnp066rtM7AHNjBL5fDtUnZkbyob/LxYTOKvbTTDX
X-Gm-Gg: Acq92OEH2pxVmnDYTCGFzq2+7/4xLekTt8u4MzIE4aACDMODgd9Q0Qk6/q6fHJFfhhL
	+sGgA2mUhm1MPURW+cFOVFShbprCoLr+WFjUzONsOCvqJPgJgMiax6v7fh0jDuyXaMmymYyst7X
	v11Zssr4c3lTRfLVizHzEdDhXBMyuMkDoHZEdQv5sDQVR0scNlf/1NLWdHAtIJc6tq4peuP6TwD
	bE8MhTbLv2FWYCz6rULsuT+r05/GvAkNJBJzUBa+MfREwfM9Ppv7ivDLI8e1Ya8+sy65gWA5bCl
	kR20USdcoWl4PJn0o0eVwW/SWQmTn5W+JHRD6LeP7TJCchN0+viEDbWAsdvMhZ/fdVc5+I8s1aY
	Oi/6XsT355q06VaeMzJkFdLTfXub6DS3E1Ye3S82TnKQucz8rWJ/DDcH7eESR04guyWrbP4agd/
	ZJwyurcPDylAzhkCY75v6x1KSSKA==
X-Received: by 2002:a05:600c:4511:b0:490:6869:46c3 with SMTP id 5b1f17b1804b1-490686947bemr118650025e9.30.1779802297866;
        Tue, 26 May 2026 06:31:37 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:37 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:26 +0300
Subject: [PATCH v9 3/8] media: qcom: venus: add power domain enable logic
 for Venus cores
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-3-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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
 drivers/media/platform/qcom/venus/pm_helpers.c | 146 ++++++++++++++++++++++++-
 2 files changed, 144 insertions(+), 5 deletions(-)

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
index 14a4e8311a64..be1cbd5cfe84 100644
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
@@ -309,7 +343,77 @@ static int core_get_v1(struct venus_core *core)
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
+	}
+
 	return 0;
+err:
+	while (i--) {
+		pd_dev = core->pmdomains->pd_devs[i];
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
+		pm_runtime_put_sync(pd_dev);
+	}
+}
+
+static int vcodec_domains_set_hw(struct venus_core *core, bool is_hw)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 0, ret;
+
+	for (; i < res->vcodec_pmdomains_num; i++) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		ret = dev_pm_genpd_set_hwmode(pd_dev, is_hw);
+		if (ret && ret != -EOPNOTSUPP)
+			goto err;
+	}
+
+	return 0;
+err:
+	while (i--) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		dev_pm_genpd_set_hwmode(pd_dev, !is_hw);
+	}
+	return ret;
 }
 
 static void core_put_v1(struct venus_core *core)
@@ -320,11 +424,43 @@ static int core_power_v1(struct venus_core *core, int on)
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
+		ret = vcodec_domains_set_hw(core, true);
+		if (ret)
+			goto fail_vcodec_clks;
+
+	} else {
+		if (core->res->vcodec_pmdomains) {
+			vcodec_domains_set_hw(core, false);
+			vcodec_clks_disable(core, core->vcodec_clks);
+		}
 		core_clks_disable(core);
+		vcodec_domains_disable(core);
+	}
+
+	return 0;
 
+fail_vcodec_clks:
+	vcodec_clks_disable(core, core->vcodec_clks);
+fail_core_clks:
+	core_clks_disable(core);
+fail_pmdomains:
+	vcodec_domains_disable(core);
 	return ret;
 }
 
@@ -875,7 +1011,7 @@ static int venc_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int vcodec_domains_get(struct venus_core *core)
+static int vcodec_domains_get_v4(struct venus_core *core)
 {
 	int ret;
 	struct device *dev = core->dev;
@@ -999,7 +1135,7 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
-	ret = vcodec_domains_get(core);
+	ret = vcodec_domains_get_v4(core);
 	if (ret)
 		return ret;
 

-- 
2.54.0

