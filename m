Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E327243F4A0
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011735; cv=none; b=opSY4eZR5E6lprcAg+Mxa1mrmyv0YVQ/FRzfJkG1a3bOeupIs4e+sJobDZ/LAcaCmzp9KndT1I8NCUVpxfyd892sf6WC1KMi1W+P/skOKA4ktP/OU7AzBQh86YK81Ar2ACXSdL2U/HHzo/8ptQujX7sEbSvdPHLs5XLV+TFLCMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011735; c=relaxed/simple;
	bh=BhNchIMHagP5LNiH58a3QPrktwpAXLbNmtJZy3kytRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UtSwBVfO0ad1/dSAHT1N/JulYmbvgO3vRLcDAY5WQX263RY7ScQ+R0EJYsdrOqps+Za2hH31VF1q3TomZVHOuavR42XzmGfAQjKqx8SgY0zxZZiIToVtd/lOcIvsxAIFkVwld8hK9HXOvOG/2u8zYAH6MhzADXBy+TpDUort9lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH3P3bt6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH3P3bt6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49553515a8bso30105105e9.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 03:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011731; x=1786616531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNH7C3+W1iQuetjKu7PHcF0eka/FhNKK8WPnZOjuhC0=;
        b=PH3P3bt6Hf3iiq0uXf9D31jPLqsO/DuyrEn+81iZZsPo1+qBRuJ9Ch7NIJXAQa1uZN
         SQs+XuRLbQWkUz3K6b2o7ZddSP5ryKSWfxcLPkuJ5ZG7e84kf9+fGXdE/1189X0aIK1n
         rRmRJ5Ey0NaGVVrR9OirxkbrfNyqDgmYJtZ/W1mxU3GMlKSo27OelNPIPj1jxIfTXZpX
         7H/G0IjInc6X0cvDimzC185OU0QaX/CEmi4qJ4vwh1ftTR3SGVLLZrKqIG52JNDUzBzb
         JwdnzlgLappTdPT2ubxz16sY1K6rNLrFzKU5x6BRwjpz9fiHMibB0hYABfkixAqHSS1F
         z4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011731; x=1786616531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNH7C3+W1iQuetjKu7PHcF0eka/FhNKK8WPnZOjuhC0=;
        b=Y9X8YLUvzvOJITgyZnfW89zrFSFNAI82YOiyrMsZ/s7nDpdZRCu6FlVqQQtJkZnSo+
         H8qxIBEIBMPzw63CFOPEy7wUtEhsaChXqPWz4owiGIBGOCwNXrn3VD6ba+b+WwTLfP5X
         QfdJDHCcCnmeHNB26oq53KcYg+fpcn1fmwRDrtpV/HmbRMEaSJWbHByAYc0SbA0CqHgU
         /RELUzFpqMn7482/9xLb+6xGGoM+d72IFDgPwU74Ehlg0XbAypWaNfPB9txhHkLIuC/0
         w/1T2r6dS/GEnclf3bazB9zp43tojW3llj4f080bdfgubrusI80hfuMis5pyg5vnPunI
         vWAg==
X-Forwarded-Encrypted: i=1; AHgh+RoiV+kAQNaLlyQVsW9NQSTgnH3svKKFRutaJW8vwSqbzNxLJBtnxdWEqmD6629eDWCJ1Bp0FvGYEBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2t5Tty4I5RI2bJ6pxGBJkl4zr8DQUIFOboR79Fi6Uc2PuFTll
	Vt72Mpn9eYc7U9PzVyBpTbhNbSZNmSqv279ZETD9dHxDCIDlupv+ZH3Q
X-Gm-Gg: AR+sD1354xfQFcaB8M8gvVXnpVvZ5v/B9qHHd+pK4BKWvmGA/qv5+qpeAFTIjHS3jnX
	fECrjdW7sl4IWJWRVpKXAOLCE4rcX8m4+S3//plKo93mNjWj8G3bMzVcwr15Xva18tfQ5t7V/Qe
	QAl7sCh/1fLctAArw+fawwdkYre46cYCQ604R3Cd8ovmLHejHhNW6U5G5+mXXpmevZcWKqrK39b
	hmLmOwTL1pTHKdgkXj0phEueG1Fm8LfAGD+oKO9aPodrs427LWyEObxxHRvGTUJEOAZKILTTJEO
	RW0O2IRfBDn3THFGunoViIzpSkIpqE0h+yPmrLLzJJyrGyHtvL6kYB7IAQfSONyd/wXyiIb94Lq
	g84M8WsmLi3nBaBeeMwtVmWo2tZLc46S92+05D6O/517tsP7mfOi44yTWikIAO24JstrLPIXiht
	R/t8DqEC3QrSe650xpDv7Kkqcj2xqPcAsS8Mv1jywZWyBy+vXcgBnqLZ3By+5kbMVIkHM2dCGj/
	fRPY5zkVlO3
X-Received: by 2002:a7b:c38a:0:b0:495:7538:d4ea with SMTP id 5b1f17b1804b1-49959d790ddmr3341015e9.0.1786011730787;
        Thu, 06 Aug 2026 03:22:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542851d6sm58729205e9.12.2026.08.06.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:10 -0700 (PDT)
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
Date: Thu,  6 Aug 2026 11:21:48 +0100
Message-ID: <20260806102206.149110-1-biju.das.jz@bp.renesas.com>
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

