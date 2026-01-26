Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8EC2DCBFD
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 21:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461645; cv=none; b=s9m+sDXAyRoZiA17ieObE1zLeV+pBRv5RIk7UYj/+hOIgylWeq9mLVyFQkOLLWpzbmb/RBnYBsxfdp7zcHHUxAD+w8k4NoRgmVHOp4BZuf3QxQwPcHD52UHwNf5HFRO8/ptqfVZc6YfymnuYlAYw1HxpOWdunsk5enId3gw1n3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461645; c=relaxed/simple;
	bh=4OBH66/ndxjvzebFUaDdQ90XWGj7VJOTgeMg342/j9c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bntYkwed3vmLXbkDJULamagcgfae6k4xOEhsDv7AUOhotCTmB2va10JKhLFeykmH4wdJiz7yUSdDuIm2m9IcxeLv8KZ2yn4hBQxRYllEnM7fYZP0MVHs5ah8Pr48poL3mrDlGHeNSWEuignb/MXGC76vsoDcMpwfJ3o/OzTyWQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=VB/NVeK+; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="VB/NVeK+"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-790884840baso46110497b3.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 13:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769461641; x=1770066441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQ+ZbTntkP2HXui9Ym0Sh9Ym8nTlNYxOBU+DQFXOvjc=;
        b=VB/NVeK+DyUulOg5WRfiC1Z6O5Zv7NzREwRCemIeNH2tPEohdTqthOWYtVhTQ7uWou
         RMZNPHmJtsHk/CePaEn4InCklFy9Jl2SDb40ysfDguq+6cNvqsKey954MR5PPvmexK8h
         BFMB4P/7u9S17iw9Y+/M3N1olZWINeYLe0y24D10Gf9G6Ccy2srOP8NK/Xga8MpISqvz
         2drsRZmkcEP1oUwdC/3SArV1BJmA68V3jKT3Ex7jC+J1sCWwxYfjReIMZpKljSKAdcA+
         022HQ+yxq8+QSVUw1c2aaaxNCw/aS86QQQQ4VN62Tl5dn3h/J9NCxuFlnJZt/5uglQEG
         zRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769461641; x=1770066441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQ+ZbTntkP2HXui9Ym0Sh9Ym8nTlNYxOBU+DQFXOvjc=;
        b=bE4ONixCBP9OZ0CSSq16iTl2z5kjqbUKlR2EATiREjyzaeNdpWtc2d1RmzB/MGVmmf
         IOmPyqvzp1vbqO57ETmJG1n0J+xkxbIJmbyAJMVWyB7XsP84eIYx+rKhr6G5xfKRrBJi
         IqC73nAcQ344fYN/btrKQWUeEA4TUf0kcGb2I8IMu2jZL1V1iFYsEepoHLqwEz1+wU/b
         maAcZqI9zsI4oU/hmlAiDtaJYHncML3H02niWRiMHHdHHCVoA/WeRWG1fP0oRlVPCoO/
         bfHX1H+2HZ5LdyAR42C9qRY92lWYf9ZflspMXIUWkhvjcoxte5CC6z8n1nWY62f3FkdP
         rWPw==
X-Forwarded-Encrypted: i=1; AJvYcCXg0G8KJnvrFbJ6OcRsDgRfcqgWP2SPfg16s2Rp+RWe2lp269SPVXw9czQI2/hD6udeg8pV/YRKibg=@vger.kernel.org
X-Gm-Message-State: AOJu0YykpNY6XMa3qvl36nWnG/oBB84UGKSUbg4APXR/tPa5nrx34lMf
	Fn5RUSBPCd+nILLaj1QaPU6snL58jlAAK2g49R6Jvx9Vala9FfZpN09hOcs7a9zhMUI=
X-Gm-Gg: AZuq6aKHyc2eTSGzMYgppG+MeTbJObx7I6s3GXGGjom6sCbAUv/HOIlKiTiX0p0moXQ
	v55A00GzVYOGdbEjyWkAn/Zq0QrYGqgLR44TF2mC90pDLkdbPWIfp3YsdS2iJ8C0AMqnB25B0Hw
	13Pfzt1tBcpFujgywNVrNw120t1baLu9Us2gDPcSfaHmRdqL3RFbFFlrc2rEJw44tns1TsRuzmG
	bkescgxQDFwNm0L3L1+pwFj/iapkOfUAL645XGCkm+LPDK/XHm3KZaRRVcvlF0hwo4D0z3Fqqjn
	5oca8W30un0Zy4QhnrupwiK6bC388dbiuPEXkNLUbf0sk6tmVAhqTlyYYpVJwf9nm6qxrcZo0VX
	htFTBoIs8TgQW4g3akZrQoNwtz6rGsbWjzCtM69u/Mf2Uo9N0bdX/wFggXB83C6Hxo1DTRTfJf6
	lBjZ8a9ytmv1D95WJZ3OsE8mU7o1TOM0s2PoV/3eJG42f2p58pfeB008zTj9knjY2K9LAQ8qqzA
	TzIck5DOA==
X-Received: by 2002:a05:690c:ec7:b0:794:198e:943b with SMTP id 00721157ae682-7945a845621mr46975107b3.8.1769461640816;
        Mon, 26 Jan 2026 13:07:20 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944bed27casm37948757b3.7.2026.01.26.13.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 13:07:20 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v3 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Mon, 26 Jan 2026 15:07:13 -0600
Message-Id: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIHXd2kC/23OzQqDMAzA8VcZPa/SD4y6095j7KA1zjLXjqaUD
 fHdV4XBwB3/gfySmREGi8ROh5kFTJasdzn08cDM2LobctvnZkooEFIq3sapddESN5M3d+KDaIS
 Rjehq6FneegYc7GsTL9fco6Xow3s7kOQ6/VrlzkqSC17pEhAqOai6O3uiIqJbiYAuFsY/2Kom9
 SOp/VdJZckA6EqCbhDgv7QsywfrNyQvAgEAAA==
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
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com
X-Mailer: b4 0.14.3

This series adds support for a multifunctional register block
called PRCM in the Tenstorrent Atlantis SoC, whose main functionality
is to serve clocks and resets. This block is instantiated multiple
times in the SoC, with each block covering clock/resets from a
different subsystem. This series also adds a driver that covers clocks
and resets from the RCPU subsystem, which covers most low speed IO
interfaces found in the chip. The reset controller is implemented as
an auxiliary device of the clock controller and shares the same regmap
as it.

The first commit adds bindings documenting the PRCM block, along with
clock and reset indices. The second commit adds the reset controller
driver along with the auxdev definitions needed for it. The third commit
adds the clock controller driver, and the reset controller is created as
an auxdev of it.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

---
Changes in v3:
- Fixed warnings reported by kernel test bot
- Addressed comments on reset driver bit set/unset value
- Changed auxdev macros to use inline functions
- Renamed bindings and clock driver to use block's name of "PRCM" rather
  than syscon
- Link to v2: https://lore.kernel.org/r/20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com

Changes in v2:
- Improve the documentation about the syscon block in bindings
- Implemented all clks using custom ops
- Removed custom lock/lock handling functions for regmap
- Addressed comments on header file ordering, newlines and typos
- Removed code for mux parent setting
- Squashed down multiple commits that added reset/auxdev separately
- Link to v1: https://lore.kernel.org/r/20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com

---
Anirudh Srinivasan (3):
      dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add Atlantis clock controller driver

 .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  82 ++
 MAINTAINERS                                        |   5 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-prcm.c            | 941 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 160 ++++
 .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++
 include/soc/tenstorrent/atlantis-prcm.h            |  58 ++
 12 files changed, 1380 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

