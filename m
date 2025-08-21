Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D8D2E9ED4
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763435; cv=none; b=f7tL4jkfcQ52edciQ2sM4t/YKZgIv1wuksFx4rY6UmmyExMgh4ZWL+GrsgTHKVnJmeqlcg8iYLrj0Q0uisEQFT6RD4ibVB468SB+MczEsEPs0TNx+m5we3TLi4sKFjSiFi9rb79ESRrhRSh/xWQ4j5rGgTaOSQ1d2FDfh2mFd/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763435; c=relaxed/simple;
	bh=UgZqJPI03azHfavD3Y+z6reHEnmYzpFLbpmicXpKdUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AoqZZxC6/wm1vfl1yW/5szsK+w8eC/oU4m6r1bNwHecgqTHjXNPH1kvHD2l9qhFmhwANGLA2SzBXR4hgrEXmdNXMFa+c4sQMJB8O0qe3kPbzFTwlJpa1dl1o2yugbbBAEPRKYXRnnm0P0S7/RgUE0n/kiKnA1DN+1231aZ4GQ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ue0uQc6g; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ue0uQc6g"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a15fd04d9so11823655e9.1
        for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 01:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755763432; x=1756368232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XjehKGt2s9Iw0S60/WJtSyoiI8bGy2dbzPpshFFO9Q=;
        b=Ue0uQc6gMYDbCbCxfNRlT8vnqxxtmV2bCMvUb1Fh3Q+BHQf2uZg4axVRjvTQdmxYTH
         EP1T+6Cbd65juppz89cycqCVXYglTsV7cA88xU1zsy9ABai90IKkN0ryuZixMrlhYB+H
         qd9NRG0FN8bb0lRHd5Xr6zY2BsI/4iV95sSsLPhKl8wUTxZ+9Kq3u8YQ6me4+LVRfvtm
         GmO9kuZb1a3qT5GY1ZhUAdtzqbwQaS00nFmxtDZK5HP9cDuM/gkzqjq5iab059oKIH8J
         3ShP7oMDmusYkSmcP3jc+bfWLUMd2UzK0McpWpvQo4r8ojkfbw8iPitsxEJMD/MyWvmv
         2J2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763432; x=1756368232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XjehKGt2s9Iw0S60/WJtSyoiI8bGy2dbzPpshFFO9Q=;
        b=SU6kIyiLgGjUQYz48N+epCFHIRCaY7r4XWP+XPYfu+2kSTEXedAMEhsdiBX4jUPUrL
         c+NqiKNdYSiJIdBHY3HV5ObeOWXsebolBZigruX7eI0PO4Dn8fzHP0PZZypO61jwb/m3
         rATQLy3vgXp9Sfi72IyAExbYpteF4pRaEcwW4vvzQ6hq9WOOoH10G3/Cl2O5tkHo/Lud
         C4NVQ4HDEFp2WeJfN03BFFgnz/dbQaqFsF7tIxA3KMEiwIRc1gh87W0wH6R2zsIaxYco
         jPuDNw00K8rjZdimQZRaIRXRLxw0QPet9nHvXEsR7qn+UfvLv8KnVqi0U7dmWoBKxmaY
         L2lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYwSath8H7G5naB21dHTvXzYbrDQw8Kkl5qMhh/bPIparYkzfB9Voo2lI7ceJAFQdvJSpPkC4UyvU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0qNVZVLRjN6yg8Y1cZk4mLVFL6a/cLEgpTL5znUbMvUQxwPbW
	0bPqvSts0t9myH8ePjqb2D4daYcLQHa3Ib+cBZg1MpofdSPQCAJARV2ReZcYhMuFzZxyaEluBXU
	zK44z
