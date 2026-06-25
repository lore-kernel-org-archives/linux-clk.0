Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADBD374E66
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 21:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782424680; cv=none; b=R+5YMiXDinVnsG1sfSujNr4lw7nRbPbZqFBlWynDIec6qYInnZEZ30ZniWl6nlBsl99a5bUVmmE24sNLIpb+0mjzfW0ouSsY5fwsfAO0yeLBQ/NaPPRxbkKlAU4m2YxYyKYHSQsgu04JLBugoP614sZ1fyVidmAD7M2EEdgi31Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782424680; c=relaxed/simple;
	bh=46jnChl2wMQ+0gZn2yaYikR3dO6y8zMPR9FWL51dirc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=mvR3wLvixwN/o0Dn+POHj6gi7cWnKVJTEGb5jwOWVHSbClmJk9Bz9m2oGZksibbb3ix2KR+BnZaa+edKBt3Tj51QbrQRkoL3Y+tiWRfIwdG1zzd55xmgJOieWSd87P2s/AWvSOapGl6cKCEA/Gx4q373zKwKnE/8Q+aAUDLXsag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hC7JLwuO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hC7JLwuO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so2483255e9.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424677; x=1783029477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/GDPKha/I8hlDx0JY3/FoA06iUy7EbgInPO5kMOUnzM=;
        b=hC7JLwuO0WYi0WhAb7P0MGyaaRuVutebLmfOKIz+6dNJBUhYpzKFb7Oj4HhSSt3Ht/
         j1aQ5IZub3BZuK3dPFebnWHmpkUOMjG5m1NXqtw0pyYzU7VKLduWttzZ66d+EVq3vxUd
         Z6f55TaH+1pwY2YtK2whgphRaya3Q9+cpfrL5DamzlS4vfQzPbW/SCZOXub/VNFxVcnd
         XMYZyc4hftgcD6bEKLacn6r7+icwcEdDxZqOD/jJWDL3uVqxYjKVmdFwSNufDarFJWdd
         Ab/FiQlju492ejXJ0Z3+i5AQdSat9QCaIlwzbUqa6e6Wdvrpzx7BJ00kcLcdmaKrcysy
         b6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424677; x=1783029477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GDPKha/I8hlDx0JY3/FoA06iUy7EbgInPO5kMOUnzM=;
        b=hckbYieIckqjh+qhXAfn3RbUoUmTkRUwKmo1c86mOk0e7LYp347Fj92unR7+H9/RmT
         cF+xw7oUwF1eeiJ6TPZY5KeqR2ZTGiQSI3pXP5At60wE984yO0mnZyznuYHKitXCLDaD
         2AgM7HhFd0nREDgYaZkdESWWzRC3LhhOJBBJ5eCk4K1Pbc9DTFRlgs5OPMcHhfpkPgpk
         ov1n565249atLt7fypJw9hP7qcNaOSAXE7Em6SA2edUaAi1tLtFuGlFXS79DvlaP8caE
         tv5JgxTygR9zqERouCeRdTvQa5ufAfhyj95yunlyi2cBGr1zgXS6BCB1wjLP80ijdPnt
         s/fw==
X-Forwarded-Encrypted: i=1; AFNElJ+3t23yq4UA4f3y7CixKf7Mizb3SH4stFt+0w1im5M4jWZ8ffWkzUccYTUHnlocCDsHp6wg9iCgWjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQiFffniBhd0IaEc5asl7Dqjqbmw/KNJoZsRIf6AYTmRbvnTwJ
	4/1gT9xefhTHaSXHOftu8GSbiQBeNnngUNkjBWRruSKTg+SnkDYiD72L
X-Gm-Gg: AfdE7ckeKBnr1C3WRFADEa7rKW6nqvTJ2WctGyFpO9QAF5nEg4wVUnDUBmFVHFAYp25
	KTEv1TXZCDfcvxT0ySGyKtJNTWJ7z22TrGmMPYf4b2bDW9vX1g9dnRrxFeOTmXfRHutEgRtQn7o
	o8qZX0typ2egw2TSUKoR2w5dW8Nmr413N2onoZ17Jbfk0lNmHOkBd/mzQDegW81gMp/VWDFXBNZ
	P+3BrZGdzZowsziHPDTaVq2q2omhIUxEbMWKNgiJFZJkHFIk7FW1Cf11aXdCBc4Frhja7oG6/cZ
	PEqLKOxlQSJXF3fCNj68zx0M9NDbuAysqRSKH9nGophAQ9VBZ7lq1g6b9PhAb9Nw9hnldoF7XUE
	h7BehvjeEaewMC+9ootSFuQQ7OlzOJOrfHUXBSGsG6qQwggZhQ8FoGgIpDZI62cV2WHIZEER2yK
	1YnB9NiyFyKidSLIZJGHG76Mb+ul+H4r80ByY3ume2+Il9uesk4AhCdzBtygraV7fBC7kuo69ID
	9tuQ+NoihPP
X-Received: by 2002:a05:600c:4353:b0:492:1eed:3e67 with SMTP id 5b1f17b1804b1-49266893383mr39799415e9.26.1782424676723;
        Thu, 25 Jun 2026 14:57:56 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:57:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH 0/4] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Thu, 25 Jun 2026 23:57:33 +0200
Message-ID: <20260625215741.3253212-1-ansuelsmth@gmail.com>
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

Christian Marangi (4):
  dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
  clk: en7523: add support for dedicated PCIe PERSTOUT reset
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  27 +-
 drivers/pci/controller/pcie-mediatek-gen3.c   |  98 +++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 358 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0

