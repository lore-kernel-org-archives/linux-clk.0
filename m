Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEB647ACDA
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254777; cv=none; b=hiYjtuoU/HK/KwlHvZgS1ZM+Sugrh23rGl7Ke6fli+6XswIORmD+3kV0nwpZfK488ny6fkARafqX5spkEx/ch3tF0jyL3Clk5010ufU85EZqkJQ57VKkvWFA9JzgVtoMn3z92xqAhQuHWYX22Z47vXWt+FGjlzyeD2Ak34/3p/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254777; c=relaxed/simple;
	bh=WWiZETqtERmFbujUpcdTmbmOg/Oos2rIugNyk5YbX6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IEvXaJii8c1Qtz19Y8a28UV5/moIEjwyJiFXzqlqHLN0/ZizQTCLd7cv4PieimBXnAslXtok+Y8uGnaO/JBCNDNDZQQAPZ+25xNYfOIiLfg0EedwnRCRD5cxuwi/oHIBT9xC/labgS6IWPcax1+ojzIc1ipOQIU0kTjIbFXtf/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfvwQwzX; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfvwQwzX"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so601085a12.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254773; x=1788859573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=bfvwQwzXQUsRXYC5orsAc17HHlNxcFSteeqrEUkmKUwv+OUV9Bx/eX3HzIk7tPO/Lo
         0vWA/TbrEGT7Z0Cm1ytWp5nH9yKSqjaICLWNPFJNsNEBfvfGWksSahxKe/j2+DsX1mWj
         SzdsYAKD1FbSMvQhOFmOYz3fOqs3FKHwCxh49pzcfZ7pvRGTbaAV8hGnDvoV1pIxMhuM
         EnMyeVhx0MkccFJI4v+bpzh4AxxRCbZPoPmCmiZMJ3MSumCDY2k/GXDwQzal3MZzT5Fx
         5qH9KJwYeCVDKCsT8psMr+WKUF6B3n3cFI/tXRyvQ6fqU5NFyYGUd6kQmD1qTZvpK8Ct
         t7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254773; x=1788859573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=tAAXPh+SroY2DLIMgSCCDAtkNxvXkhsoOeDwAnyNN9YqkhGhaYmh2i+bElR1s9Zy9C
         R1GNmF1jjZcTp8H2DZb9PnrDriqdhf4F0scliWDwFfclHlvHHmGy0FhUw1tlBLFCZrze
         eTR5IDj6rWU54Nwf9V/wOurN8Mdi2dSpmQKsn26UPCZVBwyqYbAaTpGdxmauV46JZ0or
         fmorAYw8e1B1PpiQQMOmU8PROkym+h6vJx8vREClRQAFUWiYSVi2CXblp4OkYJs0NLZK
         YCJaiAcH6xE7gFIVupdF6Glwod3ohGYi6rGIjmPNpkThShyj9pgjrodXnsF4Dx8tvdE5
         +czg==
X-Forwarded-Encrypted: i=1; AKwUvBzxz4Y90VlgKgLEd0IZcPUD59hIWWsIVQ5rUriB50XjUso52/YvD6kPGbGwjwqfjYLioxT+eXGhSEk=@vger.kernel.org
X-Gm-Message-State: AFuF++lWWGkitGYlnMDiKW4XiDgA9x/bRjyLcsiwMEuOeP9bFCXh5jcs
	y1OMkJwAZTAw9HGabQ1nCSSL3+e1AlVtyyI6fpxssp1jkFUh5LlOTUhj
X-Gm-Gg: AYBFou1Bi8gfC/q0lFJaXTvBrHpwsdViiVpY9URvDA2NG8cqTixjl4+LGRukBLnnhmh
	sJqsRppAfrKxCnHcvpfMLcBTg7q4BP3fE07ePQmHS8LVrKSkdMuFjTk+U/6fx9yBBlFPtbuEutE
	eTz/LpYqZG5T2dqivSHTfDF+Wd39x5vfctimsZDvetM/gwmWzRtVpjBYx1hKYwuwaaLq5Ws2HmQ
	lEaSDSoIdG1S10NPjNlLk6ez2N2jlqhxusXJgAz1sCPXj6TXGLAEuOD+nAqmbB+o7ebj5u5WMQb
	Xq1O+X6eLO5MVgTMpyuKQIrpwum2Jf0dkWPxj41mmXtdBa2w2yHwDbtIH5G1VsAO/5Yg+g78WOb
	TbG+NUgFR14wiFpqa0jJUOiQfFVeSj6G/MFtDl7dTt1bySIVvB8lneiZq0t2JSnkVRVxJxWro4i
	nXCEM0hHYZo4Sq+3btL649XGIlUBdHA+B+TM7gW4BHCrIC5D64dtlV7GgDmGRZYVx+tNi9o/X+Y
	sTEfyJkayYx
X-Received: by 2002:a17:90b:2fcc:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-3989be9aca2mr37784325a91.20.1788254773212;
        Tue, 01 Sep 2026 02:26:13 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:12 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Tue,  1 Sep 2026 09:24:41 +0000
Message-ID: <20260901092447.3028-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a224a94ae..5799fa296 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -1005,6 +1005,29 @@ static const struct clk_rpmh_desc clk_rpmh_hawi = {
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
@@ -1114,6 +1137,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
+	{ .compatible = "qcom,sm7250-rpmh-clk", .data = &clk_rpmh_sm7250},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
-- 
2.43.0

