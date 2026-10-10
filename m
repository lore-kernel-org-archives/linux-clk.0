Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3513B493D20
	for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633353; cv=none; b=ZbppX97eEvk83OuDm3KeWx4Ccrsn9+jOeI0mZ4KTyhYjxMjn8zID0uyzvQt5OHbh8kc+12lKKg6ORMH2ySyd2vf/yGKmt4XWUoePVfdVf/OXrGxAOFK1HQiCCJnjl0VgeP6o6pD7mGfbdA56Ebqex0DP+n8UAdV3Ii9uypVajFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633353; c=relaxed/simple;
	bh=rvRwgHQvg5JZ1LUtLcvpMJdT9FYkYz/WGufe4EYyt6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QzLBvpGq0U7fTnRlE/OT8gr6j5zz9h2r7E2zsAYsE2fzgAZd93NrUF8haWTtteEYG8BYxtNIgBAL/2XqEjJPp8+ICtwRolTjduZINqDbnzEvY1Ane1AnbEX0IsKyJ+LEpRnWnPvZrsQWomM99mLQHPa9w0Vf7etAPk901eRCCnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/uLWFKb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/uLWFKb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a061a13884so4859995e9.3
        for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633348; x=1792238148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MUGs28pjyaKV6mm7T8DFRVWF7FBLghSbmcUfgUOr8K0=;
        b=X/uLWFKbu+/TRM+hrDw4HzQYRKaf20P5Gr7PXI4ImcUAd09UQJ5rhaQt3DmOl1xtpr
         YW7fnABdmvlyapQJCPQsOk0TZy4qEZf349NoRhc2sAQnxuAcIjIS03s5cQWvI9yMrkUd
         GPuuaaMIkvDP4q9wxa4Lrw8PijPl9P3qnypWIZNRqno7C1QSTmzeFddgDbDbSYuQrmp+
         sSh8LCeuMlV1OGT1hjgHW/5IXFH8q2WzouXTBiYhsIwTBrOVq9T0SP9P6/DHaVI2ye/J
         UcQt45qq6RH95KxhVaDDPoPfEQ1/Rve9s4lrph4OuVJlUgrrog8tuIC99ndMLGx+oxkw
         MXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633348; x=1792238148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUGs28pjyaKV6mm7T8DFRVWF7FBLghSbmcUfgUOr8K0=;
        b=NlZ1Jb26Z6ikm4DkfKNfvvP8hTKfGY9MtbKlmhZEqFgt3I7bjxuM4qnDbgD+N9SaR6
         NiTf6DyKxnoEcmxVy04RsneeoG1fd8J56I/80BIWccWqH8XMc3rtVnoDUq4pF9+etHl/
         tVuhs1/6vwjhbV2boIwtEMUnjkRTOg5Frwl3ujCJ6zKHB0EIZVWpu0faLVMKNbukwXrn
         Lj2q9BMvDnSN5xtyBe04mcjw4Hn95Dbu8p5MKS8PEYY4RlGvSBkVE7a+fPiOI8NfzM5q
         WlAN3XTvwiqtYBp8b1R/ycX82ADLqxzHzeOZo8UtoVcb7Umdj9hDCA4M2bBb6Iw9QBel
         dJ3g==
X-Forwarded-Encrypted: i=1; AKwUvBx1hSegcUxcpe9zT1o7C9CZ328G3wC6lAEJP6PJuyLDudyRUstm8EwEF16aZ3lAlaana2AiYyfOsic=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqNMgjR68qDHkZq7wQQjwn4gSSFy/CatRnmmkNAC+8bLKWyWux
	kIxVZlFO2X3uInltnScCiQlST3ccm7LIvnr9ZVfG29L8yyT/upDGBEYe
