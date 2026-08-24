Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D921F41F5E6
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576787; cv=none; b=X1jgA00wo3C/qSU064tUxy7k76ad/VKoIrwGTDzezI9b29QwkNA1zJsvs7C0y8eMUdQhoEUbIV4uCOa1NAKsKe56viNmkkiyhR5HxN2+1yOmt034oRiY1+4u22Gt+Bf/GDWMy4KUoFqt2YO3cZuy+hZUZs180RDiN1aoW9my3Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576787; c=relaxed/simple;
	bh=9Rs+ll41NKEFlOm3FoL6ceFLLpdJXgRekcTbFNLh3NY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAn8MfaG+WmPRkqpUpA6hewbYz0hTbXBvZkqbmKsyNqs3qlhZw8I/o4yqj1/SYVdwnShIeKun6P9LfId5z0UEXn7i3SHQWp/AHOmKNY7RLmdbANf1e4oK24ebN8r6U71pbIWQTf00a9UELClU6VNh7qvnjZ1C2kUFIWefD2yI24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qum1La/7; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qum1La/7"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc891373e0so37895665ad.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576785; x=1788181585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=leXltbiOaTHy4a8AzjEvY38i+F2Jzsbl2HWjNkp0y+k=;
        b=qum1La/7h9/4tapE+kuH/r/Yo0F1th/ZMtHB6IzU7oEXgLm+xDhlmHShgbzIm+hjV0
         SBCSEhtR7mvxnJMCtDq6d+QVbnmoIKUyCbiu/NZC26DvBZThkqM5KEUaRQ3RFo74PG3H
         7jUJxtxYdbTjqc+GyKI6ve9bZd68/OYLm3QwSnlW1WO6tVFUko4i7PNG+kjcqUW5EVYJ
         Y9/Ck/rZqxwPc4vybvAGG5UCMUahIh05QDbTwFjwgL6Idlf769q66eKg/ZsUjhnkca/8
         tFGDnZ26H/MxzoaigCUAj/VxtPEQbnPzFh0DW0mf8XesmMbPp44x2Rxb3QFyC/52wLZP
         cU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576785; x=1788181585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=leXltbiOaTHy4a8AzjEvY38i+F2Jzsbl2HWjNkp0y+k=;
        b=e7fsFpU6Ldd4vSWz5YRXF1VyEL7Qygp9//W4t9MXd0iEdMfo+Llq/ipj0KIZ4w3tH1
         Ga0oQ46Ss3beFBZY2Whz8LV9Oyywyqt/nqKdZSKLQUd3gJdqg69DarbLtv11ulZ+Nzx0
         MVwX16Htf4BDy/BnywjjW5wp4WIkKTE3+VSleoBjisO5yz/fR0h2NlQUC0N9j5OC/qmn
         3yBIt/hXPSgtnq1NKO022aXuKbnCQnRZAAvliCHzQlkd1BoQA2ryEBfyh2VSXynG8VAa
         9z/CpE6c7oMkooETo3ZEw+COq0IVCpphgRLRjP/5zu/J70nmsyWsdXzCTmBRwzQ1Qjuc
         6beA==
X-Forwarded-Encrypted: i=1; AHgh+Rpyk/TYOqNdwXu1XLQyDMDx/tkjT0rhWPoWR1pe2RbnVGZ6qc2VawlwQpNifpsT2VEWGQsAMFrwV6U=@vger.kernel.org
X-Gm-Message-State: AFuF++noEni3x+PdUUm7vpm60xfzHqDtBEyIR5yJS0CiwucYUxWbSTtb
	rq7rx55qZhnTbPn7V9notjYBGe7Y4EWNg0eZwN2ZetKIblYF2HiRNRNm
X-Gm-Gg: AR+sD129XiN0qY8iPCO+yJG1sEoGhAqGAgVy1e2nYtWFRrLVY9BMsvTKMd3aOkBKjJP
	DzHKlMeHJmjR3MZ/rJZ9zrzgWhpnWsgebD+8bKxKd3I9KdbXVUB0uSurVhH7AAvMYxoP6+f6tTn
	oe163NmwI/SrTA11mqUZG5QsfBhUCZ/doA6YiA98NS/S7FpEziMcbgPDKX5Yg31eLI8TbyxUn9j
	8obZa0iQHe3PB1qhjdHcIHJSUjiUYIbWdU6h5s50fI24W9z0oYeX3HBto/KKoS8ivfueXZUoLRb
	xzy5zo8lmoc3lvdFIfrLT9D5aDAObyS1fdaRXROD/nQg2X7Jl8uH5oMUjJemR69qi9o29bos7uQ
	iGf+giQg2z4wCHuVK1jWRxxtSnhxj0prMmGKr3gxHp2dJOxjFD6v6Bsdkxs9gtQDgMlBfsKU3Ig
	3dFbYTP+obQcIqndqvTbkyfk299Tn3mNOJkvu0w+/LhJFIgic5K7Pv3Sl88vIwfd2Z5Irt8qvSb
	BHZuOn9ZYG8
X-Received: by 2002:a17:903:2ec8:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d670b9ba58mr347409935ad.5.1787576785252;
        Mon, 24 Aug 2026 06:06:25 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:24 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 08/13] pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
Date: Mon, 24 Aug 2026 13:04:32 +0000
Message-ID: <20260824130437.2771-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RPMh power domains for SM7250 SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5..70d0ff5cc 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -490,6 +490,24 @@ static const struct rpmhpd_desc sm7150_desc = {
 	.num_pds = ARRAY_SIZE(sm7150_rpmhpds),
 };
 
+/* SM7250 RPMH powerdomains */
+static struct rpmhpd *sm7250_rpmhpds[] = {
+	[RPMHPD_CX] = &cx_w_mx_parent,
+	[RPMHPD_CX_AO] = &cx_ao_w_mx_parent,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+};
+
+static const struct rpmhpd_desc sm7250_desc = {
+	.rpmhpds = sm7250_rpmhpds,
+	.num_pds = ARRAY_SIZE(sm7250_rpmhpds),
+};
+
 /* SM8150 RPMH powerdomains */
 static struct rpmhpd *sm8150_rpmhpds[] = {
 	[SM8150_CX] = &cx_w_mx_parent,
@@ -910,6 +928,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sm4450-rpmhpd", .data = &sm4450_desc },
 	{ .compatible = "qcom,sm6350-rpmhpd", .data = &sm6350_desc },
 	{ .compatible = "qcom,sm7150-rpmhpd", .data = &sm7150_desc },
+	{ .compatible = "qcom,sm7250-rpmhpd", .data = &sm7250_desc },
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ .compatible = "qcom,sm8350-rpmhpd", .data = &sm8350_desc },
-- 
2.43.0

