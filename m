Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A105514A619
	for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886234; cv=none; b=uNypixHZqZzHM80XXrMNdXOTKVAGOalx+5jmMdAJNk3e27Ygvfd4n45u2H04ZCfya7NKeieW9x/eVQA6xRXfZNWFFiMVt1OcAd8NQsdRVBX9crLxp2i03BiEav7lrwlcZBSBN39Sf7C+Zznu9jUcib+cGPK3lBaYroRBegQCWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886234; c=relaxed/simple;
	bh=99pJRjLsjgQp97RPaeWEZ1YZegnfkzqsNfQJNAJNwP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExRNtRp9h91v+ZaQ/f3V4PCejFMFi0EDRR90CEvpBwwbpMNv4gSerm5jH3HRrP+DOpeuYh8fjLB2uE4b9We12wpDXyTNhabn+CuBxyUpTHo+ilKxHeuN65IFndmGxLR1BUGqz768emVR3SlFtmp4a2hbgUOCHEHmwQK746aRJPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYuRae4V; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYuRae4V"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3900e39d935so2348687a91.0
        for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 06:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786886233; x=1787491033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXCkXj9IgKaAKQ31oXzwXtt5dbLLTdIsAYd130AoDV0=;
        b=KYuRae4V1hS2NQ3vslM+2DLILO2YsIPFIbL2zuD024L9znztmMabFC10WnbLvVGXb0
         oIbUPi8cqNjq+J1Q3Z5kyFklouipYBErhCDexHZqrLSBFD+NjWq2hKStVZDg+OPdW+mg
         SPKTIwvm4c1dxehRez6RiGZ4qkDQiM7nTyxlbDTb9T3P8qyv6Ip8iVUYq2VL/WcWDQ33
         03ACjxX2giU3d6ty0066Sf+yBs/1sFGhKI0tWmM2yim1YPQRvu8mdMQomqsEL2Ao1B+9
         jxaeCtLZQupkF41W/pmTxnRB4kQJtAXsySiS3MxHfNO5A6eik5Bz37K1L8fE2eWWtTKU
         Ewog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786886233; x=1787491033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXCkXj9IgKaAKQ31oXzwXtt5dbLLTdIsAYd130AoDV0=;
        b=fC+wa8s3OvUEDB/l+ciY2NCJ+o3qXyEOg1BArjwTKey1HgoTpvu0wHweESLCEGTTFC
         D27G0UKgSF99KMsVwvvlVyr8EMDu1i4loeGnAIGJODWD1ySYJ9yof/LDW7/Cy4mcFfiy
         KLXb/jjBZHsCPTU9VCu9EnzIeA+rfEvZLzHHhuTq2f6sKqpnId0yMTGXD+8YVPO0w/Qd
         4cb6pVP1mIPp0r85aHyopStmsW7pLGldFvIx+98Qydo50Ps1zvOmrxIGEWO8JPyOFxyS
         QZsaZ353wGjN4Of9ZKG1tFmykZaA2eqbfFujbbPzbiMMAdkZL09ZQHrwJRvO5Yq9zJoD
         7yyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZF7NkERJOvuj+0BVjad05TW/iNpVxFuA0/dqF1ryOsYIYDAS27DUFV6KfotAUifkCRr067rQw4mM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM9mrY2+wDd8ExgGD5OF3m+AcC55MPzPxL+71+5e21bmU2b3qy
	NL4QwAmeO9LbgSW+VoZxgUfQJ8es2BP+lfH89X4VtQ6DdPww3JPpKDZm
X-Gm-Gg: AR+sD11SINvN5reVY6kVSUJ8f0+4QbCiHXnSYOew9pmV5n6uFIQ1YCEUqWElrX/Btby
	Q+dHlTV3CcSMk7zc97TystD9tXigXjtpxQvwamYGrhRYf29le+wPpOq84aNM18vfmqMTLvoZtSM
	86Xmf6fhSp55ziVXJ5aIstyoaPZukBL+l9AdWdVMAN8WZqpAgDP2YEe7GEPtCSDVnKAbmsmZrQh
	2UfZxjXF80rrUTL08snToRQe8QLQ8wjMtpjT9IURQQZLGG+ZkvO2IhCmy1BQET93tTiUooIV7QJ
	b8sXOStCwRR1MUHpovdCo6s79cWXhLY1TdqxJODMQcqnotYgRiSgQBTh1Q6VfmH5GjseoD2EuH8
	GQ7boLLVsOFqElzyl05NtKd8l6e0watYq9DDpHrs0My199eqWQi7IsIOuvnEVWU1wqlimxY8cSe
	5Zz9SOWHbZhRTZSr8ImriNlEJOZp6gdOQ28vxbErXOPlkap1+DbjF4C3HQlffDUpG65tQhWr248
	R4vvX3oXGxG
X-Received: by 2002:a17:90b:4f84:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-3933bd186f4mr19782001a91.4.1786886232899;
        Sun, 16 Aug 2026 06:17:12 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887e3e7sm29235330c88.9.2026.08.16.06.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:17:12 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_tdas@quicinc.com
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 1/2] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Sun, 16 Aug 2026 13:16:44 +0000
Message-ID: <20260816131646.10551-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816131646.10551-1-sreeshankar0910@gmail.com>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RPMH clocks present in SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6367b2a5a..f4cafa274 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -1011,6 +1011,29 @@ static const struct clk_rpmh_desc clk_rpmh_hawi = {
 	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
 };
 
+static struct clk_hw *sm7250_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_d.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_d_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm7250 = {
+	.clks = sm7250_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm7250_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1120,6 +1143,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
+	{ .compatible = "qcom,sm7250-rpmh-clk", .data = &clk_rpmh_sm7250},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
-- 
2.43.0

