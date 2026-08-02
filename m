Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8282F1FED
	for <linux-clk@vger.kernel.org>; Sun,  2 Aug 2026 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702846; cv=none; b=RN8+hQHRONyDBEssejzo9nrBF2DU2KiIELqGBSxY1VQzChmU4NEShKXFcjk0aoz5bEwYVGAeM1Y1hdPoUmA1sDUwYirNm5fdxNyVCZcKp8Kn971UiOIJ8uTDQRoN9er9Ao/AJzNY6ckQZjvBGXG8zaVJRxA32KgX10DUTjBYyt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702846; c=relaxed/simple;
	bh=ytkVlGWPC4ZaFYhCIySoL2e+Zt6OCP0DIB5EwOX97uk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AvYIZPYrr1uOFVEv6tlGPBO8mOSofBGDjftqAiZdLANY592aIN7qzjL46PruVDmXvfmsif4W9HnKzOn1JsxLdsZqD2bBQTT70BY4FODKk9AA1+ZdTQAOqvFcmCQy/bgue0nh9SjHpF4ym0lOZkM7E5yWERXpEDejfzSp0P/2BDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sn33F1zy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sn33F1zy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49558ce01afso11012595e9.1
        for <linux-clk@vger.kernel.org>; Sun, 02 Aug 2026 13:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702842; x=1786307642; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tXBqjlY2f6bYpFJSuXlfBIwEMNbQe6Xjdd649Bgo4nA=;
        b=sn33F1zyzIVqsQKNVwfMFhHVfY+yEcHTrOlIhaNrGvuY3nWKcKeCl5DtNmfPGtvwir
         tGfj1ftFvScEjMrWxjLUaeSZBJJRFc1etojoQYFlB76r1s3T5Yn9HH6pdfkFPZg06lAj
         BsSjoddOA2Me62qc/d9BU9r+oHcoMF6M8NZK2cCP5tB78RpMSHJ9dMoXC8SHOYGTe02y
         FFByFx0T0OErlrc+KR1zeHE/3kTIGudwkOfGhcxF1HuSp4Mslaon7dqjPy/KIfH9DHvz
         dYcX86xaeRvSRnYoTtsCXv0VOPdzDAcBry17EScXHDJBn3F0w1Qweu3fy6BBF+MPMRIM
         tXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702842; x=1786307642;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tXBqjlY2f6bYpFJSuXlfBIwEMNbQe6Xjdd649Bgo4nA=;
        b=MkxVjV49xRiZnTRDLGgI89ynTgVQMVq2utFXemrowXges6COq+r+fW6xLg53y6GXqg
         ngdr5zoDpzxy/jRVB4xrE695Km6iqJ7y1DJg8+86+tbhNEZ1Lq/lGRCD+eNTgVwnyx0x
         yNKO136xmvopL/jFENPadsjqxpREy1qy+2j4fUpMGIAbJI66vDFGz/n1foTOpLUJhBti
         /9FPSTog3RrcvaPnCFAFPt1zc5s9IuBKF0ZUaYOuHBjfutiOTlDddiuisNiZylYplwE6
         Zy1JRhnv6D/BqHF0WpeGd8VMJXLqZYZCXmXq2rIojHEtLJm799pL7Nq7WtgNN5Cdh98c
         VYJA==
X-Gm-Message-State: AOJu0YybS6uSrIEH8B0CacNyrQTTEip87XZVLPtMuU6rd9wWq/CC/mYY
	/qREOG2/DQbp5nkuxIsNykhKec6Ps3GyCCe5FrZYY4VNE4wjbNcnwYxT
