Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B633B9608
	for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 20:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540032; cv=none; b=CGgcv4u0uiavanQhjMVekypvn7hP+Xk2TYxtBiE6H6c+0h6YLHZhGGPJF5NlcNKqYG0zuR/J+UFDEYNwOCptisz+kFbGFFRH0UU/2Z38FHcSOOcrYevfBvmfdbd68u+TDm5RIL9FLQ2hErhV+TuSEMbWVWFSB0OaeksHDFf3C4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540032; c=relaxed/simple;
	bh=mj7t87UDSwNUYjV80t4K9BuJ0rKYlqWFxDtlX3wjr5M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BX5tvYzV1R476Qugvpl5xVF9jK5gApPBzujWWzOostYR1FQAb1o60CefJYwjbPMzu7SYH6FlTOvXrWbej/kK17hHDiRjPCKd6PICEoWU1tzdDYl4t6dsSgH/Oa5fHL7QBYd35lWTb4uvc5XIYhA+89cyyBVAALSiWKDBGzf1zjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+/hzHIW; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+/hzHIW"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso1394504f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 13:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540028; x=1791144828; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xkjyTn0l3c0/b7Ekfpo5HVRikXcGMrSgvq66ads6B6c=;
        b=V+/hzHIWNrB4DBRfxqppr58slzO9dPC+9eNCTXioHhtHuQD5tGWLCXjBV+vls5Vl3R
         rzNJGrpK8JjQd/SNlrKKxUOVUFeMivvMuDCzhSKf1o9sLS0RHWjekgqfw40+BY0RYPk+
         FZ0fNaB1EOgOVwSXWYkEeXq8ez5u08yH7Te8xskQeD63Ut+UWAXlXWhD1FCXP9akDWIi
         XnBq49wytCpxhLuWzcFSax9BEHTjVTcnivLEaKzCLuyb1gNdC6h/4Ss4RFEFml/WltoD
         LLLOpDTGWpDbHt9QAZE2kxLnsQ12OgaUxhP5hYPlLIHuUZSHVyqTYA2hbTJiCB9PNrWM
         P0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540028; x=1791144828;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xkjyTn0l3c0/b7Ekfpo5HVRikXcGMrSgvq66ads6B6c=;
        b=swIUmRxlafyIfsX2lqKsyzZuRFvIcIpBcF6mal3HFy6/Di6iIFkpcp2pNRsfjW8fEq
         aHou6DxSJHe+OXh+A5dziF01iIE1vCGNIpuewDFQ/CAV1JOvZoxeqZuLb4rHmrMP7+n0
         UkQCrY5SKA069fa3dr8GvLV1vplj3qHuUFuXHuRRpbl2maaAk9WUjfjIxMzX2EVNEf9L
         GZPLGQGWZRDkWYYDyg6OIiWzi/i+l66gCLdv3rnBnQbfc5ABmTi2tFB8smWoyXDXv9Jh
         Q6RLMpW24xNapLHelgXE5s9uaDqYL8R+TFUCF9P57FuYZE+U/SbKdU/WXqCVmhrjEeBd
         EKpw==
X-Gm-Message-State: AFq9FYJp/NmAZd/2Mo+07t1SaTIVEVhUIjnnVtv8aue+Ap+9o1FF3geR
	o/5Q6UzZgDFXU/os32sLArEqhoQgMl0URRmT5ZGI5aYPHQbz3od5PeIE
X-Gm-Gg: AYBFou2CbE8sS0xbfHbSDLRtfNRR986pHJA00kef4+J7NFQpjp7H6ij3oc090cCFKmy
	rEpbHvCI8POFPQRfOaghK4oi55mMQ8Aft4n1uj07fpTv1pqYkI2CMC3+vXClhavUk7/A6io+C6E
	AFhLbBe+vbp7ckl5QTupSzK/BUs8OmTb3VVWo4Tvm+OBQRpQMJhdAc/xRzfZQLySyUxE5GtYnG5
	tlv2xy2RsVWD1hOlPNfcqTE9zhYJINWhXSPmJzyzhFTP4V8j79T3qBsq8woYoZ+bbmLbchXpOCa
	tl+UP6gIG1JmYhIbRTjU1y/A+uWOjOaYxMvNRf7i6QIYsSoyh+Ayz0QpC+7I+1VLvVAYNgm0F+f
	hj3bOyyA5fzDLUku+wKbvBEmc62QLTT02e2tox58Y+YYMfy4ur90Mvv5SQgwnOhxMRPOXTV8grX
	UX07lMLGG1IfL4cpy9zpNz/K4s3bTBOSzuoX/XurhSUFyjDQKYOEZHl7AY6XkB/aDVIGdJJp52V
	E5nkhkV
X-Received: by 2002:a05:6000:41fc:b0:485:8c17:976f with SMTP id ffacd0b85a97d-4887db4a42emr13382389f8f.49.1790540027649;
        Sun, 27 Sep 2026 13:13:47 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:13:47 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v13 00/13] ZTE zx297520v3 clock bindings and driver
