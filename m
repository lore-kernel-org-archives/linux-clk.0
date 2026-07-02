Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132EF4949E5
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 09:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985106; cv=none; b=jSqtOwzfNmBQ7U92CD1NDZyla6ggi8cW572NAnK4eIsItn/ngT9ZGIMvy9u+KVq2XIKBphHlG86gWSHITjZbhnkoTF2aqRQKccsxCt5RUKzs5wtPJvNbPb2HD00iYXrPTHgFZ//TRtujHbEQIAvPw8I4H8DZqed1B93kr3O/1vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985106; c=relaxed/simple;
	bh=HRhQcXSkBm6kIuMN1HooFdhZDLkqe08KsRSHDv4nCaI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=s/94OQ7/9nHQMNtIQDkRtnb0nj/CdoQfbmRq4/EBm03WHv3ysBwwz+BoFvF0YV+dHsJNcrpzcmaygqobndNBctZyCq2shoUUWDaLJoGMDTSP652NLhKTk7te83R86h6iHM8disw59ioxqRRRtCTgJhXXpNmAQw7fn0MCXl1BPBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aL3sTFEe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aL3sTFEe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b27c7451so3577835e9.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985102; x=1783589902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HkRnIfEsm7IYSwoxJF19HITLD0IHtrEiTPGLRE2a3tU=;
        b=aL3sTFEe+jnK+iM+lWkx78IEjPomcGdlbgr42Id5Uxq3nQWYvTvVo2WsDuo6T6ZyVl
         wtoc3PLa0YqdYFfQH1VTGwZhC+XmdstLVqdHcAy4DlAp6AOEXY+NQbc8Vqk5McpobWeY
         HxLYgd1w5RBPbD4GDhBdc/UxfKR+HQMIC6f71cHS2qOxYycgDmchldgVNjZzcEF7OLUl
         HajgmbgV+go5GLPKxj/H5PHdcua2IXHN9CXPHZx7g7uInUDf0z/HjrcG458pnllPsrvC
         hKV+ZFXDhptiZa3NZiArn4TciFzDVYojl0sHAAnScTeQJMSApMV/t6j/nXJ8tamoAOoc
         Wq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985102; x=1783589902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkRnIfEsm7IYSwoxJF19HITLD0IHtrEiTPGLRE2a3tU=;
        b=J8fhmGUiveX5xgxx0JXVvqsqbu+5cNuuin+sk5MN4jAYzdcXiY6/rqyziH6V83HaoF
         G10xuf2cVjweDosH7V8XP79DPyshbot8SnEigaRFAx/aR/PnoV5jXj//ZC7S6nbIKDve
         3HY9FXbnVcyYjWxIJ+iKZuX1eXDMSwv5XVhXXJ9mncNkbrxh44J4pQTXb58FlDDfGVLZ
         qjaeBRHWni7qpGhTUP1ty2rBFgDJHb0DgiLbR08rzXBnCu2Xzez2gPSYJYCY6Kw/RO/T
         hJLHgMc0YqmJ7hONeY6H5PX4Nlt0bJ828nRjq0Wi4P5pRSN/brCt55xnWDI5TxaV61VL
         /KuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yQKItCDPfp5Wz88Yp7wSH5i3gu0Q2l0/QjDWewKRCoe9ZeWmL0s83hxMl0NFEnDKUEgAbOU3Q6l8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeeoM2Qdeu5kyimyOpe96FHNWeWAQiZOHuKdYQ5p8hofVY0S2d
	9p7NTZzEozu8QnlpePSPM3FwDN49ZObOBmK/DBJtMJnbnr+T8Q2iBJs1
