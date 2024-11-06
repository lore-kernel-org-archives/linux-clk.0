Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32131DEFF7
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 12:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730894493; cv=none; b=ehhPTwZZpsCPqF0MaBUeah5FNcLO3GRGUnLhxdkT38RY6Y1L4Bz3SwxmJ6LaDGfWBf50GcdvXL/RaEJHxEtketgMuc3KkimcFdcn5k4TZgO+0sZz1M9putbMZgNH3wnLSCBByMkIDp1LDr1lv6KOPBCQQhW9yQ39lZhA5DIfcsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730894493; c=relaxed/simple;
	bh=PQUaNmhCftixjcjPvmM5IEF5VOVSnPAEw/w/dSs0lYc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sA8p3pU6axOTPqIA6V/cvK0qIpznGFiqzDcE2hS1omtwls9uWEVAOcjBBS6PAEfHoDfnVXYVWtPXH1Be1Cfn6kG9I1dgraCqHj6CPBebviP/dbuug/QxzhnrnHJJr0sw/g42ADX5tnX3YUSIGNjMxuL3rt2Fl/IR56Lcc+XqOno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=d+xT45VX; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="d+xT45VX"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c94a7239cfso4089621a12.3
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 04:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730894489; x=1731499289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4OdoU3Lr3nA667dN5ioAfPSrG7GOf/Q3AS1dKLXo78=;
        b=d+xT45VXfxcxvBdFkWafFk1XXwyV4uB83uiH/5DhKkP2IWtd2cTe7OBUBgpF5VSLif
         qFkyPFWeVxexY08jCCPJ2pSaTo/JvaaBTtrCZ7WJD/c8F9O8vRoRr7TfJwCWG/KM6r0H
         BhVCRV/t7fEqzGgZO31wVRQvHU7ovQE90fPBtRt3U+JjRZig28EZEn6BgZ87yqgxt2kQ
         mGNzgeOQ5ube/FWyB9IPXBWTj/foB9AbGxxmcs9xlxmmjAS5udLe930PSWGMQRIor2PV
         OyYTCl5sM8cNxbVW3NoBcdFSofgjioks8v0EwNPfsUf9QPtHGBJAJkB6BG8v7PA6IvXb
         FgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730894489; x=1731499289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4OdoU3Lr3nA667dN5ioAfPSrG7GOf/Q3AS1dKLXo78=;
        b=vV4hrKtNP52y78zL8dVrOURH6dUEeHcGT8qOv0grYuh/vjdkZbUBc+nd3btoxkMpIM
         vb3mthDvS+PeGxyae1p1nIj1d6LObVo7xebMFzfEwmZULk1tbo4VmFbdBdWadPoprGaz
         RKZ7R1OfINpd4nb17cfGYU10g+aWMqR/hJn0LGMgOd8aBg5wgvv0vK+Mvdz/noG+aR//
         dLNIWiOZyS4qO7TOFB0s5XuAJvDqZYXoJluNH+AQ9jKtfEVYd6YnXxVWAJ2crxkk7f5f
         kKzKQUs3X1D8ssZkzx3Qfc9IaQM1Yg4uAqhRWKfysaUAszwRo00srTf0BO1Ms2Sm5apK
         RYyg==
X-Forwarded-Encrypted: i=1; AJvYcCWJt0QWNlWTDk8APuPYrgnYUcs7jxX00dAYYkTWdK9+IURY0nEudGJhunQNH+dlhgvtUD0McBgEoog=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsxa/+d/Ir/ac1qltmV1WEUVvmcDB/t6PXSjuuRtP2Y6oUegYu
	TwPWmtu7X1DxFdgVTLB5UD8VzCLfTqnsvGelMvgD2zaqdp32r1UcH5wHBFmfsmo=
X-Google-Smtp-Source: AGHT+IEMBnLm3/r2LARk7JIsFb0z++ZbjgxFeX0AqX0aEeTorNzBh5pVrmLo1R/U4UFfsHZpRWOlUg==
X-Received: by 2002:a05:6402:5215:b0:5ce:e5c9:4491 with SMTP id 4fb4d7f45d1cf-5cee5c9455cmr7256569a12.15.1730894488782;
        Wed, 06 Nov 2024 04:01:28 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6afe528sm2697984a12.55.2024.11.06.04.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 04:01:27 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de,
	ysato@users.sourceforge.jp,
	ulrich.hecht+renesas@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/9] Add support for the rest of Renesas RZ/G3S serial interfaces
Date: Wed,  6 Nov 2024 14:01:09 +0200
Message-Id: <20241106120118.1719888-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

The Renesas RZ/G3S SoC has 6 serial interfaces. One of them is used
as debug console (and it is already enabled in the current code base).
Series adds support for the remaining ones.

Patches:
-    01/09 - adds clock, reset and power domain support for the serial
             interfaces
- 02-03/09 - serial driver fixes patches identified while adding RZ/G3S
             support
-    04/09 - extends suspend to RAM support on the serial driver for
             the RZ/G3S SoC
- 05-09/09 - add device tree support

Merge strategy, if any:
- patch 01/09 can go through Renesas tree
- patches 02-04/09 can go through serial tree
- patches 05-09/09 can go through Renesas tree

Thank you,
Claudiu Beznea


Claudiu Beznea (9):
  clk: renesas: r9a08g045: Add clock, reset and power domain for the
    remaining SCIFs
  serial: sh-sci: Check if TX data was written to device in .tx_empty()
  serial: sh-sci: Clean sci_ports[0] after at earlycon exit
  serial: sh-sci: Update the suspend/resume support
  arm64: dts: renesas: r9a08g045: Add the remaining SCIF interfaces
  arm64: dts: renesas: rzg3s-smarc: Fix the debug serial alias
  arm64: dts: renesas: rzg3s-smarc-switches: Add a header to describe
    different switches
  arm64: dts: renesas: rzg3s-smarc: Enable SCIF3
  arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add overlay for SCIF1

 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 90 ++++++++++++++++++
 .../dts/renesas/r9a08g045s33-smarc-pmod.dtso  | 48 ++++++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 25 +----
 .../boot/dts/renesas/rzg3s-smarc-switches.h   | 32 +++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 25 ++++-
 drivers/clk/renesas/r9a08g045-cpg.c           | 20 ++++
 drivers/tty/serial/sh-sci.c                   | 92 +++++++++++++++++--
 8 files changed, 301 insertions(+), 34 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h

-- 
2.39.2