X-Gm-Gg: AR+sD13FunS8k1S3AFZWy5pbVbaHhGqjyKHWev1klTZU8hsfIYIvCmBshhBnHV6bqEP
	h+JYnGDm7xMAaJTisABDUqlNel+zbgQZYKrvhi8aRVIdVt7YvYbzseoPxJD92/A1Yfxdy5DYQ6s
	FyIx8MMGSsqQ3HaQOiUn5aVR7PeLkTFR3b+3uAAtuuBKZDlPQyi5qTWWNdUR/mZQCy8XdiSilHT
	6Q8PnpyFGst9ElhwbmvtJJJWU0glcefoXnlfxz2F5l+0zlCDAgQTnUmWL4cuSQiCccm5JLhO5IR
	iOSk7AOI1VdfBpzAbK2EUIvEs0ciXg4Yhgi214F+w+tbbcIrIXSVC1UqE/h9RyUv8Xkw1TXaau7
	+dpBQLFviGjHobmn8DRJRHVHlSp/b1gqAjCYsp01oi2ozTInUhNhDA7r+0KNmQi+1sDEvyga+J0
	BtFF0L/wyNWIAiRsLeLiDrV5my8ZkIwR6DqP5HSnnAW6DlZHodcQm8pI/turPNwsvDvPfS6yH+S
	l+GRFqQhSg=
X-Received: by 2002:a05:600c:811b:b0:495:6934:414c with SMTP id 5b1f17b1804b1-4980c696c7emr154090745e9.19.1785702842254;
        Sun, 02 Aug 2026 13:34:02 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:00 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v9 00/12] ZTE zx297520v3 clock bindings and driver
Date: Sun, 02 Aug 2026 23:33:32 +0300
Message-Id: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQy07DMBAF0F+pvCbIM3b86Ir/QCz8mGkt+oCkR
 IWq/47bLhzCciyf6zu+iJGGQqNYry5ioKmM5Xiog39aibQNhw11JddZoEQje5Ddzxl92r13SDo
 rTwrQJVFvfwzE5XxPen17zAN9ftXA0+NQxDBSl477fTmtV5HIGpV7Vhqi94m1xcAUe+my9s6xw
 WBSAHHL2pbxdBy+7yUnuIf96zNBJzuCGBIzkzf2ZbMPZfdcH7xnTDh30BxWh54l5aSk5H7p1My
 hb05VlyxTrymoWnjpdHMGTHP65oL3OmZE8nnp+plD11xfnfXMUmvS4HHpTHNWYnOmOmVttFKzk
 0kvnZ05sM3Z6rR0GiBxYmWWzs0czpy79Qwgbay/CfnPftfr9RdFFtOHcgIAAA==
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7558;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ytkVlGWPC4ZaFYhCIySoL2e+Zt6OCP0DIB5EwOX97uk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6modbMmWTEjfJLS3Z6rWqgIE4+olimQZbU63
 SKtgKVYwimJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pqBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKAphAApm5Me2guqbkgXD/SWGOTxtNV/dl2exj
 Jeqdx6EpnTWGJwnww9aM9S7eL0OtPfNKAZarMRAKhMhqNPB/FLr5ApZSlGhWG2ZC7eaBLnmcbpt
 VJC3+YWYPzqLt+87KUD+qbYJgm2FnLqDkG900TWF7TXJeCm7gn/5snqFpxc6epqiyggr1YJ5SbA
 Rx5YelP9xjPSlItbiIT3yCrt33LD8A7yqb5czo80VdHLGyx8ogkNBQSUK2XVXpK37uvo6SvWs8y
 pCVEOLBxoBJJ81uku2HXLrNNwcR8UmrbR7RZSz9VfhEw1c/4uQZl/7ZbIRyugm0FoebYD33quxo
 pDEiT1ocU/M4zroec8ehe4a0b/LAeKcvn8t2zBDa+6RTzK1KY8MqKuXBfSuS7B12/Iv0wZ5S0m3
 Ne0LNFFOH7BaqSzz5REOR1TXL05Sh98G1ePeV6AiMczrv6J/cJ4dZ9VxV4eOz78wCQ8WNT3ZNom
 gNwWeZ8q8XR+ucu3FHU2i9hSYRGFzAcCVCCPR6yR84l3VA/adE6PdDYySgVxOshcknUY9yaI37v
 QNtYr4vpIs5NOFHSCX5FxMbwwUyFnWZ3H34JELxiDrsx/owPhBr9ivZgNkZg+uhaF1n3ULK2nVb
 QmAueSe4wRQEhk6er4ExNgtkMBUf/lO1VyuNaxdjwxDWxV71dexI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

