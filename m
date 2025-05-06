Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59D1218AA0
	for <linux-clk@vger.kernel.org>; Tue,  6 May 2025 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565607; cv=none; b=ioVypFet9akCyyS2oVGr4re73zHiTyR7s/awbDCGi014uu9+oLMukYuSyRPF5JzaBeqHAmPmGNshHBwyhVH9kJ+p9JC45ouVXlk6J2sYCSyb3bwJGJTZynwZfSOmTw1UencxqJV+Jy2iODO300195E/UQ//GZJ6dN2a3RcmceDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565607; c=relaxed/simple;
	bh=ERNUVozEOVt14+yZDFjTZpFiaXN84yn5w7dLaTHaL9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvroeW9417SjWb/1D91FnUTZbzGwfgmVsAklHSs+IatAErRk7onpZgL1OWiGO49jRMeSjJqrRK5aH9aUWAj/E+t4dMfPajbMkrmZf1ds5nz+ckeT5h4iNfutX7aCDp4zdAB4VMUxurF2lmNBUezhiw3WliwgHjjQCpLvzkDHECc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=F+3i9RXz; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="F+3i9RXz"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-8647a81e683so171136439f.1
        for <linux-clk@vger.kernel.org>; Tue, 06 May 2025 14:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565604; x=1747170404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ctQSvVihHY5dWsU4MBBsIjj+H5evIdxG47g04dOZUkE=;
        b=F+3i9RXzL7sv4SaVclDtnqEzmiCThSpxM1btD6+6QL25D90tMoEHYHqpiNZpfEBcxn
         iKhY0OrCGXkBMKjevJCciXbE5P7+sBIl7Wm/Cy7uin6Key+KacDEzuEzDsx4x7U2sP/f
         QECC236yEoldWRfrhkqx7FLC8Hc7LUFuKhZSQXP6h7vmqjFi64ptZK/frD3f/SmCtOyg
         co3+OCe/XIbNxfLqvouEHunt5rumqOxGCI6vXB0zuTIlhkstGpcy3v2Jy7qi9k62aR3y
         kcgqCmGvXxgV2d/nGUQKYgk4fa7RgZ/FN4RnMWPzsHC99ow3Q0yl0/wEg0qbyn1iahhJ
         0PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565604; x=1747170404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctQSvVihHY5dWsU4MBBsIjj+H5evIdxG47g04dOZUkE=;
        b=jIBCT68IrSkph14NUxPyy5Vt/1Q0fgoGTiTt2LISZBP5kE+MHovBEFotWzXhEdVD4E
         4ogScBVJdzzTAoKqgBt5Ird0/r8nOhqqRiKG1a4zmQJ0+OpjSxX9WMbMg7twOoBhPGvq
         XxSuayS73uS8JyF6/C+FD6nidLLnTYAZFuWLF1qj0/yLPp5Tn+aXz9b8PUTs18peqHgw
         LIXjZQkCkCbsa74LqnXWsSrWVv0v1tDS9pGhiGViMaiYCQKvqe/maWIQJ0jxYzrx6/kl
         bwEPk9zJXbjv0h2cTmJ9B+HcLkq43eDQpYPxBfmZx+BrNSvr3Lb0NomrN0/eEfo4q3Gp
         XCxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWszC7OJO7hgU5btBh5SfIbxIKcTiu3AD9c3mRtQLSTCzynviJKI1UViAi/h1U7+C0JWzwIO5My4n4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbZfa/2VksaEV7oLh/2T17wpnxK1N1BBT74vv5BzAdKeilO5Kd
	MdOQWd5/fjf9Td7t6+CHQP935QVwAZ6iG8UoTSrdhxyUaeFWORC0t7kZ8YbLx0I=
X-Gm-Gg: ASbGncvBpdPcWTIT+UZ9A//S2xJ1k49g+PwBFxMWuzLZknVh3Lgmqj2VszUYwvglRQu
	8xYCFicc0ZXMvYiEURQ92uOWMdsF1KMpgiXeoNqI43+BSTypuQzA17iQbjIfPe28KQ15UP7f12J
	D3vMsOgQexLrjA8Ye+3kt0OGY0j8rXxIsA89pIcQ1OjsVqMUZvqm/3EwlTQnK3crzW2HF0blL0t
	IjOOQqZFBi47dNnp34s39tfDsLcnklwrSXZMI78Zpp0RJnNgRremHslw3DZ2MzU3GqEi2tu76vJ
	/lsLIB7lDsUAsbMI1CGX1rR1FIhGhNkXDrnzf+HSFTq6/jEyoBZaHlDYYpqIfWOOwHq354yhbKp
	4tLmOB+CN/w/pKw==
X-Google-Smtp-Source: AGHT+IHmLwR/RdxY6gKxsVffp2BFaQw1Bk6UdfmCxeRt2RRt1uEhRJSBeWBP2YNWT9ppTywhStu3jQ==
X-Received: by 2002:a05:6602:6b07:b0:85b:41cc:f709 with SMTP id ca18e2360f4ac-86747413db3mr136372539f.14.1746565603723;
        Tue, 06 May 2025 14:06:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:43 -0700 (PDT)
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
Subject: [PATCH v6 0/6] clk: spacemit: add K1 reset support
Date: Tue,  6 May 2025 16:06:31 -0500
Message-ID: <20250506210638.2800228-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.

This code builds upon the clock controller driver from Haylen Chu.
This version has been reworked to use the auxiliary device model,
as requested by Stephen Boyd.  As a result the reset code resides
under drivers/reset rather than drivers/clk.  A new header file
holds definitions used by the clock and reset drivers.  The first
patch is the same as before, so I preserved Krzysztof's Reviewed-by
tag.  I dropped the tags from Haylen and Philipp, given the new
location of the code.  (The actual reset code is largely the same.)

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v6

Between version 5 and version 6:
  - Reworked the code to use the auxiliary device framework.
  - Moved the code supporting reset under drivers/reset/spacemit.
  - Created a new header file shared by reset and clock.
  - Separated generic from SoC-specific code in the reset driver.
  - Dropped two Reviewed-by tags.

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

					-Alex

Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  reset: spacemit: add support for SpacemiT CCU resets
  reset: spacemit: define three more CCUs
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 ++-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/ccu-k1.c                 | 220 ++++++++---------
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/spacemit/Kconfig                |  12 +
 drivers/reset/spacemit/Makefile               |   7 +
 drivers/reset/spacemit/core.c                 |  61 +++++
 drivers/reset/spacemit/core.h                 |  39 +++
 drivers/reset/spacemit/k1.c                   | 231 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++++
 include/soc/spacemit/ccu_k1.h                 | 155 ++++++++++++
 12 files changed, 777 insertions(+), 125 deletions(-)
 create mode 100644 drivers/reset/spacemit/Kconfig
 create mode 100644 drivers/reset/spacemit/Makefile
 create mode 100644 drivers/reset/spacemit/core.c
 create mode 100644 drivers/reset/spacemit/core.h
 create mode 100644 drivers/reset/spacemit/k1.c
 create mode 100644 include/soc/spacemit/ccu_k1.h

base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
-- 
2.45.2
