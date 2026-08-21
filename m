Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ADE426405
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 15:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326917; cv=none; b=JRZZbB6ns2yPoTpMPcuVnNNsvUDY4lRFwWQ2VUDk5AJOY7kdAKbS2ddKYYbUhbuP4ovIXFpCdElV3fypSSRXoIHFkahBf4SsEZqR8Ebddci9ng+/+kQ2sYbdx+mkA2o+rNhWRL3iB8ZgDWlQOG8s2zi2DbmV3xM2W+LXP240Ke8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326917; c=relaxed/simple;
	bh=r2L4kMqfhwIbUzsmf8wdDtYuSEy+RrrvfwHFtyC9iAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUUBTJtuee8TvQVwunjA7rf4ccqDHjMK+bOIGoKj/AFFCzsclHtbLfMV/8ej/DRcCvwK6L/ngpbDxWTVD+Arx/OPVdg4Xf5Lx0S2WdrY97f87FpxdaaKqNm1Xyl2DNoZCICke06YahcZ5mafxB2hbs0hOq7vvLEPMwWYEtUjAvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da4IX5jg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da4IX5jg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1423511a91.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326915; x=1787931715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnjRied0UBQQezXmJ0yRlrcVs3eu3/u9Ou72/egKxFo=;
        b=da4IX5jg2ICPv4tKlrTWsXqUHy8yHMc0e4Af4iphB9Ox8tEyok/nvowc9Mh3wbbvzD
         1rEu5Kn43sFQO2za76nrneXizcaqfcNgZyWNhvE4+L3nZ2byxDQEA3YTV7hNQtSIbZZ4
         BLCfd6yJ1zEORopGns+6GJQFpVFDld/4oJ30+Pq1t9iV1fQg35F3dHSy5EddRkd0E2bo
         jux0Cu6d9ML/6cVLEvWKnTUGkFydObNuFsKlrBB/o33FCRr3Ntu8zhhOZzgDToV88/CX
         GOr3nusxu+WaE6V6psgtCyJFUHUl3Q9b0kBfht3cVe7VxmvWTTe19IJc4+/gb4drmoNw
         +57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326915; x=1787931715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnjRied0UBQQezXmJ0yRlrcVs3eu3/u9Ou72/egKxFo=;
        b=gi/MKc9sDEGzeXzqCi82DgJuCL+bm30kKc4q9gSiXLWh7QOsro7aUCGJdDPrrUzmII
         Ue44X+5IXnTgk6kagOwdHGU1AOs+GGZa36ZEGs5ehKXyt5SzqpHsoJfk1OnsHkzy3/+I
         4ysr2NOxGJCFT/zgj9U3sQR3L7oupWy4/8RoY/14bupfTlXL/g7nBz6tVDEK85TZ1Igk
         +Gykk/wL13aL6R1/8iz0IZwZlKfk5wnWh2Wi/Dxrvbggvq6i6Ge+sglby/np3ZxPXuNL
         X2mZcHWLcHqhVeUZNbthcplTh6wSVuWZ7D56cAKCSnmuMaEs6eB66Xp6A26qVMTapWpI
         Ag1Q==
X-Forwarded-Encrypted: i=1; AHgh+RppFzRBuk8oMHi+Y79b1DXVEqdVXwjLh0XLnxykYxXDfFhkSSyMzShWovobUsH+UtNOJM4VJVwtNg8=@vger.kernel.org
X-Gm-Message-State: AFuF++m96NybX123/gbd5TgCKEWMY12G7VaR/aRah3tBTCM6GjpaRLSV
	pnmzLHnBQRmy5u3SuA+TGQU2IT8P/a/0ksNt+llhAyc4zJoZx7CtLIJ6
X-Gm-Gg: AR+sD12F2mUokKBn4r8s2KfzgZQ3tv+0E8eQwyu93MUw7LpNefib5hDBJfFjKQqIH15
	eA1Wh8Ej5oZQMKXQH3r4TYFSfU7pZH1PXU2ERaFVQ7ntKQcOpkPvZ851YElA7eP3BP3vY1usG5M
	u+HIlQxKghT8tgPywCI0W/8aSsAszOVT/fon7WoC69IAfmuq8pADui9g/PSbYLdcTranr50GhE/
	tKdyQNO3b29/ENnIYEb01DROa+G3ZqqcLwWb6sXYxGQaYj8IjjeVBVZ14Nwmyood22SASprTxoF
	7WXiw9vGV5IGkE6yc2SNV2JgDHFE7Ex2Tf/XdO5sCHPBDM++yLs3HpcqW4zTmeHrZl6bA3ynVYs
	+ulNZwOiunjW07B63Jq6jjMRM9Rzo+RBBBQPwt4CTjuPitz4g5XkwIvjlUxS+IM+WEZj6pyPKTO
	P8mbOvZz7kxR8zk29x0WNNHy5apOXOkWKvxaD8pX8YLJ2xZfLvSh+sHEA136BsaMc+yKwWm0jAd
	rQB8f+RHAYQ
X-Received: by 2002:a17:90b:5846:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-395c3718ee4mr14838683a91.8.1787326914537;
        Fri, 21 Aug 2026 08:41:54 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:41:54 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Fri, 21 Aug 2026 15:40:23 +0000
Message-ID: <20260821154030.2514-7-sreeshankar0910@gmail.com>
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

Add the RPMH clocks present in SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

