Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4757C439F90
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011762; cv=none; b=BbHrHwh9PjGF2miIX9UVjUq0gNsTuAoilKixfizPy6IHyrHFziEDuj9xVN0vgAepEBykgVIQS2S39+Em/Q4CGSG2A7MIhX9nnbFiaE48JW4auyRxSb4HMXk6U/PACAG0QjPtNf0x3UiEuyqFov+dFE62+xMIg0+7+40nxqdTv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011762; c=relaxed/simple;
	bh=BhNchIMHagP5LNiH58a3QPrktwpAXLbNmtJZy3kytRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ufiIwYQ2LRjsfoO0EgJKfXFMSJYNLoaYHsoEq0sF4Tmiow8rVmzXfurP/zfkENKf7NlMEQeBUBzj4haMpbDmMlFDvrcH0v/r2hO8Q96Wyk+JR6OnMmOALCeF0wIItD00mKPht2qBPtecYQiQKrrOAEcO/jZSQe2ts3UaQY2otp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfWgkXC1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfWgkXC1"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-472326ca506so1368659f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011759; x=1786616559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNH7C3+W1iQuetjKu7PHcF0eka/FhNKK8WPnZOjuhC0=;
        b=pfWgkXC1725YGRNpVB4gwJCR/MKcEGPHPBIbVWr1MQKxuMfE1JAgB1P2BVoUBEbhki
         r84GosFnD8pZ5HJ+JiXg/JIlOu6fZwY0ADZV/k44HbCOJVVvpTlOw0dIeuk59lrRJL1a
         8Z85fea1Yha927EEg0xZkQMr4eaMw1gOrwVtteU5uMydOkzPXaRHJ20H+s3EOyBxZBUg
         mfWJlOKoWHkTr/vz+/+7WYdzXFvog0/Fw6Ev5NQInAZu4u49Cma9B+fz/dxahkP/PaE9
         eRK6HNbzwqHLYkS4ZECWycXm0zatw+nIKGGMT/D5wAiVzHPGPgn4J7GdRZF/JTps6jxR
         iaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011759; x=1786616559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNH7C3+W1iQuetjKu7PHcF0eka/FhNKK8WPnZOjuhC0=;
        b=ckj+bPSkos0qzv9GNjsbhH9qVFbI7kuc5wkCKlbe8x3uzRTrwkwvzYCqnfrHgEbDB/
         6TZgDZxWuomgzSIj0TOaH3ZBrBWwKOGxlXJ8XhQocnX08V98L/bqu8yRmVTtmf48NZsP
         RCs/MHmaFkmTIl9E9KmJsIF1zO5epwYNIwXMrKGczEHphD1OnHjfX9lKnQ6s0OvS9kpC
         4rm93b6m3SJWWHCoZaRg5p+byOZ3Qq2BjZxFPeGUC7fp/9nCHV+Lg3uK22s3r4Rpfemb
         F92q/hkI+N+nUeiVMJUDsn4itbc+1SpdA2os6kIySREiKHM+TokostArnmOKH5kCRiUC
         1U1g==
X-Forwarded-Encrypted: i=1; AHgh+RpH0qsGegrDOIfHHoMZIMcCqEeixTcC+83tLfPQvnqRtBnXpA1ZqOr88TXMv656jC41jjQo3nBMoio=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ6sQdDmo8Meymz+/Qfj7HTgtSKmyTvYM0T24Q6MZcqlF+YQ52
	wgVPyyBd4rjTkxXz2DMALqz/a/eYjF1ZKTjA3hGAvX5eEK1Mlchh/dTv
