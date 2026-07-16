Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCFE3C3F69
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237754; cv=none; b=qHxsXi8hVwDMK5Z9DCz5TkP0TDbiM5i0BVacK1Zs6IY92pbPOfB+Hy8gp1HpL4Ui/yCCjaVB9n1ovE84cKGcL1cSUIpZY0FFTpDRF2rHoSnWXANnT1WIzQlFrthgxyhKiFghPIrZr2k2wH+LhUZQYRUtB2QGcWSmuI0AyDDjbNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237754; c=relaxed/simple;
	bh=OqSvMIGXqGDRrDVMBFCV9DvkyFArR9V1QJOx9PbTKFw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LEVIoH7U/qAqiE60zQVWfq4WT4BFgOPo8dDA5j/Fb4UW+hzIPaVPLtnrs0GYgOdX/mpADrzZ01Q6CnKHRvngtdybmYXrRgVMI1Q8Wjgp5u5oCg7Q7A7pR+kGm5DRzv4Nh4rHGXFPfJNnyGu/hWAMhi+GqFHbEX05xM4aUPimdrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqS6XzdZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqS6XzdZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47dec32798aso7281479f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 14:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237750; x=1784842550; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uQEvJEB4AGM+jESVICUyrbKRk3wOsaG9/wEamJsJYaI=;
        b=bqS6XzdZRN0sL2QjmaWd7MKiC5tte4/ZuRPnTxywY1zS3nFTco9dUsEdG5ZpltasMc
         Ac2NUvfgSkbhgLw0S75VSOtf3PPxPnEXXnFMzQRUxaTTBOVGhO9THZI2Q8Hoo5fm1tQ5
         I+AgOAc05CSWahhCR9JAd4DlkloS39ORFoHggxzsfjO2k7u7q9DIkY3FmMevhlhbpLHv
         q/sL70Mf5bEQSjj0GLAWFmd5V3y90uPkAeRor1HHDFtW9/iOMI59smb5LavLJ3oGbPtp
         YHbB9leSTkp2pcbdtBhKA5SraS8DXVtkmuYAhbJvbbi5qY6oJEiBvNHrY74pPIjoUExW
         mcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237750; x=1784842550;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uQEvJEB4AGM+jESVICUyrbKRk3wOsaG9/wEamJsJYaI=;
        b=jF8K+z2bTBrmh0lGtYKJe9OMEcf0lQR+CavwHeZRK2/sCGtYtybREkhIa+S0ZxcdSK
         TnfexelmTqyZmVCdJUrwYzJZFpLcyfNOtxowD8nSEb7DLr0hxcu/7yO2ZnQ8ne/wUCT0
         A7fSreCHxikD5bqWvnUCNnHdu5hs0jR4TxjqARbyvb+j7Jd4wisSr8/zrnx2khjpt1qH
         k7WSO/4NYBKiusOwASSud60w0jnE7qfpT37GJhTA/OzwpK2pr0pkjfJPYH9+lTGNtL7M
         scO18gGuOwuzgbwVyPCKp5GllSU8Vyi/+F1kC6+k23xyzc9iS3yEBHEv61kdNFmFS5nc
         4iMA==
X-Gm-Message-State: AOJu0YyBfzt8mDYwRm0Ckmz7QfSC36YGFN1R6grsYRJNLYK4ifMct9rq
	fhchJQgVifNb3Xnd2m4EgsRtYW/yYxxG0SvrPbK1WEqksiB5KqdCr8b7
