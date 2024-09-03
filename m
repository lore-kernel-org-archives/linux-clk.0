Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AAE1EBFFF;
	Tue,  3 Sep 2024 21:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725399611; cv=none; b=hhG37zLD8yaXMGu+EFXU5uHB15/WL9af1lOwRRnpHGzvzq0+BrvocrsZYNXB928Kacd/QZxowlbUnHT3qs6vNPYHb7kzAYR/pwVeeso7M9ubMEr5WfRmCbN21qxAsNDJASAkid0nYNW+KVIMcod7qdUY6hB8TbMEhMWIWNsR6qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725399611; c=relaxed/simple;
	bh=0BN/FwFINfIweSPyRYGiqivvH0muTynHLak6B4C/5vY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=trYE6nCjAexPBvyd6/LMg97O6JwL547PpIPhtbVJ2ufi5eigLMgtYorm4YUc00iDyVEEmIp9f+Tzv4H07iCYgDRMu4E3vRWFcY12c6i32tbH0pbpYidCYa7G88Dq4mN6jRNqy/t21XkUDAZetAXczdAI2KBqGAa8cxwk2zgVLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESs5x3Y+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESs5x3Y+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF450C4CEC4;
	Tue,  3 Sep 2024 21:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725399611;
	bh=0BN/FwFINfIweSPyRYGiqivvH0muTynHLak6B4C/5vY=;
	h=From:Subject:Date:To:Cc:From;
	b=ESs5x3Y+uBF44b6ZplOMnParNQDBx/5lmmKFOZwu/OtYdh8dings8z0KJ0v1Xs7Sp
	 XvLPRYireoUIkLoGMyAzlNgdbsvxtlJnfzJy0XPqUj9oKJGwJsbIvSJmPQ1JpYBMx3
	 RK9uAFfhOySAdSTB5JrGkIW066O14ij8t3JYmVPb9exWWLSUDbYlNVMIOG2kMSKqsx
	 yXN28zGQqoB8Of972to8kPtIxv1epDEz4geiO86toOy2LmjAwY5+yZG/xy47C7dLYd
	 UKaG46trOQ7WPaQXCtRWcXRJw3VuY6P3E96v29nx4VvaFmJvbEqXBuW0Ajjzdz8JVS
	 h0fN/lyv5SkLg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v2 0/7] clk: en7523: Update register mapping for EN7581
Date: Tue, 03 Sep 2024 23:39:44 +0200
Message-Id: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACCC12YC/22OQQ6CMBBFr0K6dsy00FpZeQ/DAstUG0mLLRKN4
 e4WWLhx+SaZ99+HJYqOEquLD4s0ueSCzyB2BTO31l8JXJeZCRQValGC6e9A/iA1h/ROJnjgiEZ
 Rq9BIZPlviGTda3Wem40jPZ5ZPW7HnzkPLd4DSrAhggLO4TJYaMvqSNag7qyuJ8EWzc2lMcT3W
 jrx1bNFlfxP1MQBQRqhdCkrjkqf7hQ99fsQr6yZ5/kLr3v/L/oAAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.1

Map all clock-controller memory region in a single block for EN7581 SoC.
Introduce chip_scu regmap pointer since EN7581 SoC will access chip-scu
memory area through a syscon node.
REG_PCIE*_MEM and REG_PCIE*_MEM_MASK registers (PBUS_CSR) are not
part of the scu block on the EN7581 SoC and they are used to select the
PCIE ports on the PBUS, so configure them via in the PCIE host driver.
This series does not introduce any backward incompatibility since the
dts for EN7581 SoC is not upstream yet.

---
Changes in v2:
- fix smatch warnings in en7581_register_clocks()
- fix dt-bindings for EN7581 clock
- move REG_PCIE*_MEM and REG_PCIE*_MEM_MASK register configuration in
  the PCIE host driver
- Link to v1: https://lore.kernel.org/r/20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org

---
Lorenzo Bianconi (7):
      dt-bindings: clock: airoha: Update reg mapping for EN7581 SoC.
      clk: en7523: remove REG_PCIE*_{MEM,MEM_MASK} configuration
      clk: en7523: move clock_register in hw_init callback
      clk: en7523: introduce chip_scu regmap
      clk: en7523: fix estimation of fixed rate for EN7581
      clk: en7523: move en7581_reset_register() in en7581_clk_hw_init()
      clk: en7523: map io region in a single block

 .../bindings/clock/airoha,en7523-scu.yaml          |  23 +-
 drivers/clk/clk-en7523.c                           | 309 ++++++++++++++-------
 2 files changed, 217 insertions(+), 115 deletions(-)
---
base-commit: f0e992956eb617c8f16119944bfe101dea074147
change-id: 20240823-clk-en7581-syscon-100c6ea60c50
prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>

