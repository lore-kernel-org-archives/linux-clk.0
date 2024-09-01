Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F664748A
	for <linux-clk@vger.kernel.org>; Sun,  1 Sep 2024 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725197671; cv=none; b=L1trpNnwIBm/6hK35BW5+hf3waWUiFHoVWK+dzLrVXK4aT31Mv4LyyjbYo9+wdoeC8CZ/G+x+prs/a+s7KpRAEejLzHhJAXUm9BggBGfTnipsUvybJBbtw0EXHyfbwsx9pfZM5cPjdd6/4ve9XpNiu5LJg1Ufi6nnioEh+BLeiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725197671; c=relaxed/simple;
	bh=29nqfuxgUPXjJldXSjE8UVM6yH7smgs4TIPiI6dnvCY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EmgZxI0C5aWrF5pLZLQBBYPgHRyuSHZSlQ2beuGO/9n1WfkyhmWYqM4iho6KP76RjFywyCEbM0MrBV7NorFSyE7cTTtqPiIVcIF0NmyfVwTbcqE7k2/vOJaO2anQstsxz32UF55i+RZUT/IdvhGXFMWMomMxlPUstXsoSyDN92g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MwKguGpp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MwKguGpp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42c7a49152aso11245765e9.2
        for <linux-clk@vger.kernel.org>; Sun, 01 Sep 2024 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725197668; x=1725802468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZuJNkTMEmyG1Y1u0ZHMR50xU+ptA191TJOnx8xsYdQ=;
        b=MwKguGppQ6TJlawFTOs4KByFEDPfLO/sAGXzRcTiN1gSxl+RFxgH9t64vu30uRUqeE
         wjrlbs0Ov2jjreLwWQhJDL+uPkrEFBziBV+0LLvqcyPg/IydFhKdp8qYKZF0cW9eWbD4
         0VHgIPPxRL4TntOnMN7xMAq5+BOgUlbkQKpQWSrWGDqzHegNSYI/919OsGx98tXQxE+s
         YSI79Kuv+g6sHEONMPg/4FZ7+LXUmu9it4uFV9AWQCBRUK73MeO4DsEP5MI3kUUFNiHa
         QmZKY7xYNC/RCUeaXRJyYl3LGQShRj+hXWwMqRJzo5YzCxkNhT5k4K4m5Lq21uP9JxW8
         u7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725197668; x=1725802468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZuJNkTMEmyG1Y1u0ZHMR50xU+ptA191TJOnx8xsYdQ=;
        b=XwkdglGeKcKhg2DRxTGB63aLLITQOZgiV/DwPzCo8ZoCnoPsLgoQIGnCOJRjh/98XD
         EjtLqtSwPS2G+Kr8SFxf38iOCrlPgoYhIboIMx2pFmVN6gwNgWAVTLwCabm+VhPm13TW
         xzlgvuTIqlADqdNimuVLGbsMVo7i5ohIu+x9O3C9Q0sAx+SlEgDiNeNtonfG9+6dBoAH
         b0BrzpKk8FCQLxYVLErPBPRuppdZdXcOuIAwshp1AKXRkxIdFYv2okovRE+e7YtNGFnS
         nZMq8CMmETW9RV/k3ZUv8rvFd1yzVTp61FR1mq5JLK4pJn1epljiVyYCVwOrM3SHLDZw
         0FRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh9S7sOQcT+JbX6YIIJy7Xfjtt15057bN0Y26ICyhrRLPzFAWXOZqHcGP5aThGBMVWvN7u/LMbj28=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsW31q/fS6BeYPZItJZTdy/MWME7TYLWubU1bjDFXTYlFd5+5F
	aoYOHQxO9dhpwE65Qez/eVFsXB2mVxfYTeplJmvP++JWpv6NK0Siu56vZ4fhLBI=
X-Google-Smtp-Source: AGHT+IHqJKYShZyhgkzjmZ/VkTaqE5kXVQXcvRu0tlWx8/cN/vhrQZ1wIBudXxW6llG53PYDGIacYA==
X-Received: by 2002:a05:600c:3b10:b0:426:6ed5:fcb with SMTP id 5b1f17b1804b1-42bb01ae1fbmr116878695e9.4.1725197667547;
        Sun, 01 Sep 2024 06:34:27 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e36626sm106574155e9.47.2024.09.01.06.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 06:34:27 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	linux-clk@vger.kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip clock updates for v6.12
Date: Sun,  1 Sep 2024 16:34:25 +0300
Message-Id: <20240901133425.2039071-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.12

for you to fetch changes up to 2d6e9ee7cb3e79b1713783c633b13af9aeffc90c:

  clk: at91: sama7g5: Allocate only the needed amount of memory for PLLs (2024-08-24 17:44:11 +0300)

----------------------------------------------------------------
Microchip clock updates for v6.12

It contains:
- support for the Microchip SAM9X7 SoC as follows:
-- updates on the PLL drivers
-- a new clock driver was added for SAM9X7
-- dt-binding documentation updates (for the new clock driver and for
   the slow clock controller that SAM9X7 is using)
- a fix for the Microchip SAMA7G5 clock driver to avoid allocating mode
  than necessary memory

----------------------------------------------------------------
Claudiu Beznea (1):
      clk: at91: sama7g5: Allocate only the needed amount of memory for PLLs

Varshini Rajendran (7):
      dt-bindings: clocks: atmel,at91sam9x5-sckc: add sam9x7
      dt-bindings: clocks: atmel,at91rm9200-pmc: add sam9x7 clock controller
      clk: at91: clk-sam9x60-pll: re-factor to support individual core freq outputs
      clk: at91: sam9x7: add support for HW PLL freq dividers
      clk: at91: sama7g5: move mux table macros to header file
      dt-bindings: clock: at91: Allow PLLs to be exported and referenced in DT
      clk: at91: sam9x7: add sam9x7 pmc driver

 .../bindings/clock/atmel,at91rm9200-pmc.yaml       |   2 +
 .../bindings/clock/atmel,at91sam9x5-sckc.yaml      |   4 +-
 drivers/clk/at91/Makefile                          |   1 +
 drivers/clk/at91/clk-sam9x60-pll.c                 |  42 +-
 drivers/clk/at91/pmc.h                             |  18 +
 drivers/clk/at91/sam9x60.c                         |   7 +
 drivers/clk/at91/sam9x7.c                          | 946 +++++++++++++++++++++
 drivers/clk/at91/sama7g5.c                         |  47 +-
 include/dt-bindings/clock/at91.h                   |   4 +
 9 files changed, 1035 insertions(+), 36 deletions(-)
 create mode 100644 drivers/clk/at91/sam9x7.c
