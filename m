Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195BA1D12E6;
	Sat, 31 Aug 2024 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725088748; cv=none; b=sVa/phHAPartxUfV6sDKIJVrbk+RMxmgxDBk8ZBjOoSUR++SWFpLwIJjhmgGSvKnFrDgZhIaDT2zDD026D1TiEurFCAwqxxsTgoSCRLY3TiwYwoUb/GDbLULiCrGqChboC2kWpv1gQ8M4BQQjnWfbx1S7OZLUUsuwqWo6trpcIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725088748; c=relaxed/simple;
	bh=l9Jwb+2S98IROy4dg0RuvgbMHyh5Cilt3dxPnrkZO6M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o8bUt7yD7WkmOue99+i2K6woPl5DwqCY4WVKxntc7aGlH0YF7jyUz2CfcjozmqTBZaT0fnNIC+zCuNWEcC6i1KK64FeHAvVIbX0/oNccGv0wuNNiTZkQAJUncchD23tAn/P0PlCYYZ/HI5E2moxgAbIKQTCequI8AdTjTH4RifA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twNVno/l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twNVno/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6D0C4CEC0;
	Sat, 31 Aug 2024 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725088747;
	bh=l9Jwb+2S98IROy4dg0RuvgbMHyh5Cilt3dxPnrkZO6M=;
	h=From:Subject:Date:To:Cc:From;
	b=twNVno/lfMeLIU03ClNwSFPitbwmUbmY/m5eVAdXeQVQgrGg5prBDI5Ja7unP6uKJ
	 YE0LUYRvC6KEwRKNhTds+oPfGqYBOo84Vr7V/WWsNWMTXqsB1hV+PoJvbzwzyVIe4C
	 pbt9IglelyN3bG/AL8jpHxu9Ogg2LMLOcJAXWCwR5bN9fXq1+SZzB2yy5Y9MSd3rTm
	 YJ3LHEk+TjpY+MPjgfNRW2bM4j4UFOPOE9k3bl1gxUCUFwegswb8clyFgnhfG4s+ZB
	 cIRhCyO5m1djtXEXztnThZoWdOUvJHM3u3MgVHAdTl2uC1komNSJs2nNluPiWAfBw3
	 wDZecZAICaebA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/7] clk: en7523: Update register mapping for EN7581
Date: Sat, 31 Aug 2024 09:18:42 +0200
Message-Id: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANLD0mYC/0XMQQ6CMBCF4auQWTvJtNBSuYphUctUG02BVomGc
 HcbWLj8X/K+FTKnwBm6aoXES8hhjCXEqQJ3t/HGGIbSIEk2ZGSN7vlAjq0yAvM3uzGiIHKarSa
 nCMpvSuzDZzcv/dGJ53ehX8f4l7tqd1tS6MeEGoXA6+TR1s2ZvSMzeNMtEvpt+wGNIsdiqgAAA
 A==
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
REG_PCIE*_MEM and REG_PCIE*_MEM_MASK memory regions (PBUS_CSR) are not
part of the scu block on the EN7581 SoC, so configure them via a
dedicated syscon node.
This series does not introduce any backward incompatibility since the
dts for EN7581 SoC is not public yet.

---
Lorenzo Bianconi (7):
      dt-bindings: clock: airoha: update reg mapping for EN7581 SoC.
      clk: en7523: set REG_PCIE*_{MEM,MEM_MASK} via syscon
      clk: en7523: move clock_register in hw_init callback
      clk: en7523: introduce chip_scu regmap
      clk: en7523: fix estimation of fixed rate for EN7581
      clk: en7523: move en7581_reset_register() in en7581_clk_hw_init()
      clk: en7523: map io region in a single block

 .../bindings/clock/airoha,en7523-scu.yaml          |  12 +-
 drivers/clk/clk-en7523.c                           | 311 ++++++++++++++-------
 2 files changed, 220 insertions(+), 103 deletions(-)
---
base-commit: f0e992956eb617c8f16119944bfe101dea074147
change-id: 20240823-clk-en7581-syscon-100c6ea60c50
prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>

