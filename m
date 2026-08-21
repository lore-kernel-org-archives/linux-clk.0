Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ECB36D51F
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326938; cv=none; b=M+HdlEBchxaqKg7J1Xu3LotwD/69YtkZXpUQqnxQ2pbJcVQJ5WVph7nEsSQCCydWzv98bmdidEg0ybimxxbKghOqwDDp/k/MOqKwjntsIYhwlSBoytSqMdCastQw6ZU1OcP4B0EwBIKL0lvUCjy+aUqhxybsmSNgQDFlhUBqNbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326938; c=relaxed/simple;
	bh=tl8CA4rO92JFIY1onO2td0Y/lwEd1GFGGF+FJg0LZQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d182d2F34jgGsyAQLlxyk2/Ve5QED+1dUT9eiYbjdHQfWqaX13MZK6lSOSPBXM28bxMaptiWHj0asWgFXkbRGOrRmwhkneWtFuuexyTwgEF7/PV55zehPZbbDjMABAmTgtQRzkszoNFI8YajDGA9HNRhPNQMG5v+EsZ3SCE4t/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUdno89Z; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUdno89Z"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1082214a91.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326936; x=1787931736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WL9wBLDLyR3Kmyj4eYH49sAL8oSps6Ww6VMxUCrieY=;
        b=ZUdno89Z0Mx1jozhvrp+opkWT3J+9EVlf9iTlU6thcG29Od+LiLH0Wvy+Df5YcLEu8
         odElmPglDW2SdbIVcpyCifTBd7swLKsl/PohjRr3VGZ/57nXSHXjsBx2UDFbp8Mgjoxa
         ouxPdtnf5AeU1TNlr87LUiQHWJ31k2XrRFR5z1MQCVyxdmK36W0obEGdn/F2rblRkd8W
         Rjd75t6M2R9E0n9U/sCg5qzeapDnKLBBVY8RDxHTNdr6Sh+tsLz1NWpL8huIG7rNgLNZ
         3xUjxjBAf31uFC+WSceJgohYXSG8eJyiWj0Hfhp0haus0bGiOWivRSRT2gkKFof8hikm
         7fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326936; x=1787931736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WL9wBLDLyR3Kmyj4eYH49sAL8oSps6Ww6VMxUCrieY=;
        b=CQ9WRba2ugEYOeL5v0977Cx3lQxEAq2PG514LftNrzXnUFGpukxH4essRFtXg33e0I
         MPH/e0T3OGBlsQhPXgmu8IuoPIE4PIZncJF5XyBaNm+Xt/SPf8jDpdKBUvxmNO7TCGNT
         xFhL41v4NDzAN9WJN1PhBB7DENbOqbiGIDsg1OCImxaNUbwzLaI4klkNJbD3LvhQREJj
         TQN0+Sv1zdMkUM5pXqkcLWSyPRGbbDmezxeidIJyPSmNEewiBkyaX5Lzqn80Apd8hAwB
         +EwTap6TplfqOZHAKlUXGLL0rCBsCEHh/U4rSajBfOFDJQEvhfDMF47nJrKmiupa2GfD
         UnNw==
X-Forwarded-Encrypted: i=1; AHgh+RppDMR0AeBlb40lZ7F/m2F78WRABFKmXZSLBG6OeZnjn2FXTUIpIjojE/PUjI/ph0Jcj+r80BFC2Tc=@vger.kernel.org
X-Gm-Message-State: AFuF++nRkfEb3pg5ijhVXtdcEDK28/jGdsDHGq5ttAhNNs160ucoP+ZE
	nWilrdPcoKApGgyQFw91DcIkkGHMA+mxjZjhtRVTMLYpCj/jlcwH3uus
X-Gm-Gg: AR+sD1187GllsHvGlXyvnatWjWRW3h/jhkHgJiqqnb6VjlnyZVeoveupgcWgCF2tc+7
	nm8h99KDU3a89CxGAAQJNkGyDYTsz7GjmQ1rDlzl2lJD3jOdS9094cim8IC6AGUw1cyA9Lh51V2
	RdPGVKBa857cH2661C/ugAuD8yDq+s5OBkVCUzX8fS6Cbsoqfba3Pfy6JLlmCVyxRDx+HcBSMZd
	D6yxvAg5mlHx/on1mAQD5nvvupYHMfE3XDsmOI0WxBSziqpStXBoX8iyyOuBDxdHJCRijLBg2xm
	rK3YT/oyS0jrwO35QrQtf0r2/yS4Bz+pVaehY8FHpKHlK3rx421O7vWZ0FkGe1vlvnD1SsXyKuy
	cAeu5AazixQ7Dg+l6pWKVNfsG9/YrxxyXA0ZABO0X/GsssQYGCtOpp75LcBptFJIlMIj3slUXVt
	gcVp6WHsL5U0Pvjb6pVoLJSSvwI4tAvasEfMifk3UFpdB3k5hnG+27m7yymST2u7r3UKj2jhjrD
	pinI8q/RHSc
X-Received: by 2002:a17:90b:5347:b0:395:a7eb:a4d8 with SMTP id 98e67ed59e1d1-395c3a4bd22mr14090197a91.14.1787326934261;
        Fri, 21 Aug 2026 08:42:14 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:13 -0700 (PDT)
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
Subject: [PATCH v4 08/13] pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
Date: Fri, 21 Aug 2026 15:40:25 +0000
Message-ID: <20260821154030.2514-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
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