X-Gm-Gg: AfdE7cmLGHjEC96LT9LcTvn3NQJQvK/EqxIKmcuqFdgGf0QIYl/XEitlw83wLMkC+/X
	0WX/fKmVZJOFA8tosO4eQ2f8rRMJyUxUxAZDQSpeyVPo5eG72Qe1f5xtRIXIzoadxNEJrGSkS9N
	Wj6lWhK0L9/2OYQYBk5ufO1H0WGezbJ6WoQ+kepoEmg+28BMvPa4bdF6jAlZAabZiHLw8lix3Ew
	4fj3wqWQ10PgjQNWaXBaNQ/BCBO3NuqCoFaQ4wHiQxx7Tl7kpStlcA367S9Um2a73pvZSz/y57k
	M52X59MiEbtpQzA7KbuYjQVfmxczjJ293RhUgnVMM/jLLP2sfkMe0RUveTAYqt2gXaDSZ2FCbC2
	fwZk/QWBjDwWN8/5jOIZ34kb1BN8jgpvvBA0FK9SyrdoGu7h5WedaMahkincUuiZOB4ZhCGeIe0
	1clIbyncBrypBngplqQAnUVl/23jlSIAJMSsxlL5K2bO7/gXqJS9rM6QRt0Ig8OAXg1Fg+m7eYc
	aRyjQ==
X-Received: by 2002:a05:600c:1d1a:b0:490:5000:917 with SMTP id 5b1f17b1804b1-493c230bc20mr74096045e9.1.1782985102259;
        Thu, 02 Jul 2026 02:38:22 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-52-250-217.retail.telecomitalia.it. [79.52.250.217])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493c636c8b9sm35502285e9.10.2026.07.02.02.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:38:21 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 0/5] airoha: an7581: USB support
Date: Thu,  2 Jul 2026 11:38:05 +0200
Message-ID: <20260702093812.15918-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a major rework of the old v2 series.

The SoC always support USB 2.0 but for USB 3.0 it needs additional
configuration for the Serdes port. Such port can be either configured
for USB usage or for PCIe lines or HSGMII and these are configured
in the SCU space.

The previous implementation of a dedicated SSR driver was too
complex and fragile for the simple task of configuring a register
hence it was dropped and the handling is entirely in the PHY driver.

Everything was reducted to the dt-bindings to describe the Serdes line.

Also the property for the PHY are renamed to a more suitable name and
everything is now mandatory to simplify the implementation.
(the PHY are always present and active on the SoC)

Also other unrelated patch are dropped from this series.

Changes v10:
- Rebase on top of linux-next
- Add review tag for DT patch

Changes v9:
- Add spinlock init
- Add ack tag
- Add review tag
- Add additional comments for phys on USB 3.0
- Add extra logic to make phys optional for USB 3.0

Changes v8:
- Squash header to clk Documentation patch
- Address comments from AI Bot
  Link: https://lore.kernel.org/all/20260520150912.11614-1-ansuelsmth@gmail.com/

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20260519220813.28468-1-ansuelsmth@gmail.com/

Changes v6:
- Fix kernel test robot (sparse warning)
  Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

Changes v5:
- Add Ack and Review tag from Connor
- Implement Ethernet support in the USB driver
  (testing support for this Serdes on a special reference board)
- Use an7581 prefix for USB PHY driver
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v4:
- Rename PCIe and USB PHY to AN7581
- Drop airoha,scu (handled directly in driver)
- Drop dt-bindings for monitor clock in favor of raw values
- Better describe the usage of airoha,usb3-serdes
- Simplify values of dt-bindings SSR SERDES
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v3:
- Drop clk changes
- Drop SSR driver
- Rename property in Documentation
- Simplify PHY handling
- Move SSR handling inside the PHY driver
  Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/

Changes v2:
- Drop changes for simple-mfd
- Rework PHY node structure to single node
- Drop port-id property in favor of serdes-port and
  usb2-monitor-clock-sel
- Make the SSR driver probe from the clock driver

Christian Marangi (5):
  dt-bindings: clock: airoha: Add PHY binding for Serdes port
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  clk: en7523: Add support for selecting the Serdes port in SCU
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/clock/airoha,en7523-scu.yaml     |   9 +
 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  62 ++
 MAINTAINERS                                   |  11 +-
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/clk-en7523.c                      | 218 ++++++-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   2 +-
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h      |  11 +
 13 files changed, 901 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0

