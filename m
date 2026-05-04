Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0D53DE420
	for <linux-clk@vger.kernel.org>; Mon,  4 May 2026 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905930; cv=none; b=rpeH/NEsowRepRxsbgSg55yTZVYXyTOUxgMe7mnbgyJsU4WkMpAVcq1AiLg9+cS1kFPAVVYNXRbFkunuYYrN/fyg0GaDSDGYQvCdj8UF8luZFM2/DM5SzCzLyaKN+oJuPNhQD17ZpcOnqp06q2S4K2QQ9p5G3bybMRaNu+pzthc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905930; c=relaxed/simple;
	bh=ORAOwSOu1au513HAgD2ycO0jYFY23lld5AbZqARyQKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mHr1dIDki/J0qqdXT70hYF1wAXhzE9QpXKYYNb5iRY66vPnYb7qOHJb/65S1nb1oGMVv9LX4zWOK6Pdj/bI/cwV/UzikF9lF8sqD5lyO7LGwu42/fdqPpxHiNNRh0og0XZ4TyWiIkUlr5EEWvBE9pTXUZY3lW+W4N+89A/k9SsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oW0lEQSE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oW0lEQSE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44a786a9a35so1973756f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2026 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777905926; x=1778510726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EiyJE29nUoz3rJ6eRkS9mylfjXne22lltijPJ26O8Gw=;
        b=oW0lEQSEpg0UhInJ3lwOmHZIlmzzMWGqYcr6fC6qe/FmlahENJDSBDAPWPj1uy1+Cq
         E1XqidzWqM1EHsuMQj8x04DVXKUL1TBzgwW0l9XcDlWc3fFX6IoP197sHetWqIQI+bWb
         BiHoZyHH9NWjwu5IFSTnQDk4e+5k3WNm19oLhU4tWUjxg3sqlwEGBEnTAR4uezfoRLJ+
         O4caNj42WlyPj1841bnj0yCt2acCV0PVT6Lol1HIOB3PWjpa671O0MOg4dCbc7SVgOmm
         yVOq7haEgxAF/tZJ0JbuMLBuyXS0lzjUrns0ZxcauhDeI+mLs/aMpZpJh/y21GK6mKLh
         Y3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905926; x=1778510726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiyJE29nUoz3rJ6eRkS9mylfjXne22lltijPJ26O8Gw=;
        b=bq9A0PPy7xmqWhnQC8pZ5c5RgeOb6S63JRjX8llT/f0omGplQdUSdSNjDNYH94WCKf
         7dbH4jYPeayhmugipcx+UdHYOCxB7u7ySjE6JnsMpfihwJDKvFT31rqTXuyZ7VGJw79/
         0sWYiUnCE2WGUQxQyO2XhZrAatPei2KUNMzmbSAhnEdNFlspMZbDyVsgt/p4zLKUJsc3
         E2iN6EbeH7fCJp1hNguxdPT7829H/2gLVMzZa9qyfm0E7a+w/WsDpWTajEwLOzPdlP8X
         v/KTtYHBzzhmJXQtC+N+wwZlkqu2tuyyGx+pMvhiQPd4TFYsyGL0y4e+yUUd65us/WPQ
         S5FA==
X-Forwarded-Encrypted: i=1; AFNElJ9+NY7vkadFIxFtUoFKgVUljA/8E7dr9HWTxoTmS9hnPBU3PboYXgbVu1ge30Y24p5ZYDUFJNX3mA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3PUhefiBAlHTJGDgZUGJg4wYilyFfiAcvqgJBc0Chd319GQdy
	uHjo3b/iRTv0Rc0ySdMQRYE9UnZGkOSYHz+8AFEwF3nnr5VUOy4O4rip
X-Gm-Gg: AeBDieuTNANkSBfXQEzORRr98iy8qhB/dVFmci3LsCoD4VkiRlv9HdvOrI4aHkeu23F
	0u0oYKETnaoRlm+4007eWUL4L72KaXmGBgaiyZi3QYJtQLYP0/6zhvKeN6j6SgY42Q4Jpm+0AUq
	xbGTVq9HiCupie1TlGE2rWzXXwmSZNkmTY9Im/6RxsWagkE+UDWfhNMJtUKLMIBQiXHmWJDe6Gv
	O7O83UuDKE7fTHhv0CWehBP0efPTXPMKUq7t7wmjrg/hDq4JUSD/NkoMLjOfzFKzZS8j57wolAv
	FpJ4AMu4eneuKigELS8T29+Vv5sUbVUYHCMMmDLMg62dDStB0MeCv7QkbvKDdrpvDjE8Zx4ZfFy
	i3cco49J+U0HSoy/yJ1LEFTxBEWwgWoBOdS1FTa4pD5OgrVN2W5i2jcecB1JSBpvua8+3Ou6Un3
	Fz+e8DGJ/c3gaTmub7XxAr8pyXSSAnYu9ZeNCORklPbBfcRoiRceYyh6aC1Mk=
X-Received: by 2002:a05:6000:178d:b0:43d:773d:7908 with SMTP id ffacd0b85a97d-44bb65df88fmr15957594f8f.32.1777905926121;
        Mon, 04 May 2026 07:45:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6444:b23f:58b2:338c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defa6sm24371239f8f.24.2026.05.04.07.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:45:25 -0700 (PDT)
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
Subject: [PATCH 0/3] clk: renesas: rzg2l: Unify SAM PLL configuration macros
Date: Mon,  4 May 2026 15:45:16 +0100
Message-ID: <20260504144523.153906-1-biju.das.jz@bp.renesas.com>
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

This patch series depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/cover.1777562043.git.geert+renesas@glider.be/T/#t

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
 drivers/clk/renesas/rzg2l-cpg.c     | 41 +++++++++++++++--------------
 drivers/clk/renesas/rzg2l-cpg.h     |  7 ++---
 7 files changed, 29 insertions(+), 42 deletions(-)

-- 
2.43.0

