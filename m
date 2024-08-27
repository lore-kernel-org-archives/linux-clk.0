Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B94D1D45F0
	for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 23:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724800364; cv=none; b=ZNFiDuAfJ2gDh+B+6vX4BXkE0VvRXDuKYNrcCNa1Bkl7GCD9VNcRn8ePhIq9TFSS7O//hVgJ9mWb8GvB7x9MpwDooTy2JfebB/WLzLU0xFxyinbuf1whHlagh5+yveUXJNoix83HZulhvUPnYBoFIe05iryVyPbixwbIIvaGAKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724800364; c=relaxed/simple;
	bh=SgcruDqpzkIUIuGB2VE07Hi5jscNhvIrf+oO5aoFq/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIs2iUMiyEd5G7cG26gGWfeLpHE50n0m/jDUGHdZUJg1Okd0sTtxfE9mErS+9700AbdknpS7mc2uQjAvIJ+ed8Z2QuEfVZBPsbrQNPU5Yf61Wp+glKAuY3NOD4AihCho0ZOQsqfc1MKpbCo+Koj4cjapcs3oh9HKr8SxNui1y80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DF8+5UlS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DF8+5UlS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-201e52ca0caso43077905ad.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 16:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724800362; x=1725405162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNh6OK9gpcvI3kTzyi1JJizEEsumTLCrxNqqOJriJ5g=;
        b=DF8+5UlSKzrVfKCNGSqgYokiUnnk6FGlaj8PyNWkZIUJaEO+LD84+VH3sTy5Ne9lIo
         0A1ahXKkeudiCqXRKWD1DS62ZD9q0fVLHzDF/Z8v1UNsNb7EtjNlaTrYNA/0Udlgx5sL
         p7S4DufF6Th1gYwJKix779GsKjJCXt9/q9iXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724800362; x=1725405162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNh6OK9gpcvI3kTzyi1JJizEEsumTLCrxNqqOJriJ5g=;
        b=FXkGfoSvzKJCfGP2qZqLQM78GT5TAkqSGnPlL/nm1xOm9MoLNjG8BsUlqm3HoX446S
         5qpCpYX7ueDsfM5ul3Hzg1b3MT8oD32eSuqnmn4TLuCk1SFW+Ix4gSxURJ5c9kvWwOIZ
         TYcNnDEax7GD4beWU7BvhJnSNMBrvpHrGf1G4P1mlkgwpahXcInmESVzcwSHuwAUT1ZV
         D20Hr4Fo6MzbsBpmmWhLXBZGJ7nbbZade14zdmGVsj1VsOAaM/d3cCQ8mgDAPSLjOhZ1
         RuzqpmMBeUG0lKu+whHH8Bo2WWJghgyZ1qmBVQLnuPi2H26F3GvdZB9d1rP6+zVNRQq8
         CWYA==
X-Forwarded-Encrypted: i=1; AJvYcCV0p54ULj3H7Ba8KtqQjsUdNh9A1MqWEKx+i/Ipd8pEd7sKlhX0/wBAUlCQljvKnb/2MJnc32tCEJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgRFZJN1LBodLeMS/6OLev5myFjMbN1+9qlEPY8EiT5mwdl7Xn
	128s52n7YuBszXcj7L3GwGHkxcB84FVWZcDETZAGMac73OyUPSiQnvNpaMKpkw==
X-Google-Smtp-Source: AGHT+IE1FzxMvUzMWQvsr/j5KuzyWibWhIHdYDiLnIiEuSTFy6W3CdwN5QnJLMTfVPlq3u7D9BESYA==
X-Received: by 2002:a17:903:32cf:b0:202:1176:5e39 with SMTP id d9443c01a7336-2039e4fbd72mr135195715ad.56.1724800362408;
        Tue, 27 Aug 2024 16:12:42 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-203c9723a54sm43082345ad.180.2024.08.27.16.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 16:12:42 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH v2 1/2] clk: qcom: dispcc-sc7180: Only park display clks at init
Date: Tue, 27 Aug 2024 16:12:34 -0700
Message-ID: <20240827231237.1014813-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240827231237.1014813-1-swboyd@chromium.org>
References: <20240827231237.1014813-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amit Pundir reports that audio and USB-C host mode stops working on
sm8550 if the gcc_usb30_prim_master_clk_src clk is registered and
clk_rcg2_shared_init() parks it on XO.

Partially revert commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
registration") by skipping the parking bit, and make that the default
for shared RCGs, but keep the part where we cache the config register as
that's still necessary to figure out the true parent of the clk at
registration time. Move the logic from clk_rcg2_shared_init() to another
clk_ops structure for use by the display clks on sc7180 to minimize the
impact of that commit on other qcom SoCs that can't handle the parking
part.

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Reported-by: Amit Pundir <amit.pundir@linaro.org>
Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/clk/qcom/clk-rcg.h       |  1 +
 drivers/clk/qcom/clk-rcg2.c      | 36 +++++++++++++++++++++++++++++---
 drivers/clk/qcom/dispcc-sc7180.c |  8 +++----
 3 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index d7414361e432..5f479a29d969 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_shared_init_park_ops;
 extern const struct clk_ops clk_dp_ops;
 
 struct clk_rcg_dfs_data {
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 30b19bd39d08..5f0b729d7115 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1305,6 +1305,31 @@ clk_rcg2_shared_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 }
 
 static int clk_rcg2_shared_init(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+
+	/*
+	 * Cache the cfg so that the parent is properly mapped at registration.
+	 */
+	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &rcg->parked_cfg);
+
+	return 0;
+}
+
+const struct clk_ops clk_rcg2_shared_ops = {
+	.init = clk_rcg2_shared_init,
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_shared_get_parent,
+	.set_parent = clk_rcg2_shared_set_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_rate,
+	.set_rate = clk_rcg2_shared_set_rate,
+	.set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
+
+static int clk_rcg2_shared_init_park(struct clk_hw *hw)
 {
 	/*
 	 * This does a few things:
@@ -1335,8 +1360,13 @@ static int clk_rcg2_shared_init(struct clk_hw *hw)
 	return 0;
 }
 
-const struct clk_ops clk_rcg2_shared_ops = {
-	.init = clk_rcg2_shared_init,
+/*
+ * Like clk_rcg2_shared_ops but also park the clk at init to avoid the parent
+ * from being shutdown, getting the clk stuck when it is turned on
+ * automatically by the GDSC.
+ */
+const struct clk_ops clk_rcg2_shared_init_park_ops = {
+	.init = clk_rcg2_shared_init_park,
 	.enable = clk_rcg2_shared_enable,
 	.disable = clk_rcg2_shared_disable,
 	.get_parent = clk_rcg2_shared_get_parent,
@@ -1346,7 +1376,7 @@ const struct clk_ops clk_rcg2_shared_ops = {
 	.set_rate = clk_rcg2_shared_set_rate,
 	.set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
 };
-EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_init_park_ops);
 
 /* Common APIs to be used for DFS based RCGR */
 static void clk_rcg2_dfs_populate_freq(struct clk_hw *hw, unsigned int l,
diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 4710247be530..068af819f23e 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -154,7 +154,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 		.parent_data = disp_cc_parent_data_4,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_init_park_ops,
 	},
 };
 
@@ -263,7 +263,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_init_park_ops,
 	},
 };
 
@@ -291,7 +291,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 		.name = "disp_cc_mdss_rot_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_init_park_ops,
 	},
 };
 
@@ -305,7 +305,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 		.name = "disp_cc_mdss_vsync_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_init_park_ops,
 	},
 };
 
-- 
https://chromeos.dev

