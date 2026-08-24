Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6126A36EAB8
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583831; cv=none; b=eKOWL/TLc/xN0RA80Nm9so6OqnTDyRV99+JfSxNZ//Vrex1DYFPFM3ulbpwIG6ETmEyMZvYj4OtMiKYCLAwTyAIvkG9RZiflAekN1pk2QeYjy545YEBoXJC0c+XXU2jslkkX1cRhC18JTjLOo+s4ZkyFZKLUg1BPjkDHyAaGYFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583831; c=relaxed/simple;
	bh=+m7WxzhF7QuTKjSt0vk6t6LsZP/6AIR8o4P2rlZl1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJswIzEZ224/QbQpt/VwvGlhWkSoz4K8gFVxsQhl61tGkxoiW/F801Uje2cDauEv2se3ok750UemZtog4yix5R8UhAAQxcFL7nT78hgT2Updu7H1m7VQwfcss1JgrwTN/hpkfiSHqJcGtoTotHD5zThrVTZ13ra9dvQvGKRGAbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkrhQHDo; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkrhQHDo"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7ec58fa3e01so2563238a34.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583829; x=1788188629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=VkrhQHDoc9z7G6sv5pr0hTTsb1AeiZUryAkvZl0Ykr0nyawl+9oVrSc1rRZYgKSRLP
         xJbP2yVPAhuzZVuFbVCMGrohJRCPR+sKY2+bqk0iII/C/iXGjvn1nmeyWq1TjrDk2BKG
         H496BFApo4zPo78nv1a4l8H5TlO+UWdHXYUhatsQo9fOctSZE7834OkMqeasDYJKqyi4
         xFrApOYkri9skrFy1vZMQidzXfPr2i0HuJHOB612J0hgktCavPW7LFtZqGG7QMay6K0L
         DoHe4LN7mYyWfQBdeJFHqqlJLihUp01SMZnEBzWGdwMAS6JnqEAMbyHs14NW1QIhWDGT
         sUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583829; x=1788188629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=ElRdXRUgLp0glMUMi0NKFyYC3beXw9DVBp9Ns/vnUzBCONK+FrjncZfhqjtIJSTH9w
         ubFm5OIDSN4AGAlfR+riwn78UZsjPfycweJboMN7c09C/+9luELHyFKKukmr4C3ThYoJ
         H9JlOrRMEyFwt+Pj7lqRZJFJ8WmvYk7wyYudItdIyKZNNxH+j/5FG2BGgBK/CykCx2y8
         4mAcLkyfT/VALMMx2q+zRGp+McgZf5g/nXqT1P9tHTbbkaeurI1sJdmlPsv8VRK8zbIH
         FnnlRUGetQFRDQhevZXVaKQyCDqzbAE3ajncKJWnrE+M3lPvnuSqKTnvhRt9zHF5JR/E
         grfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNeQisMM8WCyplYBD53FXOblTTft6EkVveoIkwwYaSis0St7hvykAtFdTW64tHs8zUCyhJc+WNzBk=@vger.kernel.org
X-Gm-Message-State: AFuF++kdvyL+33Gn3fkVSF9fsup3Y+zYtA2N24V4ctQg9n34SZbCDjTl
	pmwo+5x42dGv8iAZd7oltsB3ohWYsNqhTm4dOEny1g6w5bAH2ys2wwhu
X-Gm-Gg: AR+sD12fRxrFPxKt0eYFglpe1FPTkNKdz7ffVF3mFU7tvtAvfxGIweH5AYcPtWugoML
	QIik8XnO1TRguDSWM+d8QODYA6OrbQXzIhiEIk0z1za7Z1OnkB9k0bO7mZcD7/Ogka06ZjDOKhP
	TMWyl823IqlCT2T4s9G+9jzKTFYNH/t17354o/iCWPMtpNvGPz7XsxEZpfUtkI5u0k+XifDMvhm
	R3O1Nv3jGAvLgNpIm2jeER2k634kGp8OzQ4V5efk8FbQCko024J9G56Wn+b51O3Zq4FKbDtjsiH
	ghclc/Uuf6ul2skvgH/XLbRzhn8hVPdbn5ESezOGOhuYMm0DnJa176oTUQPpoyQRcdtZhvnssvi
	aMb/DNyQyXr9p9dOc5vlcT/v0AW3oRH/sOjMqpf5EX8f598JAeF0FBMDkg4uHRLp4u8lwUrymmS
	t15TFdW3dcu6PsNzdYrToOmd7i6yk//qbT4+Eq8JL3pe+VQc4Y3anDfTNc2YuUMlxYahfqZccO4
	g1XbhJXUkZtfWTaB6yCHLc=
X-Received: by 2002:a05:6820:1513:b0:6b1:4cfe:ea6 with SMTP id 006d021491bc7-6b1593eb71dmr26836615eaf.32.1787583829120;
        Mon, 24 Aug 2026 08:03:49 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:03:47 -0700 (PDT)
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
Subject: [PATCH v6 08/13] pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
Date: Mon, 24 Aug 2026 15:01:51 +0000
Message-ID: <20260824150156.1310-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RPMh power domains for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

