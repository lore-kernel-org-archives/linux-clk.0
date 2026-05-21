Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C066B25B0B3
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377816; cv=none; b=D2fMv5ZPwa4spOOAtO2Yh3ztDTRcDpWqRxlS9+4PTMLS+i/ShohTlSkJRFNQw5MBsbfBqsl1/0g/TaKv/+zEDd3ykCnv5aYOt8Bx+Bi+aouxilqtzIqhtVmwi4UtsMRJvIwlnNhaw4x9qfydz2B2ShCSfHcHTwW5+mG0p8gj/Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377816; c=relaxed/simple;
	bh=jYXygDsMTmmAvlNt7SLorTLjZntIVRWjwlL1muBsyXk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=M6XaKL65Dvzf3OIJQpl8ENeWNCOMZtrsbXAPJYZOHaPVAkHL3FXx6k9TCTzjDzGwb5yneNUZPhhZW8oyVxaucZBSB+2fD+qaM7OH3MraiblvplWk7F2IIuz3/Czu+zcsfvcD/JNamoVnRiyrmtPgdEILnP4YNvbCkl+TqogLtk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+HaIqgw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+HaIqgw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso74150415e9.0
        for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 08:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779377813; x=1779982613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yI2KtTIwiuNK+knqFFW8fgG1npheFcqTp4LO6YB2KS4=;
        b=O+HaIqgweZrYiajNw1wvBZeS2CNvbQwRsjqaB723Y6sPFXy30QF22p8BEStWv+arHo
         MqolxzlyjwuCtNMYElt0Ww1W4atIPVxwmYaijJQZPWQDNG7IHqaBvhTKj5k8yxkLd5py
         nNjbr4d68VW5e3Ls4mBBQwab00rvWuuAPlj2O5+lNtLyH6QxVfMCpEVJjZkH4+ylnFl4
         TnQXq7AZCNKSwqi0WalpvJxzpG7trYAzDKM8mBK2CL1CDM84fhw5MbyTX+yHZas5kJJb
         GRqohV8YtZ7YhRwdK8T2HV6wdYJWoezZizK8bSCiD3XfA1SjdHJN1+mOs6a/oMnkwtG4
         vaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377813; x=1779982613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yI2KtTIwiuNK+knqFFW8fgG1npheFcqTp4LO6YB2KS4=;
        b=hbQZnx6rlbQ90tKz9Rg6D6mI+jfVYjvof1hwrS9aUJSkvO/Y3fOu6waXVlEZxJrVaH
         GkW9OLH0b0NgqF+paog770nNYcRn0eZByAuLrpgoc85pIxDjNsjUmU3u6punXap3Ic9a
         gzJudsplAECeyEWk6CG2rIZyt6w/ds0XOhivpn3/BF/Gbo2kim9Jg8TFkd2xXmhx0/4K
         tBM3EnntOHmddZ8acCXNMu4/4/tJY1pOuz6hMMhdR29M2zrd0/ERcPV725D5cVmO90u0
         Lg18UtV8LjbzJoUQ2FrjLbAhJlvoOFLarcz2b5agR8wEa4uMvIt/5ubI8b9K2jUA2V7X
         QJ+A==
X-Forwarded-Encrypted: i=1; AFNElJ++5fr4ldpgaJk/Qq8WOcrrJseMJ0BDbwGhfKY2uaaOQYN9fNWT2b2Nh2EDEJgYTem2O61W+0/dL3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUgGJKwWT6tX5zC/vvqaOo9BhUY58/I/OfTvmc2LpSYz9X7N7f
	ImOAAEM5zqpVaX92VyOiMEC6xbFfq/AurTB971xelWCVWsli+4jXPkR3
X-Gm-Gg: Acq92OGV4CjNW8k/bjdg7JfJa38CKfFYVwwN2XnBKqOoUALhCII3dLR54k1ppSeqL8x
	NvudmtOxR/wBS2YGMm1DCvL1JQGVcH6j2gktDjIdAgQB1FwpZEZgNNPsA1EZ2AR9mteSJV7aUEO
	60rM0xLQNxOznnCjGyyaiYiRBpxV148R5draaf6IiqvbhgM3F1++FJtQbSw/QcNgNJG0JFmR8EK
	AOfP5zocirsClXE19uBhks2m9tkrDJB79cuhe/yLWmcK72nUSUF7H4rTdR1kxUg3j6y223hq/Km
	u9i+YptZe3MoEoIJWn/Z3Ihp7TL6aTPlRrTT/EyyrgRiYZlA+o+dqPI1cZxCrjSHtSFEuvWGB+j
	F2lLAffczeGB2d37VZUAT7DnIyhQhmkr//ayY0q5tiygrc8p8UfSjs8Z/2dgcnTy+R0m7U5hmi/
	pTsbFY1RqxdJpFAhnsiyFKXlSS8TLIzvLsmoBsfu/TZzcLwC5O/AsWgL9ntE/nmbfxbk2aIpc2O
	w==
X-Received: by 2002:a05:600c:8b34:b0:490:3d27:94f4 with SMTP id 5b1f17b1804b1-4903d2797c3mr28980425e9.7.1779377812772;
        Thu, 21 May 2026 08:36:52 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm79159825e9.13.2026.05.21.08.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:36:50 -0700 (PDT)
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
Subject: [PATCH v9 0/5] airoha: an7581: USB support
Date: Thu, 21 May 2026 17:35:51 +0200
Message-ID: <20260521153645.7028-1-ansuelsmth@gmail.com>
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

