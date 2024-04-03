Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C08947E;
	Wed,  3 Apr 2024 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712161273; cv=none; b=ofX5PUrRANK1Ajk7bMfKvMDGepOqAjBCXY4bIS11hLy5h4lmc6aLEWxoHHvmmzmS/Jd9j7ZJytb+s5OdgaHZLRWHo8SSE+g3efmcV7qECBsAUX/HCNq2/EtMLB+eJN2ItPir1q/rt/2RzjWMIs+WIK0AeTSD7ZdQvb1Ss5Tjwoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712161273; c=relaxed/simple;
	bh=Ugubryy1gtIca0MeR+7bQXr2FXyYPKSOb7mThNIjjUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d3pkPTQeT1yE/Cokf4ck3RpL9hwVH8QdiI+kKNkcKa2uqiToG8iqShOiPM6TKZBNFYcVgeu+V4GqZ1Wgs4MLLAV571X3EACcJ29c16q7JId+2fS1cW1msQ9Q2eFbFhuz8O92eQ+GjuT469lELGEujjlCOAUvqAK7oT8wHUcw4Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKV9txNB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKV9txNB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B42C433F1;
	Wed,  3 Apr 2024 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712161273;
	bh=Ugubryy1gtIca0MeR+7bQXr2FXyYPKSOb7mThNIjjUY=;
	h=From:To:Cc:Subject:Date:From;
	b=hKV9txNB9Yr81Qmq4PtNYIry5eroANvRhmdz1LAQKRrQMn39YX9B5pScqVAhYUoOo
	 Ys8J6yIVtrSz4brqbKo2/CPdJss3dzRCNZCSIiC6X8sAQxla1Lafymwum+LqNdvS53
	 4xHB6fGPECTRTefH2++L4QNGMVHtboa6Su1D6cSK3oxkNUDqbLSJe+8EgNaZKG6Ny9
	 WnZYvE8WNMd0xbloRki4myBahbCIoubQ54vhVonD3xOtwP07ARB1sL5wGxIGZZTdG6
	 H+S9Uuvjbs3xAvJHUQjs5aBA1WzEmMPDimbAC6D2iBe1wD3NBU4QLa1DIrxKvH2bY3
	 Dp4Zv5H4Oz13Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	lorenzo.bianconi83@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH 0/4] Introduce clock support for Airoha EN7581 SoC
Date: Wed,  3 Apr 2024 18:20:41 +0200
Message-ID: <cover.1712160869.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is based on the following series:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/cover.1709975956.git.lorenzo@kernel.org/

Lorenzo Bianconi (4):
  dt-bindings: clock: airoha: add EN7581 binding
  arm64: dts: airoha: Add EN7581 clock node
  clk: en7523: make pcie clk_ops accessible through of_device_id struct
  clk: en7523: add EN7581 support

 .../bindings/clock/airoha,en7523-scu.yaml     |  26 ++-
 arch/arm64/boot/dts/airoha/en7581.dtsi        |   9 +
 drivers/clk/clk-en7523.c                      | 155 ++++++++++++++++--
 3 files changed, 171 insertions(+), 19 deletions(-)

-- 
2.44.0

