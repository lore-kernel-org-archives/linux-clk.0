Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD44A25742F
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269393; cv=none; b=doY8C9La4RFVDbhTTxB3bqQNHSYSGuzITmTSKR4NoSOz8l+0qbMEbyJrC7zNkSx0FoCaGw9C+nLVFZpLrTWpChtZisuVQ+ykO+UweV1t91TTf9Vw/NCjRyNegn0lQ8qRTDKv6iW2fwdFdXX2kMCEGRbJ1vgjjBHl1vneLGgPuTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269393; c=relaxed/simple;
	bh=EjAMWc65H0NBHcJrRF8ZPun1V8oREyg5MoMG6na1NY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQpB7V/4q0DYBrnxNe+vh31mGGrJ23lsMBUvWsLOHstNXiWJXSBUbmvmRGB60cdLs50ZMebCELHNSSw1XVnGYTw+LrGAsYaLnxZazZd0Etx6jQz5i30c1KNkV7SJ5TR76EX5Qxo06GMTlmZdZKwVaWEiR7FbgCr8atOOSnhkBZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSmnGDtz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSmnGDtz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so38059355e9.0
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779269390; x=1779874190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJXcLlUsgEhIc4w3TLsV9eUQAnqp7oDifuEz48zVFFQ=;
        b=RSmnGDtznFgo4bDc0IOGhB/U0vb0Srz6uY4KXU2iAk94w2j2woqd27Qridu06tEREj
         lMcZXqkk6/e9ZtS5RZBLh+ZS2e9ayD35Fl1ZTWFC6zVjOw8rAcI4Hdzgn3CSnI6V4+Yv
         KJo2COOUTe9f8dm3+QmV+LqPJfhQPV1yXw5gvlfaGPnZxv3yezGjxLUrDCmVA1STLagS
         /NY9utkxaQ+A3uLKHPxNq9kvl/cVEs+vy4uUw5jywPkg86KlWOISeGFz/sd4IvIdVU1o
         R4aEgjgOx6cjz5eZFmthRtxP/px8YfxQ4o0ROjTOZSclDZfoVzZYU81DajoH9JJuCl6z
         VAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269390; x=1779874190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJXcLlUsgEhIc4w3TLsV9eUQAnqp7oDifuEz48zVFFQ=;
        b=WthyeNIuGR+X2iBFYECECz4YHNyusbeyTzXnhrPss05qKspp6i37QvXdF4tJNEPzJy
         eZLYSkkDydxp32F4ruxHWNIa5Dw0VGQocgc5KGdDuTK9N+2rG+4/Xqdv66iJeIoV4wqU
         iDXhmxQ30i3TD3OLWFmGYKksQVj0N9AZXypKLoWsVhy2zcRfg6pgy/oOQSiMVANLV8o4
         laCrwjBzr8tjlcWHABBDG2I+p8EoY+m8kamyzf+OQ9vOJ1w4Lh/1jwwlBoL7IK/1lB9K
         b/Zua9RcyaYKUhwdB5rQRNvba2pK32g02Y3arqmlawNtoKMK6s5uLPkOFOfnIR3AQvpe
         eAyw==
X-Forwarded-Encrypted: i=1; AFNElJ+7ede2TAQ+a0/+cRP3jFUOlE7MmtXL+C6AE+SXQuySLHzI5oChMLqpH/shBQ/CiIswOmxCBL9pD+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPTosqcG361jn6kfHwQYAPkmsVw4TbckgQVI9msQK9botF+TF0
	DE5H2B5xeO79uAvIqzXyzGFVOp8t8r8ExWtVbW+inIP3YZV0nZUlFpja
X-Gm-Gg: Acq92OE8TNr6sEk/ClkLLye9gH5zwYhmHovsmHn8psO0we2zlF+3O9Vo0oSXJr8y/LB
	fSHLoITd/wqzp00ravPq0Giku6PxMawxAOiF7gR0vw/3utpbE5BwIQwGQvEXoxIg6Ss5d2m7MZA
	lmfc7OYwAuo9sjiLhSdVWtbEsupSyRRSf6tnYVOIdukCjvmqAPuXs1CoOtmyzJ1Hcvi2YMd7Ufd
	UHXcELeGQGqAF0ZDNjbJ63aLeEVgWEjzDF72JuutVbhVABjIBVtN5r6HWhw0+1QKhMrLLJb3Jcy
	plTFAk/UKVVDWzs3NTauUoMx+h8ox6y389P/4aCg7w/9chfBkpRztp45oqF+b23YABqh55mwuk1
	MpLDGz9dJws4widMY6Ze19EnpXCqOnbiBRw9FlRYYnYjZLHvyPkLc2gHq5CtDD3rm6mIWebV6VK
	oU7jPCll0RrUHVtUylTeNrwCFppcpu9Jkb3yzZfIZsAI1CCh+8PMG4HxOVHa3PjJUYVWIuvXIB6
	hcCMN6FDNKYDU3qtCfPs6M7UWGVcMSK2d9aqvJyN+lANgSy
X-Received: by 2002:a05:600c:1512:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-48fe60ecd67mr211947555e9.9.1779269390015;
        Wed, 20 May 2026 02:29:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00bbe4sm126455775e9.12.2026.05.20.02.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:29:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: rzg2l: Rename iterator in for_each_mod_clock() to avoid shadowing
Date: Wed, 20 May 2026 10:29:47 +0100
Message-ID: <20260520092947.70596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Rename the internal loop iterator variable in the for_each_mod_clock()
macro from 'i' to '__i'.

The current naming conflicts with local loop variables named 'i' inside
code blocks that utilize the macro, triggering compiler warnings due to
variable shadowing:

  drivers/clk/renesas/rzg2l-cpg.c:1494:36: warning: declaration of `i` shadows a previous local [-Wshadow]
   1494 |                  for (unsigned int i = 0; i < clk->num_shared_mstop_clks; i++)

Using a unique identifier for the macro-internal iterator resolves the
shadowing warnings globally across all macro expansions.

Fixes: 3fd4a8bb4b63 ("clk: renesas: rzg2l: Add macro to loop through module clocks")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 426e93dc7a98..782367a3d98c 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1402,10 +1402,10 @@ struct mod_clock {
 #define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
 
 #define for_each_mod_clock(mod_clock, hw, priv) \
-	for (unsigned int i = 0; (priv) && i < (priv)->num_mod_clks; i++) \
-		if ((priv)->clks[(priv)->num_core_clks + i] == ERR_PTR(-ENOENT)) \
+	for (unsigned int __i = 0; (priv) && __i < (priv)->num_mod_clks; __i++) \
+		if ((priv)->clks[(priv)->num_core_clks + __i] == ERR_PTR(-ENOENT)) \
 			continue; \
-		else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + i])) && \
+		else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + __i])) && \
 			 ((mod_clock) = to_mod_clock(hw)))
 
 /* Need to be called with a lock held to avoid concurrent access to mstop->usecnt. */
-- 
2.54.0