X-Gm-Gg: ASbGncvCqRUJktWsnID0XKPGDkgo7xDEQi4OZL3ECyZJL1Iphum4bbna+A/hWCgMd7B
	AgChBvvFhaNR/lVfNHMKwA53fDvFUkQ+K2pc78yyfo3B5Hw6w2KhUDYfMBznQni0FlQstNcuhFg
	eN62Wl18Y0HnOl0Qzz8YpqYsKAdTj4WrzUjBKOJkyaF5L4eMnW/F/1hBPmcxv0CVfw0yG+G2Zyy
	OMykQVyeHFWgbdCD7jVRNlyM/pWOFnvx9br7xnShaaNy1b7lCz9JGsoGdAW0hGfC6DdeqTyts8Z
	yXo55j6E59so7N8KBybxQcJlbndBHLEG0gk5MX4cmK8XKoBcwDrP3Rc11avH722/BoxBiOWpvXe
	F/x8ikUgKlUUz1AojG2iz6doC92QGJJLAOgH0cdoR40K2G7fwSgI=
X-Google-Smtp-Source: AGHT+IHc431XLCYaF8pLi9lptfBNKV1wKndQFd3h8KySRGUYBaDuLZGptDhbLDqZIqPusEPqY1JIQg==
X-Received: by 2002:a5d:5f56:0:b0:3c4:9c59:52e2 with SMTP id ffacd0b85a97d-3c4aec25ae2mr1116773f8f.7.1755763431534;
        Thu, 21 Aug 2025 01:03:51 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4dc155b8sm17356225e9.19.2025.08.21.01.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:03:50 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	linux@armlinux.org.uk
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/2] clk: Export clk_disable_unused()
Date: Thu, 21 Aug 2025 11:03:31 +0300
Message-ID: <20250821080333.27049-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC has a suspend mode where power to most components is
turned off and RAM is switched to self-refresh. Resuming from this
low-power mode is done with the help of the bootloader. During resume, the
bootloader re-enables the clocks for the modules needed in the resume
process (e.g. SDHI or serial). After that, control is passed to Linux.

If Linux has not probed a driver for one of the modules enabled by the
bootloader, or if the module was previously in a runtime-suspended state,
the corresponding clocks remain enabled after resume, even though they have
no consumers or they were previously disabled.

To avoid keeping these clocks enabled unnecessarily, make the
clk_disable_unused() function available to other drivers. Drivers can then
call it during resume to disable any unused clocks.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/clk.c   |  9 +++++----
 include/linux/clk.h | 12 ++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b821b2cdb155..5278030b0ad8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1460,7 +1460,7 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_unprepare_lock(core);
 }
 
-static void __init clk_unprepare_unused_subtree(struct clk_core *core)
+static void clk_unprepare_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 
@@ -1485,7 +1485,7 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 	}
 }
 
-static void __init clk_disable_unused_subtree(struct clk_core *core)
+static void clk_disable_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 	unsigned long flags;
@@ -1526,7 +1526,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 		clk_core_disable_unprepare(core->parent);
 }
 
-static bool clk_ignore_unused __initdata;
+static bool clk_ignore_unused;
 static int __init clk_ignore_unused_setup(char *__unused)
 {
 	clk_ignore_unused = true;
@@ -1534,7 +1534,7 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+int clk_disable_unused(void)
 {
 	struct clk_core *core;
 	int ret;
@@ -1574,6 +1574,7 @@ static int __init clk_disable_unused(void)
 	return 0;
 }
 late_initcall_sync(clk_disable_unused);
+EXPORT_SYMBOL_GPL(clk_disable_unused);
 
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
diff --git a/include/linux/clk.h b/include/linux/clk.h
index b607482ca77e..7eb0e5eb9aba 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -950,6 +950,13 @@ int clk_save_context(void);
  */
 void clk_restore_context(void);
 
+/**
+ * clk_disable_unused - disable unused clocks
+ *
+ * Disable unused clocks at boot or resume time.
+ */
+int clk_disable_unused(void);
+
 #else /* !CONFIG_HAVE_CLK */
 
 static inline struct clk *clk_get(struct device *dev, const char *id)
@@ -1136,6 +1143,11 @@ static inline int clk_save_context(void)
 
 static inline void clk_restore_context(void) {}
 
+static inline int clk_disbale_unused(void)
+{
+	return 0;
+}
+
 #endif
 
 /* clk_prepare_enable helps cases using clk_enable in non-atomic context. */
-- 
2.43.0

