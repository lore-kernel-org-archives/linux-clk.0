Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E7C3E3DB1
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772559374; cv=none; b=MDICqrL3YcYaGSfs7ZyqO4evRCL/k63b3WS3uV8/YGwjl6DXU9nzOrMObSH/jo9maYT8TeJ+GD/aXWkDqPLEeReTA3okGShn4ZoxPEDET8lnNZjmOjs3VCr3oL6w2ifbit3D0h+ii3sNkUhnyF8yTd10p2QwJDS4OUTEUqzmGaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772559374; c=relaxed/simple;
	bh=fdCdFhp6AyoOAqbkB9WFf5GSuZjWAIHZZrzt48bJ2Is=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rF8swOJ8DyYDSQgwvLUuUsrqr6Lk8jDU92KqbxrFzzBg4a+ft112M67gP+TrHTZfbkHSdMWPBz5GFXfhIX1tmo9/VAzncr2GA8hr+yNNs9w4zrKWf6OdYmvn9t46fgtPRA+SiUoTFsS6pxT7YCQGE+rlom1LOPN4ESTbKCsgZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=WOaRI39M; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="WOaRI39M"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7986fb839f5so50507197b3.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 09:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772559371; x=1773164171; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H6iTpKo42LQycXu04Lv5eBd6w/oQMbMtVO5fhoLyfQU=;
        b=WOaRI39MRD1yd7JDKuFeT/66RD2oKPim87461YT9ao0Lx2NM0+ji55K92gd3GFPZJ1
         8mz+WNJZIhRhjha07aXvV8oIjpVOt+LL4CbwIN8ix5LT4/PFGWuc2n/cMmPH9axbeSm6
         ebNs6Q9TDvQign3OgMDSDF29jJMmFmHprKPKpyn/EUQCmJdnD9tWbE35dknd7U48sLeB
         7XYrLsbNBnP7CSU0UycM3dt7tWsSF1On/2zz98L8x0p9hkIZAb59BnFmdpJtwavLZ6zh
         2Ua77Jydrp1jkrAWcSP6Diul3km0B7T2jDhFlYvRxyWzNVw7ajbxWOZBQSzk3hbP2S7t
         y9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772559371; x=1773164171;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6iTpKo42LQycXu04Lv5eBd6w/oQMbMtVO5fhoLyfQU=;
        b=Tvf3ow6RnNCmIjXz197IB6+nRcGPtPvIHsjm00a5gMDuGb0KXV6Z07y3eiLl3sKDL+
         igSVqoKSEAkE8hahwze8Xzvr0mnBCOobEPWeiCy6oKUUBAlpuTSFo8PGmIHf066p0Ig1
         zhJs51b5c4UqD4VHoYtApDHE6xNNPvoKKTuOCNiwotPTd5hXhAaREy+GhYakB2WS3lb9
         p/7raoY5ACNKMiwZ+23gwDZ7KcS1EJFhPelikYqq+NW9SmksgeHjxesN4SRrRqsC4i27
         qFDDqPKs2GErAW48AZkNA2YzjDmQqMNE1V5D0dsOL3r3EPay4g8W1tUxTIAh/9Z17Lge
         Wlsg==
X-Forwarded-Encrypted: i=1; AJvYcCULA4I+scDurfwp3+QI7bCOIyqRX3B7FJ11fc034VShQtZsEN21PRKcL8Go1tNYNmp+5JKgxdBC8BM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsEPSfzbPKhdY1ai9CNG93+EvmrmMowKJ38owcSIgh6V/PA/Ld
	LdYk+pVqKRVIGJTS0Er8WjOfXpRpjBMo6x+nB6ca4/TBHHwnDSWHSuuJgQMAai7t1zY=
