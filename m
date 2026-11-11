Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434258;
	b=A0T2TV6YTQWj3eNI37Y6UDdMLCR/Oez2SMYWDm70TUF+x6RrLZNTBQxzZM16C8EFQwvb
	 vLgYLYuFmuOrFtzNzuwQAlpt/X59VxmejV9v9zI84z3zo+u1pVLaTMYcwqTMZpqpz1xJM
	 h/wXfZheWNmaFaULAijR5ETh0a/tJFrKvwmTT35VpMQLs/Mo/RPzZvjpM9B6/Idccp1rq
	 8Dp0OienS8DaC7xmb3+1We9t81gHhCvX7q6hVMmKygdkDcAenfcMa7e4pzMjShPHBpuIA
	 mP6mXbg4fbIkDLtnAKByPOh9qg+EcNEXv3RNdgkJDqnDaZRuMxA+4pAEGKeAzkgveQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SlM0yBvLi14OnV7gxzFnWRbA+lvM+aJE4vd4INa5MSo=;
	b=LY9TgzmKTNxMn5FLUmR5TJOag99zjLaNWcj5gDkeOxCFtGNxWIyaeGNMGT56EkGQvBHC
	 xy73dZs1WCbf37SwZr7x5rX9jt7DpSCIcSqgyXPO0SBGZ7hR3dtW+OqEWzT7sqcLkSrXE
	 Bf4AhKWvVKBbwQqCwXV3fG7OvZ/v3u7xePzV95zA1X0sLXRLp/rVjdCThKwlhvfC3OZHT
	 bOjmSeEXFPL2msJrXA+3dlR1OPq2KQCGM1aHYS2UDRYtZHHrsFU3aTlPmskQ79Ou1vAPF
	 IauCreofGT0kEH1y28Z7jSsfpy7rhTIKhdsOui94eRjGMffquE9z2Sk6JStYC4YPIlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sOR01uyR;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43997606A339
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 21:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43997606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sOR01uyR
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso158054a91.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 13:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434258; x=1795039058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlM0yBvLi14OnV7gxzFnWRbA+lvM+aJE4vd4INa5MSo=;
        b=sOR01uyRvXHgOyzCyDNY0Yq0Ast07uOYX4rPz8OcCM2Gp1XpxXLHflfejIsB2PU095
         lS8KvPNsrhc+9na1BlAKBJ97wpV1O6iVAyNVzyUCz/dI8xbFAH+RyrPL5kSo3IP5KNAd
         rh4v4bSbxWecqtR/soDUSkxJpcFzQe0n8Nafsh/xQHUW1k4IqVx6a/xzXOvMigmTFzPl
         H758JXDlTcgi/nrrbLrjllIrf4zNJmmTy+rm4Ol8JwiF89D44kSgdqjjIHg+dPrSslw4
         Gs+9OxKh6ggWSexuWQExm4hHcVgKFw3Y28s/t1fo5OZMWzfzgZT9F/abgLmoz1u1EBrm
         NDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434258; x=1795039058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlM0yBvLi14OnV7gxzFnWRbA+lvM+aJE4vd4INa5MSo=;
        b=CxmiNi1h6nMdLZquUt+dOqvVc/1nRfQwg0VYbY/+CfQVV0KtF67lxVFM7OLq3NzWlE
         nkJMNjvbzQ9totYLK8WAW4gI8nmWQh8vVcXxmcwysDbjtwu8X/oLkgIrCqgUtTYR8fM0
         EEmEHHoU6zSfOS8Y5icV91t/IrRikJgy8QHLQNPVb6dvJW18052w810Nfj4OtWdd2PfZ
         lTza0/x4aXRfI0mfbi715WiFNDDrFa8yz9ep7agxGmZ9HaEAFw5rYG4D3bnKkJSEVVCz
         Y8EuQG90Qt3qNrfJ2T61kGIncxUMXJKQhEjHkSgPUfEzCyQpkwvqzY8tbpOShLv/ERBe
         AQpg==
X-Forwarded-Encrypted: i=1; AL+hErF3vaqEMqtUuPkl0Hrnk6AukZwJ4B/QV+qev/wY18vfghGKAAjiq3mQHmoHLOYQA0ElG7VQ44LT+bA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8no3+7LHpC+KpnAYzICM3KIAzjuH2eshhz2D5W/8dWiHz8Vhl
	C/wiriCrrX3mhnSOP0g7DITN4xBMf5WiuT7aRja0ih1+2O8MZ/q2smWG
