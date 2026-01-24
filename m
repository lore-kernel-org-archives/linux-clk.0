Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2038F513
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769248040; cv=none; b=S8hCy2yzRY9FPq+obkrJb/jX0Rv7diLh6yETHxt5tKwsBSMyT3/fII62YQtaQ6PHdyZWax9JDF5Zw/spjMtGAk/gHu75Yx6NMsR+reqg4KdUtn4nJcUaAYZDUqlHzHMxlTD/x3OZmN/kPmwd/au5hD0XAcU3AUko667hRKa8fRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769248040; c=relaxed/simple;
	bh=0bCjYphcq4HGjPZtMvzozka2YFFdDW2j8f+Vb9QJ0Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VNbxxhGMvHzgLYSdC44DW3W8D7k0EEGJFa/Qv3oFE+6BgCGJyxwKK6pZpB6sC2d7WfDgvSblXKQSWdUrRUb0aRTcTpIq9k4lh/GArwr4yLEVHXqAUeqOzjldJbnmw3j8zB5TWWFMPY9oOdYp6k+F7+F4yvwn7tqq2Id9n8il3ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bfOTN5CL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bfOTN5CL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so41657195e9.0
        for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 01:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769248037; x=1769852837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uud2oUTC52zFsSDQ8gS7qn6tbVNgNYPWn/BGGml4wA=;
        b=bfOTN5CLhyeYMtfzGakonqMfREXceXKHSNwECPbx4/mWlrShe6xB7Rx6H8YJRmowiQ
         vK4szsGmRGAP8SufN+tZ8Imj1jnk+f6HCzdhnCHl2JiLqhDQN+HpNHY/fzY0HR+DOUtl
         BT+3nZo22t6XwrhNV5fkWdgD2gNJg67t9GZRSUJsf6b1KMW1WBUqABZgn/RyToJMWetV
         vLGaeC8/f1FQmt6u6kR3INfNuokU1TqIu34JYP+aAxdWsc+VoooCQM2LJc2zVjOWii/7
         4rVbFDTTNR0VXWWvijnSKVBhNXf+PipKjRB0GDDFc6S3FzVHBa4SIiGo5+697bjeMtqw
         C2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769248037; x=1769852837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uud2oUTC52zFsSDQ8gS7qn6tbVNgNYPWn/BGGml4wA=;
        b=Xe7F5SAPlbsyKYeeHnB8s989x6mlWwxMbLThD6SeAoem6rCeE2A66H4XPKouzlW3Dw
         f3iJGT7v5P/F7Vl8xIWmNOmC6ElrhxHbPjGGqccCEKljzcGEcpDqVQByyYAPu4ULIezO
         4osokAyyo8LZ+TE2McpGzdPiSjiwG0sDymiGRpG86oKiklqDrG8/LN6gbolLLhCPICIT
         fla/Yp28+3+WPwVnbl0m4v2uoeBPsKV/039Im8fEprqLiUyC+ZOmCJKxsDSqa6iQBh6Q
         Wd6MCq5dYalmPwDu13ZKkv4YvCe8toBGqxgzI1IE6jA8JtNilizP2NAsmoltNj2bcEy7
         HBzw==
X-Forwarded-Encrypted: i=1; AJvYcCUvCbWexKdEWgyQLcNRd6SOW3LdTMW4cFPnYd3ckC//3SG2cg00/LFtilV62/uJq1m0qTT4+bIuVJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YybwXmBkgnIyz7ORkHHvKVPZDSZVWDavsPvzYQsZ+jWUCPgYFyQ
	jftTBrCs5WBIwKpV84agHYvkJJruS7GjI5P7DYyMDJf9Bl1xkYB08+EB+lmC9PWKomH6Nr07LVP
	NG230
X-Gm-Gg: AZuq6aLCH3/aFfbPHV+qZlWBuZWy0jW7eyPDeJ/lwNQp4uIXpkgSBO8PH63+ycuL3+o
	bkJt8GCUIw9+7aSf25V0J0lWc7/rC8A6lODj8ZzmIc6fH0PRwzUY7WP96aI7UqrduzBks0kywWJ
	cFenntBRdO5rCXin7AXxt/tyYAY9yTChBT/tXGxndrwtVNNHhOnRS81zf3Oy+fW2w9t86ph4pun
	TpOPcHAyC8rIGagmh3BG8J5r7cxPV84xuHz5uOD41e+tt01/Hy4MoS6zTojBokXZIeg4t47NkdM
	lRjDOOIACwURvHAtCqHpEXCq4BrVsRQ3VQVPlSPHdwu0b+c1OWotCMCWkD2j9Z/7zUCYFxWoQ6L
	a5MaoZiAZKbyGthny1iOj4nEcavSY2vHmBQLiWZVzRzY/W8xcHLg4h8V2UL1H3hQRq2VH7mdu9l
	4Z8gyFdyk+WOgvtva0zbHlgz+0sP58
X-Received: by 2002:a05:600c:5285:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-480572bc0d4mr14513385e9.3.1769248036920;
        Sat, 24 Jan 2026 01:47:16 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d845fc3sm108739035e9.1.2026.01.24.01.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 01:47:16 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com
Subject: [GIT PULL] Microchip clock updates for v6.20
Date: Sat, 24 Jan 2026 11:47:15 +0200
Message-ID: <20260124094715.2106796-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.20

for you to fetch changes up to ec8c1f35b5aa7aa63bd398add63a8633adad532c:

  dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility (2026-01-16 08:48:38 +0200)

----------------------------------------------------------------
Microchip clock updates for v6.20

This update includes:
- clean up microchip/clk-core.c to:
-- fix a sparse warning related to multiple initializations of
   pic32_sclk_ops.determine_rate()
-- correct the return values of roclk_get_parent() and sclk_get_parent()
-- drop an unused include header
- adjust the PolarFire driver Kconfig section as the driver is now used by
  non-PolarFire devices
- update the documentation for the Microchip PIC64GX SoC clock controller

----------------------------------------------------------------
Brian Masney (3):
      clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
      clk: microchip: core: correct return value on *_get_parent()
      clk: microchip: core: remove unused include asm/traps.h

Conor Dooley (1):
      clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE

Pierre-Henry Moussay (2):
      dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
      dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility

 .../bindings/clock/microchip,mpfs-ccc.yaml         |  6 +++-
 .../bindings/clock/microchip,mpfs-clkcfg.yaml      | 16 +++++++++-
 drivers/clk/microchip/Kconfig                      |  4 +--
 drivers/clk/microchip/clk-core.c                   | 36 ++++++++--------------
 4 files changed, 34 insertions(+), 28 deletions(-)
