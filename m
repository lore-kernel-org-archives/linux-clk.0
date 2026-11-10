Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274611;
	b=x0gnjla6WpKdTFe8Kh/gJiS6vZj4/raGMwaLCBVIMbh0PvouUc/MeEao76cGAsNBzXN5
	 tHgFhezsmKs4fMe/3iOybUoNtAliVXZiH1JKST8ipfOyHH/4LCgYiPR1axfdBohV6h1ub
	 E6B07OVbyGCdJZB+iXjol7gudUnu+6gOQF1wHxEFsNwWeAeEOHK0JKOrJy4j0jRNY7Tta
	 hbBWCVGN32MpXDldCdU3YojzzbB5iM8uSgvshCEAszEB54SngkbXQyO/oG7g70XohWOzC
	 BW9FzZHF8PxM5cavRIlDfoG8xs9IRvQhhMkyM1lJ4vepa5JVKBx1MveUpTgaIukIFEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yq8OaymsGv1Izlycs1HhxHCWmqIk//CwjtwmB2avx0E=;
	b=VZMATrHlq6uHexRAJHppUm2+diwGaSYkYlbtefWHZV20/5rJ/6mxFhpOGNleHTWp7XH4
	 W0E7aHH+aEqAdGfb+TMFqv0l5L6887V+D87Gk3ezfdPq64VlK1zlMYXA3PO06HPmOYhYt
	 5S/gu8ELlXSGUGCAi4cCDlP46BDOZfGrvyem6T9iqeOHgKrUXiyQ0YZ/cKXKfM+ZSZaTx
	 jOIUgDFTkFoGvJveRLct1NMSY6n5P2x8WIhCBT3RtxsGHQv7C98h2LGZV/4XdeD0aSOYW
	 Rj9JSBXYz++JAyyf1RAlxy5meePs161DhHe1NBU2QTxacqyRjpt9Wb6iJ1gslY+vWIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJKgaiqT;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1208E606A33A
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 01:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1208E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJKgaiqT
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e987a2ba0cso8696365ad.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 17:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274610; x=1794879410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yq8OaymsGv1Izlycs1HhxHCWmqIk//CwjtwmB2avx0E=;
        b=BJKgaiqTeyCgUTyCHLDl7Njgh/uAeAtOPZc2yyrjiThR3rdAJFgq7SjjpL4cBWvwSv
         PrMgVY3RgOZNtSkdVKKgwyJEvW17ai6wl4TDkudDp6PZYW2GEaotiWuGmJjhSEFeH6Ro
         BTby7IPCiuj4e6Aje6s0YZZEu8YSWGv3bDotCxKUG+tMlEtKTs2jR50wA6UboYeH4feF
         /w3/eYcRislA1YfJ5pCzeLNyRDydqL91LAQdNau2smpJXgcB39PQDJ14Hooj0/Sq8uun
         g568MqExacIKAQh3jdt8bsiRCcdRUyeg2OZTj/TQrSnBgQGFxQgE7PtNzrujBhAFG58z
         m6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274610; x=1794879410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yq8OaymsGv1Izlycs1HhxHCWmqIk//CwjtwmB2avx0E=;
        b=VhUSqxIH3kYgHaFE28A7VqoSBb5z8wSRObpSoZbPOMzfcv1GLR9/BAHjSgF5QaE/6F
         ohEhFgoG2+gU7lqwbx06npq68GCdvsArW8tE9DJlIMMGdiFdN9BgOSxiQfqSK+P8yIki
         iFqp2wUD0N+YZl2t45E8HIHEyGTiSAizDST3xLlC23NuLhnfzifbGja69kk6xNWBvno/
         WVkMlzT/QMQv3i32Pw2ZK4x19xgf8c9+sDDiLtQC9zqX9n9dWG9+lbkQoKBSTk0hI1eY
         XUfyWrVpB3wazpkuPVVqJpqmQqGr0ruTDa+y56aPQTdr3kNn5htP225wvvqV0pdUuzHT
         uWBg==
X-Forwarded-Encrypted: i=1; AL+hErEQ1zQnuiA0813NrqvifxzyaqJQXkWkZW39wlgeX8V65Rz1m/qmwO6OATdSIclbe7ZYQBs+LzRZ8Ec=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DmCHt3VL2R4XxRy2u8jm+9jd+I/j1KkeUEsiugHrI2nQ7+pQ6
	VdEZ2jbylvO64MA2hjratnQP+xOWYLSwxF6IrzGYclCxhpMagGQL2q9C