I am sending version 9 of my zx297520v3 clock patch. The main change vs 
v8 is that the clock driver uses parent_data.hw instead of global names 
for parent matching.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. AFAIU adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Merge dependencies: The binding patches (1, 2, 3) and DT patch (12) in 
order. The MFD parent (4) is independent, although changing the ordering 
likely needs trivial adjustments in MAINTAINERS. The clock driver 
patches depend on the headers added by 1-3 and apply in order 
(5-10). Reset needs headers (1-3), but it is independent of clock.

Though in practice mfd, clock and reset drivers are dead code until 
patch 12 adds the DT nodes. Clock and reset drivers won't be 
instantiated without the MFD parent.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v9:
*) Use parent_data in the clock driver instead of parent_names. That 
required some infrastructure to keep track of registered clocks rather 
than devm-and-forget. A nice side effect is that it uncovered a missing 
top->matrix clock link. (Brian)

*) Remove the self-referencing USB PHY reset in topcrm (Krzysztof)

*) (Hopefully) get unevaluatedProperties and additionalProperties right 
in topcrm (Krzysztof)

*) GMAC and SDIO on the matrixcrm controller need topcrm's ahb clock as 
parent. It is added to Matrix's binding and fixed in the driver

*) LSP reset and pclk handling moved from clock child to mfd parent 
driver

- Link to v8: https://lore.kernel.org/r/20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com

Changes in v8:
*) Put #phy-cells into topcrm. The mfd child will have to assign itself 
the MFD parent's of_node to satisfy the check in phy-core.c's
__of_phy_provider_register().

*) Added another register to matrixclk that controls in-controller 
distribution gates. No functional change, but it nicely confirms the 
top->matrix interface

*) Changed clock indices to start at 0, adjusted driver to not use 0 as 
"do not export" marker.

*) Rename DT fixed clock nodes from osc26m -> clock-26m and osc32k -> 
clock-32k

*) Fixed more issues pointed out by Sashiko

- Link to v7: https://lore.kernel.org/r/20260717-zx29clk-v7-0-408411cfcf36@gmail.com

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
*) Consistently use double quotes in bindings and full include paths 
(Krzysztof)

The individual patches call out changes in more detail.

- Link to v6: https://lore.kernel.org/r/20260702-zx29clk-v6-0-377b704f80c4@gmail.com

Changes in v6:
*) Use MFD for all 3 controllers - I hope both Conor and Philipp will 
agree. I kept top and matrix bindings in soc/zte and lsp in clock/ 
though.

*) Clean up issues found by Sashiko. I pointed them out in the individual 
patches. They are localized fixes and don't affect the overall design

*) Small code consistency: Changed "zx297520v3_lsp" to use "-" , "rst" 
in driver names to "reset"

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
Stefan Dösinger (12):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
      mfd: zx297520v3: Add a clock and reset MFD driver
      clk: zte: Add Clock registration infrastructure
      clk: zte: Add regmap-based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks
      reset: zte: Add a zx297520v3 reset driver
      ARM: dts: zte: Declare zx297520v3 CRM device nodes

 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      |  101 ++
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   |   98 ++
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      |  122 ++
 MAINTAINERS                                        |    9 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |   81 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zte/Kconfig                            |   28 +
 drivers/clk/zte/Makefile                           |    6 +
 drivers/clk/zte/clk-regmap.c                       |  237 +++
 drivers/clk/zte/clk-zx.c                           |  189 +++
 drivers/clk/zte/clk-zx.h                           |  142 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 1571 ++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           |  580 ++++++++
 drivers/mfd/Kconfig                                |   11 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/zte-zx297520v3-crm.c                   |  117 ++
 drivers/reset/Kconfig                              |   13 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-zte-zx297520v3.c               |  236 +++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  144 ++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |   12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   61 +
 23 files changed, 3755 insertions(+), 8 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

