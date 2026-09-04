Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4521D45562F
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516775; cv=none; b=WEqZUf7e5fXmOg+QyI7N3aSMvGDz23v6+/Ql+Bg4EVa2QjygfpEqk0GiI2UUirE58a6VUenSmInnIlFJWEPpgQV9OxQiOMJTfot4wsh6hXnpNYS2bXEBh4AjypURLM1KHCNhS+sCDLWUQJnklKeM6bdysz5JVDbQWbA6zRZ1VSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516775; c=relaxed/simple;
	bh=JOoI2fQ3bWoSNiNb4j+XTtCV5WPlewq2Kxd7FdUTZYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgWvNLffUwwSYwMwIacluIVfauKf0xsu/HbmvBzrTnrkdiZKO33G5g04P4R4qZeIROEH/Ca8xJudrKGpKqg7Mx02MyhrlHw0LCoesKQPS1ZpMxghd8dZBa07yicB9LLMgOz2ZBbpq6vpWSt8b4qo65GWyJ82iANGf177iICpRJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DmMak626; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DmMak626"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fe89fb333so495359f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516771; x=1789121571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trMLdDdWbBp5aYskl2hpYhEKm0ijNRyi5bjjWx05fj4=;
        b=DmMak626qAsG77i5dAhWAlPlfCMsx2Oz348NUbAba/CD4zmHwh1PMqhB0I7NZeLFjQ
         D0R1QVQ8GAWGzc/iAAbnZo9Ekv8TBuIUWcKRCbmvxBVvxpmeZzwV80gAZNBs8FpTlF5F
         cRmx7eNC3o9JArisZz1Ctbv5EoFixFxHJWpHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516771; x=1789121571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trMLdDdWbBp5aYskl2hpYhEKm0ijNRyi5bjjWx05fj4=;
        b=jNuONp0CDUKjlb5YRU6NLbLqqvFc/obNHbOH9wk0N7obQebclqYU2oXiNU7AWAC24w
         Wwh+vJnpygcKHQYY/s6Iqp4zUWmwgJksb9NeBmZyLS+/z8Vo1zlXk4HMhrsxPOV3Jpn5
         IpAHI3tzbjQf4U1cgroVFuT2EL3+xwbI95iMtk1xqNLN+HcZyJWvOos7TXpPhJ9L6HnM
         K7ya0exiDzAtmCQXQoybU2YgdZjIlz937CyBu78YqeoItlcQJixrW0UGh3/hFAQQnoex
         ya3+etwUZ76CChEJDhP8PdwZJks5YdsGCMeeXj75aY0RGsUB6VQPmIY7VB9L2u/54fRs
         2QAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeF3zl3Gh1ZhDQhOTFmjJgHi3VOaq2gE53rK2srEJRMLHyT6JOkEnDP/kim3Lm3P8p5B1PYd3MPYA=@vger.kernel.org
X-Gm-Message-State: AFuF++nbsUU7bKb6EdHf8XUgKDGu7i+kOQ+xw+2sBrIvLtgLYgWuPxoy
	Vlug2Fl64JDFW5BC6LUOjr8YL5Q29GLJnbAozvYBK9F0P5f4yz/2G6JsIqsY46pts0Q=
X-Gm-Gg: AYBFou3CtsnnM7TEKPWc5m6GNrDtdbprhNBg1F2lsTCX19DyBk6KKCaAf64uiGkm90J
	Br3n9m1qQ9Rx3zbauVeVOHgbVrJAkJkW2TzE2SgXJPuXMoI7n/8XO6qRrDuRF0utZCwsEZtvt/j
	yUWmcxF8ugrfYf/1UDVQLzyIgL51d6u4VvVq4LUAwVEp/EyNb5jP+XkTJZ0QoufaaYv8G3jf8pw
	WyJxuolcBaooFQ/aZyv8Y29d46fyJ2o2BiUEMuVuc5lapCKLhJFqxRTe5mW/cjfpGeu6GQScslh
	yNv4rLZay75VGZZL0KfgG0GytGhaOnyrjl91UcJKqpLsFe+pkaHhSGjBGRNEr6+gNpKm1LyEPi9
	k5D1ilQ936T3s4xpObQBRAPNa0Sp0ihrplR/PWS9erCNwmHOBq6rvwfs0YYPg9AYFm8BRFw+wiB
	Cwh0Bgwa2IE2g9q3jrt01NCFungPWaxsoOWYL3eYKldSa8QxDSB+cV8SAU4pt67M2mv/Ky0ssC1
	wuUvkher6VY1CAv4VGgxF6y4tTG9ctzK28zOyuJWZBrLrS0/Ei3MDOGIm8p9V4k3QPm0bnsv+F/
	P4xZdAIqDB+rueT/Og86TnNa7ql08SxAWmgnP0loc/DbS5UUudGo+20RtqsZZypAuw==
X-Received: by 2002:a05:6000:41d8:b0:485:8a47:5b96 with SMTP id ffacd0b85a97d-4858a475cc1mr2833945f8f.51.1788516771007;
        Fri, 04 Sep 2026 03:12:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm5317990f8f.7.2026.09.04.03.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:12:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v14 1/4] clk: scmi: fix SSC spread conversion
Date: Fri,  4 Sep 2026 12:06:30 +0200
Message-ID: <20260904101243.412006-2-dario.binacchi@amarulasolutions.com>
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

The spread_bp field of struct clk_spread_spectrum holds the modulation
depth in permyriad (1/100 of a percent), as documented in
clk-provider.h and in the assigned-clock-sscs binding, while the i.MX
SCMI OEM extension expects a value in tenths of a percent, as pointed
out by Peng Fan.

The conversion divides spread_bp by 10000 instead of 10, as reported by
Sashiko, so any valid configuration is truncated to 0 and the hardware
is silently programmed with no spread at all.

Divide by 10 and fix the comment accordingly.

Fixes: 77369b1e6a37 ("clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260901155657.6A5981F00A3A@smtp.kernel.org
Reported-by: Peng Fan <peng.fan@nxp.com>
Closes: https://lore.kernel.org/r/ZR6PR04MB375776A27E98F140534E8F7FE488B62@ZR6PR04MB375776.eurprd04.prod.outlook.com
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v14:
 - Add Reviewed-by of Peng Fan

Changes in v13:
 - Divide spread_bp by 10 instead of 100 as requested by Peng Fan.
 - Rename the patch title and reword the description accordingly.
 - Add the Reported-by/Closes tags for Sashiko and Peng Fan.

 drivers/clk/clk-scmi-oem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index be11d359b4ec..c1ebbdc6bbc5 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -39,12 +39,12 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 	u32 val;
 
 	/*
-	 * extConfigValue[7:0]   - spread percentage (%)
+	 * extConfigValue[7:0]   - spread percentage in tenths of a percent
 	 * extConfigValue[23:8]  - Modulation Frequency
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
 	if (ss_conf->method != CLK_SPREAD_NO)
 		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
-- 
2.43.0

