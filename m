Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6633A48F7
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 10:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516817; cv=none; b=tYDZX24WQZiOL1wQA3aOV4KiSllovnSRiLIP5CBBizmNI4QTKPOBIVwxdtEjBPBvxr1/6Jgp3xlg67b9vj/mVpAqWRMndU06U5Y1ziSTYxGz2yhLDx2s9cvBerB9TPbrOXy4kd8zHMKWIdQ0kJDEz8QO7ZzSYUJZKAe/oEV+0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516817; c=relaxed/simple;
	bh=xZ2sBnhrYKqxY/S8zO9jUQA4qCcp7CsTSlId62VD62U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rn19NuAlgyR29S8RwUQrq11Gp0XCh4TGy5eJGDnUm4nbRqH4P17x8uUhtyQpVxMvrmKBfTBzLCKTgGFS+73GhOqUwmVmodWoMeWm4ZZ/CYH33Sv6NA0VftFUhP/Zwp/ri/xVCvB8f+aatKCqhP/dA9AEm8cRAhsQmT/8PDkGdcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aA3G6LdS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aA3G6LdS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48584dc164fso773148f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 03:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516814; x=1789121614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/iBVA9/Ii7qFgco17f5RCUwPjhgNhGPbu+zTwjLGmA=;
        b=aA3G6LdSfBEFdJO5IcUlngaRT9cJtLRlJ2Fy7sBP8eggwremX/vAWSiEsZG5gLXe4F
         YSdHygtrG63memrbX4o5iYFEPef5abqOBkcUZPt8d2rfZCHFGwowrHzq9Y259JUKO3yT
         dR1Rs/noSnImP6n6Sfk2N+qcQDZkVuJJs8blA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516814; x=1789121614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/iBVA9/Ii7qFgco17f5RCUwPjhgNhGPbu+zTwjLGmA=;
        b=gvqKG4UjHvbY/6gN6PrHLQKUd5FQxvIBLJ4k7CgWHaTsw8DtJm/vYWiv7dxgcJnHvC
         FLQEFfAlHA1RnC8Mr2E5VK7Y0BqFHWfFhsgmTHXfYANfhsRwMG7DfHyEEl32hNj5hs9f
         cy7FDfqxQtJRc54nYVrCMNEDjyUBEumf26oR+SNM6N4oljYsGCE/nhn1sAe4DTErZsaO
         4BMfUKCL5i94PBhKDQxVFklnrmR0ADGUlB1ebCncl43TQ1vIW0s6v3b4w7ORL8rUY+Zd
         HG8bYsogWTnYC1zbUnrle/T9EgPFkksUbezxHtjVn3oJCiv7X6FTCV2O9h412nqBUXvN
         Xvkg==
X-Forwarded-Encrypted: i=1; AKwUvBx0a1exaoaFJhlH16Ndte3o8nDxER3lp/eeESHWTScwW+tmZerWV/nsJsyZoU94fgCr7fn2EPnqvc8=@vger.kernel.org
X-Gm-Message-State: AFuF++mK4EHXUyKnHvC9Sc/cKGd5c3+ZmKpMpCho3oWoZACE0Pxr8Fpo
	NcsaRiFO3jj37lF+JQ3aaJrtuIyfMaP21cMbbWMUIeP5R3W0lrpnNgATkDPofxp+gv4=
X-Gm-Gg: AYBFou3J73LLjnOZNfeBg0rd3+7sQ1d1I3C51jd9Y2x1/8ckPw6qCWta/3dVO+rQdgs
	12QnTzBLdDovVzAFePqOHBIjB153Gwj489A0A/PpZoXsbmkzGwbTO39KOhlL0VidW4FXlreq1xi
	HWKlImd3hUKBK8JJA/5GqrzvR395DZ+OrT9qjKDDMMZZosP8FtI/skY3WCRTtyF4cYE94ToQXHn
	Eisbn0sJwDPyJ0p7xwlBFrQxxqBX900b1Cadu0jZaBvsteZKcGiZvtRW4jsSJWIG1S8ZCTmtP4c
	Hg23gaUGwpw55/EpLk555vykjBk2ZK4zO+nLCF1twrY+DhQWOPzlb4jdTcYlvwBxtwpjOQuIcl4
	JDluWvd+k4GQ76AvZ7A9eeuda3vNLpQNnUfNVaFdYX9f25barM8svZMe8yztwRqXF3zG/rmFMKY
	1SggyGjm7Dbb6RsOWTSMub17FKOVrFBZA72f9EuQJE6+CcvrDC//LC289PWQH5yigeC4uT4oAuJ
	bWgvAM4k5kIuRdbDBCotDGH0l8GJXNsprF8UhqhA7CT80zZzyFfYlsjU4AgjoVFh0LpsTTufdJP
	ug3Z515o6JwddlZetPh/ZA93xmXviw2M8VerzzdmniSaziDA0Ezd7RE=
