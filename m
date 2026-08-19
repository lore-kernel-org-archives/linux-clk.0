Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93649480960
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153257; cv=none; b=HTCnRK3dox2Q+MiDCISpRTfLziFbMHbUJqNf+aeZGrSSbAex+VolMVLZOvIm65+S7Cf+m+/7N3XLijL6WIrWXwlk5go21C+5RWc5ooYtHhy4awhzNQ1EC7t/X2KKKslr2hxbGrIayrxe3mtFSYhjRCsJ1oHdt8KCPMkOdPoFsDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153257; c=relaxed/simple;
	bh=bObMEgQbwlymBnP5r1sUX2Gi8xAR5lTxrs70cVwI4ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBUR/6OXKLgla+375Li4t0sefKCUsF4JrjGhdAddBYqLpgbtcLE1Febo80O63fYkHRAucXpLsusHrgiPp30DjQfhWz8uMov0y0HR5wo7tzFloNmF7qpqghP3jK5Z9DPrD3p7fq+JENgVuW/qHhk7UmfVetShO8hipctgHTuZvsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ao7OX9xu; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ao7OX9xu"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3900e39d935so1262017a91.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153255; x=1787758055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vegrD4saB72brBgKM+q7YCK2Xn3FRCR7Y0DoP1meQyA=;
        b=ao7OX9xuA0alWXELa2DGCMDg1WlllKbYAiOe9bHjgMBV5/45OzDKhj2hTAXnN+b3de
         Tp2pTnDa4O8gsp8MkZE3OFDFmplYSA6heYBB+tcKijuKbYC5yAT/AfpJBS0JRDKe3n9s
         70pdEAyWYm50SDq/XfsEHxc0LGssDwUUrsnlpIvDPe4HAc2zxOerM2micufCxjwooTwq
         mEKPcS9pxR7TpkvpcuHiKnWktQNTPhehGONXMkoQta2l2KKsL+auzo6XJ8oOsQHoHvU1
         svM2F5UpX51Ku73lipe4LsXjCro+adOiUNfPF9OJFIJqZUN/mw97x+Xz2F73+lv4cOMp
         DmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153255; x=1787758055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vegrD4saB72brBgKM+q7YCK2Xn3FRCR7Y0DoP1meQyA=;
        b=Y+17/jBBZgLEGftj3L6hhsErwMHBKSZCUbN96W2Pnd2/zoZFkWuCywiJQiCL9dlanP
         YASNCA4j+1Lj2q5D6YOTRSKUkR3tX2HnPf1eAxaDyyBFBHc19DPd1bCkb83ktp+d+a5Q
         +ktagLo4vaKR2PhT8k1DtilNaeIFI72K6ZaPUTFAG4iAzkfT3xylYYERtwgycWV5ofqB
         0Pw7JYc3Yducb/bYvESAKfuoSlw7a6cFpEB0E0y6UhQtVca1yqsNBYucwGIV8K87gLkd
         V9hwpwfpj34/UP+iVQeimDsihVObewA9e+1Rn8SbLVn6/t44NhCTStHcrplBhggLBhLL
         9cVA==
X-Forwarded-Encrypted: i=1; AHgh+RrpFxeXpj8b3UkZfJ0Hj6Sk/JQK39uJF82M7EAhkisNS9sQzfX5oSbpJA9sDviWj/cKX9I29dYmnLI=@vger.kernel.org
X-Gm-Message-State: AFuF++kn1DupG3Mbrfg7jzGmI7PWOC/BsCMtYgzyXR/YoMgVFa43257O
	t+PikwMqSQKDnTmEnaPoC50VYyib4FIR0pAkko1zxVpB18yhbZPIqkcI
X-Gm-Gg: AR+sD12VNf3G/cFPP1wjGG6n/dGvClYC3OnelTkv6SKr+kds5jmPcjBfxJ41v7CFbDB
	cXIX6V95YuEJMEsuw+y8zUxVtY2XQnjrnqzf5rBB6ibBlnVAWumaSOQqi3Rs9/INrVeJBIS5K/b
	U2Mejd21/lb++bRGImGYyCjBk7ZiPu2bTvjM9iR317d8eDvI/QivQQw2Q4Zti0j8lnG6drZZDGn
	KyOoWBuM7c3Hc3III4cPAjyso0tbhFyd4ru1Xfg7ft62UNi0A1wO6Y8pthb1rMmlZ7FNq8QFrzP
	cBhqAqZTGtiawyZoPS4Alers51YBHIJpLcjLB+Ukr1QiXarAqXrmAZAZKNbUVOKUCMcCdW0sUDW
	kun5wmXOiRK2jKuSZYhGl4bJGnTEYbgqQeCOUeisYcHZotQMjNHGoBTiaRLAIC7AkKNMNRBvIdn
	tYaL/XAc4SrEiAKsmUAGlvMiPZWBPeQwdUdK/Dkjq0xYf4j4l0rJd25LTkGmdP/ZeCXXvpLWdyq
	jG3SKwKbTM=
X-Received: by 2002:a17:90b:2d8d:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-39581252d0fmr10279183a91.13.1787153254754;
        Wed, 19 Aug 2026 08:27:34 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:27:34 -0700 (PDT)
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
	quic_tdas@quicinc.com,
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 08/13] pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
Date: Wed, 19 Aug 2026 15:25:37 +0000
Message-ID: <20260819152545.3934-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RMPh power domains for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index ffc46de8d..6f4bd6b53 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -494,6 +494,24 @@ static const struct rpmhpd_desc sm7150_desc = {
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
@@ -914,6 +932,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sm4450-rpmhpd", .data = &sm4450_desc },
 	{ .compatible = "qcom,sm6350-rpmhpd", .data = &sm6350_desc },
 	{ .compatible = "qcom,sm7150-rpmhpd", .data = &sm7150_desc },
+	{ .compatible = "qcom,sm7250-rpmhpd", .data = &sm7250_desc },
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ .compatible = "qcom,sm8350-rpmhpd", .data = &sm8350_desc },
-- 
2.43.0

