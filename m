Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7D7368D6F
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544388; cv=none; b=NQXxDCaZgpY7wWUhQNRUP+npsKcrnoemeeYt/qyrCfk1bsV0Nz3rjfjhvDTKLJ+Mxh4vP5bJ40B2OK+E/x0pst7cON4cP0f9WAXKxiMNE0Lb1qhk4pRql8leH1MpqYlQAlZoHKiv6yajhvMuAtmBr9rqypk9coR/Ckgbsuvv62E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544388; c=relaxed/simple;
	bh=RbBcvng6CddAR2Y9GGDoRWyuM/ruQ2W3muwnGr8OInA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H4J4YdPkZQUtfyKcLUvPjbkgBwmG0twfbYP9oReH/JwFFcOGKJQzGb3XEPSug8t45O8LF35I+AAVRgsMYBqimzxY1SkpYi/vC8zrB00tbIFqG21llvmesMjWV90e1xV32/h+thVE6bnSV02avZKpGGd7K24euKNWaKBnK6F6Yec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pk5KZwS0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pk5KZwS0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b966dd74so6722285e9.3
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 07:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544385; x=1787149185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwr53rVuSGmUd6A8uHvMZV2frC8kbj83S7dbcomjXGE=;
        b=pk5KZwS0Ur1iQwvsd/dy95aV+Zbh1n2mGVnPJ6vpAis0mA3vSCOh8FLCvCjrTyC+NC
         yov6uNKekaXskGMgV80Zok2Y5e5wyEWhDduw0xygpaOLjAGqi1jSxmC4zmLmNmGrlvtk
         A1WsrOg32LMBl4kfrCeU4GvZeOO7P3FWdwHi2SXB8PlYW5khgSZTkLp6OuxC6m3uI7VB
         1Bn5qGFumANjbAhIjHGxl8sNFxpbP8Kl7rR2Wy/E3tVzXNRvLU+WgqUGKCeZEJ/V46A2
         PE0ws+E2SSjbJCVNiXs692M6PJ6i5+4WpTTc85jDuw2UwN2+upe5C1PUJUSvvgdrKXT4
         /baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544385; x=1787149185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwr53rVuSGmUd6A8uHvMZV2frC8kbj83S7dbcomjXGE=;
        b=Tpk/q3uBmXqNxcvcwOmpyVoK6nfyIhBGAKHNg6I0G15uW5MBsIzRUcgCJ1r927IC0a
         VQXYi4fPzxK3RnVlzO6FHGttGRdeHMPfX06NHisbh8rdDHae4aSwvbEECm8Y1vt491k7
         H/kByPEI/9HK9BZj0ImSgb1pfRAAbUmTRIkuyeH5dEUbFtYl968b4cfKyj03QJAPw9R7
         MF57WATiFKbt6vZ1EEnqp7rPn82//dzrz9+iI5iyk+RFNrECeLLA/VMskLNhP8m+vwaD
         R2NOIU3xPg3Fn2k8fY+rvTKYCP2nB8z9VK6trFfq1ECEKd56jYGlcH98VodJSi1zyyhl
         k1zw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+MHxIDTQuA5hG8vaEwJXny+yhoybIkwQKKZ4fFUS7JCjMlzVwb6042htteHIc8NywfoxOdNhI/RA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym07qNMsvJsHXfrHsV1NNXK4S5Hd9BzIsMkTcKyDgrEIOq5u48
	syQYvHNvsEvOzcqEG1VeUHb3cOS1vEQCpFp+2XAaNenGBMVkR6zSRKza
X-Gm-Gg: AR+sD11KiYV0MD/xODCQqBwNdk6eQILk0vZoDrRzlfRqXEw6DL3jU9VLz7K6WTsQder
	+isuwYkj1+3yyBGfGROTbtV7FzwKBHPlpfVDuMMqs0HpqjllDF+D5zBbQWYxL4gLF473R++Bk+H
	gSue6skrBGHiOu7UEv8wvN9uU3Dz3gztWiNB065Pqw2wHGjKKs+aRsEWtw7eA68ZUID7ytZ0toF
	OTzjMnVQpfU+sJhx3Id0gQzBniR9wtNZfShdRWtk5/csQXRvqJsjix9QfJlPfitee0K8+ojXI1G
	uhFYMw9VamrB3qWH4cFXiOoFeRLhDoeSDAtWpDvASVOXk++j86KhQvN+9M8pOkg/YUDfeTKlABZ
	cOLq6XY9WgiR08Qrc8Z52FqW/QDUY2FnL1AD9qPfnXmWmclp7Agh1r7QzQokkCTY2zXCWa/jnjM
	2HyW5HfUzvmZKtFe8mQ+4Vq8/CswtGJfHEcmDDweIQwpgq4wO87LK3gRb3VSAm5Tm1Tlu4KtiQL
	3LT3EZ9kXdxqA==
X-Received: by 2002:a05:600c:a41:b0:495:6134:6d61 with SMTP id 5b1f17b1804b1-4997c13be45mr72078085e9.19.1786544384949;
        Wed, 12 Aug 2026 07:19:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:44 -0700 (PDT)
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
Subject: [PATCH v7 0/9] Add RZ/G3L USB2.0 host support
Date: Wed, 12 Aug 2026 15:19:18 +0100
Message-ID: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
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
  Patch #6,#7,#8,#9 - Renesas SoC

This patch series has functional dependency on [1]
[1] https://lore.kernel.org/all/20260812115010.108322-1-biju.das.jz@bp.renesas.com/

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

Biju Das (9):
  regulator: renesas-usb-vbus-regulator: Rename platform device to
    rzg2l-vbus-regulator
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support
  arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
  arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 Host support
  arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 function
    support

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  41 ++++-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 142 ++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  54 +++++++
 .../regulator/renesas-usb-vbus-regulator.c    |  75 ++++++++-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 109 +++++++++++---
 5 files changed, 399 insertions(+), 22 deletions(-)

-- 
2.43.0

