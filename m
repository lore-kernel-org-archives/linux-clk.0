Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165F3327C0C
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 23:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768520567; cv=none; b=tNd8qFG50T7Po3AdFpolDN9tAnXvJY0tDZD42bzkNVhFDzG0JpaDgkNEQqVZEAGbnsaGGYvtwKvk+kMiCfCjP2llUM5avMIgXuoQX4Rex/YL2vs6a+JoKOvoiZKyo7+TvxLK7m5uOURt8WfxH0bIiAIOhxHXEbsYc+YfDhji5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768520567; c=relaxed/simple;
	bh=4+/gILBdjn1eZEBZTvS6mqsYmffWsLQnnJt5jEOLzKI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CE/5fAMtbpHqi3xeMbTdtivRYWv0SiM8dhm9lFU47E1P039D7wCtNXI7r6lqSXif60XW6WG1d24FukK7SQIN04Os5u6pGcfG/ns8+rV+PLgk6asHFlpYDLI1IQJ9HTKVEDUJtjUPGk2ItXEMc5bkTIKfRSCj/Lcz6as66Bvf4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=N4go62Cg; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="N4go62Cg"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-792815157f3so15542607b3.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 15:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520564; x=1769125364; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v6vy68HrZiN7lT0nxeuJXtxrb4j0PV95v5MAtlSQSF0=;
        b=N4go62CgnPyeeeqgNojZRccmBL44eQJQrQLhLbNHBkJct2kQO8DRYS9qNfcQThmyPJ
         fdamRuGHNOh12CbSNWpVcBKxA4wm0b+11e/EqjooLUwQASoRrI/WK/mAQ+rajY8osPYO
         1OU1wyxGtnM0eVJ7gFVBHIN5Qw1VyixJJONLNFaeCZ2605Sglvai89W6Zv4kjJZz0c1q
         w0B8SmhxlGgJvjsJtxGogU28THZBi7Pcjdy7+YeaKDqiQqS+Oh7Ccg9LBMkUeiiL/0K0
         uSSfU/hN7j5L0VXFF/sB92hvfmZ3zfeyuReDGuY37dP8hL4x+7zpjnmRPhFFPu0gkP5s
         tKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520564; x=1769125364;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6vy68HrZiN7lT0nxeuJXtxrb4j0PV95v5MAtlSQSF0=;
        b=OFHLohlknb+j1xWiodSmIrsMLt3/F9pBUyaK5wBc4hzvxNrsMH0UseE+GBzK7wMm+j
         2KoCf64OsDTJTvY3wvp9pLPuAG/X9mMqfLNvJdBJ5+C++MiDG6ZxhxTKXteO8ZhZshrg
         lO3RDfY0gsUgSQ5PTYgF1ud/kKRTm4O4ecYpHv+O79DyWF7v48bIrPfezdfGk7jGlhGl
         bfgSvj5aZVT8zPN4/4e0iZs3S94+es5FVvg8ayYt/xtBX9NPGCbTvbWk9MaZXfHbHL6a
         dqxxljDjTYA6K7vDfW7iD9/W6PJHQwDhxU3aC5oKfXId1Wc5xS2irF2yVj5i5MO23Bah
         kOEA==
X-Forwarded-Encrypted: i=1; AJvYcCUPx3itzoCC4BUXiZNqnhNJTO+PhioD56jjFFtKstYrLOZlAyXUHh7twWP+pl0zXoyh9FG0Ty3UbTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtzWE4GVVEjLkrh6IUXZgsoXrOhFL2T6KVvJOP+CaNBddw3L7B
	2ydo6Dni0HXfH4KQ3uJYMZDklTtobbRHBOrhVL5toR7bHWsqi0zPTu14ERce0lKIcYU=
X-Gm-Gg: AY/fxX4IGzKlQGNHuQ1T6PGo9T+dsbBiEllj+x49PJ+l1z9+bibgDRG7K4B99UzCHCI
	LBeJZ4WbQg0zGob6xDdFQD6kkrQfjdJi6AjVzxGdH5prYrAoHTve7TZ2XfjJga/3jg/iU1i5kN1
	VhrYdQK+HtM4thFHJ/L+J5AvdSlBereaQsHYEEBCPlsRTiFyhCHMZcbn8nYlPR/TpyXK1MLU8bv
	X6BZpd3UVLZcjNp29mXcvvqGNLG8m1GlT5pQAD9qL8/mHGVtTdkEh/XTNDHIt156kjZJC90mFIJ
	/L0NKtqZaYHrU3Cam/9g6xyViQNS1HxHQzyI6CiUWlqaf4qZTlQ9egLv5MzfAtU6M6cX2MrRa9f
	n0ydC/nLvkMpChpz0KAmoAabGeNdyPahLERzqIDKoCdvZjSNxSYE5VwHBY+XH3WqWA/dv+pE+5S
	oWx6bkIYki3zh65W6wKtTaS0HGLg4CiOq+kGGqcmMpnD+ztWHm4A8x0xHJozOuqdhT3E8jX2PMF
	sVtdWTUYg==
X-Received: by 2002:a05:690c:498f:b0:784:8338:ff78 with SMTP id 00721157ae682-793c67115eamr8895767b3.29.1768520564077;
        Thu, 15 Jan 2026 15:42:44 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:43 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH 0/8] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Thu, 15 Jan 2026 17:41:59 -0600
Message-Id: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEd7aWkC/x3MQQqAIBBA0avErBNGF5FdJVqYTTUkFk5EIN49a
 fkW/2cQSkwCQ5Mh0cPCZ6zQbQN+d3EjxUs1GDQdam2Uu4OLN4vy4fSHqBUtem1x7rsFanUlWvn
 9j+NUygfoh+4lYQAAAA==
X-Change-ID: 20260112-atlantis-clocks-f090c190b86d
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3

This series adds support for a Syscon block in the upcoming Tenstorrent
Atlantis SoC that covers clocks and resets. This block is instantiated
multiple times in the SoC. The current series covers the "RCPU" syscon
block that controls clocks and resets for most low speed IO interfaces
found in the chip.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

---
Anirudh Srinivasan (8):
      dt-bindings: soc: tenstorrent: Add tenstorrent,atlantis-syscon
      soc: tenstorrent: Add header with Atlantis syscon register offsets
      clk: tenstorrent: Add Atlantis clock controller driver
      dt-bindings: soc: tenstorrent: Add atlantis resets
      soc: tenstorrent: Add rcpu syscon reset register definitions
      soc: tenstorrent: Add auxiliary device definitions for Atlantis
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add reset controller to Atlantis clock controller probe

 .../tenstorrent/tenstorrent,atlantis-syscon.yaml   |  63 ++
 MAINTAINERS                                        |   5 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-ccu.c             | 991 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 164 ++++
 .../clock/tenstorrent,atlantis-syscon.h            | 101 +++
 include/soc/tenstorrent/atlantis-syscon.h          |  53 ++
 12 files changed, 1408 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

