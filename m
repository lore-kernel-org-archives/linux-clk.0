Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316603A75A2
	for <linux-clk@vger.kernel.org>; Sat, 27 Jun 2026 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562503; cv=none; b=I7rUHavi3IiaMzyliejq7lDTo1DG1lHoSOh5CjfoEZbxLm+9tjzAyC1DqHDH25kuHP0czU5l96sBtLz7rBbCMABIyqjl/b5cvZ5I4VAKfqMJBDcRtSEs7/qMIUuaSFGZQJ5fDPR5aPVAWapmBy5Uf3sSt3iUv+IPfS0FKzKvJkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562503; c=relaxed/simple;
	bh=iOqbzTOr7Al7FRgdDYfrfx6rKgnAR26rPeCHRKlIgiM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=akagvEdyF7L4rrv6jLIdixowajhNUVUw/T0+PzmQHgm+hMXuSW2Xds3P8rHW3paQ+OibdjNwpT0MqidLZlM2q5sWkM9vv0h+2c0II3/iKa+y8iQwO8nrsElaT/uuDlTbod8HSdLylK31hMYFqsTucrKMirk5CYZ2hELnd/HIOnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+F7+STo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+F7+STo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so8953365e9.3
        for <linux-clk@vger.kernel.org>; Sat, 27 Jun 2026 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562500; x=1783167300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENGLhUzySY12FfgNeO/39C61qpfSr8IVf4djxpXqVbg=;
        b=c+F7+SToXKOjitreIm7Brg6kMOEXdrDcrlPQ8e+9oH9P0hN2Az6Wy5jZgzkT8q9cgT
         w3yvycvwwY1BXhEx3dc+HulQ0pOa1jSPttpInRZfEFARoeTvdHPDAt7iJNwBv9NJfewq
         QjTlhHXgrpI9dBSNIuFdSZKZGn3tjsWmWNJKfnOv/0XxP/RDlMhmYsUSIxfGTK5hapvG
         DPA9jWk87QLmNqtgYWkoGHIxEUV2+F5FyD5hMpLUBQmmTgmrn0ojnylWud1o2EJQX7qh
         0NnQw5MyyOzqkRg3xuCjXoCMniWGc2NaTiO/lHWQTdHXbwQzrzHJqdqycA9l2CcDFAHC
         1iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562500; x=1783167300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENGLhUzySY12FfgNeO/39C61qpfSr8IVf4djxpXqVbg=;
        b=SmEJk+bL/9N6yXyoCSfOY6TpzSNBLYAmS/X4+xd2AdFF/uoxpsXlMLMDlnoLw5a5yB
         PrkOC0rIAHNGKVRuZYsOEmVqcBl6whblaKdQjfGomgrXFCiR0Apx/OdzVfUOFobl+vyb
         k17DgmKf4kjUDsKu9An34JAR+6MQKqQM7ciYOsoJ0aSn7GqPfw9YiDFDiGkexMNyyJ4G
         /6SLvJXEl6MO8eGDtuqHVKE4ERIlSXSWBnT4btVRZbMibatNqFIxFGTI3vxtviAdHV7S
         EYEYpAzr3EcD5yOjW1GDxS7wRhm2qh73TlAv8Fw8QW2wo/E1QcM+9iIsNGpylX9vSyWI
         Vxtw==
X-Forwarded-Encrypted: i=1; AFNElJ8seb02jrzSm9UmXbWPLHH0UYE+VfvDh53hE2IFGzGWrW1rN6t56VxvvS7YyOpXc06y+jnFlbTQCYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUTMKu5v6LSZ+s1bWaTPmOIKtqvYtLGl9mTrp3AydRAmSycncc
	zBCOtZ4JMY2e6PNbRV65VY4jqe0arCxbQXLaYRAxD5cIwwrbihCjR7dJ
X-Gm-Gg: AfdE7cnjt6R4+Jq32YwZD5TJkPTEIo9VAm1Zo8kHUDrAxOLrOg8ZIZC2wbRfyK66+h6
	GGYtBS+QLdSAUYMTfWa8tljEI91m8KofuKDOGOFB9MlUzfprsFyhAG4NVK+va2My1F23MIlxxrp
	5HZaXLzMl238lTnJH9iK2U0bYr3k+j4r5oqzQS8yQiRGt19WPFploOUkMaRhmKhiOHcZKBapgue
	/xLfw0AOWPOv7GrmxevL2VRA3l//OFTHnw1oTLPdZchJ9Dv8lc6o1tjwYViBqN1FL7AjyjREuQW
	AbYNEF1Bv3K3Mnp8oY13BEsbDNFNIyeWoI9pMHD8TB5jmhDKiI0HBrcq9B25WodBm0GD5ydaTG3
	wgclEGajrwCgZqwyfSuX8TiTYsqqnmWRjxJxCsq/AYqdFAynDEQmavWHBXK301KCCcdFwFiwBpj
	fRZS2LPzbFkkpyw7upM2kDBf7baWy3uWMZyBRk2LasSrIBEMEtO9QG0KLRs7O9Kw==
X-Received: by 2002:a05:600c:3f06:b0:492:33a8:5499 with SMTP id 5b1f17b1804b1-492668858a8mr160407315e9.17.1782562499407;
        Sat, 27 Jun 2026 05:14:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:14:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] CI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Sat, 27 Jun 2026 14:14:41 +0200
Message-ID: <20260627121450.3529133-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce support for 2-lanes mode for Airoha AN7581
SoC. This is needed for correctly functionality of Eagle WiFi Card
normally attached to this SoC that require a 2-line PCIe card to
correctly work (and give the proper performance)

The first 2 patch address a limitation of the PCIe implementation
where the PERSTOUT reset were indirectly asserted and deasserted
all at the same time (for all the 3 PCIe card) with PCIe
enable and disable.
The 2 patch address this and introduce correct reset to control
reset line for the relevant PCIe line.

The last 2 patch add additional logic and support to assert
and deassert the PERSTOUT and also apply the required configuration
for 2-lanes mode.

2-lanes mode is implemented in DT by adding the required property
and by defining the "num-lanes" to 2.

Changes v3:
- Add Ack from Krzysztof
- Improve commit description of PCIe patch
- Use pcie->num_lanes instead of possible uninit variable num_lanes
Changes v2:
- Address typo regs -> reg in Documentation
- Address typo lan -> lane in Documentation
- Apply a suggested fix from Airoha for PCIe MUX configuration
  before PHY init
- Parse secondary reg in probe
- Add missing reset_status handling for inverted bits
- Move SCU to local handling in power_up
- Add check for max num-lanes for EN7581

Christian Marangi (4):
  dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
  clk: en7523: add support for dedicated PCIe PERSTOUT reset
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  39 ++-
 drivers/pci/controller/pcie-mediatek-gen3.c   | 104 ++++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 375 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0

