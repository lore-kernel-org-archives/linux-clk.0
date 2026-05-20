Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF72701C4
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289772; cv=none; b=RbVz1zH6r8ZiFW9yKrqWkaVMjsLRn7YNm683m23dN5KWYHqQzelS5bOoHiVAREKDcKDHPP8RBcpkFwggO7H6PLMRnV9caOEl4us+JBGyuefJ8/OPIHJjofFA6Kt9K1W8x6knG+VnaYDGnA3Yjvc6CGLdu2XJ+W01Btr7yaYXawQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289772; c=relaxed/simple;
	bh=iK+ZuZ9BR1rFtDYZz+Aooke9+Bk5hQhX85c0ae+iTQk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qeA6t95IOlebzoVGixtHYoYB70b5UlIjEoq0fAdeOeYEAq1eynUf+NEo5VuXLdD5G+JegC43kK36Hf0kqN0MnOlD7NmksIeYt3YsoLMWxixH0BrbspqSyDw4veGBDbYmj9CkcEb3KSbOH6oFSsRgVASes67HgAsSI7KER5gCffE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiBZ+GGf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiBZ+GGf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so54069815e9.0
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 08:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779289769; x=1779894569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVZ1aHDip8CwzjzzjcHFHeqEyzf02kvl0N1Yqf9H390=;
        b=NiBZ+GGfUAjOlXhZphhQNg9HXcpmt2/eUhP2sa6y1Cgk71hmL9o4WqxKuRMB/vaUWY
         lS7ax/NjE12Rfys7tTsMCpqdKoWbbmY0L/IbxNOuy9YClBF//s3+WprP6Y1U1ZZvYFxV
         Vwhzk9AzUduzCuOH2diXmCiS4QU9t9gOIPaNsjZEMjPUc88LFIkFvb4yOTfa9+qBPjNc
         9u3R+ML3nhzSgDPjoyQDnvarUf6V5ewZIeoI2x73tlvO4hnbHdjXeuqnXh8TIR5QDb+m
         oDZ/h2euM3x5ZyjiqVAs6yUX/IRcuoMEAcxaMtIb1EyUSXyc5wuROIjsWrjTUpax1K4X
         6Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289769; x=1779894569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVZ1aHDip8CwzjzzjcHFHeqEyzf02kvl0N1Yqf9H390=;
        b=Us7GUOdIE1E/+J3CGIQAyZbMe5J3bDRndBcIKc+bj8F7SAUNcfWi3HLuFfnosd+0r3
         Hce75+P2rnUvJW9n4e0Mn9nNWe6GUG1IjY82vvP09wiXE3qbgf0HmiOFhnyYXeGUGVYI
         zrw3SMMCX9t6iINA64OlHYjOdl32q6KpCb3YJlk5dkaA3pcPTIX+cly/PqrhmKv9mrOA
         O/6vd0ilNvrfTH69+NMxv45104UhjtkpbheUf0Ljj8H6JcQ4fMdnKq/9W9rnwH592U4r
         Ugu351WVz2JMLzvMMVKdJX3Kn638OcVYYqNhxGzzx5eCt+NKPS/jmWxJKWbtrR3bX7tN
         Kwew==
X-Forwarded-Encrypted: i=1; AFNElJ+7HCIHQzE80smfU5ROfnlVhOqFLh+VgmgczQCImFYeU0G6O0f88SOSWwoJcgKF9vQ6X1/F+7pQIzM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdc/UYyMASSnA0A/7WcealKPjnqDVVZ1XOLzAqEQj8V5MPXGBE
	Hwy56nezKeo+/c/coBCu6p2D9fyVfI45OnLDhNKPmPY0OBOpPPgn2EV9
X-Gm-Gg: Acq92OE6JIHUjd75XYbgIzZHH6sR85F9kPmPHSOkqAJUMqOsFs5uhquAp7du/WbTZsY
	E2eWE+hwZhcx24XmXqoFpKkEExTY11izmk9avo7TN05EbX6e3y56z3dKdZVBpEEh9/5jaw4tL7p
	djV+F23u010BlSBTM+H0SXlR0rXjZaYopBMxZ8mgozgJAEmuWiatxeUPdcMBKBNayIQKpdp0rV7
	Hn+N04e6azSUsXov/9VJ0xJFTKjFiF9PnTzAVP5eEiS9hXLRULd1et6yjKidq1CavBvr5H7hbHG
	w6/V7Id1kfrJ4j/wV242FTuyM7DMQVGFEqesAWjIhnTFbYzVgAirLfEVyO5krgLjbAIJ8yY6aRW
	vXgtYSAtlIP6cADNrTQzWVwdi0NnY1YrStO96RG4O/VWDt8gH7DLkGrg4YPQp3CFIc5tT4TqdsN
	e7e3hdeIChXJlhVRAxGV3l4QXKLsEfR9acu8GgSX8DWr4bhh1WVrO51ongLFFcNiggMWcyP+vN6
	w==
X-Received: by 2002:a05:600c:4504:b0:48f:d1b8:9a9c with SMTP id 5b1f17b1804b1-48fe60e14bamr359822535e9.7.1779289768965;
        Wed, 20 May 2026 08:09:28 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm53639804f8f.9.2026.05.20.08.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:09:28 -0700 (PDT)
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
Subject: [PATCH v8 0/5] airoha: an7581: USB support
Date: Wed, 20 May 2026 17:09:05 +0200
Message-ID: <20260520150912.11614-1-ansuelsmth@gmail.com>
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

Changes v8:
- Squash header to clk Documentation patch
- Address comments from AI Bot

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

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
 drivers/clk/clk-en7523.c                      | 216 ++++++-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   2 +-
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 554 ++++++++++++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h      |  11 +
 13 files changed, 894 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0

