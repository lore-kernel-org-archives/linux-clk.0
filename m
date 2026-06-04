Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F639477E42;
	Thu,  4 Jun 2026 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579594; cv=none; b=Ka7JEpopTp1KdzCBuuolGSWN3tDUS6lDYbeuIkjsEEaeb7wYwri0+7FkFJPuA1YsJO0mE8YwDR0azFKW2PJ85KTqyb75lLvsZg5LDlRq9h2naJnS14gWwDHmPbO5soAFX2pGMTgky+c1atQI0sMWiPqCelqsPpYhWt6ut+mB6Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579594; c=relaxed/simple;
	bh=90uyPqisNZoU8A6IH0D3SzXIa4ZRYXzojw9lHn6QYjU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WN3riMlv4smsZ8S4WXiDH9w1IGE6fGRCftIeWtf8QbzSahmVynfRE0W7elhf3mZgX7r6uy4QNEueGOoo6ASnljnf6WyrWNH+iGqYfBI/UgXjew9NvC+8PC0E27oBYEG9/cnU8H2HlTx5WJe4GYrDFbZyCsVZ94izR2IxOuVn1Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bun5sWdS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bun5sWdS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 899B74E405EF;
	Thu,  4 Jun 2026 13:26:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C4465FEF7;
	Thu,  4 Jun 2026 13:26:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FDCD106A18F4;
	Thu,  4 Jun 2026 15:26:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780579589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Lfo4aG0YGR0XhdxkFKUY6E1Xy7eYelB+IUHejTZ9c88=;
	b=bun5sWdS70IQ6m1uhu7e1tA4aLIlxudxi1x8+LlY00990dbsUPja0xLHadKHR2zbVzLr7h
	N1/Dvp9ZxiVj9GdFCqHMnx0qD5P9L0ywjo1eVIOIRd+ZNtzkOUvnm+7qmglM/Q+1Qu7rdP
	ORXyaa9Rwb1PKvCe6m9EGdeywZSq0ohHdBP9bGaJt3tJ+4YhZeYuhvC+j1wwz8YK2e5c84
	d1S9VrZnFvwgJgFCQDCQZkvN5gqvGkwfh1qq+oWnKwsW0KUfLySfPeDn5xnw8e77evecNG
	F8Hh/G7PpaZtoKQkwks2VZrZQZfyY5x6XhcHuOOINZICYg1+vgTNDTPFuQ6hEQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v8 0/9] Add clock and reset support for Mobileye EyeQ7H
Date: Thu, 04 Jun 2026 15:26:08 +0200
Message-Id: <20260604-clk-eyeq7-v8-0-53f618174cf6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPB8IWoC/23SS27CMBAG4Ksgr2vkGb8SVr1H1YUfk2IVkpKkU
 RHi7h1ALaHpcmx/vzxjn8RAfaFBbFYn0dNUhtK1XFRPK5G2oX0jWTLXAhVaVSkv0+5d0pEOXjZ
 1chSMzqArwec/emrK1zXr5ZXrbRnGrj9eoye4rN5SaqVnKRNIJXVjFZposyN8jl037kq7Tt1eX
 HIm/LWAaOYW2VbgjcnAu7leWv1jnQJ4sPpiKeYYfFSg9dKau9XqwRq2dXYx15mvTWlp7czCfGq
 TZesal0PAhNr5pXV3yx3PrWOrrFEpEVRN/GdWfmbxwXq2YEJ2CZNF+NPv+faAPR0++Q+Mt1cUM
 QwkeX9fxs1q8muQfdJ8+PwNGSF+MDgCAAA=
X-Change-ID: 20250807-clk-eyeq7-f9c6ea43d138
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sari Khoury <sari.khoury@mobileye.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

This patchset brings the support of the Other Logic Blocks (OLB)
found in the first Mobileye SoC based on the RISC-V architecture, the
EyeQ7H. Despite the change from MIPS to RISC-V, the Other Logic Blocks
provide similar clock and reset functions to the controllers of the
chip. This series introduces the device tree bindings of the SoC and
the necessary changes to the clock and reset eyeq drivers.

Since this series affects drivers used on Mobileye MIPS SoCs, mainly
clk-eyeq, I tested that it does not introduce regressions on EyeQ5,
EyeQ6H, and EyeQ6Lplus evaluation boards.
    
In detail, the first patch adds the dt-bindings yaml and headers for
the EyeQ7H OLB.

Patch 2 adds the compatible entries to the reset-eyeq driver, and the
necessary changes for the reset domains found in the EyeQ7H OLB.

