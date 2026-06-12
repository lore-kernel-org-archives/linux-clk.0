Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49792C11E4
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274656; cv=none; b=MBXz7mxTitT7DJ8vDRZHtkuZpd7dmyBCYTLQNbLLngxg0b/ol+EER7+JIW5TSKALCF5CmP8VGkJ7lJ5sqroal+kTTzqQLYpJ1izMsHM6uCPpT+UYLAZYzKPodNp1krtor+A2gCKIiaMnZime9Qv6DamEvuFHRGyauN5dZeAhCiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274656; c=relaxed/simple;
	bh=yuMFmQ5MRWJeClwbnY3zCpvrJ03BA8VG6OH9X4U+owU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jvzQqotGIHvgeZVFVempWPMt7PntMtELHi71E6MHSKxFB/UEYoge0mUVbEbo/5HWCIJX8W4BY/CLk8IHm02xmAdslKtkXWXkRNO7pVFVsy10JWrNF01fEpq97cUFBE54vEJlcoHjpc6IGvSIfuXluA2d9TJL45c3ILDPwEDUS0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8OdHXyO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8OdHXyO"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so644254f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 07:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274652; x=1781879452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sj5YLZXXcBmUxWzHptzfJghLh2vd+J2ccuESFm/Sbrw=;
        b=H8OdHXyOP2jx3b9qgnEFQx967A9FYE+GRupn+fIZzyGeRrHeDdhnw1VP7mXW01LVXM
         eyii53GRrsVmGx1lQKUqKRKwjIg8dQtT6dc6rJ6yKfvqs5xBQZr6jFAXQ/FLAcVtNF3U
         IYbX8I054wOCFM+mI9mjPLJJgvN4kkFDd7BQ+CXNmVhte7vwDYyNZEwb/4OF4eAIw2jJ
         gCf27DV3aAzGn43eqIpgclBVDn/a5INBa+2arSvCJgzJ9Uw0yp2/CQ9mYLZNG+eoT29o
         xz3A0yTUs2gp9MGv9Tn/DogNXfJIQlSg24xaCpQ4ByMAXS3vXVxF0v+y/2rSw1eTrIJk
         98Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274652; x=1781879452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj5YLZXXcBmUxWzHptzfJghLh2vd+J2ccuESFm/Sbrw=;
        b=bulIJ7dllvF8gT/mRwn+cIhjJyzNlz2xIm29Jm/LRt0WvVLSP2FgeluQ2oTdQZmhw1
         IuQ4IZJF/qm3Uewlje/qWnHixTjA6hA2PO1P9nEc4PjdMoFuq0gu1RsgqVap1DHz2Q+9
         UWg6AxIacn9KE2/i2eQ/1s0vkexCNeXqq6ioqGO14d75VieYRto2miF/D+nQFsiGZdC4
         9a/5L/5/RSawEQLCGstWiqpVf1HLlMn28UzULVuQtmcmHBIceB3ikiKDcWOmEalb43/b
         Q9o65ruQUT4HUYobzK2OLL9Mu8gaUXe3TijCjwYQ6Ix27YUHUSX9bn8lVyn0pcPkcoPx
         7/Zg==
X-Forwarded-Encrypted: i=1; AFNElJ97chcv8gGfE9tNrRk16Q4tofSpmIGiAEFqIN0G42c0jl4ZcvMnK/nREnTZQy0vGEhvHaHyRe4tQwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm0e4jiy1Inj2qGKEM4rP8AEvca8eMbXgh04+d4buOIqR2bPKD
	Em9sGTT5HAGXH9etscdpcXrgg5Kvp/p9yIupwRUU9fDd1MpMFWIPDVWX
X-Gm-Gg: Acq92OEBMX2B2CdEmu0wBfz31cFW2ewTlaRRefIlMFh4pneL/BizEPzGrkk5hDHumxf
	C2QcOetZqiNMUz+noYpG2mdSefdTO6LilvNqblRJLhXqtpA5c2G2QPUl8NQdjVtg2VUTvg9U64E
	pK5UkwDU9uqRwGSsG6edXd6d45i+StJP1i3G+W7ewV7JaX0JWOktFgzDTnz7fLptmD4o3KXNOJc
	RZ03XQDUYDuFrbVWL68FczJpBjT23lZuLSO3vcsMxXKUvjm0zFlHseMtfM2ZEmjB05qUApk8swl
	w9Ba7CdwMk3XNoasufK9CYbVrNAK6MTF289QfvGFcC6SWPDjuPQkCVHCYUoP14t71WhBABai1YS
	NnvHDsmU1HCrF5PCdjkCYOTTWad0bxdhBRlfk6mgWurHG1lEV4tdOKqGP7NH5lDsdMtCpIUQ8Mi
	iipKp40F7XL+7JsLWkvONrKLseUuXFELwN3ZI0wngZ1uKBLg9O
X-Received: by 2002:a05:6000:428a:b0:441:1cf8:ca00 with SMTP id ffacd0b85a97d-4606db9f17cmr4752008f8f.26.1781274651930;
        Fri, 12 Jun 2026 07:30:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:51 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 00/11] Add RZ/G3L USB2.0 host support
Date: Fri, 12 Jun 2026 15:30:28 +0100
Message-ID: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB PHY
controller. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1.

Biju Das (11):
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
  clk: renesas: r9a08g046: Add USB2.0 clock and reset entries
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Introduce helper for regulator
    registration
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support
  phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
  phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for
    disabled VBUS regulator
  arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support

 .../bindings/phy/renesas,usb2-phy.yaml        |   2 +
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  20 +++-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 103 ++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  49 +++++++++
 drivers/clk/renesas/r9a08g046-cpg.c           |  15 +++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++--
 .../regulator/renesas-usb-vbus-regulator.c    |  72 ++++++++++--
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       |  44 +++++---
 8 files changed, 291 insertions(+), 34 deletions(-)

-- 
2.43.0

