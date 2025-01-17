Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E566199FA4
	for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129539; cv=none; b=PoJSTNJD7lJjzN/NEorwrpkZO7U6hOoD4beSvIdnfe9c2olXSgq4WCKwP2ba12makWxrURa4RWl0iQ/Q3NZ31wdzXBkK3aCViFFzVPAb1eVtKdiuvpgSXz5uHPQ/+ILMX/8j1HMcB1Td/gyvD0Ni0AYsJ1yHfJR/jepHC9l5uD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129539; c=relaxed/simple;
	bh=5GBtK/Zufm73VK+pUpHd8niOXTdAdy+WcFTCquXSAPQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KFh1ICbuicqAVJDUWj+IEcknQtsmbrkb+TczmQb04LWrKf8QQlE6jPY1iVT7Wiqkl20xJf8Qw1gRhBLyTSdqJO21foHQDs5J9lR62DPiQVkf/OIOJg3ODwXinf8HMYNDkrfGDIi0U7LWvjKQYkn7Seaw9sK2zdXwQ2yOYVKD4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MJPnLu31; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MJPnLu31"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so1402197f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 07:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737129534; x=1737734334; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9g6Vyc9mOB7lyi/aQRjsa7BERTyMx1iof60RQwC2Xw0=;
        b=MJPnLu319Df7x1n7p3HSMxvO7n6Y3Kshfx/Gus/ta8uvuXAJTX3hxOqv3HMe+1Ob9Z
         FURmeXvhW+z8EBwp4ytVQ5pyuTCLzDuPi4XFhyx2JK+c2UxY3iPNRVytqhsC1yqLW5fQ
         T4dEs4paKUUEwl30M8GBxJ2cHMJPUWjFgflfLR8DOJJjNZVaSj6ZO/9sjEOHVHkOITIh
         pKG9pCcHBXvDf7dX/SXCriv6jGKtJY25ThTIJUk3wvyyC9onoOXbUnmitimP9sJjpfyf
         VHdgywAx8HoljpAuKGdGkcDEWTzXk+VqxBnpMrVQUoMRBRkwDTKg5W4r6YENVYU2AV4p
         MBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129534; x=1737734334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9g6Vyc9mOB7lyi/aQRjsa7BERTyMx1iof60RQwC2Xw0=;
        b=CpPIcBUNk0qi3m+8xEHYNaTfCFa8Q2RuzY++nzgnV3DOMZMoSs/+COgjplML6tZYPn
         93W7PnP3934ZftIr34YHVVLXwPgt0gH+cgx2vp/dLqM0imvd2QgA+00G6icZ5tXwvcDR
         ebQ9aO+xGqS3YpqulCn03nJ0nMqwI5qZy2c1Nw5KDxgIRlaoLSx+Q1+BLzf1oBduOAZb
         LEtqdPfnh06ImFBcyZ1wBAeE/a+PeYZeWakp38RClzOT3f72Zbkakgu0gLXlFQ8rh/c/
         xqpkAouYI8bg6HW2ywIKRfXH/BXxvCjoIJNhpBr6VTTXRkv+Mv3VcvgUBO3hKsAUxj/h
         SjuA==
X-Gm-Message-State: AOJu0YzYYV7owLOC1IMkl/4K3rEhPHI/7tIgPFTAazDx1rerq2fjmQIC
	w6fddKFdH3nseJN2ECCfilRMwJubHuyPTtzxRDc1Eh1o3v0Y0gW+OgnLSTIOvHI=
X-Gm-Gg: ASbGncsy4BgbaiOwUaMOY4dn94srvK0s4lgXiMbYUM/9k6jy09PS47w782dIcf3d0DB
	tJBLjpkgqfnvnCUsa89S3ogE0NaUuZR4PxYxnTHaii7YMugcMPW8dnKIA0/EmI/sRE4SyWnGnop
	sF2tbZzACk2Udnrt/0u7FQ7/Fsb3d6/aRUjAvvfbCS7MP0gDblbS4Qn/O0xt/h/mQ1ZdRiS1b5O
	iO5Iz29LoF2LvvPRDSVYNySRR9APlgaXjdOIQ6LFIsQLEcsztDAxBqnuZUevb5Vd+O+1es=
X-Google-Smtp-Source: AGHT+IEFctnhDoaU9MlqplgOMTYAM82vSV45AUZja9u72PfPs4/igV3EGZ+h0AvIYK+a+WQ9znx4wQ==
X-Received: by 2002:a5d:5f8c:0:b0:385:ef2f:92ad with SMTP id ffacd0b85a97d-38bf564d5e7mr3579724f8f.10.1737129533948;
        Fri, 17 Jan 2025 07:58:53 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b019:599d:2d51:f3c7])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c7528076sm99382195e9.25.2025.01.17.07.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:58:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/4] clk: amlogic: drop clk_regmap tables
Date: Fri, 17 Jan 2025 16:58:29 +0100
Message-Id: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACV+imcC/5WNTQ6CMBBGr0K6dgytFtSV9zAs+jPAxELJlBAJ4
 e5WbuDue9/ivU0kZMIkHsUmGBdKFMcM6lQI15uxQyCfWahSXaVSJZghxI4cuPAGz3E6BmM3mAl
 mYwMmkDfUrtW1uuhKZNHE2NLniLyazD2lOfJ6NBf5e//SLxJKuFfeV7p2trX+ac0ayDKeXRxEs
 +/7F+6SzzTXAAAA
