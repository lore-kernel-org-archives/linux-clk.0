Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E6741D64E
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246539; cv=none; b=anAre9oYt3rSKBaqiErPlWUjHM1vKo+CK63mdmNgTrN03m81di1zhT90VWTD47SguCF0e9v5dSvnYfi6f18RTFAR68AnRnz8hJ1EyIFTK146tZKzE69iqpiQnuCGIn+k8zNV6woTZQ07xVFHcNRo/EO5HPFczyS9Wxd9Ak5FwZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246539; c=relaxed/simple;
	bh=+m7WxzhF7QuTKjSt0vk6t6LsZP/6AIR8o4P2rlZl1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIsanjNs1ZcnObrDQaK0VKqgOq1ElD3IQhG+A+zSbtH0yRS0xVmXVYqX+AUJsn04L4xgDVJDzhTPAJhPWNXcIKonZxcoHq37LCeW4ZTVWq8ViNwC930l+RoRa4Mx+tIC/JYXakDO7vXK6gPxtJxWldU/WW42N37ry/a1ToJt6Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVHqhbcm; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVHqhbcm"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9aea40d799so402801a12.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 00:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246533; x=1788851333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=LVHqhbcmWVZdx5M5W+g6FxkD58zvXa67C2Bg0/vszbKkr8MJ7Hh8N30wcMmCxdf3/7
         3H47G1g8536VzCKqEELGEHSSL371jAXg1kaA8zFw83eKFBCiIV88UffFuAXLNTFHG0OR
         YrGY3rxvXFRsBiZHWizifmw5rbEOPV5Htit9xmyzp5sinsMPW+PFwY8aKY0X0ags9HNc
         UGQOQnojq9xPoZYY2dcigE4IPUdu6Wnba9pDSJCI8nHKNeN9OX1TFJ9qgnEtg6887Toa
         GW4BAUQoExSum+50g4N6LiM3W36euAQo1YYiY/XF5CR6eYs5gNRq3CHeogmucIeJp8Q7
         BcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246533; x=1788851333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=AwWzyjbdMvqPn+ubxKWDGezuwgLHe55daeyVQ0laKLND1EnEXBne/XdEZxA2l77ZB0
         YlNIw7lC3mNnadcfqKRjc0zbRZ//V66rDfQ+X5IIyRt+kykPWpCLW7ftTcm53OMGU0BO
         bBVuivKdSer59Qh+z4STFQ/t/VKLrxUaN47jzoJw+ytTvoII+74lq0HH/QEO8Q80T28u
         zFv/YpD7sJxMd75AXdvz/UiNZhxVPjBXszoYeiEu89xU5nD4qFdvjS7NSO0WLUHcQFZ1
         owPvZRXsUJbCxDJopFc8h01zbH6+X/OsL7BB+JKL8Ekt+EnrNctw9Bt+7K4jbZ8g37+z
         QXGg==
X-Forwarded-Encrypted: i=1; AKwUvByXtvR3O2D0dV2BgqO8O/vry/KJLF2PJMpHKf0H4v7oyGedOTsA1kbC0ulbVhiIIMfzWxIG6G0pDUY=@vger.kernel.org
X-Gm-Message-State: AFuF++lF4mRP8NQ8ILuI/m7JMB+R78DB3bSSWvLrmSx9jKTblmnacjpN
	PRwEv731YWk/Mx0al3D/1j5ViL2zh+53mJy3wcIHJ5ebsQCZKoBgZp6t
X-Gm-Gg: AYBFou0egA/uzc+/XdX3QqB3m+7cGLe7KnkxLF604A6VaUCw7AZzFPf6jRt46YH+HC3
	CXDWg4/t9XAF8n3s/shPCs8dvfiSFcD+96W1gat8Hauk/weQ5BEBO7m502sREmI26QqR7rAkMlR
	Apaxs5HZkTyyxUtK1JZyeg/4aK2G33e0hl5tTD7vjih9bp+BM16Xdg6lhWov3E+Db0Udc5GHenR
	WApKT6Z/qrK4AED2cpOh48KdX3jYwW0Bg8EM+5dE8WRYD+m1XdU8ZwaPGPaZYPaAv/kP3QAIhln
	o+KTrDWIhHhzYk+Mpq3jy3pcIgVDUYPOn7/1BNEAnqmwz+7yu3Ybc8YVPceio6WXz7zE2Q3zwq7
	fFIr8d7ebILN6JBPJTeaI06ndRHop19cbyREVnCzr8jc/e8ZYakOZua9CREdDdhAvaYODyqLn+b
	YgcnfID6tPvX4UMkU1/r+XgNvraGtkzSMSq8tqJ1mkhbL5MT+BfwMmqEvIOCU++52h10l/kJ4LE
	YLDZfiNR+ix
X-Received: by 2002:a17:90b:588f:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-398bf7eb378mr26750541a91.2.1788246532645;
        Tue, 01 Sep 2026 00:08:52 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:51 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v8 08/12] pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
Date: Tue,  1 Sep 2026 07:07:13 +0000
Message-ID: <20260901070717.20513-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
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