X-Gm-Gg: AYBFou3uqjXhNzziYALptHQX2qVTgbYtfjps5e3h7s4r+TbIiJ98+ZoqwAc2uoQmU3A
	5WS5vuQShfNVot4mWl03FJh796JIyxfwq2P1Hl0yfn6e0flJU2pJkTdYbYVtbg6TH1O+bNK6OoO
	P4uaaY+1i5QMrP797Nt5zOQoxeGUk5DTw57Zy8NZMvTUInz+bm4Ht7KHWRSLowWFqvBxBrySa3x
	5op+YVD9HNoFJy29NV+d6okW9jjqyHiGclE+YgrWCsfKx4dFN15trqdXirQFHzvjORBxCnXgKYQ
	CkI3BAE0Koo/gAfo1bSeHFOrh2+vUacq87QcOdfn6XDZxmlMjZMaKiN6hNLEfbETU5piyA/fCm7
	v5Cj1lK+g3IzTgso9xLuRthIX3twWrNoVLjQZJRbe234JNr4hXTVHKpypagknU6B5DNqDKHpbZD
	d16xZx/98oEmOFcwkmOD8dT0IxxVYxOdfPRBCbJRQC8A9vI5MYvVL/A0neqky2URmQEmHHpuJRs
	vHaMTyOLydXIwJQLCNvgshO8MwXzHJFu69FmVgIwaRwuycNspbynPkgZMRvA5Q7ckkMcP48iP5+
	z24GwPLSBJDd4hWE+v7LIC25FPzPF9jjagZr/Da+6HVVzZpccfrVJth/jwT5gSoKDcxmKIl9vVf
	6a6Z5bg86Eg0Y60m8fpdoM6VSHICOHgtZzUGkt3yOnpgVmlpRKiyKu5PuEEzES48hgo95S0DTvg
	hysg==
X-Received: by 2002:a17:90b:2fce:b0:3b0:9310:b255 with SMTP id 98e67ed59e1d1-3b197cce666mr391401a91.36.1794434257629;
        Wed, 11 Nov 2026 13:57:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:36 -0800 (PST)
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
Subject: [PATCH v3 0/7] clk: add a driver for the ath79 PLL controller
Date: Wed, 11 Nov 2026 13:57:22 -0800
Message-ID: <20261111215729.10683-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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
and 4 drop ATH79_CLK_END, which is not ABI, from the binding header, and
patch 5 adds the UART1 and PCIe PLL clock IDs. Patch 6 adds the new
driver, and patch 7 removes the old code.

Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
of the old code. The serial console, both GMACs, the PCIe PLL with a
QCA9880 behind it, and the WMAC all work, and no devices are left
deferred. The debugfs clk_summary, consumers included, is the same as
with v2, and stays the same when the clock-frequency of the reference
clock node is removed. The other SoCs are not tested on hardware. For
each SoC the rate calculation was compiled in userspace together with
the old code and fed 2 million random register sets. The results are
identical, except where the old code overflowed 32 bits with register
values that no real setup uses.

Changes in v3:
- Register the reference clock read from the bootstrap pins as the
  provider of the reference clock node instead of with clkdev, so that
  its other consumers, such as the AR933x UART, find it and fw_devlink
  doesn't hold the platform driver back when the device tree has no
  rate. Drop the clk_get_sys() fallbacks (review feedback).
- Wait for the PCIe PLL update to finish after each write in unprepare
  too (review feedback).
- Add the UART1 and PCIe PLL clock IDs in one patch (review feedback).
- Drop ATH79_CLK_END from the binding header instead of growing it, as
  the number of clocks is not ABI, after moving the old clock code off
  it (review feedback).

v2: https://lore.kernel.org/linux-clk/20261110013646.1582970-1-rosenp@gmail.com/

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


Rosen Penev (7):
  MIPS: ath79: apply the QCA956x timer workaround in setup
  MIPS: ath79: move the bootstrap reference clock to setup
  MIPS: ath79: stop using ATH79_CLK_END
  dt-bindings: clock: ath79: drop ATH79_CLK_END
  dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
  clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
  MIPS: ath79: remove the old clock code

 MAINTAINERS                           |   8 +
 arch/mips/ath79/Makefile              |   2 +-
 arch/mips/ath79/clock.c               | 673 ----------------------
 arch/mips/ath79/setup.c               | 107 ++++
 drivers/clk/Kconfig                   |  12 +
 drivers/clk/Makefile                  |   1 +
 drivers/clk/clk-ath79.c               | 782 ++++++++++++++++++++++++++
 include/dt-bindings/clock/ath79-clk.h |   4 +-
 8 files changed, 913 insertions(+), 676 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c
 create mode 100644 drivers/clk/clk-ath79.c

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.0

