Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548713BB4D;
	Wed, 15 May 2024 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715777942; cv=none; b=aMQ4uzNb7izXW4cAtmT4qwr1vs4F656DbttGOjLPMFaqjT2uTHaZKCEnHwLlGBj5ruuzEp/tbOkPKAAuM7NzAcnSBxM7ZhOxLU1wXYcESTT/DbyGCVDe+kWXZj6YIG0dkgzh7so1EP2NG2//BXCNUuD3TnH7YMPTatFL6r113g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715777942; c=relaxed/simple;
	bh=jzStfGXfXjfJ2zeI8DnIbWR6nERsvGqp5FXRusUzJIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AAZqDFMUJZHVv6AzH7arEpD9Oumhm6aFrBWdFs0E5xLtPSHR2KYcXY5e95Q7Zr5wlUpVyTy3E8+dN3fXd2+qEpEyu5959WE/IU+XdOZg5Q4T25668JdP5n3ZX5Wp25wnW+JtRVdS1xzF17kvDVNCODwc3lNO/V0g6AyfQeJ+gXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsCdAH4q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsCdAH4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0BFC116B1;
	Wed, 15 May 2024 12:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715777941;
	bh=jzStfGXfXjfJ2zeI8DnIbWR6nERsvGqp5FXRusUzJIw=;
	h=From:To:Cc:Subject:Date:From;
	b=EsCdAH4qU3QyZZGukqpezrrcxHoI4dN1LiRTaa3LEtVIys/U7hnY2ldRfmXbnDTxR
	 SuuiO0lkKaA5VYd9Wzcm089yR88ZU+Po5ksgm4/Ivu90LhhKoQVywG51gklEBstxGs
	 WFcAe8asF6ttJ69XqApB7R6vgLf+94w1J7GcSOpUYjriYos/MI5pcoKKBDzBDV6rrZ
	 78TgQ0DSNosyCm3xCZqrQrIy9uLwUXIA9avmSjLVGb8Kpob+dV+Rk2CJD2d8pmgti+
	 I3U8xmtlLBbVBxgluGYoZNgg4GyRfdpRe9+R4xW4l7zGvxBLCJhBpxnpnPllTMJw4M
	 ph0a7IUiU67Hg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com,
	conor@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH 0/5] Add reset support to EN7581 clk driver
Date: Wed, 15 May 2024 14:58:46 +0200
Message-ID: <cover.1715777643.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce reset-controller support to the Airoha EN7581 clock module.

Lorenzo Bianconi (5):
  dt-bindings: clock: airoha: Add reset support to EN7581 clock binding
  dt-bindings: reset: Add reset definitions for EN7581 SoC.
  arm64: dts: airoha: Add reset-controller support to EN7581 clock node
  clk: en7523: Add reset-controller support for EN7581 SoC
  clk: en7523: Remove pcie prepare/unpreare callbacks for EN7581 SoC

 .../bindings/clock/airoha,en7523-scu.yaml     |  21 +++
 arch/arm64/boot/dts/airoha/en7581.dtsi        |   2 +
 drivers/clk/clk-en7523.c                      | 137 ++++++++++++------
 .../dt-bindings/reset/airoha,en7581-reset.h   |  66 +++++++++
 4 files changed, 185 insertions(+), 41 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h

-- 
2.45.0