X-Gm-Gg: AYBFou0LL7AhlcwVUDYYfpoZqwlMeZ+9U5YsDGNZz8TUsKLoyRPGJIdRYBaVXEp4b46
	lBxCqZmq+RH1zlNtUExswrrErYb6ymlhKhYZzIfHojBMstcXg0y3uYlDxiWhnbuqq5XNDMAacVo
	ANjOOGGSSE+RpoqmTLskRGA1LrfN/KB1puMq+C0tx8DOizzOvkmAhIjE0a0OMf2OXqi/e6cknW2
	DpkLT8P++ZWvm57S9jQv16++H65WhoL4eWGLHG1D5LTmuJ2+HGWb2JO63mGPpQRzLY0IR+lvzs9
	X6s1WZ6bePucIL7LETC0HJ2W1Cfh0yf68j09ZYvBAaAwcLnCuUrf6ZVIR9cHMOafMMO8eUEOglJ
	DZouZ29kocVTzgW/eHY5GdU8lBRsqv+i1OxztwyusahzJAiI7pS4KCjMPAmEQnpx7hSPIAFJGoz
	mPUUyMW/Njkmw79sOJMXHd310+vtH6XDwMc/u5q9624VEyc64sUtY+bPsL9Oe8KWrypTqSHm5Dw
	0mxSx0PEskjuJaRV/hxgZ3gb/39ejTArDeErRWMxEAuUcZ7T8KPxZqx3UFk6hlxReX7X4MSB/qy
	EzCStqy8kHL/RTSxpvEdIWbLc/Nmkzjv1YFyjEbuyjrnOAgpq5ZdeeC+b0Ga81x9rsKhequUccv
	A0yxxNQaNMtQprcU0SZtM4B3aJ3PkyYbYzFa/Aipac4/GqlLvutIER1UaW7qCsnCZ5mngC5cADY
	LUXg==
X-Received: by 2002:a17:903:26c4:b0:2ed:5548:298d with SMTP id d9443c01a7336-2edb928164bmr9145275ad.54.1794274610253;
        Mon, 09 Nov 2026 17:36:50 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:49 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] clk: add a driver for the ath79 PLL controller
Date: Mon,  9 Nov 2026 17:36:40 -0800
Message-ID: <20261110013646.1582970-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
clock before the driver core is up. This series replaces it with a new
driver in drivers/clk.

Only the reference and CPU clocks are registered early, with
CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
plat_time_init(). A platform driver bound to the same node registers the
DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provider
returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.

Patches 1 and 2 move the two remaining non-clock duties out of the arch
clock code, so that it only uses its own registers and the clk API: the
QCA956x timer interrupt workaround, and the reference clock that is
read from the bootstrap pins when the device tree has no rate. Patches 3
and 4 add the UART1 and PCIe PLL clock IDs. Patch 5 adds the new driver,
and patch 6 removes the old code.

Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
of the old code. The serial console, both GMACs, the PCIe PLL with a
QCA9880 behind it, and the WMAC all work, and no devices are left
deferred. The other SoCs are not tested on hardware. For each SoC the
rate calculation was compiled in userspace together with the old code
and fed 2 million random register sets. The results are identical,
except where the old code overflowed 32 bits with register values that
no real setup uses.

Changes in v2:
- Post the new driver as one patch, instead of moving
  arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
  patches (review feedback).
- Register only the reference and CPU clocks with CLK_OF_DECLARE, and
  the others from a platform driver (review feedback).
- Describe the SoCs with match data, and read the CPU, DDR and AHB
  selection of AR934x and later with one function.
- Keep mapping the AR934x SRIF block from its fixed address. It lies
  inside the wireless MAC registers, which ath9k claims, so it can't be
  a reg entry of the PLL node.
- Drop the clkdev registrations, which have no users.

Claude Code (Claude Opus 5.5) was used while preparing this series. It
wrote most of the new driver from the old one, together with the
userspace test of the rate calculation. I reviewed and tested every
change and take responsibility for it.


Rosen Penev (6):
  MIPS: ath79: apply the QCA956x timer workaround in setup
  MIPS: ath79: move the bootstrap reference clock to setup
  dt-bindings: clock: ath79: add the UART1 clock
  dt-bindings: clock: ath79: add the PCIe PLL clock
  clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
  MIPS: ath79: remove the old clock code

 MAINTAINERS                           |   8 +
 arch/mips/ath79/Makefile              |   2 +-
 arch/mips/ath79/clock.c               | 673 ----------------------
 arch/mips/ath79/setup.c               | 100 ++++
 drivers/clk/Kconfig                   |  12 +
 drivers/clk/Makefile                  |   1 +
 drivers/clk/clk-ath79.c               | 778 ++++++++++++++++++++++++++
 include/dt-bindings/clock/ath79-clk.h |   4 +-
 8 files changed, 903 insertions(+), 675 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c
 create mode 100644 drivers/clk/clk-ath79.c


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.0

