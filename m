Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525D91F4C90
	for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 21:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173233; cv=none; b=hkZEwQb9qrtAJhKVw2Oy+Sv3KZIHdBs6pixQ/2Sd3mntNWCmcNE668GojWSjErn2Glp4EBLPN7ZjaxCg7CrnJz+ld3Ik4jFn7fh/0y4GPq6weq2rdcHkNM8n+ebuonDrgAbMjE9vOH1HC1xHjcJvuO63CywNClZtevSriwlZBlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173233; c=relaxed/simple;
	bh=71pgvnqAw3UA+IpyU+Dy5uOMDBAifp/mgVuOv7x8aPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1yiSYs4f0dRkyaOEvRJUTaghPNPlNiZXTTi3qImGdGggX9lKRI2mhvu/aT0GLBKK0vjz3QHbGRMPaKmUHIqC//m0eX87Ix8ZoYtmT21a2CKR70qNftgzhVWj6cSAiyQ6JkvypYUyKrrv+wStsBJXLjkDB6xCvdCPFvLHzJAY24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WGZu9e8a; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WGZu9e8a"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86a052d7897so51588539f.0
        for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 14:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747173229; x=1747778029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IoLEEBUGNiFTOGCb4OTLcURUXHh0Is7POKT/aDTs3Qk=;
        b=WGZu9e8atDc/sjVAmpq5f7gFtBHgPWfqzehsK1UXXyjWe4QmnRnyB8Po3vrNhZPSfm
         2BIeqQW6HBet3Cyp/ytwDYrWMPNhADO99434FPaOsyD6jqzW9y8yvGhqYYqeqv+uUhnB
         bKUNv8323dvEfxhH31I8kYPe5TCN1q3i+dZDp0BRF0m6qmt9elQ8TvpSOy/unDXrsScA
         DSm+IHoK1jxCHnnqgJXz0IWkGFu47txnf8LiUZ+Xp4WXqdBvksLbA7gC7NH9z7yJEPAC
         rxSNv2c/IiUU7E13V4DKSt2j7h+LV6s5CQUunwOA/xVLowaf+ORs63SG7qP8ncSKkeRC
         tT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173229; x=1747778029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoLEEBUGNiFTOGCb4OTLcURUXHh0Is7POKT/aDTs3Qk=;
        b=DNh0yG2yiQ3grHu9BvSLFRrvp5jeapbrZ5QsGE4k6MYMwf/FJLyJ4avQ/AI/x5O3q9
         wqcZVMJ+h6T2u1zuETNppzQsFSPQsU6rhuXH8hW1IUyhxHlgCPf6vHWoYld4fGXDKDBl
         PzIEw3Vto4qgoCnKtXYFvMi3EG6F/L+ZVpyv1xHKC6hOZpzK1YuTBud2c8OZS1Y8LXCw
         PcNAmNPisIKqn8XVyak4R17sNgS/+lKk/+Cz2rWmgrCsL0sV5PrYDABfDILxJ5yCqIDR
         1u1/Ui1RJM0YLziNszG/Cf0mObEd+Z9cny9BC9xFMuxcQqexiXobX7Rqoc2Q2jjl3rhh
         oDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7wfyCefh78g83eet4xLsU5sm7vSuJ0mmXk57Rv5hl+259bOjPI5TqTZ1r7FwY4mFFRLVGogpEcAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4pemnppxnF8LxszSjlQ2Ax9WR98rdrOB4lZJIeJz+CWcTj0ED
	P8XPunw7lxa3Z4oMFQNZ4q/8glDRANhhV3unB5gBl+j+mR/nNtTOu1Sja1TDFC8=
X-Gm-Gg: ASbGncs/HfCFnUNWBuOshCs144qYCsir7hF9gp+eX8eZY2i3Okz7Ns6d3UNttcRwD+b
	JFH4FksIffukCUKX31MSAzBYOedlK94dkhjSPuZLDXbdugOSQnI6UiX/EiCtpwFSTUfVKYssBdF
	Rhky16VhhCbHk5wYAScDBKkXX+oV8aojdJk/IEJCQUUzwrgE4TfUZJJFYYb1ec0NS0KHHjpkfzL
	t1Hif3ZCJeaaP96+/Lz4GIkoL15jGwYirvQVFIFVUCsAVt5YQWnscQ9xoWN1AbsgpBaP5svUui2
	sskfg9ZSczpe1OgEwSNfTDvcVwsfRzQII4WbVJ3bExnTZBclHED5TQpKvOyuVQfqrbbO89FC47X
	rDr4RuamlPQ3y+4yPaP8bmUdQ
X-Google-Smtp-Source: AGHT+IGDBUqBNV1+C83bdeHkvMMC/RIROVFW0hAND3S6eCYJOwvoQKB1LZmfPoy/YugMmgpVIC3HiA==
X-Received: by 2002:a05:6602:3944:b0:85b:58b0:7ac9 with SMTP id ca18e2360f4ac-86a08e3dc6emr93279839f.10.1747173229345;
        Tue, 13 May 2025 14:53:49 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0dedsm239622539f.32.2025.05.13.14.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:53:48 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/6] reset: spacemit: add K1 reset support
Date: Tue, 13 May 2025 16:53:38 -0500
Message-ID: <20250513215345.3631593-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.
A SpacemiT reset controller is implemented as an auxiliary device
associated with a clock controller (CCU).  A new header file
holds definitions used by both the clock and reset drivers.

This code builds upon the clock controller driver from Haylen Chu.

No code has changed in this version, however two patches were
reworked while trying to separate the clock from the reset code:
  - Patch 4 is new, and consists of clock code that was previously
    found in patch 5 in v9
  - Patch 5 is now the result of squashing together two patches
    from v9 (what remained of patch 5 squashed into patch 4)

*** Stephen, because of various dependencies between the reset
    and clock code in this series, would you be willing to take
    patches 1-5 through the clock tree?  Philipp agreed this
    would be simplest and said he would ACK this.
*** Yixun, I am expecting the DTS changes in patch 6 will go
    through your tree.

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v10

					-Alex

Between version 9 and version 10:
  - Reviewed-by tags have been added to all patches
  - Patches 4 and 5 are changed as described above

Here is version 9 of this series.
  https://lore.kernel.org/lkml/20250512183212.3465963-1-elder@riscstar.com/

All other history is available at that link, so I won't reproduce
it again here.

Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  clk: spacemit: define three reset-only CCUs
  reset: spacemit: add support for SpacemiT CCU resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 296 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 ++++++++++
 9 files changed, 754 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 3f7ca16338830d8726b0b38458b2916b3b303aad
-- 
2.45.2

