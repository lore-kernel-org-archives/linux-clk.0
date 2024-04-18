Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2F4165FCC
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713449833; cv=none; b=IGddRbiVTjthPm6ehsx6QVsVzep0UcNaELDxDQPpwcCdm8OHhGtF0ArF+pv2ul+7pnq0ECwt2+9p07e+g8GMR1AfP37aq78JpRzaUGN+bE23E/YbDHY9Aqi/AX+/wXFhVgeluSwEBRfrws/V1zjafUaCPL8iENlOr/mtlisZJfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713449833; c=relaxed/simple;
	bh=iWyHmrvi91xVl8ESknpnnskQ0bzxK0EmmpfVyEtSIeU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cMiNzw0vK9CKFeVaTjJh12I9h6PpEuskgqxTxETHUfgeLZOBxFMBguqe55Ab1xTELOsWVP9gYY7Zs+tGNrF2h2te+Hnf3TstJtbHbWxiibO97IBHgvlcGfvmaFfYbngrhBEWy8UzDOY0uRH1ohl1QZ1sW2RklRVm5LoUTvml05w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0Om46ci8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0Om46ci8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-418e4cd1fecso5275195e9.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 07:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449829; x=1714054629; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O4qQ3BMswui5iA/lahEt8yxPrfztwgwq30rSThlaR7E=;
        b=0Om46ci8lcC/51F8e8C+C4ioAQ5WwG9QKFAvZ1zF7jngqz2zvAn2D1dw/zSbf+Al2H
         e2EnhI0Zcxy9Ptl4SzPA6FF+FO7Wvg73Tme5BXbG8zTYcEqF6RKl2XuiidD4t74N+sgM
         ghTyY5D6zjmv4tODcHmPpjFz0zVechCMgKXPH9pQkoB1eo2NWINh0faXi9oj/S4WG+PK
         Jl+Fjw4AA7YSIdhnfTIpXa3KGar4DmSnK21te1q7qJHfUQCOsTSzrXx8oxiHb7l3O6cb
         54iFx2KmK6N8yzH8HzWKHgU5ewWok/RukXQQMhB8BOV3tKzJNuNaWTlbHwLZ2TsrXA/m
         3Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449829; x=1714054629;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4qQ3BMswui5iA/lahEt8yxPrfztwgwq30rSThlaR7E=;
        b=uPv4RURwFxdDuaAFYr86LRCO0FrWOQXzaw031RZIOCaT+TgXQpepj7TOOjzbe+N9lT
         h344kEJMnKeiKIaE45LkGIdvq9U9q86Tl3FX0wzm2CPjHp570tZlPgDqtU8WabxVjVrA
         PHt5mcs37L8gauRu/O7GBhI+d9rJUBP1TgB8CDKiXnbJcSHHdplRKgg3b/ZO1xR5GYz1
         CiXi4ZBIn/iva1rv2771YFeFeEAc/Ot3uhwd5Y1791GR0x7MkoVz6PTivdyFx7GKdMW9
         a5UsN/RlvQSKmb/l/D4KwBqUsKrA4dbuuOS/2FU+CcINTEokInMFDXCsqQgGpe3/N9h3
         1V0g==
X-Forwarded-Encrypted: i=1; AJvYcCVMC5xqC8KIHkKCQmJeIWrNK5zo1N+CiS3Sw1T9Yi4KJ8Lbs7+iH0YNTq0a9BUDk+wtN3xqG5+1wQf0mzzB6YeXuVYJxmgYP5Ep
X-Gm-Message-State: AOJu0YwvpAnQ3Dg9m0w/SBhCtb1daydpLJ9X0RmIpkSgQSA4RjNynedr
	QyqSZugjmkBk+a7phz7zBIuBhT3No6rZzRXeD53nG7jzAKDDhVkqWoFJEKBMbFE=
X-Google-Smtp-Source: AGHT+IGVpb9Ci2p5M2/Njc+fC5gHT3nWfNz2iG6ShInHy82wcrtLmmoA8+qGrmtDPDbBpbRZRHxZLQ==
X-Received: by 2002:a05:600c:1d9f:b0:418:fb6f:5fb3 with SMTP id p31-20020a05600c1d9f00b00418fb6f5fb3mr231339wms.3.1713449828814;
        Thu, 18 Apr 2024 07:17:08 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 00/17] Add display support for the MT8365-EVK board