X-Gm-Gg: ATEYQzyMAjCwwNgnblJElZ5RF+mcJTScP3AvRnyyeaDIdm906MGB+ijW8CmJFAr+uNQ
	9I7CcocJ5DxQ1t+J1GagHV5B3VTEfikCgRDJKO7nYTSoBIhzilM9EX/Jn3gQN9jEaZVv4A078Bp
	7q5kxcCmqnGPO+MmtKZ2b1trswYo+LNWAx7AR/waTnrD+jEeKfvFD5hIAZ7sF1Po/n884DeUkMO
	syv5xZoAYfq/+n5ECA46cSixsFctoYgIsERhJpmaucBMUoW2V0bj7S0R6oq0oM20XaOusssTv4c
	boMuPCI/IGc95hsMmNwcHZ9vK0/femokPROceQQZihknqIhsL0boMGhqMh+9YXoW8HOhjwjSbYE
	igvhHHiWXxismC7oxWc6mowH31ouF7otuzzvSNANLAZclGl8C1HLCdMVczgHGUwqjAI0EYKkKCv
	4Eo6fOLmO2iiITEmIixNUxCsLmUvjQCFxcLDluDhgDqGRpW5eR495Rje38vb3CZ2kXm7yIOcmIS
	T1nXkgpMKzicxjhLRd7
X-Received: by 2002:a05:690c:d8d:b0:798:78cc:3e54 with SMTP id 00721157ae682-798855df3b0mr150815947b3.48.1772559371384;
        Tue, 03 Mar 2026 09:36:11 -0800 (PST)
Received: from [192.168.5.15] ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a8df9bsm64750477b3.1.2026.03.03.09.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:36:10 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v7 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Tue, 03 Mar 2026 11:36:06 -0600
Message-Id: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYcp2kC/3XQwWrEIBAG4FdZPNfFGeO49tT3KHtQM+lKt7HEE
 LYsefeahdJANhfhF+bzd+6i8JC4iNfDXQw8pZJyX4N9OYh48f0Hy9TWLFAhKQCUfrz6fkxFxmu
 On0V2yqkIToUTtaJOfQ/cpdtDfD/XfEllzMPP44EJlts/y2ysCaSSVhtistDhKbzlUo4j9wsxc
 D8eY/4SizrhSsJtqwmrFIm0BdKOifYlvZZoK+kqBQUE2hgDwe5LzUrSais1VWqoZYOtQYfNvmT
 +pXpsJVMl5RC50T764PclWknw5He07CnUVuSNi1Y/l+Z5/gU6XC1HKgIAAA==
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
 bmasney@redhat.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
driver. The third commit adds the clock controller driver, and the reset
controller is created as an auxdev of it.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

---
Changes in v7:
- Rebase on v7.0-rc1
- Added Rb tags for Patch 1 from Krzysztof and Rb+Ab tags for Patch 2
  from Philipp
- Addressed comments from Brian on on making clk_ops const static and
  use of !! operator for non zero value checking in atlantis_clk_gate_is_enabled
- Removed multiple error messages that would be printed on failure to
  register a clk
- Corrected clock-gating bits for some of the PLLs and adjusted
  pll_is_enabled function accordingly
- Link to v6: https://lore.kernel.org/r/20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com

Changes in v6:
- Renamed bindings for PRCM module from "tenstorrent,atlantis-prcm" to
  "tenstorrent,atlantis-prcm-rcpu" so that filename matches compatible
- Updated reset driver to fetch parent device's regmap instead of using
  auxdev structs
- Moved reset register offsets from include/soc/tenstorrent header to
  reset driver
- In light of above 2 changes, dropped dropped Rb tags for reset
  controller patch from Philipp Zabel
- Moved clock register offsets offsets from include/soc/tenstorrent
  header to clock driver
- Removed shared header file in include/soc/tenstorrent
- Remove boilerplate code for initializing and register reset auxdev in
  clock driver and create it using devm_auxiliary_device_create instead
- Removed struct atlantis_prcm and it's occurrences as it is actually
  not used anywhere
- Fixed an incorrect use of boolean && instead of bitwise & in pll ops
  in clock driver
- Link to v5: https://lore.kernel.org/r/20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com

Changes in v5:
- Replaced to_atlantis_*/hw_to_atlantis_* macros with static inline functions in clk and reset driver
- Add Rb tags from Philipp Zabel
- Link to v4: https://lore.kernel.org/r/20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com

Changes in v4:
- Dropped !rcpu prcms and custom property used by them. Will be added
  later with rest of clock tree
- Link to v3: https://lore.kernel.org/r/20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com

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
      dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm-rcpu
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add Atlantis clock controller driver

 .../clock/tenstorrent,atlantis-prcm-rcpu.yaml      |  54 ++
 MAINTAINERS                                        |   4 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-prcm.c            | 893 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 173 ++++
 .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++
 11 files changed, 1258 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

