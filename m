Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20CC37C0ED
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406490; cv=none; b=JrjHCaIvYYm7kFMSk7CQPTF+o8ia8gIxjEqliUL1fi0jvm2NoQhR+PlEhRTd7T5n/b02KFJHu+p0UezDeY1AopuHT78/RzytzSZxPulFt/kcL4WDvtNFKaec6DzM8tXVn2BeqQwVJOqS95ANeZpLtvN7IHfYmlzk9GlYksluQsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406490; c=relaxed/simple;
	bh=gXVvFeOiszOtLNi8thoXHWhThbz8pXYYCqEAg8kpU0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vx/DObTy5juBKGlMUHDPGG+LdeCNWOcL/0ztcI2/J4c3cQBpbCC4GaRajVQLAoxzTdU79L6zLFSYSjeYN9uJNryyXC8JVIvp7Ic8yBv4UFcTJ1GfKK+mKdkGbHkTooExZTLFB9tMyFe16SQaOxJqGm8sz74rSHAIFdd2c+sW5MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOj1Wjsm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOj1Wjsm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so38352055e9.0
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406487; x=1779011287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OmykB+UZ6UVbeiOb57zqKjObziO9aek18m21I2ISj0=;
        b=mOj1WjsmEqzlwnp+yLiCAaKuIQ5j/krioE/LuOpEGVH0E0KvQMcdenuFdda1GNqywa
         IO4p5JpeVwhflz8OBXpIySsIHOjoqBAg5K6LpJX4HCaMsJg1eiQVTESWnpVjz6vt0FHk
         tDWOkQnbGnmSGnz2br2tnkECPhpAI1bFrakJjVVU3qkuDTxTv74BZTLb1oe++0Uc0Spz
         K+dK/Os/hWZc1CYGeeVcYNMpKtNAcRwukH6arwETOBdY7cIf8Pdb9jfxjMUsWrHsaX1i
         alubOK7LGUr1GIVf0FFrnFZXD93DwtkOTd9Tl2GHiK93X8MiUa6JWg4oqFTERqHXN5/4
         vA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406487; x=1779011287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4OmykB+UZ6UVbeiOb57zqKjObziO9aek18m21I2ISj0=;
        b=ZxDiMzZ8hypN2CIcRV59j7DmHtLjBKzxpwkYruuPDpNz4bj0930lE4zAK+pyN+TTnk
         g9UqP3kz836eUvTXtols7pGypGr3ryxxGO9xGcynNCDviSBp3Fnqjei6P9nPy45xk2kJ
         Yi7DU9fimNEhK621C9mK7J7AfSlfS4MpmrQb188tUd/PA6G41YyTYJkUiJdwE+eEpcYz
         SiGSvbmX+dY03NhQBYnp/WnCJ56BcG7yEutgkscVvgBTqAUqqCISGsi9Ub76Q55Qm9i0
         8ZP8vkseKKYUp1pRCSztwBHF6vglKHeA70ejYmHIIhgRPnRVLx9y93PehqENRamcj8n4
         eJ0A==
X-Forwarded-Encrypted: i=1; AFNElJ+NhNE8jeWDogHKmvv+01XLn5DJmd/LcPe5KX+4+MQMzJQbygnqcM9ZEH0A7y9EROfyKorNo9hy+5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqTWG0MQXFUYXEY85N1XGx3I9HKaPPwxlEeb8Zp6HhfNSzQxqK
	kAJ6xTup1T9WO9dGdkmWHTlVFg6nkBTYsjDWrYwHvGweXd4kPyObq+Ap
X-Gm-Gg: Acq92OEy+WEM6SHbP1Yz+qVV/5v4bvkpHm+R/GKLN3sSI8uQDyNUfsmgwShvQ+fCLeE
	X+a1rvIrHE1Gk5RC+Bw/rnBAO1AzmmoqL36P2dr/hnejXC/MNHVOv18JYQtEDi2Y1LFBVTJEzP7
	h1It+aZUKtYtovWuAalALi6AhFay1oBKC2u2fKFdIpP4kzPCXhrNUesLLyu0mOCP9J9BBN6FpB5
	B6f1V5IYF0HuLe2zAJRuNg+Jv066tjk43D0ELA0kxZoM2RzrcgDGv9eO+4rC2ciTVdXkZgxTtxx
	GXLL2W/bEIJTMyfAI/xuzJ3Qo8MoK1Mf1FKUkC3hZNgfD5nMJhdQhNW7ZcuYCVR3k/t54xabgpF
	d1C4S91Jv4cbm25/FETc/eTEbvBok2/KlVPGRfnWSXbaKRiFt9VrGszfHilUASFhJKFvW/ekpGf
	1ADPVRn+vGxqlwa6gmUyPdX2/IxNAj
X-Received: by 2002:a05:600c:34cd:b0:489:1c5f:3a9e with SMTP id 5b1f17b1804b1-48e706f3688mr90854495e9.13.1778406487439;
        Sun, 10 May 2026 02:48:07 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:07 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:44 +0300
Subject: [PATCH v6 6/8] media: qcom: venus: add power domain enable logic
 for Venus cores
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-6-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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

