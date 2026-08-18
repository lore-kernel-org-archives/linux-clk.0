Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13141D116
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 08:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040576; cv=none; b=avVSwZjfCwz8z5HKIE49wmfrW+O0YyEB59P3ZyEOqeOgaq0ZOrU475jFaMalwDToR7xKQBM3PDuv8oCwTpJiGxUKVZ7sSKUloFzzWUhRKKEaA7PZFT0hBMWUGlikpLpmWV87NmiPg5iI7HjnMiIB1H1ZguNmwVl8/Lc73tRiZ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040576; c=relaxed/simple;
	bh=hrc0R6KlKcRZuarL4/2xinfYS5AgbkPGLDVTEkPPZ74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPo4C82VMOdVmA330nuX/iwOrhOirmS5t1OZBSEajX7t2ak/Nk+xhpMpvgX/JfRsYtJO/P4C1rd1k90zjcznj5w626B87Sr6HJ5YX8rU5jhEP9/W4mocPUZ8axLulJtXgntrUt/BooTTNRQPxueWc5HVQ5HF/wjrpvPUEWw+teE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kq47DFGP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kq47DFGP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d560775ca2so21543975ad.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 01:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040574; x=1787645374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nFL4XLJFCNL3jRTkLbh6D9yBXB9KUubku8W2Rf3apf0=;
        b=kq47DFGPvRJcz75Mi8zmusYZvrGwBi+gNHXdUCS7+A5Oo0m5Hpot7zqZiA4rw1q7Ka
         NfIQNdy1X9ekRSEc9pYsr0i2qJPAQEtEKEBXn4JVTeoAWZPWE2NJOji/N1SIvw3XZVdf
         qqyR3yithe8Otr0fBgJMCE9gnQNaNtG2zoN827L4CAgOViVFYUTEQpKBGzUgxNi4t8x9
         bNE6T6TCCj4K888ZR+lz4Ahcz85RmndunXg3ZGedGdM/Pi4gan7TX9SpEF9QPRS1D3sd
         ys2dhqh9zjLi6PcU3UorArwmlxPKE3vhMyokQlQDtjio019tL+5nvdFQnfwBZKxAw1ES
         UBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040574; x=1787645374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nFL4XLJFCNL3jRTkLbh6D9yBXB9KUubku8W2Rf3apf0=;
        b=faZ4LNuXpnh6Wx+4PdWly1RXeSKhWrNSbqlj6AzGX0gug067WEjNTIAJGGJlWScl9T
         cGOSTtRyWhuC8WcwS7tCKUilKEHBm722NIZ1Wcg6bLUhl+bncrVg1Nt04xOyVrb3BRmI
         GIX0x4XN30wY2FZ/duOIpSPIjmvXbBQTnprxi0PwcgDc+fbGwLvjznwWs9S0xelL0GIG
         1sTW5xbV5T6J674AdMCDnxf/O9mjYrPNd6dfNKFxJWrhxV5vrq5eJn8z+Gfan1apBNbQ
         47v1zWsfU3vyvAd76RQGHpBIVf6ujnzuiADzNdDTySnDTGNAt+3Mjdfsi/gqFBs7D57Y
         1x9A==
X-Forwarded-Encrypted: i=1; AHgh+RoFiob5CCgeYgUxzClSEzSF5xkeN29/bLi5f4ogpwL9wX1P5vT81ZyNuNvHMWR/C/Nnwwvt7DnGHk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLMUiWJ1HSgDmtWaIhKkIG1ZGXVLNHfrU9YgScWtXJg/XrP/E
	QhIQ5/nU7P8/LvX/oLyng3M3DkCqlXgBwWCEHJzVz8F5lY4VcutX6Rqn
X-Gm-Gg: AR+sD13rC3y6EK71VBkaI9b/+r9OQyJQobAhikpxDYP7hvtVofr9vEaKpmhAlYtWYWt
	59WgktwvlbutNmmSG0KlUczX/GlcLSTb9Tdvl4UDqaA5AjR+VlKhIy9SPCMb75L4sN5IPqVKHSV
	HHJoEsIqAz+YJAC7YsgtYDMNHwcFmcqFsZJ02tyowcJLoczXhHlarRSbGZzlq4QNUSDDxPddGj+
	8CzNx4UUKRrAfMh64wXJJmUsNxffjOBphaByr76aWyu8TxhEfzfpy9aLr3OwHdXGofjsYbcuDTR
	X/SXaPXFEiYZtayMIzlh/GYz6mI1nMY/EVUeVX7MP7LTBx7fOyPKyjGu13QdHmBwyJ97AS6ik+d
	VegXMtj0lfprDQBKELEu7UuxS0Nn4Tz35bVayp0qC+68ZG8sARevqitkp3uJQbT5tP5qbYlpKS5
	IZSSBTtfFYpprTvGQc/feZQzfbt7ptDDUHllBE6OoFlgfC715H6FSvFUWoiakEj0+3yDWffgcNU
	W6xLDIe0Wo=
X-Received: by 2002:a17:90b:4cc1:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-3933bd0dd0fmr38889309a91.2.1787040574404;
        Tue, 18 Aug 2026 01:09:34 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:33 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 08/12] pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
Date: Tue, 18 Aug 2026 08:07:50 +0000
Message-ID: <20260818080754.4362-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RMPh power domains for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

