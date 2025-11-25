Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E14631ED73
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072390; cv=none; b=TB1cS1jmeOCsh9ksNHaBhCrP7T1yC5k8/EU/uaCcy0/k1Op/8bTF6MYohYxGu9z3T/1Jmkc4nAutsaUgiAiuvC7VqwfXo4Wt2AJhYQyYG74G4pnRhkfEGV4GKalkhVcUU+B2xz7fDxusWcOs012KAa96iQul5jSFdJ9KtYSTwC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072390; c=relaxed/simple;
	bh=xUFvUb8oKPEbKpAh29NhrNZ2bfXoPM/j19JqA5bbRxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pFKdxeyiDy8fVmja/PaqxYKnnXhBGTZ2PrX46PuedrA5F9KgYjMGVUi2MAAscr+2wB7eKNUq3LwRfwlFCcmAMBmjDGBUptWtcojpIjlmBPbiTjI9nSlsAfkm/dmV313vHEZK+PyYwXNX5x/Vbt8wiamWewm/EWCaow1YhPC/r0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmGoHuOW; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmGoHuOW"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59581e32163so6361970e87.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 04:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764072386; x=1764677186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uN+F0Xnd3WljGjWpLVxmMpsaxzHe/mQ0Vkjj3hwJW+M=;
        b=GmGoHuOWaR995Lcc79GWMbCFK4Oss6BPSvGUKGkjTD/fy0s4ot8bE+Nlm7J/Yr5LF7
         8F39Gcu6sECcvo64cJ8eaI5q06VXZ12D8uk6kRyRggF69MOM/jUQIVFAUffcE79K7h3j
         YJDbVtvlQ1JyXmfO3S0OxA3BvoOTKl0ZkCMOJ7c1KYOVB5iW42ckgzIUyVe5vJtVuOa9
         Iu+TEwCepv3v5v8syqVEtfyNimIy6XEbFDV/e6aVKLCmHuCqyQ2j26951K4O6m7tho08
         lL1Dwhgs1g0zA93IXwtba0Mrfc2iMxu1YrxeOfxiXNRbcyZjSKVLSi35jdPidD+IXl6i
         SVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764072386; x=1764677186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uN+F0Xnd3WljGjWpLVxmMpsaxzHe/mQ0Vkjj3hwJW+M=;
        b=C1v66D2wil6s7Yh+tPOGfhx2IadDoaHbTWuIi0okTUUIN9anS4GFTQlhR8bOYgR+5f
         Ea7R6Xjo8aP5mcEmosm6wdEDfqOdfWOtORPqKpO5/dv+fKk2EiW7w/Pra8xTnj2JMMPX
         m+gykVHIEThEjdP0+huHlPhDDqeUk8VY4RYQLsi6oC1f/fEE30RiHSNCnkWuFmc3cn3i
         NPvsL/7qi/9QvJ8EEt785WNxQidSRxZBYaslByAoNVnPLExI6KyD088M8HiEh2q3B65c
         KYmULZcz0okBrWyo6aaIcZu3oS3lWu+zat84rqFf0Yjzoc5QTU5zKPRAuwCW4ACR9LXP
         mpwg==
X-Forwarded-Encrypted: i=1; AJvYcCXsDMAaFXaMHt/H/JMvuUVh1niB19YnA7vM1Q9ImKukQ2tOtw3bgxoC9FYwQ8GTezQjFs9iCCuohVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+SSzBDzAnzmKHx+ag7hEqCP8+8CBKptabEjVv1TeDWnQSAJtw
	8mUYLdn/KjJXlNJQoCamQV7OZhA15UCxcAiJsaVHOF2mQZFNYPqVYRp0
X-Gm-Gg: ASbGncubCXewCRETz3hEEwL2wrpuWBRumpGjsIxR+sXCrKNNoIkighcN9LOEMS1ekeW
	zB8pkZoYjJ4neaFsUguHG7FBtLnOUgj6IUZA9Jc19LjVJXMBd73tLNFBpqhtIdLT4lnWqwNzFlX
	qN/iA74UsAIa68Uu8YJm5V82M5iPdnWuwP7w0nq8o5GEbaVR+83fihQiHLIoddSKoZ9YgXgUhFn
	wkshGxvjjTKVZkeV7h6gXtqhorSTWt8ILZoz69y0b9OPKOjYR1A/s0fr0C+GysJ9yPRq70km5aZ
	VnWpuwHXjK/BR2Mhumon8YZ9Jt5bbCqWWBoJv1kgVu/5Dpk58mk4TBEvg3rqjAtOl/TjEl2ka0Q
	zUiYMG/kWD+qt8IjN2jYcCYQLQgjJxzsihroOXOVryjGEvAXIVJS8EI49JVJtcr2acULB7S1e9l
	o=