X-Gm-Gg: AfdE7cne7b/hrsPqPCZOhxxcctvz2PTFezgtGFCeVVGwjo4I1uXiPTSPZdrwdn+oLii
	DhO5QlqPqp8fcugyOKVf1ShMINRaEd9l+dG9Ay/oneet+l/bTeQpNEJaJggZjtQI69/HJiHFaBU
	SXN7ItlCYTlS9DTl9DxFQKovem1zOOFV6BXYjRHTI06SAtdm5RwIwCpyKNNpVU3J6XNtgJywowr
	n2t6N+LbgnB47qh/w4wDlOBKJ3D/QaLSy8m65ba4LWmThYt6CptBHAp/IdvkThd86TSR3GDpnv+
	Ex4AHtcscPl26viT0Tr7JsbeChhLbX8BHUw2mNNeXnZUsYpscBdcKXqf90Z2stnHE9RqU4Cys8r
	wbbAnJwQmFQ38B4ckG6k3s/VQux/YOejwNFh/wRXM5nj6HN8PpCe4CDwXNP+zrxiOh2KCBZtKMH
	KcKU/qF8KD5abl
X-Received: by 2002:a05:6000:26c3:b0:472:8343:7f5e with SMTP id ffacd0b85a97d-47f4884879bmr15868041f8f.5.1784237750230;
        Thu, 16 Jul 2026 14:35:50 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:35:49 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v7 00/13] ZTE zx297520v3 clock bindings and driver
Date: Fri, 17 Jul 2026 00:35:36 +0300
Message-Id: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOy07DMBAF0F+pvCbIHr8yXfEfiIUfM60FbSEpU
 aHqv+OmC0dheUc+1/cqRhoKjWK7uYqBpjKW07EG/7QRaR+OO+pKrlmABCetkt3vBTB9vHdAJms
 kraBPor7+HIjLZW56fXvkgb6+a+H5cRQxjNSl0+FQzttNJPJOZ8vaqIiY2HgITNHKPhvse3YQX
 ApK3Lv2ZTyfhp955KTmsn97JtXJjlQMiZkJnX/ZHUL5eK4fzh0TLJ1qDqoDZEk5aSnZrp1eOMD
 mdHXJM1lDQdfBa2eac8o1Z+4uIJqYAQjz2tmFg745W51HZmkMGYWwdq45L6E5V532PnppuJfJL
 N3tdvsD/qAbBgICAAA=
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5926;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=OqSvMIGXqGDRrDVMBFCV9DvkyFArR9V1QJOx9PbTKFw=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6sx909B2OK3LvHZa2W8bjRks7EvSNHQfCfb
 4VeLVRCzQuJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOrBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKc0RAAjQN2lwgYHAQBZL7rveeOP/TT6H3XslA
 SpTbp3oL3yc/OdWBz5+NpjNtdX3YGASJXrb75RUVjQpvW0iSkbQs016tI859Wv17TVlOaE4M96H
 2ZU4C7GyAfnGrqSLm2frMAOYl+hCBqeVQdpT5JTVnt8W69dUD9wYxAfToGF+0W05/8X9ruj9zAJ
 Z9YASSiz+fwGGnN1+qEAj8Gh0u6tdgteeqqfbn43p1At24SeP7EvTOxZZK6/rdGTj/++/WoksBI
 NXlUci9mhMXvjkRKqkfuK+XFolVqvigvrcwNcgPIVLdCai9OVOQW8jk+2TT9dlCCE5NUju/A4iR
 ZXkLMmnv3d8INocIaP4qSSUSvXaED5i/TS+n8wF4kwpgB52EK1c5vdJ5zn9JEUjK9TGP1OrT28Q
 ALIYwp83WCysDzCIQcvaIHD1TZfhStAuwTPVCzBOIRq3YwKtYkWbpOi/5i/ByBFjJFZn7728TS0
 F74RAYUe8z9usUpUWrPGgrg4BpomGQf2v/1DUZoG/J2WHNTVWKQwQCo3kEI6DV59IevJ75WcBYt
 TSnQTAlSrF63v7jtHRSYFk78t6tSR01XrET7sjr62vVJk/y6KjSjlwilb+lWXWjhLmA8P/Z6mcN
 Y1yUv7mClZWHNeNqbGsxRZXX2Zt2sVVO48o/157vtEuE3QmAmysA=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

I am sending version 7 of my zx297520v3 clock patch. The main change vs 
v6 is the reverse engineering of the PLL input and forward gates in 
top+0x140 and according reduction of the input clocks in the matrix 
binding.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. Afaiu adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v7:

