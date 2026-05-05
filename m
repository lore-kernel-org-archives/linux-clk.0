Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF15A4968F7
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017591; cv=none; b=TRTUeNuFLhdBAkduSxss7Ju/EKhfnSSe/SK9Gez+0cN/XyLx0Y9WLFhLlDvwH/90ET3xP0IVQDY7ZooxrtDQvohiI++QaOdTGWIVjArPl06s8weT/hecoklbY4dh+9hsYZq6zxu4e0gL8nPMSXv+kmMQ0LgO82Sd5JUMNyUaHgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017591; c=relaxed/simple;
	bh=Y3ohJ1oOQhONh2Boqz1nsKxlnH05B9SJoydn8ICKThM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJOyyyeBpdQpIABEDCT46+sISrrnkLD/Ejnp5hh+e0bVvY9hAFv5Oq5Y2KrOPCVnluu7gU+xcYurWweEMlfhPq5c1OJ+9Acx3n3u9L+5V5V0gp3IQmKugjURcR9z2aQMgtwXqUn3WBsIvrEzhOiFFGmXSUDlP/8+AJCnYN2U/mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiDf6cUF; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiDf6cUF"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7bd5dde63dbso59302977b3.3
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 14:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017589; x=1778622389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GemZJIkLJf1bCVrVzeTpeAfgV/EiAoljEyPbaTRdNw=;
        b=iiDf6cUFle/L8+TsbbPzd+HaRUbEaqWOswdiJgi6VIVywOvRJKTKEFNIlNcShXEoGn
         F91v3Ejq2icMUkidgk5OzFOg9TJK/ws2gXzQbR/39/TBJxxIMpKaju0Jx7rWhV+DISGW
         kQMWdocGG5r5uYFMhFBaNpFK4nCXFUiB+GauXz0zRU+sczy6JNJRD1JGgRLHy+3RV4Yx
         2hrQSHPXvCvW/PGgAReAH8C4qaZbLeCN8Vzkq1JFG5Xv++xE3/YxB7D9oTwL4XMdQGrV
         ElhAavdrwf1RW+PgvoradxnbQEyiEdFfIBqN7V6NY4hQ1c3GVtLtR3yLCpfDK4kgBY8D
         H9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017589; x=1778622389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3GemZJIkLJf1bCVrVzeTpeAfgV/EiAoljEyPbaTRdNw=;
        b=p3mgHwR669T2sg6qZdwjUQcJutR18JXLmcDeroCyR7cKTJF7E9i9pg3Eal/p6odnc5
         GDhUyh7qCYgvs+HyhmJ/UeuJB1P8K51LLWBYNeb5mU/fW1NAb83uvY8MP1w7YzUXlIy5
         xEhqKkKXoRUjoyZeeJhI63A0NgVQ/P9v1GaChgIaB4JCZ3eayDQ/zyU5rXPtYNOFP9hx
         yWQczn3MuiqHJ1fEl99t8Mb4K/Zua2M0bTpqSwc4CGqyu2ZvBqdM8Fqjfsn3Qc/AaKJk
         d+YsTmOkmC3wMcJflKTdLEwlple+LAvOf2JqMAwIwn4wR5Ymz/gnW/WopQ0ZoXcN/23t
         3P5A==
X-Forwarded-Encrypted: i=1; AFNElJ9+NiDbsdPMVfzcBqybpbHCDxT9k8bzQegqJ9HAIzDOdjCVe0ZKQbPcb2WZYe8g16UpWWg8cDFuuFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/4q6dn1vNiD6umNnYqkRWMeTYBZfKOhsRsHGLoW2MDQsetSq
	DkNFaaJP2KOF5+MCldhuy/3zSuZqmpqUo4Zm6qFKGZ8ormVd1xhaQY7F
X-Gm-Gg: AeBDievMZAYFmj30eGYmsP6/atkP1FL0ExRvT/afZATcIQQw/1Kn3WAtsOEfhxHsHIm
	tkc0ln/a9BIO6B92dvJONFTjn1wjiMsOoeg8J1786VRqLjNXYzsK37EMmqrW9LTSaCP1YsaICU9
	XlhvTbD4EOwhKWzBoXQyYg3A5CQoUKiAxJCgXZ8GopudSZizdO+YVS8PkzGGq+tyJTOHgnQy4xp
	0RJOLFLuVPDihN9ErRJhIzvde0PDtZav+NR10aei3hZKjvH1vBnZQvd1HbiuR4LDByQTb+vFPuk
	nJEn9LImQXGfg/zG1E8nTAlbV6YuONvY173xU3fCA+MTmQtGl/ossPUO0RHINwzQVOKQjjfFUN6
	yi74ypI2euRkoqD72YVzHf9Tg62/RLM2UA+PHJh9K8yRicybd2kyJaVe/FodszoTIn0HliMg6tL
	of828ZMn57zx0tvy9x4hEgofJXLB96K3SKxkn4
X-Received: by 2002:a05:690c:d8b:b0:7ba:ded4:df5d with SMTP id 00721157ae682-7bdf5eb937fmr13916837b3.34.1778017588910;
        Tue, 05 May 2026 14:46:28 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:28 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:45 +0300
Subject: [PATCH v4 8/9] media: qcom: venus: add power domain enable logic
 for Venus cores
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-8-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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
 drivers/media/platform/qcom/venus/pm_helpers.c | 80 +++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..c8f7f220c713 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -299,8 +299,22 @@ static int load_scale_v1(struct venus_inst *inst)
 
 static int core_get_v1(struct venus_core *core)
 {
+	struct device *dev = core->dev;
+	const struct venus_resources *res = core->res;
+	const struct dev_pm_domain_attach_data vcodec_data = {
+		.pd_names = res->vcodec_pmdomains,
+		.num_pd_names = res->vcodec_pmdomains_num,
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
 	int ret;
 
+	if (res->vcodec_pmdomains) {
+		ret = dev_pm_domain_attach_list(dev, &vcodec_data,
+						&core->pmdomains);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = core_clks_get(core);
 	if (ret)
 		return ret;
@@ -319,12 +333,70 @@ static void core_put_v1(struct venus_core *core)
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
 
+	return 0;
+}
+
+static int vcodec_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, core->dev, core->vcodec_clks,
+			       core->res->vcodec_clks);
+}
+
+static int vcodec_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 1, ret;
+
+	if (on == POWER_ON) {
+		if (res->vcodec_pmdomains) {
+			for (; i < res->vcodec_pmdomains_num; i++) {
+				pd_dev = core->pmdomains->pd_devs[i];
+				ret = pm_runtime_resume_and_get(pd_dev);
+				if (ret)
+					goto err;
+			}
+		}
+
+		ret = vcodec_clks_enable(core, core->vcodec_clks);
+		if (ret)
+			goto err;
+	} else {
+		if (res->vcodec_pmdomains)
+			for (; i < res->vcodec_pmdomains_num; i++) {
+				pd_dev = core->pmdomains->pd_devs[i];
+				pm_runtime_put_sync(pd_dev);
+			}
+		vcodec_clks_disable(core, core->vcodec_clks);
+	}
+
+	return 0;
+err:
+	while (i-- > 1)
+		pm_runtime_put_sync(core->pmdomains->pd_devs[i]);
 	return ret;
 }
 
@@ -332,6 +404,10 @@ static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
+	.vdec_get = vcodec_get_v1,
+	.vdec_power = vcodec_power_v1,
+	.venc_get = vcodec_get_v1,
+	.venc_power = vcodec_power_v1,
 	.load_scale = load_scale_v1,
 };
 

-- 
2.54.0

