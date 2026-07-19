Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B830F7E8
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495626; cv=none; b=k4MPrApvbE+zfHWfBHvHhslhZQZ1yEVJ/zXRvSUgV37HCl7JbyncHXKq5BqkSOfDrypYhIyEOZA5DXfTUb7SRNkSsZc+rwjXV3sClMVO4gRSVMuxn3Cw8bjeOdrtp2DGjwfZgMVg2YZbDf+DpT1NFnqFqbun075UT9lLISGiW9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495626; c=relaxed/simple;
	bh=rQT7FnSJWSbCZQvFgg9XlhlbtVZ2Cd5f1GzQeXk++wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BBEywrOJz9dAZaEUE2EZnQUfcA3MQU4p6z539NjXmJLo/VChSgfBh8XMGzFOrVAkg5aKjMWaKP6t6vx7WhX90hqsvxSM0g9b1Yx3TgDc4dLx3ZsEcPGWL1fygJbR+8qq4SyRlkUUzL5dTJuzFQsHWFUqdD0imf4zC65SnGt0IAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbUkv84X; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbUkv84X"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so72821575e9.0
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495623; x=1785100423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoqurlPSvAJxWv157dNwPLL8InVlGkCToDlg+t76AwE=;
        b=ZbUkv84X3Vsh9jErt2iRoW/Hn1KY6LYTAk+7WhKDw9eI/R2C635AXLS/rmsJ/5u1R8
         bKbY4PCn1wTn4gLU1qqivHCeyUB1WarPnbxyPFDm43iM8yhud88AjKvSFjZS8Ffg2Er7
         Zd2Fhj+gin+i91C2pkOjwkwYwcT7WkgoVTJ/IZ7I9uWn5kqlzOfJWrd8r+FMHKagKelM
         I54VUb+VPbDSLc16SHsBaO21WdXKZfrPuzgrUCdgYjKxk4xT+cBO+yhAEXwORbn+vARt
         1+UbO0u1Q4WR6j/iB2+3YCROGaNh6Kyynhw6wCImHF1cPrtaYd7H+g0SWKsOLoafy+ly
         jMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495623; x=1785100423;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yoqurlPSvAJxWv157dNwPLL8InVlGkCToDlg+t76AwE=;
        b=maSmd+rNY8BK+XLE5BACDSExmEjyqZfS605uYDTlPwh9tcfowC7O7io786A45aWGr6
         rvHgVjRN/vpQVzHl89oeNTLawIR4c/bHPUQvcIV4a0WPkb1bP3cK+lAnBexjPu57RcGY
         pmxTcpR3iSLCIWQKpVKFwHIuhVaU8AaXFMU64rS08+PQehjQislvWU4gMrTNJGIvcrWp
         4jRG2IwxjdepH0nHOJeFgewj+PYTAb4V6P2XWYaBjByp6ppEF5U1l8o3/9CepxWx2DJN
         PwnqWWSGVHxZz2ISMOkGWz7Q+T3+2TF0IPbBB7ZKs+4aUsfibD0F8WK1FaDfPw9yetug
         57og==
X-Forwarded-Encrypted: i=1; AHgh+RqUgsGf81i2uZBHnf0XzxIkF0GBSSDvkc4HFQoptl+7FJYZw7xbRBVbpKptz95d+D8WJcTBKsTrP0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vf+CyrSZ34p4GYUuqR+cFTe6iKFReav/NrtmmIiwzdh/nb+U
	o5r9ORcJx20QHjeW/9e3J0VVmR7HWejeZ0s9v9DtRrMpg1J3LSuuyu5w
