Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE7A4028DD
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200125; cv=none; b=rKnx76asZvU2fgQC01eykrxtUX5hDUWlSuMEx55eOfMC4wr6HbYA7NezSyKccuxPXk2xYAUKIeHxPmekoFL+BLv0rzZCOqb9Lsxy6zGSAzhC6iy6CKcvJNi0Ocwuo9PigKdlB3oBjiWqGKfUGdI2CPHLt3kCC0RU1altye6Ar1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200125; c=relaxed/simple;
	bh=PGSkh6LvZVlA0BnCf3uh1OaxJ8WJjnqLWqIGmm6MjzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UTWmVQyAhx5ckm9YwdjPrccAZtOTReOykH3+ra3HUkXWRr5xTMqh1irGVp0zQXFTwo6xrGTw6g70n0wDWRzLy15HPnV5XTywRH4sNMr9LebhkLMtDHf4rwAaCF6FWmCs/EqlHok+5ys8nuQQ4Gom6MNXIeJF5oZgHt+Z5CvCtnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrfR1H4+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrfR1H4+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48d146705b4so39558205e9.3
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779200122; x=1779804922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RxATEsy8GcAphXScChSyablU/KR+6BWc5WdwPA2R0s=;
        b=QrfR1H4+9a3Tn9cvEnq34YdhPrtkCLm5OaKXFab7+ADitJ3DgcEzSMB1TkMEC4kfta
         NbzPrvLKfGwUeAU0uHi9QeKPuGmFuzLOYINE0LRLoRhA+2THDf/s1VN3QzoMtYW+/Bg+
         /K72sZPjYOR7WfW5D3l64aTdiUIHSQyIpOBp7NXaw2WWc1Xk7sufuN+xkAPE4HtuqdNf
         wWk0TecS/BmDTQM59zHPYezOxlWZ9exraAybNQCp38tH8GTvWlbE2/Kujz45HPVNK9yz
         U2+A6wwWhCWY+tkmGJ+sTvA2AIrSMPgeg2IN+z5HzFPFP8RxNvLa+7wsIHxRGokeQ2eV
         NO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200122; x=1779804922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RxATEsy8GcAphXScChSyablU/KR+6BWc5WdwPA2R0s=;
        b=MAaNWjch9RjUso4lFK5T498zy6VonUIVewPVQahkFSeYv4X/0x1+DLK7JJ6lV+7uuG
         YUDDbUJap5V12lnwatLdMpZ24iA94yDEo0XWzBUgu1ITiNqY4gcERj2d8S1UEX401/RH
         4JLw2PGVGk89qZEKxSVM2PaTNzcjlbRvr8cyzTLQxigqmdApU5JY+g+JkBxvt1IosxDp
         +HKAmbOGlNrDEFVwEeyqA5Ea7Xo8ey6nHKecSL3Mm0hDTbHSnPINE/j9v4whh/h4Fe3o
         UmhehoYn6tp88d+RyNTqLNL9O3RKRxJxVbqSWVSxHVXJmB99/Blnt3Gqe3wYq9Fj6Q8I
         eLEw==
X-Forwarded-Encrypted: i=1; AFNElJ+iM1QZsk9A/SfAAc6LUQ93xD2bzLL7JYRKc+Ci2ZyJ+yA9TrUjIP0PhfJjnylkxnjEK1TYO+b0yFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB/R7bhjb/y/N3ykwvakj8tsuKofX5FzLFnAxjoqEEpJi96bft
	dTlhJgknnP9Z5cMW8REXR4G1Ae45YxRlMb5GM75ZAmJMmuPyAYkGpWba
X-Gm-Gg: Acq92OEdjUCLhmSuUDPb3fSfRwxa7N7VPGNnoo6DeVRL78dB9D3N7+Q+tb6M6Gb17eb
	273cGrzEzk2TxCblUYwxlbJZ/Fv/Tu3QyWhBgVDrYqyu/lFXCqR/POUzrOFdLhfgZcVi3UczReL
	2fSnB18xl3Vy8S3OWMuQGFhW6SCsnowU0WvKt3GoASA0QqgfED9O+TAeZL5sfpjGTcSTNI6Ot0d
	KuwLlPwM6r4MD2Q8ENT02DUBLq5sfMcNRr6LXDLBGIJt7wcGR208UFAVslHjYKXGPp/OgnoGBIM
	aQXnlYK4KEnkfFzRfScfkQdozmOY3bjvAJph0SJpglTkkvRtph4/Z0avIJKnjwiOXuvtRx47Ys1
	szzE3mLvJ/RgyiD7p7d9BalyYiWGb5htt7NjkEXPGzGzzA7Q8Y5g2FJ/ZeDg46j4RRnEeVrP6Hb
	F2MLlYq9kIClgw1CTGF8bJIjW5VCyg39OFDehbQNR3wsVT847/
X-Received: by 2002:a05:600d:b:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-48fe60ee64amr233439125e9.12.1779200121457;
        Tue, 19 May 2026 07:15:21 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm557912205e9.1.2026.05.19.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:15:21 -0700 (PDT)
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
Subject: [PATCH v3 0/3] clk: renesas: rzg2l: Unify SAM PLL configuration macros
Date: Tue, 19 May 2026 15:15:12 +0100
Message-ID: <20260519141518.389670-1-biju.das.jz@bp.renesas.com>
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

v2->v3:
 * Rebased to renesas-clk and fixed patch#2 conflict.
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

