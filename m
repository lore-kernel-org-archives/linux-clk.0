Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B688928EA;
	Tue, 12 Nov 2024 00:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731370172; cv=none; b=YNFCNl607IqFxKQQBA6STQgxLr96TyIGJp6sQ+SjSm+oUAFbbHANFIeS0oxtMiU6X+301WP4iq6wzrnJ4CGT9mEcxyt8R3O2iqkdUIi/qtjiERWd3JhmbVgRLRZgmRP/6yHsETgV0Lr4uDdZwIrtIDefCLFC09+vMNwMfbgcRA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731370172; c=relaxed/simple;
	bh=0BN/FwFINfIweSPyRYGiqivvH0muTynHLak6B4C/5vY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jbtpEr6RfBvuriSAxpHtPXi9VP9zVqp9XMHEM9VXzKLGqrzoQIbfypmXH0w8XrQdp7SnABrIrVAKROZmuXXMpeTC8TMOJn/+VK3uWOTLYUWTQncAm7y+SrMU5PBWQ/szqCtSHaMx/pNTVyzzkm3zq0i8RMFCBqF3MxeBrykHDtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gA2rjWSI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gA2rjWSI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC76C4CECF;
	Tue, 12 Nov 2024 00:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370172;
	bh=0BN/FwFINfIweSPyRYGiqivvH0muTynHLak6B4C/5vY=;
	h=From:Subject:Date:To:Cc:From;
	b=gA2rjWSIv32F0Rwy9fJ2opnTSWrlewyiuq/0/8JnZNHe/EJxkbjjSrNj5QDNB0gMU
	 fQlshSh+/CxIeiTy2yHaOuTUu2O022BMuNk8wU0S3aZxGDDXHAkJ92D732fej6aEHu
	 BnvreV26OsQCb9QYb+caYOoeDjuZoMqBeP1gxZXxPagAdc8xsa0V9Cut+ibjL8ZTKL
	 IlIvhMYikGTNeT/+nGoOs4TMGMqYrbe4qfPj8Qu4n2wCWbvu2AdzrhS0tnyakfPTl6
	 DS3x2x4iAnzDVKVP9ZxOejmkM8OYVgmxpTBsSl3ExQomsTXy9df7guIOOxefZ2iqQZ
	 wniY3TBljhNCQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH RESEND v2 0/7] clk: en7523: Update register mapping for
 EN7581
Date: Tue, 12 Nov 2024 01:08:47 +0100
Message-Id: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2

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