X-Gm-Gg: AfdE7cms5k+qcEgKO0UN4Mxciy+n9+naK/XaDSCNldVrnu4Ey8gv1tmlOkY616bvevj
	QKb3wLbDOaNVAQRC3Rf67184/hUwCcYqcihOaX14BqcTIsSkFN3Xgvu6zso4QlFKBM/C3u6gRmB
	Q7XPSxev7RVqBFuwRbEtBlAHk2/gdeh83Bh4+6CKEHOp6AAZ896QGQlnCbIB8WMD+APty5TTt8k
	dlFOZ4IkGEtA1dc/wtJXCceKtO2pT4/7BOMVwRieXxoIqhX+UmEjld6wb8HZrXSdviBn08ibhc8
	/KCQWXBVCYJoeGtmz2TyD46Gu8rR19T/gbENmKovpHdzvmkPwCpZXUeydmjxTWxWuYQBSP24SGT
	HEse1XPoRInf6dOdw5fgT7rvQXqkj/ggnfUTPYzwSx4K0F9pDCnpQwOYR9AHMCVwUMwnwIEuDNW
	tAMaM7uPa84wPnHlRZ7jMOpzK1brHHoxBKlzMke3qlh9I1c/I=
X-Received: by 2002:a05:600c:3b10:b0:495:4aff:5fce with SMTP id 5b1f17b1804b1-4954aff609amr121711955e9.32.1784495622909;
        Sun, 19 Jul 2026 14:13:42 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:42 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 0/4] clk: sunxi-ng: fix the A523/T527 GPU clock model, enable GPU DVFS
Date: Sun, 19 Jul 2026 23:13:15 +0200
Message-ID: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series follows up on the discussion in [1], where Chen-Yu pointed
out that the A523/T527 GPU mod clock is not a standard divider but a
fractional one: GPU_CLK = Clock Source * ((16-M)/16), with M 0-15.

I checked this against the T527 user manual (v0.92, section 2.7.6.58,
"FACTOR_M: mask M cycles at 16 cycles") and verified it on hardware:
with the current linear model, forcing each OPP on an Orange Pi 4A and
measuring the real GPU frequency with the Mali cycle counter gives

	OPP request	programmed	measured
	150 MHz		600M, M=3	~487 MHz
	200 MHz		800M, M=3	 648 MHz
	300 MHz		600M, M=1	 560 MHz
	400 MHz		800M, M=1	 749 MHz
	600 MHz		600M, M=0	 599 MHz

so every OPP below 600 MHz silently overclocks, up to 25% above the
vendor ceiling, and thermal throttling to "400 MHz" actually raises
the GPU frequency.

Patch 1 adds a small ccu type implementing the cycle-masking
semantics.  Patch 2 switches the A523 GPU clock to it, drops
pll-periph0-800M from the selectable parents (the vendor BSP removed
it citing GPU job faults) and drops CLK_SET_RATE_PARENT (pll-gpu loses
its CLK_SET_RATE_GATE protection once the GPU runs from a periph
output).  Patch 3 registers the existing sunxi-ng mux notifier so the
GPU is parked on pll-periph0-600M while pll-gpu changes rate, as
Chen-Yu suggested in the same thread.  Patch 4 adds the BSP operating
points to the Orange Pi 4A DT, which enables panfrost devfreq.

With the series applied the same cycle-counter measurement reads
149/199/300/399/597 MHz for the five OPPs, all from the intended
parents, and devfreq scaling plus thermal throttling (emulated
temperature) behave correctly under load.

The higher speed-bin operating points of the BSP (648-792 MHz, gated
by a SID efuse bin, running from pll-gpu) are left for a follow-up.

[1] https://lore.kernel.org/linux-sunxi/20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com/

Juan Manuel López Carrillo (4):
  clk: sunxi-ng: add cycle-masking divider (maskdiv) clock type
  clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not
    linear
  clk: sunxi-ng: sun55i-a523: reparent GPU while pll-gpu changes rate
  arm64: dts: allwinner: t527-orangepi-4a: add GPU OPP table

 .../dts/allwinner/sun55i-t527-orangepi-4a.dts |  30 +++
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  47 ++++-
 drivers/clk/sunxi-ng/ccu_maskdiv.c            | 199 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_maskdiv.h            |  71 +++++++
 5 files changed, 342 insertions(+), 6 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.h

-- 
2.47.3

