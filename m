Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3571E1DFE29
	for <linux-clk@vger.kernel.org>; Tue,  7 Jan 2025 08:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736237804; cv=none; b=mO5NbBaP3MD260x44ftiyAKeaMOoWD+dUjx3OYi2w1nkCNI2ytYsQHzmdribr4prg6tYk9G/L2PMB7K9z4+5pWWzFN2F5XVu/nnR674es3ZBL6YrSOIIOvP3bQ/TfnrKZI7Ut2oD9ZlMtS3M/rH1YkQpEI1F/UftWuCWKhpWVt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736237804; c=relaxed/simple;
	bh=q0e8faXxL6jdwc1iqJwGovJZVtpt+ypKa1k70ybyykM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UonkiShXJ/Aq5/EQMn7zRQqd+UvGDgfSmjaBYiE7g37TbkA7q1nOjjXX04UpZQT36BLw6w4eEeaSTeokZ77hkud2uTbj1R9+jfYnzwfKUeFzyR5YHOdksF2rP8tM3/v5p0MZM56sR0KTEjDZfi5f1MndcRsFM57zMRCYnErWxUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ljWh7wxK; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ljWh7wxK"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaecf50578eso467832566b.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Jan 2025 00:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736237800; x=1736842600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWZnOQNGgvsMVEiJg19pTOxC3hE9uhPu/vC4I3JbvkQ=;
        b=ljWh7wxKjNNdp3kk5YVQTdzWoSwq1kI2QVWm+JrWDg5Tb+81E2ZwGerbRdeDMVCRSj
         IvYM4hI8Tzf0m5326rnzbPGmSVC+mBXWoa9vtaEXNKHYV2PuOFepd9+zTv/WK+DX88Pe
         uYyfIZJs2Pb5W+sHCGkhTdjxPcsIm3LuIEU2oArz17PTEbqkcdLeZS7X3oXrf855SQ17
         9bt5yP84b7GRRZbe3K3//WX7i3MdNUdh26rLkuyvCR5Ck4sabv20FjdsOt6/2p9z39Ha
         vFfUhi11cMOcfb3Cl5WE7viMvjmKxng6w8zMvirvN1Mz0d+y57SBeWd+jLJaIjzusXYd
         60Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736237800; x=1736842600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWZnOQNGgvsMVEiJg19pTOxC3hE9uhPu/vC4I3JbvkQ=;
        b=SOX3ybGC7bh6SA+pWX5cFB9GB5f4JlkAFLKJeNYlwuv0Nk5H0WZ+URYn1w/Qoks4MG
         68QyK5dx1/eJ26TaZKLTY05kylre17jfGzo3amE5Ij55GVh1P/aJ7d51gO+Tn65rlxjy
         ceW5WzhoWNwcO0xNVZh03dM226bkec3zSirzdqsBbQWiG5lEGunDFYWQ8Bm4MiAJQdNR
         GaQi+SE62GjfVmBaGYgDl8j6Hm5ESUmMBQHQyztcrcnjLWEeGW2zhSZ2AhDo5Bz7BbK5
         FHH6uqVn3joiryg0OwkkgVLnctXNea4MBkDzDKmD8AFu3xCil6+VWCbLleX+Ha/OclJl
         BMnw==
X-Forwarded-Encrypted: i=1; AJvYcCUvNVkkZ9ViclMKsBo2zX5+Q9eISKvWb/SDPA61EVXYoZxJd/zp7sflCEe75maGpbcrxDbbnnligVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbUvMaHH/FPDtaxVY8ieRuRDpMSdruKHAjiO+BXzO55tlYlodn
	bOFSW7g+EwxMP6CvNTTjMyTuRUCWlFonHPFBxam8FBijV42rrORyxs+YGx+O8Kk=
X-Gm-Gg: ASbGncuqnueBNInsYeyAdNnPj3rJ+P4YN25Ys9APownECHS5T/Fqi6Vww6x1ZRAATCl
	GIakCHmnFaAh4JzM1SBj5OkvfRGd3jwjzZNpXANHpuKpMrJW7T2OW+JtmOVhKOn36XetKPe2xvL
	kBgzvLvA3FtnOtEVDMjJk8pM3qAnfFublxh14ZeJdtLwXVTMR96/I3EyXI+fLUziqPqR4MNzBCc
	a0mUcAhYDe8r4ZTEh5zIMcw2MNetvi5EMBtWeDhlHCTIYibbk3pLpiUtSPLvNIFRHJsFnLAtMqJ
X-Google-Smtp-Source: AGHT+IGbUAEXJHqfyFPbYVD8n57bs4F/61Tg72L7793ZwWUSlwt0Km0YbTYpB9yeiaXWuNcpdWRtgQ==
X-Received: by 2002:a17:907:1b18:b0:aae:ece4:6007 with SMTP id a640c23a62f3a-aaeece4611amr4640461766b.59.1736237800055;
        Tue, 07 Jan 2025 00:16:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f014decsm2365740866b.149.2025.01.07.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:16:39 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com
Subject: [GIT PULL] Microchip clock updates for v6.14
Date: Tue,  7 Jan 2025 10:16:37 +0200
Message-ID: <20250107081637.759666-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.14

for you to fetch changes up to 9a497710cab94140762bcfbd9b6dc2c45f30678b:

  clk: at91: sama7d65: add sama7d65 pmc driver (2024-12-29 14:17:55 +0200)

----------------------------------------------------------------
Microchip clock updates for v6.14

This update include:
- support for the SAMA7D65 SoC
- clock IDs for for the slow clock controller

----------------------------------------------------------------
Claudiu Beznea (2):
      dt-bindings: clk: at91: Add clock IDs for the slow clock controller
      clk: at91: sckc: Use SCKC_{TD, MD}_SLCK IDs for clk32k clocks

Dharma Balasubiramani (2):
      dt-bindings: clocks: atmel,at91sam9x5-sckc: add sama7d65
      dt-bindings: clock: Add SAMA7D65 PMC compatible string

Ryan Wanner (1):
      clk: at91: sama7d65: add sama7d65 pmc driver

 .../bindings/clock/atmel,at91rm9200-pmc.yaml       |    2 +
 .../bindings/clock/atmel,at91sam9x5-sckc.yaml      |    1 +
 drivers/clk/at91/Makefile                          |    1 +
 drivers/clk/at91/clk-master.c                      |    2 +-
 drivers/clk/at91/clk-sam9x60-pll.c                 |    2 +-
 drivers/clk/at91/pmc.c                             |    1 +
 drivers/clk/at91/sama7d65.c                        | 1375 ++++++++++++++++++++
 drivers/clk/at91/sckc.c                            |   24 +-
 include/dt-bindings/clock/at91.h                   |    8 +
 9 files changed, 1403 insertions(+), 13 deletions(-)
 create mode 100644 drivers/clk/at91/sama7d65.c
