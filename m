Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909FC1D54FA
	for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988051; cv=none; b=rYh4DQ1cUcyeCF+0uO432JifvPng9SEq8fykLsAnNdArE84ImEGN/hDeo179v8Za6ku4NY5mQfGm4hNB8SxDi7LplJVMRDXPXQUxDLmqNkg+TapoLP6F+UbJ69TvdVEa59DkK0YQQcQRe3xbJRX67MHOSRrFgbvilv4Gz2CLKWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988051; c=relaxed/simple;
	bh=dlNXHuUORBV8qyM4a+/YpF7hE5uuPIDHKUaPv4eKnS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V4K+h42MULtZRJ8sI4i6tZgTXvzRbQXyNIA+Ql1lKMPqc7VFj4EBZi9r0HklX55YG/baADJuwFThs8ycqu20mF5PnxeloKtgKyeZBaxC5yFgV2e5GkKndDkyFRDWfPToCp4oELutesX2h3RVGRUuYg8y5CwMLRszhMEgKX2WVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=eNWgBPiU; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eNWgBPiU"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47690a4ec97so20003371cf.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988046; x=1745592846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpNDOPRCFGOfXdIE71HVXdbzEYefPrTNzqdoa96DBP0=;
        b=eNWgBPiUZBBGywto8apaQKwi0lvLeSL9o8o75LMShhgWvF7u9JpTMdOij00XXoRr+Y
         2YEvPfNzv8KOURvdDiyTu/pIWrX4o95B+wENzOQBgCFIH63/p0iImXAMCJuR36JamtIk
         9G/K6VapKRl25yzpMIne3PAKSCFZNP6hjYK88sBufFg1NurCtfdyJZg6Rjxn21X8EKzV
         /sQYwA94VV1kRg9j2f96mykISRusQoeUck0aKPmE1y6uDl+0sEjN6SVggHF92NG8qbMq
         sBrUa+RVBaLmgVktiUHM0o6DM9nx1k3t/5JUJjHwKuSDZsmguusYhAlF9+xhY445he31
         BsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988046; x=1745592846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpNDOPRCFGOfXdIE71HVXdbzEYefPrTNzqdoa96DBP0=;
        b=eAGUYP+2ZKW4hr1jd7k1YGqfje6Ok0Y9cMa2aJ7k75/W4i8Jbeqz8rG7VXnbMIsY5A
         eiG/mvouX8kJ5gfIRlZPKwD89BGKz2jkRFjKKJCeP/qrCmhnfZFG+TtApvAHyzFx9Wr6
         PARXcll5joF9V9ougZY5U0iknCC9alJkSvaLRdlrC69mgvJywy0RuDw3oPy/ohwTDpLm
         4arkoI8fU245//8fHNBIMCaBCNl92NbZ6MJ81QwcKy6MsywXj+ROPNI4VjXD9Se6/hmp
         5+wB+9zKc50t10isQTQ5JksalDoRieWDy8NBvcheYwqiIN/nzHNEquOXHBR0ix9Utr6Q
         d3cg==
X-Forwarded-Encrypted: i=1; AJvYcCX9Alfad/85wF/qxcO9Tl1ISAd8NSMOwXyHuh9SuFaSsULIyL8fC+WPHc8AuRgrsMC4Xq3MpfKju6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxObMOt2SpfTpo+saX4MCe9u2+VBWsDeaeRs3rXSLsgGgLknsU+
	n6bL8yFo1YWnZMBQVhdYzXGRYtws2HwfETtaS6SK59zak2nasfIy0feQagYdza4=
X-Gm-Gg: ASbGncvuR2YmUMyPaXMWo1JjVZ18zZBob+2JiOr8ggOHLiy3b3gWQ4zCAB6EUoipDCN
	yeaPrYRdzM6e+zDUcw4lltrsVNyy0x2f4w3nQW5k/nykHfzcOFMi69r2wUwdSJuTqf8NutY0kmn
	+Pdxdfh5dIW4xRbSTTx2d1sI9k2NrHv27AhUbga3Rm908XMVuGxC+463RIOZhaJcNNt6YZqV1az
	Qe66BE7atqzopDMGpwzqT/VqwGRDMkqUdljyCndUCmt2kTBdz9FwcVEvrdbmCO9nGT0h6N8ibAW
	AbFtBo1eWJ6VOtnuny8oaSA2/ZKOus3wXuSMLj+rPKi2mlYR/9hggpatEQA0ns9NozJC/oz74B0
	xyXVOE4tER2C6C3WZUoUdmITV
X-Google-Smtp-Source: AGHT+IHiEG1eSrMtmu7ABawgdFJIO6lV2wB6Q3AXU/kHDB1pdQpbBxefqDVD369wLGK+b6k5u7CG9g==
X-Received: by 2002:ac8:5a92:0:b0:476:7327:382b with SMTP id d75a77b69052e-47aec396ac0mr52829231cf.16.1744988046352;
        Fri, 18 Apr 2025 07:54:06 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] clk: spacemit: add K1 reset support
Date: Fri, 18 Apr 2025 09:53:52 -0500
Message-ID: <20250418145401.2603648-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.

Most of the the clock controller driver that Haylen Chu had out for
review has been accepted (at v8).  So this time this series is
based on the "for-next" branch in the SpacemiT repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v5

Between version 4 and version 5:
  - Added Haylen's Reviewed-by on the second patch.
  - Added Philipp's Reviewed-by on the third patch.
  - In patch 4, added a const qualifier to some structures, and removed
    parentheses surrounding integer constants, as suggested by Philipp
  - Now based on the SpacemiT for-next branch

Here is version 4 of this series.
  https://lore.kernel.org/lkml/20250414191715.2264758-1-elder@riscstar.com/

Between version 3 and version 4:
  - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
  - Added Krzysztof's Reviewed-by on the first patch.

Here is version 3 of this series.
  https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/

Between version 2 and version 3 there was no feedback, however:
  - Haylen posted v6 of the clock series, and it included some changes
    that affected the logic in this reset code.
  - I was informed that defining CCU nodes without any clocks led to
    warnings about "clocks" being a required property when running
    "make dtbs_check".  For that reason, I made clock properties
    optional for reset-only CCU nodes.
  - This code is now based on v6.15-rc1, which includes a few commits
    that were listed as dependencies previously.

Here is version 2 of this series.
  https://lore.kernel.org/lkml/20250328210233.1077035-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Rob's Reviewed-by tag on the first patch
  - Renamed the of_match_data data type (and one or two other symbols) to
    use "spacemit" rather than "k1".
  - Replaced the abbreviated "rst" or "RST" in names of newly-defined
    sympols with "reset" or "RESET" respectively.
  - Eliminated rcdev_to_controller(), which was only used once.
  - Changed a function that unsafely did a read/modify/write of a register
    to use regmap_update_bits() instead as suggested by Haylen.
  - Eliminated a null check for a pointer known to be non-null.
  - Reordered the assignment of reset controller device fields.
  - Added a "sentinel" comment as requested by Yixun.
  - Updated to be based on Linux v6.14 final.

Here is the first version of this series.
  https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/
*** BLURB HERE ***

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: rename spacemit_ccu_data fields
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 330 +++++++++++++++++-
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 +++++++
 4 files changed, 482 insertions(+), 23 deletions(-)


base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
-- 
2.45.2

