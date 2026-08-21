Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9999842CAE0
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299999; cv=none; b=p/wDOR3+OyDUj5/s4B/mxigRjOYlC5xQg54UKVPrKmcMJYq5l39sLFdmXME2xGRYE6dZ+Wd7jAcipw6TuopRoji5RhXPozVVPkyzhLiXdyLEOOSwD4PKflPmXd3nXPFkRLjfPb9Q1peo8YFLoa6oqfdq5eKWXcwYyTYjVw8vT0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299999; c=relaxed/simple;
	bh=tl8CA4rO92JFIY1onO2td0Y/lwEd1GFGGF+FJg0LZQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8X4AmcJtHgC+7FtsnoRNthNvgbiWgePXZZjGaafKC2ZSgwLC5NFkGE8t3eb5JioipyMSyQpxQKqgyUfaoea+M02Ffs70yaQoXFr5Jb+yFxaFQwrFeiANiRnDEUsgmvlelBrn/OetkmWc/CQg7+vk4A22kFhoUXF/d+2w3mdeok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONySzn9Q; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONySzn9Q"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38759bcd877so787396a91.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299998; x=1787904798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WL9wBLDLyR3Kmyj4eYH49sAL8oSps6Ww6VMxUCrieY=;
        b=ONySzn9Qoe/stJqsxPqed9cO5RnTwV19LT5SkLY1nBoX6n0xowFriYJDonjeuNkaZT
         nsSzPFxzYojg24SytFVcQainBFZoueX3KirlQ+lNKxFDYju1oxDa2GpFrZ2GULj9HbTh
         huGEXMInU1yAWELXesZWdw8LJUhC0ckDW+un7YBqWx8fj+Gg2v3GDs1WDM/rmTaWpPGK
         CLmqhnjVw4yrCK5XbY8OUWr/DaLHi2cAeMOshooiakEo87LexvSq0j7Oa2PR3E5wVG5O
         99Hg2JwnD6S26Y76GaXq70Lxui0WwxOZ1raaJLIN/cIJ0q11xtBZP9tlfUYnx787bTd2
         1uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299998; x=1787904798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WL9wBLDLyR3Kmyj4eYH49sAL8oSps6Ww6VMxUCrieY=;
        b=HpFxpSB5/XZ3Ld8BudEHJ1dumECKyhf185MDs84nV5TH2U3g6HupLWe7Q8038Xt2sy
         HUHEoNuFeWizgl/Fmzndw5A0O5MxfGRFtWRvCGYZY+0abVrjBkvD2YKbPZVCNQ9Ef767
         qGS4gRJ90VSRLtbAqB2A6SIeyMyj+BzlUEysDrsjB/AEjhr2fbBKwA1ZVc321gI1Vnfy
         Pg1qbQ9jYae+4aOmEQcaD1q3xXcIQaE1LP14UGL6Y56XLb+1l4JU+DSOaMDFz76B2lyx
         Ne52Ow9BzXGZpMCTC9F4RzMhxGLWJIx4Evb08ijD/bpGVCaFbas+168FIpUQ0tF1Ib75
         7x7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqil+oN+tjwNJ9cxhcriZls51RW59peGNiWL3KjSv0LiBF9CqynTBqOBoBQmO/jjN64FJJbvgifnog=@vger.kernel.org
X-Gm-Message-State: AFuF++m55AlwEAFjWszh9P81gNNxwOpSboa/+N2Iryi7kSWgBUCtdWbr
	9tGBI3lTlzHLedGyNl8mo6iDhs1tf4oKBJICq5JRcCNDwoSGDohWQK8a
X-Gm-Gg: AR+sD10z8QyWDfotnnYuiR+7rjk7f9XYcSFql0m49mFZyi78qcjjz+nAN+HsOu76DkR
	vs9nQFgbNo+e9U3ac5uSUtJ22Z9EsAA1PoHn16+BeofhDg+pGn3jcLU9YpkdgIAT7eFyXQuuPIU
	IhHF2BXnxC5vQMEr5Auv+5W4jMvvIMKKEdihToEPnlxbchllBgWQzi3p6/UmdWkPilPZS9/4zfN
	swDeZ3FXfrmHl3hXREoRowruRCZNMXP9rdhU4QD2erZzgZmYievEXPKydrMMEfQXTo/rM0UxV1a
	HYV9MvpNzyi2V1di4PQWv+nWUhJ1aQzNwDzf49uwUjabdZLC2VL0lkrpLxcsC7hOIxZsY/MjGmW
	O60QqbBvBxDTdo64w4RzWeBeXm5+mrBqAyoJF24hUsyDFQ6BmwAOvOzPDBkI/dWmuhFxiwqv0Ut
	h7Z2HTGv2qHV9IukE+BgL+iHfGheO1+aX+wjlBemy/SfIhMxAwZhfQmPTvGlFNTbHTImdZmYufr
	3/yXC2RyeRI
X-Received: by 2002:a17:90b:384d:b0:393:19a3:4e5 with SMTP id 98e67ed59e1d1-395c386a056mr7511738a91.16.1787299998040;
        Fri, 21 Aug 2026 01:13:18 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:17 -0700 (PDT)
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
Subject: [PATCH v3 08/13] pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
Date: Fri, 21 Aug 2026 08:11:20 +0000
Message-ID: <20260821081125.4522-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
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

