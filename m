Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887E941D4F3
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040559; cv=none; b=XEU9WaiGb8rrVyOxgGZKkNuRinYxwHSslDcxzu54fHs3BB+TkIDPSzJsMMftkE4M6Il/Sua3kTpu2NE6BXAZPrmhMFtQyutyVZgZmYrMpS67lfgwo0h0lddYSFaH+QXDzRBlvrfRZp4s5T2xblWz2Dpgg4Rf3hKaRez5a5KT9ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040559; c=relaxed/simple;
	bh=99pJRjLsjgQp97RPaeWEZ1YZegnfkzqsNfQJNAJNwP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmw31GVkkZzoRgL41PndZzHdRvOJfz2bJvzQBz09bIpJNJNfg8YS5VKvTy00TRHYIF/fSyW7YEdEHraLeo81eMoDiGRrXfsM6wn8mYpk3FR01mkI7HdtBMQ9q3tDCHDp6GoVf/7eeFUj6WnaDWPk5U1nFOitsI1PHZLyvpF+Cwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEWORsss; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEWORsss"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso3495605a12.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 01:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040557; x=1787645357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXCkXj9IgKaAKQ31oXzwXtt5dbLLTdIsAYd130AoDV0=;
        b=IEWORsssTau2nCRyVcCAFGoqDUhK9/8Jn1gXjl9G0ucpd0cuPctQlH6DIUMBp3ArPX
         KKO1pLUNK+lkc0w19q+daqr3iyyfKl0a8glEjrCIo8gklCtsNScwmQYae8FJntVZ0PuY
         SvHktqp0I+mlQnbLK6598dvW4m/2opaQWu2VsAnJ12+kFs4vdT05CYifBjl5Dp1XJrLl
         FHvaAcWrLCzVWtvoTlmiJuKG1Au+XJ8CQvTTXIH8ZchYZQOw43Oo8RxptMMT6ZgX0B45
         /UX1Pw9niHqXqC7PO78Ds+AiU+pKaMYuY8kFxtboz4XF7FW7VdNbOcUMDKDFL/E1dD9k
         1XYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040557; x=1787645357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXCkXj9IgKaAKQ31oXzwXtt5dbLLTdIsAYd130AoDV0=;
        b=Jg4QayMCbH80eFjKt9rsBYDPWOePft0vzVi/edMuzdyab+fKUkTgMGgkwyje09T15N
         5HW37I6E6HqvkDvOpUIfRpKAw+csjjiQjYkijJVsOlnYpGx39av/k9WiuEP0O5Wc+1sM
         U7/SZhS20lZ/FpucMxE7PTblswV4/b+oPalAF4ATPRVAcH0c+g35KPPxFc7Rxt5iqK9O
         w6VMPuV959eS0BnU/Uos4LittN7pmBUAZIKxxVv6PlK7BjHQim9TAtl1piKIuNFnPk5M
         BOZ9VaEmjOySaEHv8Eh1fDrfWkOp5hakkVzsOt1s8noXsC6L/hxqaLGl+hca1VEsGd5P
         QSSQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJowPfnQpLP7x9h8kQY+FwPL/fevm6I421b0CzsNvcq5B6OeUU2Fdz7kt6zUs3ls8XOibw4yigXyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0TwMfKRFKhLxlirZrIMEKvC0Nl5mtDSXQjeCOSX8cipfz/MRe
	vO8eVvlE///Ru4KTNxBXQ3sV9vfdtgr5f/+Q57rR7muNp1K6Lv3mIGg4
X-Gm-Gg: AR+sD12h3U301nSoBgLvhz5MA5/z2jW98IQDJT6aNUY/dqDQ0gfiu3D0BZ+MBvPyHAY
	iG+Bibg18jdSA6PTyKF1uKK2oNBWWQv9We3Pe7c67dMqkah1wF5Tjth2g+QPDX97WRzE/LxiG0P
	FwWZda56BGUVq7HZV3hK3b0wR8GJhKuSUn3Sz/DjdsfExKtV7GptSm+AM2bNEGBXiIbWfgwrJRc
	dYyuUW2mZpB7vBQwViiHJmpL+wnSCzHC+tUJy9vgnY7deA0nGr4/a+V/YPT1aj8oVfiyPDX6Gfp
	i6fjVoWd4mgOz6492Ybmp5AM4+hhQPIZuHuPEP0RJ21CiwO6K7Nwg7lDljaFcyPcxjyad2g19az
	ZkQU33fU5+VU2V1oArCAiIFp+gOAy0vte4lyFeLKqfkXrTJeLkaW6DaZZCZVRpogFKIda/iejUd
	dsOIE8eT2Yb4/pGIeSRFkz/6Cj2E90nsMboTktUExaVqucJ1ZJfStMHJtBZyEFb2wFPC7ZOA07n
	4z2kT6sf6c=
X-Received: by 2002:a05:6a21:328b:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3ccda9e2767mr8314311637.12.1787040556809;
        Tue, 18 Aug 2026 01:09:16 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:15 -0700 (PDT)
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
Subject: [PATCH 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Tue, 18 Aug 2026 08:07:48 +0000
Message-ID: <20260818080754.4362-7-sreeshankar0910@gmail.com>
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

