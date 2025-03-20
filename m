Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EEE228CBE
	for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 19:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742499896; cv=none; b=Xr0Kmt01KXaysG66hgqS8EB/EVwAxK+aTp4Ub8V8vCfi+ms6g9V2DRklsZHNN0R2f21p5QbWwOpVP+J7JFq6zMSdjXg/J4lTYn6Pg1quwR76bOI0tZbypsGXuzG2mC0KMDlSzD8pCuWqbFZX8uT+S3/ymB63M8uyu7LmVrUrvLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742499896; c=relaxed/simple;
	bh=zrHP/gmG47t4vvKq7gzmaxI06hPKcdUhZERfPB/kMcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Legdrq8qjWNUTqJL3i/X5cOceCk2ucihRRnrz9P6nuWicR1n9C6uoGcu+cyAL7w2FhaGh0eMJEuNsatqJFFKH7OIldE5h99KoSFCn/D+va9jEMZB+DExKfmSnxWOcOc6s9zi6q2V6bSnHiAb1xRJuGhMUF+alZ+TkVo8Wz7ZLnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WigfZVxa; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WigfZVxa"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-854a68f5a9cso90186739f.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 12:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742499893; x=1743104693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AW49rekhn13ov0fYjoV+6+dgXQ3GIdWnPfM3LeEAqlk=;
        b=WigfZVxa+Sc2C6oPQnyhmefRACIjgmVqwXmNJkP/WM6DR3pZx+dOBi66PcaL9reWZn
         Mdb+iOSMW10iLZ/2ZX/oTHU/oeoto9bmWOsv0Im0gaPpgLYfceZs4SxD1a/plAxR2bpt
         amz9FLyqlw36EVZxbkS4OwyCNHf8Tv9C/x4CSIHrlv11p8OHN7CLNdGUCPB7ZWivSNqI
         nmxja7/cQ4Z9eXvxEdyus4Ei+49JnAbczdnzoXknEjqodCHp9YHF8h17F6gplYvRteHv
         OaJT4i/230EI/fzmYsHdE7tALvLYo9xBkr29UuNY5NDRtg78TeT6eYp39SoP/AAvjIEl
         Dmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499893; x=1743104693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AW49rekhn13ov0fYjoV+6+dgXQ3GIdWnPfM3LeEAqlk=;
        b=QcmaneBcAmU/HMwEZZsLrr2JB6iS3eTbhRFkNNKYQS2+DDZJ8du61Oyngeruc/252v
         CUQYTgU4OeADA+jfcUSwQSXiSB+3ToZ06AMc+d+u4FbBxXuPETstRg5//rfi1gTe9Huf
         LfE5vMmJXY2Z+JSo5eIu1nfs2gdnTFVJhVlWD27wPYurRH8iToJ7yXFAfygFygC2Z6EC
         Bj5N8SLlPiCdLH6OVYVXuekhJUJTZf4BerJLBRUZ8TdtUtmJ/QQ2pRAvrCKnvMoqKIgN
         C18j6/BG9XbCMaFNk4V5FlTj7MveLiSHo/Daak6+Fq82qgDB6PUBl/mVXoms1y3rjAlT
         13Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVH5CV/381Kn9fCPlj8xL579ST7qWLxyPpmWf5uCfVtvZb+cNvsiaq3IloGDCY1N+oLVje6E5t0qi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxatExw8dv/SFFo0cyYjQKmvLKjrR03ljWGcgcvKC9h+nwuDU/O
	RuLI0uCkn9Lwk+e5P1iWOBSEAkxxkG7w2s5wDX9sy+APoqweteYJsqvmEvd0jIk=
X-Gm-Gg: ASbGncvsJtzvtr2M5E+j781tJRpFjFz+2DozPPgS5eoQK+kW8K8eK/XJvU+y9PtzIrV
	+BwUUw2AFZQKTeLABF4jg5VLdkZ+8DjsMfD9SVHgUGO0vGeHWR3UoPqpbY2lPLfntZcCcjNl8l9
	lEYo3i3h+GH4BAGX0U/oHrIogy+SJSjX5pyGgqLyudwtfndsH0//I4aohHootjCvwW3aJV/SEj2
	L06jmD18Oc3Ms9O53kVYqLR9JhbUitIwWJy7R9QcbPRIusXJ/oHPRXg/Lypf/lbWHAMz/rXnif1
	GT9BqwB3P9Yicx6yDfA5YiD3v16UxrPfrkiP0XVCG7U8YIiB2EcGJGnmouYhYaD3MkD4PNjjL3F
	kF4tkoVE3eQD+JJrqSQAT3h7m
X-Google-Smtp-Source: AGHT+IFltPpVI0ACnzJTqj+VKPKw57T57QohZSAekfF3yS1ZRlpAvC4mmTtGWHjmmF2YmyCcadc1NQ==
X-Received: by 2002:a05:6602:4c83:b0:85b:3827:ecef with SMTP id ca18e2360f4ac-85e2cc5ebefmr62134439f.12.1742499893623;
        Thu, 20 Mar 2025 12:44:53 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c40fsm8341439f.32.2025.03.20.12.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:44:53 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] clk: spacemit: add K1 reset support
Date: Thu, 20 Mar 2025 14:44:41 -0500
Message-ID: <20250320194449.510569-1-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.
It is based on Linux v6.14-rc1.

It is built upon the clock controller driver that Haylen Chu
currently has out for review (currently at v5):
  https://lore.kernel.org/lkml/20250306175750.22480-2-heylenay@4d2.org/

It also depends on two commits that will land in v6.15: 5728c92ae1123
("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")
and 7ff4faba63571 ("pinctrl: spacemit: enable config option").

The first patch adds three more system controller CCU nodes to those
implemented by the SpacemiT K1.  The second updates the existing clock
driver with a structure used for OF match data, allowing both clocks
and resets to be specified.  The third provides code that implements
reset functionality.  The fourth defines groups of reset controls
implemented by the CCUs that have alraady been defined.  The fifth
makes it possible for a CCU to be defined with resets but no clocks.
The sixth defines three new CCUs which define only resets.  And the
last patch defines these additional syscon nodes in "k1.dtsi".

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v1

					-Alex

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: define struct k1_ccu_data
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 393 +++++++++++++++++-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++
 4 files changed, 539 insertions(+), 19 deletions(-)

-- 
2.43.0

