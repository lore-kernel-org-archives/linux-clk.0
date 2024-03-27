Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ED115218D
	for <linux-clk@vger.kernel.org>; Wed, 27 Mar 2024 20:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711571268; cv=none; b=grbFMwWwjqAlj8bFkiCDLPKV6A9pvZeRVgAvGH8GLo8i68rbXSFUitnI9w5wo22YdKeCguOcBlaFds1Nq0MYcAlE0tUriWIPAIvwKi/tzaI5LGHwqfNieFKuMYsrcNkcUTh4ONkW2gzBj+rGtclJOPI1KXm4e/t3Cc5Hp0O/yzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711571268; c=relaxed/simple;
	bh=5oad9tk6xdefUEpfxlO0qYtx6N8maziQMfOniCqwJyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXePTekLwmmlGr3BnCyqL18pa9dJYoZ+2LNrl4bpx/tnBZ6JlRTNEBlSXcd/8RStJhWqRMw6T14o+EyC3QU9Txo7Co0r22HSRUgjzoWNiSSgBOxmthlny7Dc8nPkbgCqSPiTATcqWa8itSD3W4TKvloCGtKmJOCom57dIvYAqfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FO9RNtOh; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FO9RNtOh"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so139226a12.0
        for <linux-clk@vger.kernel.org>; Wed, 27 Mar 2024 13:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711571265; x=1712176065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOsAStJoLrdj/BC0nTULl44A6A/+Mu8syVTsqrg00QY=;
        b=FO9RNtOh9nmWPrsc0Wbt4Qb0e9boRouaPAalzw174s+6dQUxuDYtdJz+M2ynUZ9KgE
         wEANRs/JjRMK7KkmPKYBRK7PGnOdBbd8C3iODKCuOdEC/Ndetd4G0HSPdTD9ROUafBYa
         pzCSAXP4pHonrrdhTkuBQ8cGF38U0g6OvKQPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711571265; x=1712176065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOsAStJoLrdj/BC0nTULl44A6A/+Mu8syVTsqrg00QY=;
        b=dhYh1yKHbfGeV2cY8ui/q0gIj2jWVut+cUMm8rJDlwE8W3uzy76114M9iwMv7p7Hqo
         fiATAs/Np7eJUS64Q6j6tOhOJ/VZxKdt2Kd7nkMKY9kqm86BKzR31f8Slom42e1Ki7Ki
         AF4hM/zdByL9/qceAGCUDWbuD4tj+C//DXmp9nOqXZRNunxx2Tq6GhpjTp57hj30FtwO
         dFIYiXinNWdOxYvZAbKFX3Vfx4rTtyO1p1jIpNNeh1Ij+5QLrbuY4bAtjJbgFBs/Ki7X
         VqKJQl4LOiUm6DSU/NVl7FrD6+HEQBwzjUcM9niMMTQGc28eY1nAdMFlJ74IfReikEVf
         g8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV4vyYKjeRbbRa/gPojm4mI1X+rXm45sfOa9z1LTEjItbXEMCex300dD0mCUYcW834q62+N9v2hjaf8Zx0OBawDUnL78sD0MvvR
X-Gm-Message-State: AOJu0Yyz78tcirLC/S5SlhX9GLlPlsu6aSSqqqw21QJKnA97SHCi3/O2
	KhWcln3Surigari1Mmxs0IQAhkrZA5DZV+yxbP8tEIUlrivPDnu+HRBvnzM2fg==
X-Google-Smtp-Source: AGHT+IEsci/FRTRW4pt6BJLZbr1PpuxpETOrv0oWRHOV5f+8PsFRccHqiRauOWrEOQ+yKC5ucYNhyg==
X-Received: by 2002:a17:90a:8402:b0:299:72d7:5b9a with SMTP id j2-20020a17090a840200b0029972d75b9amr706179pjn.24.1711571265285;
        Wed, 27 Mar 2024 13:27:45 -0700 (PDT)
Received: from localhost (4.198.125.34.bc.googleusercontent.com. [34.125.198.4])
        by smtp.gmail.com with UTF8SMTPSA id si13-20020a17090b528d00b0029fe0b8859fsm3602158pjb.1.2024.03.27.13.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 13:27:44 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 1/2] clk: qcom: dispcc-sc7180: Force off rotator clk at probe
Date: Wed, 27 Mar 2024 13:27:37 -0700
Message-ID: <20240327202740.3075378-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240327202740.3075378-1-swboyd@chromium.org>
References: <20240327202740.3075378-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'disp_cc_mdss_rot_clk' is parented to 'disp_cc_pll0' and enabled out
of boot on sc7180 Trogdor devices. This is a problem because the mdss
driver (the driver for compatible node "qcom,sc7180-mdss") turns off
'disp_cc_mdss_mdp_clk' and that clk is also parented to 'disp_cc_pll0'.
When the display pll turns off, the rotator clk gets stuck on.

We don't really care about this clk being on through boot, so simply
disable the clk during driver probe to avoid this issue.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/clk/qcom/dispcc-sc7180.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 9536bfc72a43..a3356a7758b3 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -705,6 +705,20 @@ static int disp_cc_sc7180_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	/*
+	 * Force off 'disp_cc_mdss_rot_clk' so that the driver for the
+	 * "qcom,sc7180-mdss" compatible node can disable
+	 * 'disp_cc_mdss_mdp_clk', which in turn disables 'disp_cc_pll0',
+	 * without making this clk stuck on. When the mdss driver runtime
+	 * suspends, the mdss_gdsc will turn off. If 'disp_cc_mdss_rot_clk'
+	 * isn't off or parked on XO at this time it will wedge the GDSC and
+	 * then 'disp_cc_mdss_mdp_clk' will fail to turn on because the GDSC is
+	 * wedged.
+	 */
+	regmap_update_bits(regmap,
+			   disp_cc_mdss_rot_clk.clkr.enable_reg,
+			   disp_cc_mdss_rot_clk.clkr.enable_mask, 0);
+
 	/* 1380MHz configuration */
 	disp_cc_pll_config.l = 0x47;
 	disp_cc_pll_config.alpha = 0xe000;
-- 
https://chromeos.dev

