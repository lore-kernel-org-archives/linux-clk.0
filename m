Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F323E3170
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 09:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097234; cv=none; b=fE3PfFXmk0SiGmd+V/E9fca+ktdWYueWg22gzmiYCF6VbA++D2MmBb9mZeXCNlP2o2PBLzW2/AysdeFLDj0N/lXzV5Fw342U6XIHkfzbk2KXc8j7aBSeMM+Uj1IHg6u/MZOnzM6iyzTwW8vsYEE1W/9DejtxLe7TFXuXVXEWuTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097234; c=relaxed/simple;
	bh=6b027lnRAr8KRwcG7PUFiOkdz/JXOW30rr9E/qvr1vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okrbGfq1I16+PTDq9iJWlMgnlETMZui5QraJzAQsVJ38FMtyiGL8G2wOJfifiqgTXEBzQ3XNeZAjX38g5FaTxWvsLP2bgl31J3kapXiL6dBbChmwHqgR8SIXQzdicOuJaf5Dx4euvDb9YwyLxTRBpIKRLbCbQFo9S60F+aKt9Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSqfVp4A; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSqfVp4A"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d146705b4so22002365e9.3
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779097231; x=1779702031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YsaSBVnjMP0jxt220HLbHWP7RzYvU7nxpFnM1leO/+8=;
        b=QSqfVp4Acu8e/vfpdhTjAMhK/iuLYzCPS8sNuqWSDAUe7me95sDCAgD7uYvDpyrQNz
         GHxeGH60Rjy28vzEFdiANCn97QsNJ+cjkU3ZjFZZbn+6GyIoGHGgYdvE6N6VJR1cxm2P
         UMmdlfQ4X9JReJqRGqh8KhYYhedc7UC6U13hOV4K+6MVQv5aIQMRsyIo4S+MVjO56sdc
         Z+MZuY+kbv9HoMINbodpPthta+cKJkfE9gvTprhfobJnlz+TpoHS624GAlL3eF5t9Kn6
         +3sxf4v2qbIQPwpN8n+/RRZS3hqaQxKrp1zoXyKM6LXxuZkWR2CegnlYESyjBcqIIRHs
         4yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097231; x=1779702031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsaSBVnjMP0jxt220HLbHWP7RzYvU7nxpFnM1leO/+8=;
        b=cybOVpJCU3wCkXWKrlsEMIZJl008EHR38eva+La6PjvEe2b/ZHUYe7sg3NWhZk5C2O
         0n93Rs5Nazpbw/epMtXNSoDqGzhEEgJckGkvi350E5Ta1rY9VVa+bqNOXz0lSQzIjHbd
         hSgRRoVNDW5W8s/zD3SfFCkf4o7g827S7CrxD7swYQf2aTzOF7GBH///u/4jg09+lT+t
         bDz8xlUs9239NshjcR/aMAPfOkUobhrSVqtOojBCCf3QoFU9ZyUp5Vrw3qwdgfx50ifF
         yVlDBB1e95d3atlG0YIhDuCvJ3xtsjNm22iqBhMjeAzqKGDsahs4Py8ruVVe0xfgCH5I
         P6lQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Qnb8KMEO2xPJwMM3a+Pn4BRvBLMlOocr4E1pmcH92Ai+3NcTuMwfyN8vEdKviz88u/+Kwsji4A9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4qEEIhu/WWB/VsszEKiZipflB04tQDjvgcxvFIAppGEChPuqE
	U8R56QW8dXUKqHnt+a/0UEdd+lfGglCqfQabFb2kYdMqF6fidMu78EKHrYUv3g==
