Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADC42F1FC3
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219694; cv=none; b=rawryedUIbt1CCYPpI1EJ/OAvYK49ReMyLMmt8BIkSxOMLNAYWbuU72fjkteUExsLmH6mIK10P2uaJiNtNsmk1yEPXqhMkWUZFu5ubunqCkO66DhrVFIjQdfJCEr9cae5Y21q7gA+ZGouwGC8ntDZek9NwqjUpJ79/uRndElans=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219694; c=relaxed/simple;
	bh=/DhO7zFg6yyGsG3ef/ZLgZH2m8TW5PiW9nEKXC5/Ofo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ey8ZOZN5P6XK4v63+ORNb80tUTXziP8V6bmD5JxS+J6rRX/sCm2srFsbL1/ALhVCnUik+IDH2tZAN0+D5QCzgA1mCKDQrg5t7QVO8lU8HaOZIBCBfR8NtOYEYExixMSKF3CZIxP/gXj+4l0rqxf1oaeEi/MsNEuTsivCfHoz9us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPDQQ9l0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPDQQ9l0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49954b88fffso20576065e9.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219691; x=1787824491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgbKi+IjJPrk4GtW2Ufu1ND7MPHdT58xQ0Q0aiwlQFo=;
        b=aPDQQ9l0gcZEdYP7a9SyH8sQI622lYveiPuspeQNQP2tC/KvpmzGtM/n//JnVQHkIN
         OobvH4WBWtLS7Z9v7pOIPzWRJlMBee60GdfSTkdOJuC1lSc0Dw1nYJm4p7voOUA75Mwp
         OMnxm+Omj7PzLgBloPraBxVsF4p3gvr9jbh2FbmNnIV+FvGZsty+f+GK7IOcHoidSfyy
         U8Kkaa0YSpJAaCqQCJsypZCusQqj5fh7l9hePV4DHWozvDSnDvHbLT6wsm1u/tygBnSI
         mUIgbI3/wWI1R/vCChwNdStq2fuzTF+Y7Yo5AnVdT9Q8zOZHJKuagE6d1ySxG5XsNkcN
         bZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219691; x=1787824491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgbKi+IjJPrk4GtW2Ufu1ND7MPHdT58xQ0Q0aiwlQFo=;
        b=LhmRpKiLdfynzWu12syInCmU6ufDL6mJmHna3xlU9z6k6BByEBIfh0hHEK5S65cwHL
         OZFZmUlJHK7RQuQ6KYzDJNefXYDdSEETV+mqqw4hcTXTy8fhX9HMxyZbe6PgdfDEwStC
         oYvk3O2+739YlrDBxl95tWcVp5ELoQgJU76n/ZHgR616wpf8nMZzYk1FYkRVFIfaFiFr
         DlAsx9XKpDunV7xhGaKUZeeTkythknBAV9z7JXFyOWubai8IRZBOpIpMLmoHN2+YvI1k
         fRDEan7CkLyPBw6j09lRV7UXf9otD2kCYgSduqiCuMRtPbybzNpq8hgGrnyB+Na9d0G7
         sC6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpCfLmR9dU266+2F/3XC0O9zH/6/Vt3gyLN8FgzDeIHMif4OsCbfWcE6ILqf/JYCGVmePrI/89QZ3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXKKbJMNSPtbRZaEqkpBQixeUmaA0cJtVoA2rFmxK0K9U30XeS
	DBoWGOjNZPeBfdkyfwexJaNcl3kUPcJruQteRYkmp4sQiL4TPZtLy5IFIsv9vw==
X-Gm-Gg: AR+sD10AU+mVKZJNQ5vj3xFTgj5iEuQwoIgnMH0enm9dplPMqedYi+sIHFynM3GNwoF
	OHm2uOMjVnmgqbq+lK/GaOZUEzmER9vvfrRGC2meMogHyxj43SMHF6lI6QMKHUAyPKE6qOMyOyq
	+udKUKpLduMwRCy2JEPTTHXLA1WewC6+gZqGz90zasRW/EETbkSsGGqsjDaoDVpg5YxXu2a+U1j
	4ibfsnVUB987Xx5VdxdByaiWQKZD0C1Rb3zvHroBtHtUoOQu8swxsyVCE/8VlcmK7Tz6GIsYnim
	hr55X1SGdn8KTlBIxkTtj8zfRS0FJF6KqSw70G4E03ttUbgXrF7Hyjo30gMQDMmOi2CeyLuy19/
	oltbkeOsZ5/GjWByj9+liQzQzi56BCTJYuNOufDKzXKlfMAm0RAwW1Zg6Y+jRK6L1C11/kUvBYw
	qma5K8P9t0MgZ9IAC4S2aU5fw92OHxxeYm+SktVWLbYTS05ayqZ4GzTcZ6vS/thdy9xc64
X-Received: by 2002:a05:600c:34d1:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499aa14a6a6mr197783335e9.3.1787219691320;
        Thu, 20 Aug 2026 02:54:51 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm172069675e9.11.2026.08.20.02.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:54:51 -0700 (PDT)
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
Subject: [PATCH v8 0/5] Add RZ/G3L USB2.0 host support
Date: Thu, 20 Aug 2026 10:54:38 +0100
Message-ID: <20260820095448.20930-1-biju.das.jz@bp.renesas.com>
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

This patch series has functional dependency on [1]
[1] https://lore.kernel.org/all/20260819191325.217809-1-biju.das.jz@bp.renesas.com/

v7->v8:
 * Dropped SoC dtsi patches and will post later.
 * Collected tags for regulator driver and binding.
 * Avoided code duplication by moving devm_add_action_or_reset() to
   rzg2l_usbphy_ctrl_pwrrdy_init().
v6->v7:
 * Dropped PHY subsystem patches as it is accepted.
 * Merged patch series [2] to here
 * Collected the tags.
 * Added additionalProperties: false in regulators node.
 * Updated commit header of patch#6
 * Moved the host enable patch.
 * dr_mode changed to 'host' as function is not enabled yet.
 * Updated commit description for patch#9
 * Updated dr_mode = "host" to "otg" in {e,o}hci0 device nodes.
 [2] https://lore.kernel.org/all/20260707145135.247565-1-biju.das.jz@bp.renesas.com/#t
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

Biju Das (5):
  regulator: renesas-usb-vbus-regulator: Rename platform device to
    rzg2l-vbus-regulator
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  41 ++++++-
 .../regulator/renesas-usb-vbus-regulator.c    |  75 ++++++++++++-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 105 ++++++++++++++----
 3 files changed, 197 insertions(+), 24 deletions(-)

-- 
2.43.0

