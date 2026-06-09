Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1054E390999
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002774; cv=none; b=Fpqz4uQahpXfbXR6/vRyMqGR0NAsMY3WwMBtAvfh87neVUqiB06eVXrEkmJ6AC96uxn6MAztIWWzpF7ySQrwL1cbjiYXQnK4jKWL7vcdfsfNrinpLlOBUfczhcyRSnoFf21zUAZVuveo2tySDaUL9jEerkw1VN0BxWrelsbAqr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002774; c=relaxed/simple;
	bh=n87GT43w3DdRTkTnhNUWVAKarzjSVs0P2+42rKxMlLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYmIHX7pLU6/XheN4VO1BEUO7jCMM9k/gd8UO7Shsk3xRCNnj90uRJnwS7W3XAPpdr0hK5KEuKsuJAwddU/omvrXpIv1TL3uZ0RqnmzFaAKoqHtfhUutP+2mf2WpNulL1PprZ5S9ztSNpkyba7GNz1+7acJ63YThAW1YD+xFS1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLkPF3Ok; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLkPF3Ok"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so68919635e9.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 03:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002770; x=1781607570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Awp9o+G4t/KB8Nuw9M9eoFnlOxMqCJMqbpEUDuh8Jz4=;
        b=fLkPF3OkYbZc9tpACZedzC/B77KDwpmd40jvpMIIdp+1VWCX4wcHYF9Np6S1rYZ7qz
         8fg3nFsWI4MqWkc4OWbWmiCUwEC4jHbnmTjw8SVWn4bkkioiiuMgrEMjz/3HwM1i6O6q
         gxV2s9jscKeAaMrNdAJ/w5SuqJSJJu83lGo05+s3qEtDHmIsmCKFqHBv5hO+a+n9mzOg
         qJhaBxsysD37WhY+AfKcPs65IrSfIECQvkTOzDuvZOngxDmBbrSS/8BNHdXFv55eguSW
         XklSldjrMMLlfdLMvPKgXQvhX/6xu8CSrv4Eb5Kj57lE5Ye8WVRMDWWX/n8HDqvMnzho
         orxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002770; x=1781607570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awp9o+G4t/KB8Nuw9M9eoFnlOxMqCJMqbpEUDuh8Jz4=;
        b=TZsWAvegaTf2bBOrFTSQfbAoJ933ciB9YvQIJ8oKfiu++VNcLZN9HhR42J7yPwtRfZ
         djEHUGQOV4CNq3Q9DzDRmylQQnbgkaEXMR0N7muE6a56745dKGY1WLa0nKRg3APxYtsf
         CPLjRRxdrcBbBDXukooV7K8pt6UUWV0/j2tJMMS5wy67+ATNGp7kPdHbd4BQWmnHxXSb
         TPVBwRZ974k9iwYLeXD3l07xILYXBxNR3lIYHC/Oq8KQzG7zKQVvyFgTm/TSQXJe/RMP
         xGj0v3GJ0DwMpUuT0iwSgtsEMNcqccKvwjubmg8Lx61tgPUv7m5FNYonATQcj7G1RxXo
         ehvw==
X-Forwarded-Encrypted: i=1; AFNElJ/7bfeAZHTFfp4877ews9czmtYB+QV43h3OgIbhstZFGtdb2agHOkbqJ0t5JgGs+ltQ4OmWWJa5ALE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqmoffbjj9NBvstFJdKyJKesPMopLJhhaO4MdbSh5+2dRYO/uV
	F/HXkfh6cYSyXNgFrvdxTsi7sh7YV55U6hOTyzJqsfkFs9KAg3wcEl6n
X-Gm-Gg: Acq92OHhPyqF1OEB5xnPhRkhbRr8lDRZ6dWpUrTCFNf1jFxQPaOxY0wfreed8dhUQaI
	actmbirKh4nBk0GnbFSB0Jj0ECo5j3jzRprmElPKyXcWpXyEg5LFpeYwBFTuZWXKAVJCQZhcE49
	4hdQqnLyx1fz3r7ocqHAeo7u9lw1fuA/owmZNxcwi8ejyDSQusCzA7wx5pMiZeUfa/gOS1lnjHK
	odO0mYiG/LWHl7C/pcnmixBZBlzhqmBffuIRdvHOw4RkGSnVREQRmpwdc3x5oOoDl5AvUTxS0ie
	YkvDqqCIjC7g3poFg3cX2bomDHETpWP+XYFYmyP5+zMtDX+/dZniczOSa4NPdIOJsYd/1xBPuIQ
	b6iZw4RXbkWhwhveKhBlzNAb+sRwqyakbBBWe1KWjrnpGu8iWUGt0pvt2HgzzqU1A7SjuQJJswK
	qYvYkbR3SxQg9ANRRBXTLacrPMvyi1IgvlbciQhp/Egi96rG1fgc4Ue39omLqa/NAzb8e0iAtUa
	vZQpnJX2hG4YRgvZRgLoW8pci13cxBCrBaqBEPiT3cKMbOFgBZdDj0/vQ==
X-Received: by 2002:a05:600c:620b:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-490c25cf45bmr337771525e9.28.1781002770128;
        Tue, 09 Jun 2026 03:59:30 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] Add PLL3 and LCDC_CLKD support for RZ/T2H and RZ/N2H
Date: Tue,  9 Jun 2026 11:59:19 +0100
Message-ID: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PLL3 and LCDC_CLKD clocks on Renesas
RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. These clocks are essential
for the display pipeline, specifically feeding the LCD controller.

Key Changes:
  - PLL Reference Flexibility in  the RZ/V2H(P) CPG driver
  - MSTP Dummy-Read Mechanism
  - LCDC implementation in the RZ/T2H CPG driver.

v1->v2:
- Dropped RZ_V2H_OSC_CLK_IN_MEGA macro in favor of direct use of the
  input_fref field with a fallback.
- Updated the doc to specify the default value of input_freq when it is 0.
- Updated commit message for patch 1 and 2 to reflect the new approach.
- Dropped using table based approach in favor of direct conditional checks on the clock index.
- Added Acked-by and Reviewed-by tags
- Added new patch#4
- Switched to use the new library
- Kconfig now selects CLK_RZV2H_CPG_LIB
- Renamed CPG_PLLEN to CPG_PLL_EN_EN
- Renamed LCDCDIV to LCDC_CLKD
- Changed ctr0/1 in r9a09g077_cpg_pll3_clk_recalc_rate() to use u32

v1: https://lore.kernel.org/all/20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (5):
  clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for
    calculations
  clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for
    RZ/T2H LCDC and RTC
  dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
  clk: renesas: rzv2h-cpg: Extract PLL calculation math into a library
  clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H
    display pipeline

 drivers/clk/renesas/Kconfig                   |   6 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 369 +++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c        |  20 +-
 drivers/clk/renesas/rzv2h-cpg-lib.c           | 216 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 186 +--------
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   1 +
 include/linux/clk/renesas.h                   |  28 ++
 9 files changed, 645 insertions(+), 183 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

-- 
2.54.0