X-Gm-Gg: Acq92OHoEMiPq5DNGhaHNEhDEG7cxhV1/YOmldtf4feDmp7CFOzEdrFEvU+l6fYQwdi
	YnxeD8cXLvEhH/8w4uMnQ0WcTbB1rhc7VQ3OqWA56znh0WGxTCTYksJFoXFLtVA9chxdbLXOolL
	ARMpt18jMNPRmH2Z09JRuWkp4kHx7Zy7dASz3FEugmx2sAEtxrZuf1UFraw0uolbU/8Q6H3fBS3
	dlpQj6Pw/Kzh9d31WkxNjIIr9OZhoGcHJ9nwQZEuZRKsysQSrmsZQXJCYZYc7HnjoAws/EYNh4g
	IM+2fjS6F8kJVP7qz4Em2mySJWJG7rzRpyAWYDwPEeciQGchHIe7Iu5gOp9UkyCjG7CjU0YT5lp
	9z3peVfPizLPPrddLzcnNtTzN5J2NbZYV76Ukstr3Oz2DKTil2Dsb1PMFuX7qcnK+zOjt7rHzg0
	7s8zp7E5SM1OYoeL+5NOIru0u/8Uog3Js8j3Oh79q2p1KsqPoPnALYGgh14EU=
X-Received: by 2002:a05:600c:a08e:b0:48f:e230:2a23 with SMTP id 5b1f17b1804b1-48fe661ee60mr213820185e9.30.1779097230476;
        Mon, 18 May 2026 02:40:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:cd4f:119b:90b0:3b9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm127975135e9.2.2026.05.18.02.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:40:30 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/3] clk: renesas: rzg2l: Unify SAM PLL configuration macros
Date: Mon, 18 May 2026 10:40:13 +0100
Message-ID: <20260518094027.95700-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This series cleans up and unifies the SAM PLL configuration macros across
the RZ/G2L, RZ/G3S, RZ/G3L, and RZ/V2M CPG drivers.

Currently, each SoC family defines its own local macro for encoding PLL
register offsets into a conf field (PLL146_CONF, G3S_PLL146_CONF,
G3L_PLL1467_CONF, PLL4_CONF), and the driver uses separate decode macros
(GET_REG_SAMPLL_CLK1, GET_REG_SAMPLL_CLK2, GET_REG_SAMPLL_SETTING) to
retrieve register offsets at runtime. This leads to duplicated logic and
implicit coupling between PLL index and register layout.

The series introduces a pair of shared macros, CPG_SAM_PLL_CONF(stby) and
CPG_PLL_CONF(stby, setting), that encode only the standby offset and
optional setting field. CLK1/CLK2 register offsets are then derived from
the standby offset using fixed +0x4/+0x8 deltas via new CPG_PLL_*_OFFSET()
helpers, removing the need for separate CLK1/CLK2 fields in the conf value.

Finally, the RZG3L-prefixed STBY/MON macros are renamed to CPG-prefixed
equivalents to reflect their shared nature across SoC families.

v1->v2:
 * Dropped the dependency from the cover letter as the patch hits next.
 * Collected the tag
 * Updated commit description for patch#2.
 * Fixed the macro RZG3L_PLL_STBY_OFFSET by using CPG_PLL_STBY_OFFSET.
 * Moved CPG_PLL_STBY_{RESETB_WEN,RESETB} near to CPG_PLL_STBY_OFFSET.
 * Reorderd the above macros
 * Moved CPG_PLL_MON_{LOCK,RESETB} near to CPG_PLL_MON_OFFSET.
 * Reorderd the above macros
 * Dropped a blank line.

Biju Das (3):
  clk: renesas: rzg2l: Simplify SAM PLL configuration macro
  clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
  clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed
    ones

 drivers/clk/renesas/r9a07g043-cpg.c |  2 +-
 drivers/clk/renesas/r9a07g044-cpg.c |  2 +-
 drivers/clk/renesas/r9a08g045-cpg.c |  5 +---
 drivers/clk/renesas/r9a08g046-cpg.c |  7 ++---
 drivers/clk/renesas/r9a09g011-cpg.c |  7 +----
 drivers/clk/renesas/rzg2l-cpg.c     | 40 ++++++++++++++---------------
 drivers/clk/renesas/rzg2l-cpg.h     |  7 ++---
 7 files changed, 28 insertions(+), 42 deletions(-)

-- 
2.43.0