X-Google-Smtp-Source: AGHT+IGkQddv0h4W/kIYw24XVr8lRF2/F0YngAnHGV9hmScDktzlX2Yt8Q6XtITCokbogoFFbpJn9Q==
X-Received: by 2002:a05:6512:159c:b0:595:9152:b932 with SMTP id 2adb3069b0e04-596b526c87bmr786045e87.47.1764072385864;
        Tue, 25 Nov 2025 04:06:25 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecb9sm5150993e87.58.2025.11.25.04.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:06:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 06/12] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Tue, 25 Nov 2025 14:05:53 +0200
Message-ID: <20251125120559.158860-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125120559.158860-1-clamor95@gmail.com>
References: <20251125120559.158860-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove current emc and emc_mux clocks and replace them with the proper EMC
clock implementation for correct EMC driver support.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 8bde72aa5e68..853ef707654a 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -622,10 +622,6 @@ static const char *mux_plld_out0_plld2_out0[] = {
 };
 #define mux_plld_out0_plld2_out0_idx NULL
 
-static const char *mux_pllmcp_clkm[] = {
-	"pll_m_out0", "pll_c_out0", "pll_p_out0", "clk_m", "pll_m_ud",
-};
-
 static const struct clk_div_table pll_re_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
@@ -672,7 +668,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_csi] = { .dt_id = TEGRA114_CLK_CSI, .present = true },
 	[tegra_clk_i2c2] = { .dt_id = TEGRA114_CLK_I2C2, .present = true },
 	[tegra_clk_uartc] = { .dt_id = TEGRA114_CLK_UARTC, .present = true },
-	[tegra_clk_emc] = { .dt_id = TEGRA114_CLK_EMC, .present = true },
 	[tegra_clk_usb2] = { .dt_id = TEGRA114_CLK_USB2, .present = true },
 	[tegra_clk_usb3] = { .dt_id = TEGRA114_CLK_USB3, .present = true },
 	[tegra_clk_vde_8] = { .dt_id = TEGRA114_CLK_VDE, .present = true },
@@ -1048,14 +1043,7 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
-	/* emc mux */
-	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
-			       ARRAY_SIZE(mux_pllmcp_clkm),
-			       CLK_SET_RATE_NO_REPARENT,
-			       clk_base + CLK_SOURCE_EMC,
-			       29, 3, 0, &emc_lock);
-
-	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
+	clk = tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_EMC,
 				    &emc_lock);
 	clks[TEGRA114_CLK_MC] = clk;
 
@@ -1321,6 +1309,26 @@ static int tegra114_reset_deassert(unsigned long id)
 	return 0;
 }
 
+static struct clk *tegra114_clk_src_onecell_get(struct of_phandle_args *clkspec,
+						void *data)
+{
+	struct clk_hw *hw;
+	struct clk *clk;
+
+	clk = of_clk_src_onecell_get(clkspec, data);
+	if (IS_ERR(clk))
+		return clk;
+
+	hw = __clk_get_hw(clk);
+
+	if (clkspec->args[0] == TEGRA114_CLK_EMC) {
+		if (!tegra124_clk_emc_driver_available(hw))
+			return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	return clk;
+}
+
 static void __init tegra114_clock_init(struct device_node *np)
 {
 	struct device_node *node;
@@ -1368,7 +1376,10 @@ static void __init tegra114_clock_init(struct device_node *np)
 	tegra_init_special_resets(1, tegra114_reset_assert,
 				  tegra114_reset_deassert);
 
-	tegra_add_of_provider(np, of_clk_src_onecell_get);
+	tegra_add_of_provider(np, tegra114_clk_src_onecell_get);
+	clks[TEGRA114_CLK_EMC] = tegra124_clk_register_emc(clk_base, np,
+							   &emc_lock);
+
 	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
 	tegra_clk_apply_init_table = tegra114_clock_apply_init_table;
-- 
2.51.0