X-Gm-Gg: AYBFou2uCkHNxMocQ4WwKXeqRz7ett3E7hGXTybaFX5j0YETnDbgmbymzQlxO7V2hoD
	5r/SAmilL2vLNk0+xGb2q3jXQP9fJrXHAKWLgZQIKQy3t80+68/9kAZ+QUbngl7LyHTbWu6EPmy
	huO+41Vn71fAh/0OcOxuMvi1cWTRfijpVK25+wljOsdj1X9uHdNB/i0wTXC6lhE3KrdTlArSNJr
	9V8n0OSACQEktCdn5h5mRcNqsZlHIB5Pu+14oVpQ28AvcwQk2/ex6683Tab4NuqiugoF+MK+DJb
	YoUfjDSdhS6JGUtVZk1mpJ+r0B3zASCul7sUNnm1EktRlBszVBCt7VQe76ma1JWGLpt2B6k8aGV
	xIDE+Sz/34iuL5FgUAlEozqWUWAIKeuS3mnPkMnXDKPP++mz2eHkEA9HklXn403MJnNq2pSeQ8c
	VTy7+aP7nISGa9vQEDRFe+nIxxlsEAiXP5UVTqwuWlM9aeeOn08CkDIHqo9jh1YEMwBVQVvWfdA
	wikkQ==
X-Received: by 2002:a05:600c:4e01:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a18e4afc3amr83354515e9.24.1791633348096;
        Sat, 10 Oct 2026 04:55:48 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:55:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] Add support for Mediatek mt8167 HDMI display output
Date: Sat, 10 Oct 2026 13:54:00 +0200
Message-ID: <20261010115539.9237-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek mt8167 SoC supports HDMI output via a dedicated HDMI PHY
driven by the DPI1 display block.

Support for HDMI output was partially upstreamed in 2021, but is currently
not functional as it's missing its HDMI PHY driver. The HDMI PHY is
apparently similar to the mt2701 one, but some differences in timings and
in the initialization sequence are better expressed with a separate driver.

* Patch 1, 2 add support for the HDMI PHY.

In addition to the HDMI PHY, a few fixes are required here and there to
actually get HDMI output.

* Patch 3: Some of the HDMI registers are mapped into the apmixedsys
  syscon. Since they are manipulated inside the HDMI PHY driver, we change
  the apmixedsys memory map to non exclusive by switching it from
  devm_platform_ioremap_resource to of_iomap. This approach was copied
  from mt8173 apmixedsys syscon.

* Patch 4: Since the DPI1 interface is hardwired to the HDMI PHY, it is
  appropriate for the HDMI PHY to control the DPI1 clocks. There is no
  effect on DPI0 clocks as they're completely separate.

* Patch 5: Some MediaTek SoCs require a supervisor call to enable HDMI
  output. mt8167 is not one of those.

* Patch 6: In the common path for mt2701/mt8167, a register operation that
  is meant to enable the HDMI_PSECUR_EN bit is actually touching some
  other bits that are set by later operations anyway. The patch makes
  more explicit the intent of the operation by setting only the necessary
  bit.

* Patch 7: Adds the device tree nodes to the mt8167 dtsi. Since DPI1
  is hardwired to HDMI it is possible to bind the input port of the HDMI
  node to the output port of DPI1, but the patch that adds the DPI nodes
  to the DTSI [1] has not been picked up yet, so we leave it disconnected
  for now.

The series was tested at all supported resolutions on the Sony PlayStation
Classic Mini.

[1] https://lore.kernel.org/linux-mediatek/20260921113914.779393-5-l.scorcia@gmail.com/

Luca Leonardo Scorcia (7):
  dt-bindings: mediatek: hdmi-phy: Add compatible for mt8167
  phy: mediatek: hdmi: Add support for mt8167
  clk: mediatek: mt8167: Map apmixedsys iomem as shared
  clk: mediatek: mt8167: Correct HDMI-related clock definitions
  drm/mediatek: mtk_hdmi: Set tz_disabled for mt8167
  drm/mediatek: mtk_hdmi: Improve the secure output bit toggle
  arm64: dts: mediatek: mt8167: Add HDMI display nodes

 .../bindings/phy/mediatek,hdmi-phy.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  62 +++++
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c  |  26 ++-
 drivers/clk/mediatek/clk-mt8167.c             |   6 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |   3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h      |   1 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c    | 217 ++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi.c           |   3 +
 drivers/phy/mediatek/phy-mtk-hdmi.h           |   1 +
 10 files changed, 314 insertions(+), 7 deletions(-)
 create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0

