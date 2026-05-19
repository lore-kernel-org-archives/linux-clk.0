Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00A82BE65F
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779228507; cv=none; b=t8+OPmU22AcCM58yX8lcLNwHfGIraZR7AhpLqv1OmIgcO8fLzcryMtf+ZjVXu63tWUcoKtJ2uDageHRrcSy2TIbdxvQqHBnNDG7t7BR+Wm8WWlMVyov/YwPziNlj/Hu/mA4vx5joCnBgRXXeQDbAThB7/eRy6yLRo6/wpRZfP+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779228507; c=relaxed/simple;
	bh=G/Nrw3cfains+j9k1LacJdGljge49H6XmskKVoFGD5I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=hrai0OfMpS49E5ML8gkkVoqWLhVYJT/WYVPHpMfYjMRmGvUyDFhh1hUCsTNx1OFMpk1ljKh2x40ogOwr5qYPiGlJnNdZXELRi+fUyXV9pBFmFVjT5MDdErGkY/sT5VP7AEIdq/UhIJgQqeB2IN7htrnzUxOOIw/MgUL+8RmvkFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlBwndkJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlBwndkJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so39672895e9.2
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228504; x=1779833304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n9SmKxDkFJP0+we87jbRanJrpKrMwE9QMl+XapPOXtc=;
        b=DlBwndkJWwBygXaDmUISDlV56F2Jr/umPToNDDosW5ygZuzlAwf3Cwke3MbHi3cDia
         wi2BRNaB9agDP+VKaNK0L6KnxeSDZbz5Ir0n82uY8PvmALTh5ypUSBn7xjWTYhBnOoQf
         N9lRv6ndQjaZ+exVwrNJE3MJnZGKrsoMIO97MtQQiyVsLK9rJRUL8llOxpMsyaLAiKYm
         Y2O7WdSatxODwJw6MjzEtmxQiA2lXShlKvFgB2XjK2nfTHTQB6V8iRvkfQmsyngaojuT
         hEy6gl8XyUc56UP2eFi68x4g2shXkT8GpVKlZiGih6bq131veqOU0Hy02F72qhz6DzL+
         CAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228504; x=1779833304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9SmKxDkFJP0+we87jbRanJrpKrMwE9QMl+XapPOXtc=;
        b=ivjjtMs2gH6VLNdgAvBcZ/cuK/yusr1S3eyVFDOsTsjBebwI518A2AlXbEYtDee4ci
         +dRkTEYR4AjleAEg9s5jxAif041Y2Ys7YcS00DUxfFD1Dd2YAzRbZnpIw6Yn+67jlQEZ
         Mw5C3dg9VcOs4DuMOG1pYGiHvnRtD4FbgjuZ3mzXq0MlSKuufDZJusUbeWd0r72kJOWX
         qrNBB2RPrLoOI+P4etgFNFTXoVIjlTPtKW1rsecXQv9HRThta9c+WvQT4ZyW0mrPJmDN
         e2Sp9srAwURBfFWp5QQZl5Jse140Rapp0PB1ImCL0B1nUJu63My4SFJ6Njft83bIp7tU
         T9OA==
X-Forwarded-Encrypted: i=1; AFNElJ+PYxK5MjkyVoE1WzLmn0yQ+yGjA3JuNkUIXWAVivy9d71J8AmfnD/vI7chnE/5CuyMJwKPKRMw6a0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlxXM4GqKNA9F0s7aceFpEK/UktuI9x3QThezAChYTtycL7eBt
	Ia9TOfA9d3npWXaVzVTIWwxJlcxwYvX+QCKqVuVEzWlxQPH3QExh/dNI
X-Gm-Gg: Acq92OEfw9T7J3iaQ59M2alF1jAdOG8cvjteM8udK5rPVwQ1lezZr4tKfwrBFxtJFKB
	WWSPZAck1CPNH6SDC9XZbGpY4BOlWRX/+79vfWLPI0NyQgb0gU26v0z5l/Bz7g3akod+3ydYbHi
	ae5zen91Iy6nhA0Us4gYCh5aWEauxCc/7TRY6qdI1JZ8NHrzCH3Sa0+t9wWSIuCE05gyCy+tZ/H
	8ShwIMvDseUXNkp0dr/36ybpynLzVuLtmWN0y2XUNAe1xrKnLo9KP7p853x8VueRplF51dadAo9
	4Kqt9wSYPsTJ1fMXCkJVpowLLuT2WmxAp11bg0+ZQfOXrbdfOL8r1dLPOXAvGguZYclSJhIDpT2
	IAz6cP5MVvT5Py1yCi9FI2n8tXgm47OidVUrtztPQiP9pJkLbE2qq6RU6SP++Sz0udfmTnJNKvK
	XOua6S7T/XRYFPYukoIswlMFGTtl22HKKAsQ4hOz5WFkhSKGdGRDYCjWh5VnZKqxSRXFgii49QQ
	IwtBy7SQQ==
X-Received: by 2002:a05:600c:3493:b0:48f:d2fc:d042 with SMTP id 5b1f17b1804b1-48fe61f1a27mr348852915e9.13.1779228504201;
        Tue, 19 May 2026 15:08:24 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm118304005e9.19.2026.05.19.15.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:08:23 -0700 (PDT)
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
Subject: [PATCH v7 0/6] airoha: an7581: USB support
Date: Wed, 20 May 2026 00:08:05 +0200
Message-ID: <20260519220813.28468-1-ansuelsmth@gmail.com>
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

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next

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

Christian Marangi (6):
  dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
  dt-bindings: clock: airoha: Add PHY binding for Serdes port
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  clk: en7523: Add support for selecting the Serdes port in SCU
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/clock/airoha,en7523-scu.yaml     |    9 +
 .../bindings/phy/airoha,an7581-usb-phy.yaml   |   62 +
 MAINTAINERS                                   |   11 +-
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/clk-en7523.c                      |  207 ++-
 drivers/phy/Kconfig                           |   11 +-
 drivers/phy/Makefile                          |    4 +-
 drivers/phy/airoha/Kconfig                    |   23 +
 drivers/phy/airoha/Makefile                   |    4 +
 drivers/phy/airoha/phy-an7581-pcie-regs.h     |  494 +++++++
 drivers/phy/airoha/phy-an7581-pcie.c          | 1290 +++++++++++++++++
 drivers/phy/airoha/phy-an7581-usb.c           |  562 +++++++
 include/dt-bindings/soc/airoha,scu-ssr.h      |   11 +
 13 files changed, 2672 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7581-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7581-pcie.c
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0