X-Received: by 2002:a05:6000:40c7:b0:484:3310:f394 with SMTP id ffacd0b85a97d-485872d2de3mr5945970f8f.23.1788516773023;
        Fri, 04 Sep 2026 03:12:53 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm5317990f8f.7.2026.09.04.03.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:12:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v14 2/4] clk: validate spread spectrum configuration
Date: Fri,  4 Sep 2026 12:06:31 +0200
Message-ID: <20260904101243.412006-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spread spectrum configuration is passed to the provider's
set_spread_spectrum() callback without any validation, as clk-conf.c
only skips all-zero triplets from "assigned-clock-sscs". An invalid
device tree can hand providers a zero modulation frequency or a spread
ratio above 100%, and each provider would have to add the same checks
to protect e.g. divisions in its rate computations.

The KUnit test data for assigned-clock-sscs uses spread values of 30000
and 40000 permyriad (300% and 400%), which the new check rejects, as
reported by Sashiko, so fix them to 300 and 400 (3% and 4%). Also use
a realistic 6% value for the initial settings of the skip tests, for
consistency.

Fixes: c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260901155657.6A5981F00A3A@smtp.kernel.org
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v14:
 - Add Reviewed-by of Peng Fan

Changes in v13:
 - Fix the KUnit test data to realistic spread values.
 - Add the Reported-by/Closes tag for Sashiko.

 drivers/clk/clk.c                      | 14 ++++++++++++++
 drivers/clk/clk_test.c                 | 12 ++++++------
 drivers/clk/kunit_clk_assigned_rates.h |  4 ++--
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fef87167a60b..208caf60eeb5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2851,6 +2851,20 @@ int clk_hw_set_spread_spectrum(struct clk_hw *hw, const struct clk_spread_spectr
 	if (!hw)
 		return 0;
 
+	switch (ss_conf->method) {
+	case CLK_SPREAD_NO:
+		break;
+	case CLK_SPREAD_CENTER:
+	case CLK_SPREAD_UP:
+	case CLK_SPREAD_DOWN:
+		if (!ss_conf->modfreq_hz || !ss_conf->spread_bp ||
+		    ss_conf->spread_bp > 10000)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	core = hw->core;
 
 	clk_prepare_lock();
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1c5c8b7c1f3c..21e62d68f87f 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -3526,7 +3526,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "provider missing assigned-clocks",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_without),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 	},
 	{
 		/*
@@ -3535,7 +3535,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "consumer missing assigned-clocks",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_without_consumer),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 		.consumer_test = true,
 	},
 	{
@@ -3545,7 +3545,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "provider assigned-clock-sscs of zero",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 	},
 	{
 		/*
@@ -3554,7 +3554,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "consumer assigned-clock-sscs of zero",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero_consumer),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 		.consumer_test = true,
 	},
 	{
@@ -3564,7 +3564,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "provider assigned-clocks null phandle",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 	},
 	{
 		/*
@@ -3573,7 +3573,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "consumer assigned-clocks null phandle",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null_consumer),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 		.consumer_test = true,
 	},
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates.h b/drivers/clk/kunit_clk_assigned_rates.h
index d7ae5ec2d25b..c5d9f004ee81 100644
--- a/drivers/clk/kunit_clk_assigned_rates.h
+++ b/drivers/clk/kunit_clk_assigned_rates.h
@@ -9,10 +9,10 @@
 #define ASSIGNED_RATES_1_RATE		9700000
 
 #define ASSIGNED_SSCS_0_MODFREQ		10000
-#define ASSIGNED_SSCS_0_SPREAD		30000
+#define ASSIGNED_SSCS_0_SPREAD		300
 #define ASSIGNED_SSCS_0_METHOD		CLK_SSC_CENTER_SPREAD
 #define ASSIGNED_SSCS_1_MODFREQ		20000
-#define ASSIGNED_SSCS_1_SPREAD		40000
+#define ASSIGNED_SSCS_1_SPREAD		400
 #define ASSIGNED_SSCS_1_METHOD		CLK_SSC_UP_SPREAD
 
 #endif
-- 
2.43.0