Patches 3 and 4 rework the handling of parent clocks in
__clk_hw_register_fixed_factor() to make it identical to other clock types
like divider or gate. This allows simplifying the registration functions
built on top of the now exported __clk_hw_register_fixed_factor(). A
new clk_hw_register_fixed_factor_pdata() is added that will be used in
clk-eyeq later in the series.

Patch 5 renames the defines and functions related to the PLL with the
PLL type fracg, to make room for the other types of PLL found the in
EyeQ7H OLB.

Patch 6 introduces a new generic type of clock structure that can
represents all clocks found in OLB. Then patch 7 and 8 converts all
clocks defined in the driver to the new struct eqc_clock and remove all
the previous separate clocks structures.

Patch 9 adds the list of clocks as match data for the 14 OLB present
in the EyeQ7H SoC, and the functions needed to probe the two PLL types
found in the chip.

This series is based on v7.1-rc3 as all the prerequisites have been
merged. It also applies cleanly on the clk-next branch.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v8:
- reset-eyeq: Fixed the offsets in the comment for EyeQ7H OLB (no code change).
- clk: fixed-factor: Rework initialization with parent clocks
  Added Reviewed-by tag from Brian Masney (Thanks!)
- clk-eyeq: Added details about post-divisor for EyeQ7H PLL and that
  EyeQ SoC are 64 bits.
- Link to v7: https://patch.msgid.link/20260522-clk-eyeq7-v7-0-14ad6c2c5213@bootlin.com

Changes in v7:
- Fixed DDR OLB reset controller type (the comment and sashiko were right)
  and the comment for the reset offsets for west OLB in reset-eyeq.
- Made sure the parent clock is valid before accessing it
  in clk_factor_determine_rate().
- Fixed error paths mistakenly returning IS_ERR(ret) instead of PTR_ERR(ret)
  in clk-eyeq.
- Declared the DDR OLB dividers as read-only.
- Ensured that the mult and div computed in eqc_pll_parse_fracg() fit in 32 bits.
- Link to v6: https://patch.msgid.link/20260512-clk-eyeq7-v6-0-0540cce18fb2@bootlin.com

Changes in v6:
- Rebased on v7.1-rc3.
- Dropped the MAINTAINER update for now, this will go with the SoC series.
- Link to v5: https://lore.kernel.org/r/20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com

Changes in v5:
- Rebased in v7.0-rc1 + version 4 of eyeq6plus series.
- Remove an superfluous whitespace and tidy up macros in clk-provider.h.
- Link to v4: https://lore.kernel.org/r/20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com

Changes in v4:
- Rebased on v7.0-rc1 + version 3 of eyeq6plus series.
- Link to v3: https://lore.kernel.org/r/20260114-clk-eyeq7-v3-0-8ebdba7b0133@bootlin.com

Changes in v3:
- Fix eyeq7h-olb DT bindings following Krzysztof review.
- Link to v2: https://lore.kernel.org/r/20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com

Changes in v2:
- Move the dt-bindings to their own files and sort the compatibles.
- Reorder the changes in reset-eyeq and make the register access more
  readable.
- Drop the validity check on even divider. Unnecessary since it is
  always called from a clock .set_rate().
- Drop the parameters check on divider registration. Will be posted
  separately.
- Switch to a new generic struct for describing the clocks.
- Add an entry to MAINTAINERS.
- Link to v1: https://lore.kernel.org/r/20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com

To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Benoît Monin <benoit.monin@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

---
Benoît Monin (9):
      dt-bindings: soc: mobileye: Add EyeQ7H OLB
      reset: eyeq: Add EyeQ7H compatibles
      clk: fixed-factor: Rework initialization with parent clocks
      clk: fixed-factor: Export __clk_hw_register_fixed_factor()
      clk: eyeq: Prefix the PLL registers with the PLL type
      clk: eyeq: Introduce a generic clock type
      clk: eyeq: Convert clocks declaration to eqc_clock
      clk: eyeq: Drop PLL, dividers, and fixed factors structs
      clk: eyeq: Add EyeQ7H compatibles

 .../bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml |  192 +++
 drivers/clk/clk-eyeq.c                             | 1268 +++++++++++++-------
 drivers/clk/clk-fixed-factor.c                     |   78 +-
 drivers/reset/reset-eyeq.c                         |  271 ++++-
 include/dt-bindings/clock/mobileye,eyeq7h-clk.h    |  119 ++
 include/linux/clk-provider.h                       |   56 +-
 6 files changed, 1487 insertions(+), 497 deletions(-)
---
base-commit: bb1459368dd795c43380057523f571d5eb0ddded
change-id: 20250807-clk-eyeq7-f9c6ea43d138

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

