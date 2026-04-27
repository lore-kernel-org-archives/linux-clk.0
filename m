Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E63F0A85
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 17:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312766; cv=none; b=Yi4aGhLAdNRPnIJvAlqtPrVQg/sNYXjCkF0PhDoRuRMpre3gekw3aWKsHQzgUfq3GYeIQPluO7nz/T1paNjGgrMrudcagvShsktx4Aizmhrt+buqBjxFCXkWifCS6Prb7ZxUii53/mLhwBEC34KGIarBQ++60v9W5SDzRcSqIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312766; c=relaxed/simple;
	bh=yEAoBevnklvr751YiPv2ruAY/6bNGQFrrHJ3uHFmatA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FncI9GjUBQnMGNrUIuDo61BMLKnPQ/dI9AOMo43sQd7kseXEisa0ypyk6ZIozhpZucvKnjxb9CSE4QjcO1MEbknilYbMihXIMMPIzJjkSOgQjwb6tw8Pm2x5lO7+nEIp5ZlfZJnAwbIy1aVO9VOdiXyLe72cHvJ3EofYDePXGKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSx7iiWK; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSx7iiWK"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7986e0553bdso98568157b3.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 10:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312764; x=1777917564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=cSx7iiWKBRV1o1T2hhJCmhJtMMEVYuyO6T9HCFCREQm8gDem0cC4ZUqFTQcnafFlln
         kLocccXlCoQLdySM9b9/w+cHgLXvyXq8pu9p0wzXvZ64tkdjqvnCAMuhged6e1e6s6u0
         jnRqrSmImNU2fY+yZOx2L2btwZfzrBFDSyA5t4rigEMFu89red/G1YZgBWx+YHNGj4nw
         InrgiZPjQ+8Vj390CYPXRREa6BYJlyLsTOLgBEGwbfNiQEaknNdk8pZnE7uSL86XCX0g
         OhD3wfuuLtJunir3TJ53djWKdTEcD+PR1fmHQFpCJSfbTdB2p56LYc6v+TFoXvEk1EtT
         SRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312764; x=1777917564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=nYQceSxN4ennHK0vkvA52YVlmGmdvS+ttiQh19SPUPkHmGmc6llJjX1iLR2mYjB+Ji
         zrOO2B4tI6LzJ7+cRdD3o4NXL4WZvaYcApH+PksF623o1XntlHdMAC9gJ78re/yeRQNg
         I/7F16DH6MWURuXEIFf0AnEc3KNBKaAqbTYcnvk4qpa405imbcDy3iS2sGm6ur+fR9kM
         PxJXrMJoMdvsrw/D5EfHMpVac8kZC3RwK+ozKwVieb1Yv49a+KO4Vl9n50iNwYw5hp8I
         5WVvNmDvPROpojcj1pxljonCKQSKmuxa3rGe4wcplP+1ROhOqnjAJyp8ki6rQCYUDjag
         OHgA==
X-Forwarded-Encrypted: i=1; AFNElJ8nl/g3mQPJPt3b2U4PPMuddjhg6B4+wITo81zjhMQpcdVHnt0jBtNJuSPIZ+9m5bcqwcip4aSTbyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YywV7VrH3TaRdsr9KYKSOZJ3Rw7Zk2jl3snaPy8zcfDcCiu8PvA
	QSlisfS24HuSY8Cv1V9lPe2RTpnPCWZZqMj8ca8M0OyKTM3O1Ziv+prC
X-Gm-Gg: AeBDies+3QP0ZEKOwbJ7LP3w76g5xx7jNzP3ZxepmviR3yJg8FjkbI1jf6NsVMxBvtS
	0X7RDL1DsGY9p3JoieRHWbnXY21IArjWLbSsnkB+/Sq1BD0rqVkaTwWSU15RCTsASFYfE6+gQca
	qucoUuQqdUxIgcaQVtlHQc9RY5OrWUC3Qd+Xl7ykQX83URATGsOsecU/rZ9ys4swhr41ztPqdN9
	kQLuudyDtumwQYYw/RWWJzVgCwwuwKUoT0i2jL+OE7OsnFdMs7vKQs5gOVolZrHv/gpSPflsDCO
	UW7/4jSqbm939cuhvEtXHTnxOfoXR1LvRerRwWn76HwwQ8efuATXhOVt+vHPdG/ZgfNUiEeIQYw
	BT/8aIEGujWg3fIyzjLwAwm3chZfJpyJ6XF3cGh0g+IUPIPze3YtkfnaW0iLd/y3wbx8uXKI5gc
	a3sZ6gsl2vTsOAynUWEA7VyT0iK8eNzh6CNZuw
X-Received: by 2002:a05:690c:c22f:b0:79a:7157:879 with SMTP id 00721157ae682-7bcee02cb9cmr3050107b3.50.1777312763881;
        Mon, 27 Apr 2026 10:59:23 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:31 +0300
Subject: [PATCH RFC v3 09/11] media: qcom: venus: Move HFI v3 venc and vdec
 methods to HFI v1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-9-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Some Qualcomm SoCs which come with HFI v1 like MSM8909 and MSM8939 also
have dedicated cores for Venus, like in HFI v3. Move methods from HFI v3
to HFI v1 so they can be reused.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 66 +++++++++++++++++++-------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..cc21a4762188 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -328,10 +328,56 @@ static int core_power_v1(struct venus_core *core, int on)
 	return ret;
 }
 
+static int vdec_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec0_clks,
+			       core->res->vcodec0_clks);
+}
+
+static int vdec_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec0_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec0_clks);
+
+	return ret;
+}
+
+static int venc_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec1_clks,
+			       core->res->vcodec1_clks);
+}
+
+static int venc_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec1_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec1_clks);
+
+	return ret;
+}
+
 static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
+	.vdec_get = vdec_get_v1,
+	.vdec_power = vdec_power_v1,
+	.venc_get = venc_get_v1,
+	.venc_power = venc_power_v1,
 	.load_scale = load_scale_v1,
 };
 
@@ -351,14 +397,6 @@ vcodec_control_v3(struct venus_core *core, u32 session_type, bool enable)
 		writel(1, ctrl);
 }
 
-static int vdec_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec0_clks,
-			       core->res->vcodec0_clks);
-}
-
 static int vdec_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -376,14 +414,6 @@ static int vdec_power_v3(struct device *dev, int on)
 	return ret;
 }
 
-static int venc_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec1_clks,
-			       core->res->vcodec1_clks);
-}
-
 static int venc_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -405,9 +435,9 @@ static const struct venus_pm_ops pm_ops_v3 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
-	.vdec_get = vdec_get_v3,
+	.vdec_get = vdec_get_v1,
 	.vdec_power = vdec_power_v3,
-	.venc_get = venc_get_v3,
+	.venc_get = venc_get_v1,
 	.venc_power = venc_power_v3,
 	.load_scale = load_scale_v1,
 };

-- 
2.54.0

