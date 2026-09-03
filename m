Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E044E80BC
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449937; cv=none; b=lbxHSY5Cl0suQUQanutWJ2KmGSRLrQmNWK90ZQ8fl2GmZdOe9CUoA9I9APFaHtsJr5dOCfFAQl13WMP3xTwOP5/3WE+5NF0N+gwuFQVDpQHe16OtnCojMJqWs8BgZsEQ2AT0Fyr+aPzJHqJGlMEx1ylILDCpZbViyMYOzQjVKCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449937; c=relaxed/simple;
	bh=jqDxNsidN6eFRCeVQqRvHX95xR+s3cpiy6Fu25B0d+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1m9LgmyX0NU620NDZWIDqXVK4wp3RX+TDghlwU9LLsphEQ8Ihla01Ae8dSibhzi+cP9Dr6R8QCdcMgnHE8pkTD6UsgkJE/Mkqw9Nq6tibjss6/d1hf83BoMjMv3IckNnMeEiNY5stkKR6eCjK2YbEYvVqC2uZ1CZhxRalxMjS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=JdV9mzTB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JdV9mzTB"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48586861639so44850f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788449934; x=1789054734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0o+HCmOQx9XAtsX24zUFSwjZJzmYz+uo9CE80R3VvZQ=;
        b=JdV9mzTBhXYIdoynAn+8gdWXTkhRVbDmtOwIskA9NCWA77NXqLJgwzVNySVtHP/AVQ
         J64nMACeQhtuUrGShc3Lf93A2o3owTNzjgJnDPG7Qvg+Zc26D1CJzz346YfEyH6SCQXI
         dPrNGouOGUuKSSReJ28U9P5D8KBerz0At3Vfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449934; x=1789054734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0o+HCmOQx9XAtsX24zUFSwjZJzmYz+uo9CE80R3VvZQ=;
        b=hKDwyliNxOuzxdlBRKTKLVnqrEfWU+xyNy+L681PdOTzGk91IfEOBs23r/PSUaA/08
         hFod9wx5QtI4r4+H53+UK7DYTTqtVFkyBm3x7qUe2LRm5NSjDeIckuS3lRCOPa43k7r1
         Pvvr0QPwpo1AFzATnWCcBj8HxPGWXg/0yBtbKo4F+8BAnjNLdM9xHuVNbeDVvEXEs81f
         OuTIFuaMdZfRwgCti6Zy/GHaM8OasYErgpnWG1qXRssLMKWptQRJNszek7KSDZwSohZ1
         i/k23svSNesNB1H4owQU0ORdLFjMddL/IK+buNmlrRsuN4wJOB6fi4A+gDnYvmJpylqE
         WRPg==
X-Forwarded-Encrypted: i=1; AKwUvBzZlJ0VDYivjpAyg5fuXbSxTd3It1xqIxRQHIlZcjUJ6rkQ6n21T/fY8HinBNp90Kvc5ycXgMFPY6A=@vger.kernel.org
X-Gm-Message-State: AFuF++n7pCu64+94ftrlEFlgezf25D68HlyPopcjVgUnpXCh1CfagXsc
	MQrYtUg8exHcoesIKm0w40b6ZwMNczd0qgthHAUsYEyN+kZK6IZS4+g8NvDOucL5HwU=
X-Gm-Gg: AYBFou0GTZbsvkL/6eyjK+TxiqZJLJcuUw+YMi2MBgoSIW2EhSWCzROck5EyeNiKgA9
	iUuUZNW3YvouJ3KHntWh8P8m0BZ7Pf0KdghuBYOnMm8s5Betvrzyr8fa49uRbaIAOvnpjW1NsZm
	Pl4dpahuLEekMS2OZsTLBNkJQU85M8ni8HfX4SYxkaK/KQUvUTMRyipwwRW8QHrdWzTkv/0Mh89
	TBFWVPWesdUm1JSBXwfbdGjP47G7cYfCmb+drufu/eL+Y+K/YbohgJIJnUShFuyJOnr1uEeYV2M
	WVwI4Ty1ao2rx2M5LWO2g1UnC/eWXngzIC1ca/zTj7JStKqaNA+6D2jQgLCCci7BvfTqBoODEhX
	eGKhT8HeAKUFTtFYoPurvM1sbhSMBoTypTS/RFoKBexVHQI447DKbNKym1aTOtJTlZx6EbK/prY
	MZf/6YRgnG1SBbAcPx2dG3dUYYkAeaB97rxV1wpVa2awd7ndpi4yaQzqs1znRJzqMHH61zv4AWB
	umZwc4oxmG5bbrYhT+290okn0/VvnbnBZIty3h7RnuigZV4ln7UbLFcOpd5ck8yhrsryumBmt0V
	0CfLwinEYlf97ZkZ6oGne+WGMpnbO2BqLEtccDE1qSLSxanOab+LagHI33yTTR31CLc=
X-Received: by 2002:a05:600c:46c6:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49cf1576df1mr45683825e9.2.1788449933923;
        Thu, 03 Sep 2026 08:38:53 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm15366301f8f.1.2026.09.03.08.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:53 -0700 (PDT)
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
Subject: [PATCH v13 1/4] clk: scmi: fix SSC spread conversion
Date: Thu,  3 Sep 2026 17:32:13 +0200
Message-ID: <20260903153836.373267-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
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
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

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