Date: Sun, 27 Sep 2026 23:13:28 +0300
Message-Id: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XSzW7bMAwH8FcJfJ4HkqI+2FPfo9hBlqjWWNNsd
 hZ0K/Luk9ODVOcoQb+/KJEfw6rLrOvwcPgYFr3M63x6qws03w5DeolvzzrOuW4MBOTAIoz/3kn
 S68+RlLMRNUghDfX0r0XL/H6LevrxuV7095+aeP7cHKa46phOx+N8fjjEkKygZjc5T4JWYVLrA
 5sibCJFTyaWwjBsWS/zej4tf29VXvAWdlfPBUcYFaeYSikqzj8+H+P8+r1eeMu4UO+wOaqOpID
 mZACK3TvTOZLmTHXJF7Ws0YRQ9o6bc+ia481FEZ4ykUreO9s5Cs3Z6ryUAszKKLR3rjkP1Jyrz
 ng/eeASIPHe+c6hb85XxxAYMZVUjNu70DnqXNjqjAh+qr+J+e590lzo65TqMlhrIAebKewdQge
 /NB6qdCawY6lPoHQnu5EJ1LUCt5kpIWYryTG5e9kNjZDp5DY1koiNlzrC+Us3rtfrfyOgtmtZA
 wAA
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9739;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=mj7t87UDSwNUYjV80t4K9BuJ0rKYlqWFxDtlX3wjr5M=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXjvSe4C5L+EpLNbqQIWNIEYsE00h3IgaxsKx
 QjKsMOXtcOJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl47xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK5xw/+Nfg4Ui3MlF04of1PtPvRDCXrpspIyMT
 CG8lmaVZG5IE2tv373phnPkWe3CWjPw+KxdCz0NDQ2D8mSV53imBx6i72uKOmZ/fYpgSoLGMNov
 pYRsSH9HSN0NhVeSwAVYIHJTr1sk5b0bt9i8oIrBy0UJWTYn3/ZYQA8BZNPesBMAH8zcZwrX5U/
 ZIVq3o2wb5CXgP+E2zmORl2PWNiBbvU99FdJFUSNErwEa7NTnZFon80wIKSnD2lBWbZY2bAlj94
 QrC/9VPaHFdbUNBPKWOBQvXuDFEl83Q2RGeeQZxUPh1x4tU1B7i4B7ZYVrgY090qlHTvNFPTh5+
 85RWeERTQWrDi95OHhBkYINnbMV6r8gTDaqiBfsfyw79aZiZJkZoVhPTA/3FUPt192kDa/cVfyO
 vt53v5H3++7A+ZTh5oXkPWgSm1jFlGqzmI9S7S15NH5fqoPiGvLrUUYiYEnsxHTyuDBuYu4Vi7f
 9DTtF7prEz3dxzIsTLbwEPOuDyHunuAmFvcTNwUBdqZnHzHf7A1MNK130X6UrYMUULL4ze8wLeu
 49sMkzJofH1w7aJ1Q/WLFkv5Zl0NR73BZdC6RNnKYk8UfujwJyqPgRhh0axugsYqbFvb0Sa0Xom
 lDv6mt+Dgg8xlwbkzoCD+6M/4j9mVTYEIF+pX7QKA/4gUHLNK108=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

I am sending version 13 of my zx297520v3 clock patch. It addresses review 
comments for the MFD driver but has no other substantial changes

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. AFAIU adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Merge dependencies: The binding patches (1, 2, 3) and DT patch (4) in 
order. The MFD parent (5,6) is independent, although changing the ordering 
likely needs trivial adjustments in MAINTAINERS. The clock driver 
patches depend on the headers added by 1-3 and apply in order 
(7-12). Reset needs headers (1-3), but it is independent of clock.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v13:
*) Added the missing RFFE_WCLK export (Sashiko)
*) Break out the MFD driver MAINTAINERS change into a separate patch per 
Lee Jones' request
*) Add a comment in the patch changelog why I think Sashiko's "select 
RATIONAL" suggestion is unnecessary

Changes in v12:
*) Add more comments to the MFD driver, explaining what the devices do 
and where the names come from
*) Correct SSC reset bit
*) Add some LTE and GSM related clocks that popped up during my 
experimentation with the phone hardware

- Link to v11: https://lore.kernel.org/r/20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com

Changes in v11:
Addresses Lee Jones's comments on the MFD patch
Reorder the DTSI patch ahead of the driver patch to give it more 
visibility - it is the only patch in the series that hasn't seen a review 
so far. It is also order independent of the driver patches.

What's the next step after all the individual patches are reviewed? 
Should I submit them as pull requests to the DT, mfd, clock, reset 
trees? Or do the maintainers pick them from the list?

Changes in v10:
*) Clock infrastructure: Fix issues pointed out by Brian. The individual 
patches have more details in the changelog
*) MFD infrastructure: Remove _MFD_ from the match data enums
*) Further refinement of LTE related clocks and resets: The ZSP rproc 
has two resets, one in topcrm and one in matrixcrm. I don't know what 
the difference between them is, but both need to be deasserted for it to 
work. Previously I thought the matrixcrm register 0x3c is a clock. The 
clock gate is actually in 0x34.

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

spot earlier.

To: Stefan Dösinger <stefandoesinger@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: mfd@lists.linux.dev
v2: Fix build issues introduced by checkpatch.pl fixes that I didn't

---
Stefan Dösinger (13):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
      mfd: zx297520v3: Add a clock and reset MFD driver
      Maintainers: Add entry for drivers/mfd/zte-zx297520v3-crm.c
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
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |  101 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zte/Kconfig                            |   28 +
 drivers/clk/zte/Makefile                           |    6 +
 drivers/clk/zte/clk-regmap.c                       |  237 +++
 drivers/clk/zte/clk-zx.c                           |  192 +++
 drivers/clk/zte/clk-zx.h                           |  137 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 1657 ++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           |  576 +++++++
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/zte-zx297520v3-crm.c                   |  111 ++
 drivers/reset/Kconfig                              |   13 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-zte-zx297520v3.c               |  237 +++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  154 ++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |   12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   62 +
 23 files changed, 3858 insertions(+), 12 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
--  
Stefan Dösinger <stefandoesinger@gmail.com>