X-Gm-Gg: AR+sD13whzKn1EDOc10NgP8r8YW5tEYBsY2mxC7HXkXKFHG5Z28Kp2BoWCMsZK+nFgv
	Clrj0stgu92uS7vD1QFBOmrvxeggvtJktnEysyF0Keje34D2Ye7HqgbDIvOPefuk7SYtRGDfHzn
	aPouwzacCEKn3NaP4/YsSUjVNqVaL2YyIAYYL9ezfEbB6YNKy85pkdWeUWI5Yqz/u28SJ4LFflS
	ICt156842aEG275zvLqor+hVb2qCqDgQeR6Il7Fc4l3dWdg//ILM3DEXtnFhlgC6uFvGenSarOU
	5ptRdU351tqWDGS/k1jhh1ulxvFQFIpsNr8TjgvYAzbB4p2msn94qT+Imwgn8/tIu5+3QpTlWX2
	yws3lfagq5IzAc0izha1igRj+TFFlQivnu9wCmmABYDDT0Pe+geNe3gB4/6adKdUcUMSTieXGtE
	P+Nq0teGnIzgwaSwZZjmxZsb4OVum3W5dnFJD2/abZO4dmoMu6yAh73oQmonRhvtMYsQYz0O/xr
	lI49t0LFqzVRk3vyoZbZUJ8
X-Received: by 2002:a5d:5690:0:b0:47f:90a4:ff42 with SMTP id ffacd0b85a97d-47fec4e3d14mr16971436f8f.5.1786011759394;
        Thu, 06 Aug 2026 03:22:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:39 -0700 (PDT)
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
	Bartosz Golaszewski <brgl@kernel.org>,
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
Subject: [PATCH v6 00/10] Add RZ/G3L USB2.0 host support
Date: Thu,  6 Aug 2026 11:22:19 +0100
Message-ID: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add USB2.0 host support for the RZ/G3L SMARC
EVK. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1. This series migrates regulator driver to use id-table so there
is hard dependency between reset driver and regulator driver.

Merge strategy:
  An Ack/Rb tag from Regulator Maintainer for patch#1 and #5.
  Patch #1,#2,#3,#4,#5 - Reset subsystem
  Patch #5,#6,#7 - PHY subsystem
  Patch #8,#9 - Renesas SoC

v5->v6:
 * To avoid breaking bisectability, prepared a single patch that
   does the "rzg2l-usb-vbus-regulator" -> "rzg2l-vbus-regulator"
   rename in both regulator and reset drivers and that could be
   merged into both trees.
 * Replaced dev_err->dev_err_probe() in error path of
   rzg3l_usb_vbus_regulator_probe().
 * Retained the tag as the change is trivial.
v4->v5:
 * Collected Ack tag for regulator driver changes.
 * Dropped renesas,sysc-pwrrdy for RZ/G3L as pwrrdy signal is modelled as
   power sequence.
 * Dropped the tag from Conor due to above change .
 * Replaced the variable regulator_driver_name->regulator_name in struct
   rzg2l_usbphy_ctrl_info
 * Switched to power sequence consumer for controlling pwrrdy signal.
 * Updated commit description for patch#3.
v3->v4:
 * Updated cover letter with merge strategy
 * Reorder the phy binding patch for easy merging.
 * Updated the commit description for patch #2,#3, #4.
 * Moved the handling of regulator_driver_name to patch #3
   in preparation for id_table match.
 * Migrated to id_table match using driver_name and reduced the length
   < 24.
 * Dropped rzg3l specific platform driver.
 * Dropped the tag for regulator driver,
 * Added id_table handling by introducing a common probe().
 * Dropped renesas,sysc-pwrrdy property for usbphy-ctrl node.
v2->v3:
 * Replaced items->enum in reset controller bindings.
 * Collected the tag for reset binding patch.
 * Dropped clock patch as it is accepted.
v1->v2:
 * Dropped patch#6(Introduce helper for regulator registration)
 * Passing pointer to an array of regulators to make it scalable.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated commit description for patch#1,#4,#6,#7,#8,#9 and #10.
 * Added enum instead of const in the compatible section.
 * Updated schema check.
 * Collected tag for PHY binding patch.
   in the regulator driver.
 * Added regulators group node and its children in SoC dtsi.

Biju Das (10):
  regulator: renesas-usb-vbus-regulator: Rename platform device to
    rzg2l-vbus-regulator
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
  phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
  phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for
    disabled VBUS regulator
  arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support

 .../bindings/phy/renesas,usb2-phy.yaml        |   2 +
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  40 ++++++-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 104 +++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  49 ++++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++--
 .../regulator/renesas-usb-vbus-regulator.c    |  75 +++++++++++-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 109 +++++++++++++++---
 7 files changed, 370 insertions(+), 29 deletions(-)

-- 
2.43.0