X-Change-ID: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3163; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5GBtK/Zufm73VK+pUpHd8niOXTdAdy+WcFTCquXSAPQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnin44kKraKDYPejH2n7CpehSMnuaRgAfHt2jiF
 VRluJQV/haJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ4p+OAAKCRDm/A8cN/La
 hUAmD/9ervITo4Mtbw0X+1dsHMEeAK0MuNr7/AUtzXrn+UneQnOMd2wUL5CBYI2AiUrAjlmwLX+
 sUibYfTZwQ3MAgJ/HfDaAE9j12xOvRRfUuZWZVtR8/OmgbKGp3N390VEInxxXQFW8lyoqGCi8a2
 Pg60h4jUq51hu3c169X6IHmEm1Q2ILokgQ7V40UJjAndaOckZALQXjBJGaD67T6rdLm0fK35+OA
 EmqPYYz1Ih27N3R3n7wEfxIW89oTWewHzc6ITqZQsVnvwyVUC7jHn8CsZyPtsH3Co4PFQ9wkYr2
 U0sLKsxHBQFzdzDFBz7AnIUO6hH4DZ9bWASttBcCmt9hW/xgwwSSkmj23v3SsuUU/vgsVI1A0vi
 e1i5ZYJpi6sm+Z8yUE15+SEYA5IKBE/RfNdwNYQPdOC/omsFWLbF2dR3hRDTV+x+2hwpAw5q3i4
 7kZk+b+RJbsbeSAxsXSEu8TzCPtdbu8FWfXOwoI8PbWWjTqxDYD7eyyuSVPbn5yvO7VvYiS0N1k
 ddJM2nCbBH3igOzA3CYEVH2y2i59ob/T+HAgUG5qoO9BDwBrLZb+7HM0RqB3GbDS4b2v1ilePoV
 JE6er0pTarMGAq+Pz1+mrnt8VNBuhOvFEqPDye+b0Hvw8WcGPfxvcVEX+YLRbbTpPCboPwXAgsL
 IeEf1U8GFpubr0w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset removes the needs for clk_regmap tables in each clock
controller driver. Those were used to populate regmap with in the regmap
based clocks.

This saves memory and ease maintenance a bit.

This is the 1st step in a series of rework of Amlogic clocks, to clean-up,
increase code re-use and ease future maintenance.

Changes in v2:
- Add clk_hw_get_of_node and kunit tests for the new helpers
- Split patch adding the .init() and the dropping the table
- Drop devres based solution and something temporary but simple
  while a more generic solution to hook controller init is discussed.
- Link to v1: https://lore.kernel.org/r/20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (4):
      clk: add a clk_hw helpers to get the clock device or device_node
      clk: amlogic: get regmap with clk_regmap_init
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/Makefile                    |   1 +
 drivers/clk/clk.c                       |  33 +++
 drivers/clk/clk_test.c                  | 116 +++++++--
 drivers/clk/kunit_clk_dummy_device.dtso |  10 +
 drivers/clk/meson/Kconfig               |   1 +
 drivers/clk/meson/a1-peripherals.c      | 163 +-----------
 drivers/clk/meson/a1-pll.c              |  16 +-
 drivers/clk/meson/axg-aoclk.c           |  22 --
 drivers/clk/meson/axg-audio.c           | 433 --------------------------------
 drivers/clk/meson/axg.c                 | 131 ----------
 drivers/clk/meson/c3-peripherals.c      | 210 +---------------
 drivers/clk/meson/c3-pll.c              |  32 +--
 drivers/clk/meson/clk-cpu-dyndiv.c      |   1 +
 drivers/clk/meson/clk-dualdiv.c         |   2 +
 drivers/clk/meson/clk-mpll.c            |   6 +
 drivers/clk/meson/clk-phase.c           |  11 +
 drivers/clk/meson/clk-pll.c             |   7 +
 drivers/clk/meson/clk-regmap.c          |  49 ++++
 drivers/clk/meson/clk-regmap.h          |   4 +
 drivers/clk/meson/g12a-aoclk.c          |  34 ---
 drivers/clk/meson/g12a.c                | 261 -------------------
 drivers/clk/meson/gxbb-aoclk.c          |  19 --
 drivers/clk/meson/gxbb.c                | 393 -----------------------------
 drivers/clk/meson/meson-aoclk.c         |   5 +-
 drivers/clk/meson/meson-aoclk.h         |   2 -
 drivers/clk/meson/meson-eeclk.c         |   4 -
 drivers/clk/meson/meson-eeclk.h         |   2 -
 drivers/clk/meson/meson8-ddr.c          |   9 -
 drivers/clk/meson/meson8b.c             | 200 ---------------
 drivers/clk/meson/s4-peripherals.c      | 341 -------------------------
 drivers/clk/meson/s4-pll.c              |  31 ---
 drivers/clk/meson/sclk-div.c            |   5 +
 drivers/clk/meson/vclk.c                |   2 +
 drivers/clk/meson/vid-pll-div.c         |   1 +
 include/linux/clk-provider.h            |   2 +
 35 files changed, 239 insertions(+), 2320 deletions(-)
---
base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356

Best regards,
-- 
Jerome

