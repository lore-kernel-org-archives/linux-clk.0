Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9FA22A4E1
	for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 01:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766107775; cv=none; b=SYJA08RoJJj5UkcK5ZiJ3HPekj6jesPk+B/0Yvjm5KnkehRFdvR5YUeEUwf0I2Zl4y0QF1ZxIM4IXM7UVUhX7aq9+12mnvoTtRoO6KgSx0U07upjOKTJVnUHZjnmXd8H9GyuZjOvOy1NIP0EcDBBDhfwehV365NDE/pgbayKcJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766107775; c=relaxed/simple;
	bh=coBhJbOTPb7tUUz9onsZhOwWKYw5Qqk4KBE6SRHMqXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdAKeXGuJysb2Z/4BPTFh6Mpme6pDpePWZogEHx880PSTKillGSl8IaushbTsoMbhW99jtzcaY0xZAaQzmJsNXMQLqT7+Ih9jUrqOAWLZ0XwJUy3EFd5ELSLX08FykHw+QHtkzw7/6t3UFCCdD7kM2jIqJAo0MpUzjefzznzH30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bb0RhvnQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bb0RhvnQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a07fac8aa1so13188815ad.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 17:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766107772; x=1766712572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQga6H56NgMAhDmuMLtpPzFbNPail5D+bj27HRwKHs8=;
        b=bb0RhvnQX2whpAE7wfJmXNur9qZo0OaxvQV43bwax50hFdjt1NRSnUqbC0l2YgnSmV
         5fbdBokwXSkbBE8xwabL8YHNmKoxo6CERGKkXS9EdZa5xRcvcFedn2w9HgIbVr8BnYhb
         pTHaqxqeTdskBEhiHQZsaqhoEFoOxp1LZ9fKvW++t8vRPgqmym5GIOsTVA9qzWSxA2Dg
         hLvVymTrDLVsR+wGPMrRCJ4kfNGPslyXb4BJA4pvpaQCURdj18cymXJXCx8GuGPFhUO5
         n1d/vB99L9+8mKkhvQv7gtieDHjZ8Ig5WH7tSh++NtkEsWLu+wfrbV7x+hQlbRPNb3nY
         E97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766107772; x=1766712572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UQga6H56NgMAhDmuMLtpPzFbNPail5D+bj27HRwKHs8=;
        b=mWCnSuJkiwYq6giNpGGgQBJWOgx1quJGxUUUJpQShK67Lvx+LVW0vN2DQ5MNuTVtrj
         ZTGLcPQUTX4yqAIII1zQkUHfVjEBWu3tC3Gf0xp92yDAYAVxr3Jt8Tp7AuTcVjs5N/Ur
         KFPKuhq96FCQrPaOSXWC8bTDL4C2+KY4M9DB53RVdhSA/DNXEcCE/mfVCdqtfTvPqcwO
         6LS5kleNPA7932l5le88dyjMdm8mB8wgsdJAx0LyZvqWFdVLGVzRuNYh63w+5n1jLxzt
         p2aRTjWGevG9J6kUXNH6k1n6gXiexlvPhANOXN81dvxflDfn7GfUvGJeuy5vZB5YfkdM
         f/bg==
X-Forwarded-Encrypted: i=1; AJvYcCW8kiydOrbRB772cU70xvfVRgyZqIgdcp3wvVPZsW/E2W1+Me/+I5uhFK7S5NUTCFIF90Qje8bHVI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLkNZYsCleW+GDwalB6quWl/GfeUDSTm+R8VqGgVb/cbvjWxdd
	sYsQYhWST6I4zJLnqMWnnnZvo+ESsoksw87hhyeSzq2cDPmS0KANl2eo
X-Gm-Gg: AY/fxX4WVjKTK4S047C+il3iuoD0EvBuUkpol9TnFtiDFDxNH72tJHkT0sEs7aXZNMl
	TBmtlOVmTAR73N+1GTtqdn2yhTRn92TsdmDlovXK8DBkGJCMIUkZZvFrujHbCCQQEgi9xLbp0QP
	Y+6LKou3z+gjTqDzFmrvJiY+Lm70xrwt7WEIcfhD/VH/uHzR+8E6/1aDJ0yUPHj4E7oJ7JHJI7F
	SplvECHaaDgQPqTl9F9AUl7cQoNA+NSWBERW9axXR3sx2P9nX8de8tSPZ9P/PG0kdH/+/MZtb9C
	gchw7EQeNA9i6jk23CE2w6WFCSYLbVDWM92VtPc3uYMDUAEuLK8yc4U5koE0WXwJB6auy7oNQ+9
	gotuHedNEhan9JYQ5dnNQPx+bByKoSwlITD2jHqASaZ98l2LBSMB88IZTCDdwk53Cg/Xq9Vt8/e
	d1XFGKRH15WA==
X-Google-Smtp-Source: AGHT+IHMJ6kEWYKA6O5Q+cLJMQcvpcOIDvA3plPH9xUduwHOUSXGLhy5v5hS/sYcHwSl1ox8HAe/gw==
X-Received: by 2002:a05:7022:b92:b0:119:e55a:9be7 with SMTP id a92af1059eb24-121721aab58mr1352297c88.3.1766107771841;
        Thu, 18 Dec 2025 17:29:31 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254d369sm3053035c88.16.2025.12.18.17.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:29:31 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/2] clk: spacemit: Hide common clock driver from user controller
Date: Fri, 19 Dec 2025 09:28:18 +0800
Message-ID: <20251219012819.440972-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219012819.440972-1-inochiama@gmail.com>
References: <20251219012819.440972-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the common clock driver is only a dependency for other spacemit
clock driver, it should not be enabled individually, so hide this in
the Kconfig UI and let other spacemit clock driver select it.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/spacemit/Kconfig | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
index 3854f6ae6d0e..3351e8bc801d 100644
--- a/drivers/clk/spacemit/Kconfig
+++ b/drivers/clk/spacemit/Kconfig
@@ -1,19 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+menu "Clock support for SpacemiT platforms"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+
 config SPACEMIT_CCU
-	tristate "Clock support for SpacemiT SoCs"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
+	tristate
 	select AUXILIARY_BUS
 	select MFD_SYSCON
-	help
-	  Say Y to enable clock controller unit support for SpacemiT SoCs.
-
-if SPACEMIT_CCU
 
 config SPACEMIT_K1_CCU
 	tristate "Support for SpacemiT K1 SoC"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select SPACEMIT_CCU
 	help
 	  Support for clock controller unit in SpacemiT K1 SoC.
 
-endif
+endmenu
-- 
2.52.0

