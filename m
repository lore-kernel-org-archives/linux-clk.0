Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9991EEA49
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 01:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749777107; cv=none; b=YRNBa1CyTG49IjtZbJCQ5k9xBfnH8pNQVniwZb9rF91NV5pQSZAsZInrR32NWlTJpUmHjHy34zY8JDU97uy4trYcizPJ1oUngZkElVegkOfCbOHW+poH7GB841I+F5kIG1JaiQ3RqKOP/ZyJqwDZFpijbD5VRB2tEUXsa/ar6Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749777107; c=relaxed/simple;
	bh=8u736JUylRMKJQJC8tFKjjHmAF3VB42qomu/hTIe6UM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/CGMbq+dr3Pleo4lcvVWSULRPdTyJXiBshUXxjTf3YSNSILf4aVqGfNsnFNZ6IM3904su5IMt1L7ciAnvHIbMsMoYobQIu3YUJ+spnU0wRqnHPuYOE5nz0ol+WLoQiVqa3/5oEDfItjODPlEVFABikwHUq3e+aqL7Y+bzEEyPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zSi5JIMf; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zSi5JIMf"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-60ef850d590so448369eaf.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Jun 2025 18:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777104; x=1750381904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLjk8AtIe7EkG0gXs3iZYCpvTmGpW65yPt2cGZeyPVs=;
        b=zSi5JIMfNakFFLIxQBn5QCs5uDgwCkgKqsCi35kepZITgUBgpnnub7kpjQhKWQ+OXF
         hHygWATq8xwBTmSG8cFCRsW2bv2Mpx6ojw7Zx1yXq9CYMyZVyxXhg3Tirz6OxGvnqtJ4
         h5Opq/EQUXy/3rX44V6QIDrOrH6ChJwyYU+j0Og35RO3uFZtBmND4qJw6AyUXMJPLA64
         LVQLNDdHB7LODTUV0fRyP4qmQzgM8wOrP/EEl7U4rkKpQmbPM8pd0rcj6e7dovhXXOwO
         1h6BFNflE2HEpWUotbRoWysdgKwzNOABi//dEMT9G+QRy1o3lwHacpr2qI3hWBtRDQos
         I+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777104; x=1750381904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLjk8AtIe7EkG0gXs3iZYCpvTmGpW65yPt2cGZeyPVs=;
        b=MniJR4ziuUn4tyl5gPYBvssQYzXjrTRIogXAGRPkKz3PaFwRtOgwHJn2O3OCc9EjBG
         ENjyOvvEx6b2QuSdTqdLfruNWMQ6HutFmDGSy4FJmCXqhJzqLqcqL0w+ODS5F4v7m0cb
         qKbOIMOO64NAgQpWhbXZFbIJBoih9V57r6VVih7YMXN3thHhwoKoplE3PJDVtmIvbzNj
         Pb1/CY/wISTsvf+wLQXw4oImf6dAfAD08yd+XXOYWOFUaQ2SgU6BFprOhfCd3rGKoqmB
         +1KFyt9dCipMiUlxkkMBlEhD3ttp5Y42VBLgTzaNaLDHASS3kGJ85GBrahQQW/aMY/6m
         /kVA==
X-Forwarded-Encrypted: i=1; AJvYcCXO7bkPy3g1KgHlR+ygEola+X8w1DmSlJeUmGEKf7VRuzYNgDNVS8vAqzGF1n8odkzUqvXDEVBb38E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk1uSAjsVz0mSSF46VbJ7yt07Jv2kfbFihI0Ac+eOC2k4J4U9c
	y8FT5Y531DNmlRO8fueVhebTOCNA6L9Lya6qUQyeSG7Lop2r4P55AfMZF2AqyGOuRVo=
X-Gm-Gg: ASbGncuhbVEAAB5K+BRyPmXF37Y6LtlmId7Cbtoy/VAzUJk9DQv5qk2X5lZpSbgVyzn
	C9Yo+lNLHPqx9VZHrhmeYTu/VMQ4HYO0wI15V0QcJnxvwwoWQKHHjDFpbYeq2fK/U2iCB9XyOdD
	XQNL29+HwnqBfogaSIFMdReR7oL3r6F+GmL9TfY0UxKVQ4lc+CpphDuyNFqgvXoHRorx3vInsvP
	vH59ftScHK8I/p2UBA+9wIYod5IzJ7gO9AlDoptL0LZLWjgQbaTu+xPgM/9xq7HBwT0cPhOFz/A
	gb3i+IWRjNMXPpxTyrJLO+Zq/CJNFyGxImXlcClOilw4GRS8xCU/fEKPw6lDhbXUeeJMnOkLnro
	PEX8xPvBV/TEzWY58AFWeEJGQfve1SLJW/AY6Wiy+EA==
X-Google-Smtp-Source: AGHT+IGuYA1UmF+qyhDFUECuEGO+2TaO/UuS30QC1CnU/pGEOag7zhyk90q5MH8bH5ojGbCRLTOPgQ==
X-Received: by 2002:a05:6870:ab09:b0:2e8:7505:638e with SMTP id 586e51a60fabf-2ead51cc4c8mr724652fac.39.1749777104481;
        Thu, 12 Jun 2025 18:11:44 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:43 -0700 (PDT)
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
Subject: [PATCH v11 0/6] reset: spacemit: add K1 reset support
Date: Thu, 12 Jun 2025 20:11:32 -0500
Message-ID: <20250613011139.1201702-1-elder@riscstar.com>
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

In this version several "multi-bit" resets have been redefined as
individual ones.  For example, RESET_AUDIO had a mask that included
3 bits.  Now there are 3 separate resets (one for each bit):
RESET_AUDIO_SYS; RESET_AUDIO_MCU_CORE; and RESET_AUDIO_APMU.

The reset symbols affected (their previous names) are:
    RESET_USB3_0 ->
      RESET_USB30_AHB,  RESET_USB30_VCC, RESET_USB30_PHY 
    RESET_AUDIO ->
      RESET_AUDIO_SYS, RESET_AUDIO_MCU, RESET_AUDIO_APMU
    RESET_PCIE0 ->
      RESET_PCI0_DBI, RESET_PCI0_SLV, RESET_PCI0_MSTR, RESET_PCI0_GLB
    RESET_PCIE1 ->
      RESET_PCI1_DBI, RESET_PCI1_SLV, RESET_PCI1_MSTR, RESET_PCI1_GLB
    RESET_PCIE2 ->
      RESET_PCI2_DBI, RESET_PCI2_SLV, RESET_PCI2_MSTR, RESET_PCI2_GLB

No other code has changed since v10.

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v11

					-Alex

Between version 10 and version 11:
  - Rebased onto Linux v6.16-rc1
  - Redefined several "multi-bit" resets as individual ones.

Here is version 10 of this series.
  https://lore.kernel.org/lkml/20250513215345.3631593-1-elder@riscstar.com/

All other history is available via that link, so I won't reproduce
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
 drivers/reset/reset-spacemit.c                | 304 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 +++++++++
 9 files changed, 775 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2