Date: Thu, 18 Apr 2024 16:16:48 +0200
Message-Id: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFErIWYC/4WNyw7CIBREf8WwFsOjrejK/zAugF7tTWohgMSm6
 b8LXZoYF7M4k8yZhUQICJGcdwsJkDGimwrI/Y7YQU8PoNgXJoIJyUtoj9GPeqbx5b0Lidqu4cp
 IBg0/kbIyOgI1QU92qLsEMfHa+wB3fG9P11vhAWNyYd6OM6/t74/MKaOtVR2DvrVSmovR84gmw
 MG6J6m6LP4oRFFIaUGprjFCHL8U67p+AJXgYVoMAQAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4094; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=iWyHmrvi91xVl8ESknpnnskQ0bzxK0EmmpfVyEtSIeU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStiDXn1Y76NsQCVXp2PgP1cU00kHkVfB6KmCx1+
 ZS5ACLWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURZacD/
 wNigbamUMpZ+kDSd8kSTVcAUnAHnBfhlQxARr20EYEsdJvr0dxAvYPFGzqy7D3V9JymwmbVdCSWV5v
 AmBgZO0Y+9lq0n+HHvGunQdRPjD6FeZkk5FOR93No/AdVsjkEisrZiZfUorTmIUe2jFLEZBY1PjKWp
 cq8eKYi7OQr2jjzgWEQTCwz4c2peq+05lAG8EBGa65mZiGR1At2etEN/mFE9L+KSBHrD3ye6Xhb9rX
 RePvXJTY8g4Ei5f3OIlYTyMXKbFBqhXYWfnIerD99LnhCqP8phhK4R9GPMM1FgzEKXaHhsarHj/hU5
 3G3dlhjbCy8zbHehVNeoDW6dYE8XLyGSxcsmvkoP8mk0u6QSmPYeddRqNjBiiiB8Dyt3+Gw2gfWZiA
 9brSdizNF3kil+S7N/MOyueiFY5+TNOf/LHgamwQuVP8tvpr1GKcMNM/CuB0pHIV93cCJPwORGHoUX
 YsVflyh1cjCYKeoM9HtjNht4psmHG7gQyJA4XQ6+2BzwAaO7sYjGvVY5b0rlYakZjENpKjMTGsjhdV
 SK0hiEfDk+Lg628vPNfN9cNoRF8tGIFHbtIyi8DUpHYzFNdpnALxR+JIKA65JIrjnNuj+C7zO6O3x7
 l7B1vhm0t8sNymp0uo5e2+CY2fbcUuqEnAQOMRq41K74P7V1VirFehKL7WLA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

The purpose of this series is to add the display support for the mt8365-evk.

This is the list of HWs / IPs support added:
- Connectors (HW):
  - HDMI
  - MIPI DSI (Mobile Industry Processor Interface Display Serial Interface)
- HDMI bridge (it66121)
- DSI pannel (startek,kd070fhfid015)
- SoC display blocks (IP):
  - OVL0 (Overlay)
  - RDMA0 (Data Path Read DMA)
  - Color0
  - CCorr0 (Color Correction)
  - AAL0 (Adaptive Ambient Light)
  - GAMMA0
  - Dither0
  - DSI0 (Display Serial Interface)
  - RDMA1 (Data Path Read DMA)
  - DPI0 (Display Parallel Interface)

The Mediatek DSI, DPI and DRM drivers are also improved.

Regards,
Alex

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v3:
- Drop "drm/mediatek: add mt8365 dpi support" because it's the same
  config as mt8192 SoC
- Drop "dt-bindings: pwm: mediatek,pwm-disp: add power-domains property"
  because an equivalent patch has been merge already.
- Add DPI clock fix in a separate commit.
- Improve DTS(I) readability.
- Link to v2: https://lore.kernel.org/r/20231023-display-support-v2-0-33ce8864b227@baylibre.com

Changes in v2:
- s/binding/compatible/ in commit messages/titles.
- Improve commit messages as Conor suggest.
- pwm-disp: Set power domain property for MT8365. This one is optionnal
  and can be used for other SoC.
- Fix mediatek,dsi.yaml issue.
- Remove the extra clock in the DPI node/driver and fix the dpi clock
  parenting to be consistent with the DPI clock assignement.
- Link to v1: https://lore.kernel.org/r/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com

---
Alexandre Mergnat (15):
      dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dpi: add compatible for MT8365
      dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC
      dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
      clk: mediatek: mt8365-mm: fix DPI0 parent
      drm/mediatek: dsi: Improves the DSI lane setup robustness
      arm64: defconfig: enable display connector support
      arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      arm64: dts: mediatek: add display support for mt8365-evk

Fabien Parent (2):
      dt-bindings: display: mediatek: dpi: add power-domains property
      drm/mediatek: add MT8365 SoC support

 .../bindings/display/mediatek/mediatek,aal.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |   3 +
 .../bindings/display/mediatek/mediatek,color.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,dither.yaml |   1 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |   9 ++
 .../bindings/display/mediatek/mediatek,dsi.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |   1 +
 .../devicetree/bindings/pwm/mediatek,pwm-disp.yaml |   1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 180 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 133 +++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/mediatek/clk-mt8365-mm.c               |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  30 ++++
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
 16 files changed, 367 insertions(+), 1 deletion(-)
---
base-commit: be0c499a5c5ff8eab746f36e2aa1e920edcb7e37
change-id: 20231023-display-support-c6418b30e419

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

