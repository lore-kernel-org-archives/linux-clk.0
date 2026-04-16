Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD323D5223
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347094; cv=none; b=rZpdRjPAkpN3X4OefkOLuYZBxqI7dQ9PLg/8lGH4x8O2vM9nIL61kV/dsenRsSa3wvDT4FAiBikReB0tziiAR7KzOcF/E7g6euKYUL/rSDuNxfYwXOXs52EzmWVtgBHhfqfQmBuWRaQqcZfGf2IbmKRTFnn8pNM5zzwfsY+VOts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347094; c=relaxed/simple;
	bh=V83toJRzq8U8D4mGDj0lJeN58s6MqU8MQGaAbFH2CNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I4idEXEJdGQyV9b1Osjoa4W6uAf9i2pV7RACZl+/YbHD3casZl/SUdozYefAq461N3C9RkPp3x1tfN1fvQkn5rtzFvUAQJ64x8/6OFUTKGn3g4smTO1UQjhwkhg3SaBsXMWhcKkXdukudqpzSV5D9ffox9uGSSDwLPpyXrGg4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjvvvtL2; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjvvvtL2"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7982c3b7da9so78636597b3.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 06:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347092; x=1776951892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtnVA07z93Sa3PHIsBwQ1JskBEYwpeJ7GU4WtOXVzaI=;
        b=SjvvvtL2e+RJbFO2GiwZ+xRA732PLucVmcgtxnuG5gvNlzwUGeXe2pbxDuGnEn3G3r
         7TFDz/u9sPLcSCf/I89T8MNkcASNU3jKzz8vRSmED4CdpLQ5ny9ZjGytKrLl0M7Rxr7n
         X4I1jLr3iUVVeiPv1Vl6frD5sHdq5TORiTs66sPylMZPUBZJJDCROtk5jQE0OrgtyWvm
         xQjYFH8OM1wKCk3gZ1ET30iE9OBmSpBOB97BbYnXr1WgjmFnSe0gn+r2enNMB7VmsFUL
         76NcdQG3rnWf9kagPWDXJ5BNUI1XMuHHkqX+2d6JKh7te6+LwYcMQZyQ2itN5qcZskeD
         VAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347092; x=1776951892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KtnVA07z93Sa3PHIsBwQ1JskBEYwpeJ7GU4WtOXVzaI=;
        b=UnEkq4QVdhz9S0j1Fd/YB0Rlt7rlJd2geRL0UONIVyBX3OZBPCruU5wkKDqCNqemXR
         6JW7lpNRx/rhhSwmm/zglucqtfmIhUUSOavx7Xoohm8NGIfNAxtXA1irLEC4NISWuhEB
         bqDktJY8fr2AtKsxmK+WHXmqrno4RIAgrtNJXtcXByCCRM8iHswDo0lxUmlGDhMKEXE8
         n3w3XOz7b4k6T0a9X8uCqeNfGdBRDbdeSS234xz4Lhn/X35lpCWSrkAAbExbw9agYsU3
         rGBL2jfsBgkxPoFHhlJ0bgTjhJ8KFf2EILlABHHxHwNmFAS8OmuyOrx3uZo/cWBnWSwD
         cOhA==
X-Forwarded-Encrypted: i=1; AFNElJ9ru8rLnR1G0Ew0dZ5B5Wo78CyaSAuf3c/rLWAykxhWEh8IhkUl1+YgEGHtIs9Q7mZPa43gdh5SH4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1k3FoLVVpmMuLYtIZVDGAGE0ksSQajyRkMU9q0dWDJc5dHSHR
	F7s1TrebQ4ebvZ0w37Wm74pIhyaN2pcvnCpJbUuggkANqFXN/rUR+/Wi
X-Gm-Gg: AeBDieud2LtryfAbAG4J52bvX+nay2OGYzoxxXgiJp7fqBPLE9abHbWpaoiDSsqdsMw
	aSmMjOXXhjrR1ZqCUjV+LdohzDNq8JU2u3q9s/gILjXOcYcffWwPtXmKmnxsZbFKU7nE1Koj5Ko
	YAnbflQMgVXIzvV+jmAW1XyNntWlWQj1awwTpzVtDKYkB2gUpYdW9wdqV3EVbVD6HZE8hHdu1rA
	t2lcCRnpp/j5pG1nZl8+UeAxur0JDocGH9jxyVY/vYg6jAaGxsu+cmwT5K6k7wSMuKuyvUJSgnR
	f/m3h9tOcPZM/T3zD2JvqEz7EdEGFG6G2BvUM1CoNgTG6C7cRIddooK5kLACA6aiJzxYc30JSZc
	H7GA6k8zNAXwNvgP+TAPRXT8n7zoPCYNOxbYc+ZJWYndYUURqtgjqcPWiGvwadfV0rjCENUZMK1
	W10Sp2fdnepNv5bRVVzYhJOVZyoA==
X-Received: by 2002:a05:690c:6983:b0:7b4:378c:f72d with SMTP id 00721157ae682-7b4378cf8bamr136828277b3.42.1776347091671;
        Thu, 16 Apr 2026 06:44:51 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:51 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:56 +0300
Subject: [PATCH RFC 09/10] media: qcom: venus: Move HFI v3 venc and vdec
 methods to HFI v1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-9-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
2.53.0

