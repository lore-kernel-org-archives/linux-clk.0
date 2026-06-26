Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394903E9284
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465647; cv=none; b=S4pqSxsEE17NH0hSWxFCRa8E81NJCMQSDJQq+vFZHfvB3XYzS3hjhBLU3V2IXVpNDfqIKXfXa79/axHb9WvDBnEJfW5dIJo/uQ849IBWNDC4XWhUVbITpsLdJ1NnalktNde5Ei7ABibvatFTsupaoODzoLJgeKK3wY+WGGyVOfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465647; c=relaxed/simple;
	bh=FCGrZ4ia9moub3vpndSIDoB0WJ00EU6aXtezVQRRMPc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AUsCgFiPonsMnpcLDzEMQMzpNFQ6GV9ul0J8oiSTrK/QoUy/5jWdU+9FFx3uuFhDqgYgXZrbzaNKw5+XUrKOB6zhW+fyvKtabus5LMynVccLR+7Hy8qt5T9WZ+PxAHPzmAT+dVkaSpXYS3naN9WshYlNSjUO6svN4Jp/5KcfIPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Elypdu4x; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Elypdu4x"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46cacc39191so204797f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465642; x=1783070442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7RIq6wHh9BtCzFgGyY7sK62eHn+d9xSU82SzTr05Co=;
        b=Elypdu4xi0M8dd2ntH3MR89nYmZoTtHRgc5LGXAlTwR07gD918mQ7nHYC9B9irBq6b
         HQEgPt+REk2YlKR6IhMmvsCS+ftOD0+ey8ikl7RH50MZHHNZSf0ClUDSmNET75vPfWI8
         /TY5s1zwrrMZmah8GsXqBP9xAnqJWWTDkPezQo7pgKr//OzkJ3E7bsIeLlcDaGrIfTiY
         PcLUhP/52jiJv27YJjQPrUhZbXc9xG3Zw40arc3acNExqrQWcCryBqa2PKhKMriS133g
         Xr9lm2sxdQbe8SWI5fS17wVEc9Bre9viIXgwkzOIbAx75KDD6Gmb03NDCaHHGtyFmBzC
         DbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465642; x=1783070442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7RIq6wHh9BtCzFgGyY7sK62eHn+d9xSU82SzTr05Co=;
        b=R/D0N1eYA2JbX+My7OT3B4YQqAca7J054sAASn+5u5FCDKMptdl5p+R4byo3cRzXiF
         4NI9eYIExkQ4HVVF3+COXydCrROM42MKXrl5O9xuArYq3L2w5z7VIamPPf9R7pfjMdo9
         gR9r8XLi2cclksJRju+/pMIf7dnU0FEHwqLag8BPU+iMPhF39qf9/p2Jq+3hRJlgq4Mn
         RHAbtoxst6NQCVWAikMKc56N631RFEfF/ifKWAQosNGuvOgvSi89e4gsv8jiLoP/aLa9
         c0mq4ihqOLAb2s29taUnWVvIpE30gnGpzzpq6DqTAOneu+yrm9r9KSwN8gk6F9QJW/LO
         V1SQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrw/t0K4BqPRvwMntP6YrBMRKWPtxzCza6HUWC+1KaDqce8ugU30URk/t+7WD1Vr42UkFMPZ2COPrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMPToRYDAvd84RkaIQ4ZSJ/APr38xx0RnoT+9tcjmwd8MYCxiK
	DF6cwexDWZacjHGKC2mcJvcGW5PaL9melvBdLz87KhnIt8m0yHSZvdWm
X-Gm-Gg: AfdE7cnYTnXsMUh5uLP87M/8FgIjPTdL/zfl4ARrgdUSk+UZzOt+9RVcuynwZNVRQHa
	kGEcXsX5ZI84RjKr/o7SxYZ0k4g3EsKvx67xemap7frjTmUyT7UUJXcKC2TB+TSsW+C1xdOBxZG
	8HfEzw6KilCqAG8vqMI66sqgq1tUVgm3dZ310ad8skg9Lie3Bw6cVyv5h/D6MOtoJAfnULP47K8
	jSAe/xm0S3e8mgBSXmsVZjJ1R9T4ks+NF9aaf6G0yMEtBy5ZTGYP/h32QlKaVMuh+/z0f/wzuj5
	aZO8AE1lwYK0zNISBsjzRxqFpIRh2RfZU/jo9HLJineKrN89Y7mGHGfYHFVAA4xXqeQ38V6g7SN
	Oj/9iwXVOROy3PbdKeceIB3gyz0IitfGIKtU/yifTIp0XFHbNT+b2wm2/e1pfifaFC26zeB+9fZ
	tVxLRhC+skS/Bwyj11WrW8OA7rmuWX/4/SeTxr7gzdjq4bgMr/ROQGtudlypHG5UZQrk+4EeCt3
	d+LgJf1IfrV
X-Received: by 2002:a05:6000:18a9:b0:461:a15a:4160 with SMTP id ffacd0b85a97d-46da8c5fcb6mr10187397f8f.13.1782465642257;
        Fri, 26 Jun 2026 02:20:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:41 -0700 (PDT)
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
Subject: [PATCH v2 0/4] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Fri, 26 Jun 2026 11:20:24 +0200
Message-ID: <20260626092029.3525264-1-ansuelsmth@gmail.com>
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
 drivers/pci/controller/pcie-mediatek-gen3.c   | 101 +++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 370 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0