*) Moved DT bindings back to clock/ (Krzysztof)
*) Added a usb-phy child node to top to expose the USB status register
*) Add clock gates that control input of PLL clocks into topcrm and 
forward to matrixcrm. Strip down matrixcrm inputs in the bindings to the 
known clocks in this register
*) Add DDR clocks and resets, arm arch timer clock. They are marked 
critical and tell CCF not to gate off the aforementioned input/forward 
gates
*) Remove syscon from matrixcrm (Krzysztof). The DDR mailbox system is 
on a different controller (soc_sys at 0x140000). ZTE's code merely 
controlled clocks in matrixcrm, which doesn't require syscon on this 
controller.
*) Consistenly use double quotes in bindings and full include paths 
(Krzysztof)

The individual patches call out changes in more detail.

- Link to v6: https://lore.kernel.org/r/20260702-zx29clk-v6-0-377b704f80c4@gmail.com

Changes in v6:
*) Use MFD for all 3 controllers - I hope both Conor and Philipp will 
agree. I kept top and matrix bindings in soc/zte and lsp in clock/ 
though.

*) Clean up issues found by Sashiko. I pointed them out in the individual 
patches. They are localized fixes and don't affect the overall design

*)small code consistency: Changed "zx297520v3_lsp" to use "-" , "rst" in 
driver names to "reset"

Changes in v5:
*) Use MFD instead of aux bus for top and matrix clocks
*) Move top and matrix bindings to soc/zte
*) Give USB PHY its own resets
*) Other localized changes are noted in the individual patches
- Link to v4: https://lore.kernel.org/r/20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com

Changes in v4:
*) Use syscon and regmap instead of raw IO
*) Move reset to its own driver on the aux bus, but keep reset and clk 
in the same binding as it matches the way the hardware works
*) Go back to having matrixclk in its own device because syscon deals 
poorly with multi io reg devices. List all PLL outputs from topclk as 
inputs to matrixclk
*) Some more hardware research: Figure out the parents of the 4 possible
GPIO clock outputs and declare them in the driver. They are unused on 
the hardware I have, but they show that all PLLs can be used.

- Link to v3: https://lore.kernel.org/r/20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com

Changes in v3:
Model top and matrix clocks as one device
Add PLL driver
Fixed a few issues found by Sashiko: register lock, some missing devm_, 
error handling

v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

---
Stefan Dösinger (13):
      dt-bindings: phy: Add zx297520v3 USB phy documentation
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
      mfd: zx297520v3: Add a clock and reset MFD driver
      clk: zte: Add Clock registration infrastructure
      clk: zte: Add regmap based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks
      reset: zte: Add a zx297520v3 reset driver
      ARM: dts: zte: Declare zx297520v3 CRM device nodes

 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      |  101 ++
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   |   91 ++
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      |  123 +++
 .../bindings/phy/zte,zx297520v3-usb-phy.yaml       |   96 ++
 MAINTAINERS                                        |   10 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |   92 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zte/Kconfig                            |   27 +
 drivers/clk/zte/Makefile                           |    6 +
 drivers/clk/zte/clk-regmap.c                       |  246 +++++
 drivers/clk/zte/clk-zx.c                           |  155 +++
 drivers/clk/zte/clk-zx.h                           |   90 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 1045 ++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           |  520 ++++++++++
 drivers/reset/Kconfig                              |   10 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-zte-zx297520v3.c               |  237 +++++
 drivers/soc/Kconfig                                |    1 +
 drivers/soc/Makefile                               |    1 +
 drivers/soc/zte/Kconfig                            |   20 +
 drivers/soc/zte/Makefile                           |    3 +
 drivers/soc/zte/zx297520v3-crm.c                   |   99 ++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  144 +++
 include/dt-bindings/phy/phy-zte-zx297520v3-usb.h   |   12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   63 ++
 26 files changed, 3187 insertions(+), 8 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

