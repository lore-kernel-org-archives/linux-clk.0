Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BA137C91F
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817155; cv=none; b=GWsTyBTcvpC/aA6MXPF53CMQnaw4racIzzx084MKeb5FjXNflzKi/Ao3R00oImZvBuQL9eNzPPcY08Rk9kS0+KJWL82FzFv/eTZaXsZ3F0VXJdx3/7xHqSOgOkvNC0JU/5Rgiwufy9LnV8u6aVK6nVKOPDanXAvrqg+SV6dBwCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817155; c=relaxed/simple;
	bh=s2zQbVVs6WW1eYbGanCjuW6KgHqF7qB2zFo4dHFLtBQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W3wsrB5TNVfzqh58V454r5Iq4riaxys7Od4JcbstIcjfpuAuepubPT+cCwpXBSb998Ov9MgmE5pwxtkmfWh3vPxt3FKzBzmbgqYv4sUAUQM/niSyAeEfR1G9qKpZv3vWNW48Xr1H/0ZDmzd+OT4A6MSiyXFSBeCp5fxSKPQLAuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=brBElwYk; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="brBElwYk"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7986e0553b0so82257837b3.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 09:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772817152; x=1773421952; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4TGiovKYE/NC2WLaNQ96o80qmi6PqcfNfFUs3pYMxs=;
        b=brBElwYkRBNxE+pciVs/4aT2c8UXndLGVEaOPuyQPUYvoISUpoiGNATGuMHI5H7v7R
         2vAL9dyXreYST5ShPSf3IRDGY4NjCErUmo19PMvvQq5kpWItsmxeIu0JVGJLeKqw96/9
         CQR6VusC5c4jK6Zeo7kCfMEtTLExZzt6KNy8vwgoa90YmsnbHW3FGJkyGwUN41tsQZHt
         9AsYs/bPJl6L39KAb9Vgve5saTQizKjyx+UWAzXP9/vJijOO0wl5T2nSQC1MbF8goVPf
         LKplupoImxyskah6TQrAmTgKIngyDksWgYlxt3/X0HiL7TT1Etum/MRGXsm0ZRHlR5oS
         0Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817152; x=1773421952;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4TGiovKYE/NC2WLaNQ96o80qmi6PqcfNfFUs3pYMxs=;
        b=XrgXN+c/mWWaZ6B5sMTE8to4J8pNqV0jDfwaXub/RTQrcXRSGxmCM4hX2A44H5vvPN
         lcOeaMZs3zyZ4fqqbc3PEybn+5fKdNql945tf8VkJVY0kP6henv6ZNvmHUcUqQwyLY6L
         o1DiP0yVOnbAcqiVvHOY8/e1P2aBk5rLmNjGPRfW7jwdmrwDxNwI/mfJ+kgfx+tasf3A
         UcfUjB2mxrSd6H1ZL8QxhzrlHYp1rEB0XG0FUhS1FCfq4/P+NJxwRCZ/8+5r4Dxc1n4R
         AH0EuIP0Q3E4GLNweF9zuQaCEpBT9N0Y4B4GkbaXZHOG3WVyqxKY7LRJeS84B0oYxc6K
         ht1A==
X-Forwarded-Encrypted: i=1; AJvYcCVcgS4pvzbOXf43GEW7y0N1pRLjDmZEEx7Wo8W5WCx9SRWsZ83rpDLdi9ka6k8NszH81Xx3NPfHA8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQSYAdfHTfJTghGCfuW2kx5meU66z7JemcMYntiaEXu/Ux69J
	C6GKwOY2ZItaUa00cFPlgL8Dtv1Vh0xmgtejqricLW5Gp2Grv4tN6bjiLYwXmAv6kog=
X-Gm-Gg: ATEYQzy5C7F2afA/nnL4GPFqeqADGSHrPu8RiToDbsQvnXPT0i8YpUdZHdg0oDYUK/J
	aq6lGZX1HwX6QlnbnXRgVypHxXKz9Uv7QNP6YYs2psymxlzF/MD29CfNy0lmwibDA4AKb+5rW1x
	tJRSARDgijj5AbrM4ApHrCXtW5PnFXV7zJH2HayxGsLyaGnQIXxnJUw5ISawlxy8mCzxoE/2zOz
	HKNbHeqn0nE0CIax/LDpRKZb5/gcFFiQu7RgpaaYAdIEEhNPgN8jSqx4zSTkZ8HOhMT17Mg8zfx
	EmlQN4gqO4wGCWpRIncjTm9IydGfDegsEEk3COd12wsDEDHQAGE3hXxv027qaS1oxbj8kJV2p51
	MuH3L6AV9o5LU8dGxgNO6Afjb4CNjNYvn8frf3YeOSBtnOIAEe9e9pVJmTuW0VB8ZzyoDukdXel
	rCk9AMKNEUcS1UPl7hUUQufEMhRR58AePBltJsF6htgAPxZR0myvvyX5uehP9CHwnGefrMMdw+R
	lhUk/Xnxmg=
X-Received: by 2002:a05:690c:61c5:b0:798:5b9d:dcf9 with SMTP id 00721157ae682-798dd73a1bfmr25088757b3.40.1772817151985;
        Fri, 06 Mar 2026 09:12:31 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798ded769ecsm9331237b3.23.2026.03.06.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:12:31 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v8 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Fri, 06 Mar 2026 11:12:16 -0600
Message-Id: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPEKq2kC/3XQ3WrEIBAF4FdZvK6LM8Yx9qrvUXrhX7rSbVJiC
 C1L3r1moWzAeiMcwc8zc2M5zilm9ny6sTmuKadpLKF/OjF/seN75CmUzFAgCQDkdrnacUmZ++v
 kPzIfhBEejHA9BVZefc1xSN938fWt5EvKyzT/3D9YYb/9s1RlrcAF11JRJA0D9u5lyvm8xHEn5
 jguZz99sl1d8SBh3WrFInkiqYGkiURtSR4lqiVZJCeAQCqlwOm21B0kKWqpK1JHISoMCg12bUk
 9pHLUkiqSMIixk9ZbZ9sSHST4Zzra9+RKK7LKeC3bkn5IUsha0vt0oLwJwYqeGp22bfsFx2F9k
 nQCAAA=
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
Changes in v8:
- Use regmap_set, regmap_test helpers wherever possible (instead of
  doing regmap_read, modifying the var and regmap_write)
- Addressed remaining comments from Brian on returning status of
  regmap_write for atlantis_clk_gate_enable and formatting suggestions
- Updated names of some of the clocks to match the datasheet
- Link to v7: https://lore.kernel.org/r/20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com

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
 drivers/clk/tenstorrent/atlantis-prcm.c            | 870 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 173 ++++
 .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++
 11 files changed, 1235 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

