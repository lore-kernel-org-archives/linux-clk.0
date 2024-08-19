Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002F11E2128
	for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 23:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110595; cv=none; b=ccQd0ST0M5DCLriaz8OoFUgb09/vutFffUnW9TCUwZ3GBTVFF7efT4maIrwer5urSddHtHzWqAXjGtWjEPlUxOXCFhMSpL8hU4x+zA9vKSKcFXRWBtfhL/QvH1a+2qYIVCNi92Mgnskji8t58EewjAi/pywVZMxVCc1DlcTLYZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110595; c=relaxed/simple;
	bh=11LWC1dHsw1h3mwOO/q+bhPVSG1jtOalR/V6EhebHss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ugwkafv70zRa1oYmpaFfH+GkuWh/FtH6TsmY6lt8pQmYyfWVFFXEIqMtzYGDv8BGcFlhQQOSzyAKbO5DyNrdFtilMTxBVakUrc/hgrfvOal2jQzn9Ck5zGcGtH+GYNseBUYgeVWICHntBp7PoQa4gie9SPcwXgGa315IGcSszp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pb+qshuP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pb+qshuP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-201ee6b084bso40326225ad.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2024 16:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724110593; x=1724715393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9Cd04T134NyakvqbnePNRvSvtAZOKVt3h8rY/EORRs=;
        b=Pb+qshuPZtui6ns+HBWeSRvEjQaKKuY/hLWAgFkQXZ9idS3NvZCn0EPlQN76VMS3du
         aizhQmcUAP7Vh87fA0JURODMrwuRX+OUT1ufgjrLI0RHqpBhI5Vmdfh9+KbV6r6Ldpn8
         IlkO7pwsaqwJTRQjcEBonm3BGp+Vslo42C3Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724110593; x=1724715393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9Cd04T134NyakvqbnePNRvSvtAZOKVt3h8rY/EORRs=;
        b=na64vuEJ+O2Z3hXMQgUxitMbMtT96Al203qOyAJxrYr30hwwusn4UEasYm1JfntvHM
         Twz33eweX+uCXuWxopbFLWwYJNIdiBinAuOcoQ3sXnt+lInevie796l3DxuAsaIVukO0
         XV/AZC01pYb6IU7ManN+GUwjNyZsg/pp/j6Bchtde3D7ZK9w/uIMi8DqEDm/MTsdj6VT
         XoJQxaat/ykBRYgK31ajpjvBniGwVl/TJQmnEmbrbLfjIA9dumjMwqfSAozQboD6o0xX
         jDiRyzeh9QnjOYE/m3in8D38HOxDShouAJtjW1kdhuehynXcFy8aWQuxAp6XQ4rg/zkU
         3Tjw==
X-Forwarded-Encrypted: i=1; AJvYcCUFz4zjTpBMlCgP9gIGIz/zWk799KPNKjtDnn6XOPrYEJQuCYsLKm+yYyMDzNtvbI6DPX02WQaSfsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6CX6u2aAnvefwbNWKG/9dshWvv7bR9Pe7beSmaRsGUv5F1hZz
	QdxL3YXbAA3EAf1AJRvuf1KtCpKGHhVTU8STdrwjQq0GLVqYKA9riOAJ79oECg==
X-Google-Smtp-Source: AGHT+IHMdQuQYTmr1VZjFq64pkXwFedtdel2DhVJEBi38KoF3VM1xbdsltPsvQqi4APbbL4RALu4+w==
X-Received: by 2002:a17:903:2307:b0:1fd:a5a2:5838 with SMTP id d9443c01a7336-20203e5518fmr187693085ad.6.1724110592977;
        Mon, 19 Aug 2024 16:36:32 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-201f0302e84sm67507995ad.32.2024.08.19.16.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 16:36:32 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH 2/2] clk: qcom: gcc-sm8550: Don't park the USB RCG at registration time
Date: Mon, 19 Aug 2024 16:36:27 -0700
Message-ID: <20240819233628.2074654-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819233628.2074654-1-swboyd@chromium.org>
References: <20240819233628.2074654-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amit Pundir reports that audio and USB-C host mode stops working if the
gcc_usb30_prim_master_clk_src clk is registered and
clk_rcg2_shared_init() parks it on XO. Skip parking this clk at
registration time to fix those issues.

Partially revert commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
registration") by skipping the parking bit for this clk, but keep the
part where we cache the config register. That's still necessary to
figure out the true parent of the clk at registration time.

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>
Reported-by: Amit Pundir <amit.pundir@linaro.org>
Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/clk/qcom/clk-rcg.h    |  1 +
 drivers/clk/qcom/clk-rcg2.c   | 30 ++++++++++++++++++++++++++++++
 drivers/clk/qcom/gcc-sm8550.c |  2 +-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index d7414361e432..8e0f3372dc7a 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_shared_no_init_park_ops;
 extern const struct clk_ops clk_dp_ops;
 
 struct clk_rcg_dfs_data {
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 30b19bd39d08..bf26c5448f00 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1348,6 +1348,36 @@ const struct clk_ops clk_rcg2_shared_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
 
+static int clk_rcg2_shared_no_init_park(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+
+	/*
+	 * Read the config register so that the parent is properly mapped at
+	 * registration time.
+	 */
+	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &rcg->parked_cfg);
+
+	return 0;
+}
+
+/*
+ * Like clk_rcg2_shared_ops but skip the init so that the clk frequency is left
+ * unchanged at registration time.
+ */
+const struct clk_ops clk_rcg2_shared_no_init_park_ops = {
+	.init = clk_rcg2_shared_no_init_park,
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_shared_get_parent,
+	.set_parent = clk_rcg2_shared_set_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_rate,
+	.set_rate = clk_rcg2_shared_set_rate,
+	.set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_no_init_park_ops);
+
 /* Common APIs to be used for DFS based RCGR */
 static void clk_rcg2_dfs_populate_freq(struct clk_hw *hw, unsigned int l,
 				       struct freq_tbl *f)
diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 0244a05866b8..5abaeddd6afc 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -1159,7 +1159,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
-- 
https://chromeos.dev

