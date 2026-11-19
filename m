Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083212;
	b=rQTmoxUYBdIXr++oDBIawwxa9Di1LzcRAkVmAT0L8XTfXKsPsPUu9RwEtO1jfYMTHC87
	 3JwAPfDNI9j07rh7LuBtD6FdAwf8JA+ltOhds+lTJvR0bMB0d4Cc6cmj+YOeJwKgA3B60
	 Sg7HOt6oFJp28yDpS1tKQdNI8K2v4ak5HXf2n3YZlUvQ4f5qqElVRSNV3ZHay6cD1Z5qF
	 s02l4bkSuZZhnjnUvLP6Z0SS48bnudictwBT6leSMFmPHWT9Ax03ZPzbbA2RajKIFcVMa
	 6Spq+xfg1pZIxEypNifOTdgC3kIXDskjSz/QJc6LmVBi4wUvUScFF9wFXHxM+x5iilA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083212;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Rr6on0uRAsOBEndIgDHMMS/YTxNNhK+tWnM1lgzsqU0=;
	b=RxtHlvBkJOzAgTEjKTdZn1frmf+WlTqwJkuvj7J9wpG0owDs7U7cY9vg+txUhu5YnztH
	 VYi6zMbjdqSGlFgh2X0A2er+nMA8OX17h1xSnRmyfXGMmfw/uJ27i/E4ItgHnetyKlbFX
	 m/lMWOPVFCz7wJAVESQMaWp+4nTQq1EJz7IZaKVsuGXBl6U1dBCm6oBrbjl/1kJ5ngi+b
	 8tL6+HG5S6HmVCjgoie0TTd98hKMBrJZCLz6cNd5XbGo1G6y8Aydy2GmMlYgd96OMHzZb
	 3Quo63fPuuhvM8O7y3VpWfi+snVfCqG+s9tKCSKML8f5lPfeX8SQN3ah+TobGHq5/bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pp8Xed+n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5EC606A324;
	Thu, 19 Nov 2026 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pp8Xed+n
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795083211;
	b=xjMlMCWonxwj1jx1hRNgU3k00BcUfYvVKwsQYJ12ZFxs4eKSlzCUKDinxoXLI/E8IhND
	 bGl05bIGlYsfVijtTD6tPT6++Ug0+tzEiO4/kvrsK333zs9OPWeIFHBh76wp8NVYu2tnG
	 gMxYLmz9kpxZlp52u7KfkWuBSVDexCnzcnjwOIXlERZgXtoTHd2BCrCDFL1F98xQ7rP0N
	 bapm5J9zFawm6C6aXdiwjXR6nXgosmRDcOgoVB4go1lAZzrV8F6ZbHvKYRZOVL9fjdAQ0
	 24hjw3P2vqQqwbdD8tmgOiXSQUhaQtpK71lu0WkcOjZqJacsAtQWhX3JrrQejNIR8Yw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795083211;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Rr6on0uRAsOBEndIgDHMMS/YTxNNhK+tWnM1lgzsqU0=;
	b=Olg4+G5IW20rZ7NVNKrMr1+4kqXl1qDJ4Q7T7D6obV6DO1eGs1psT4WIwiOKQ958pbWE
	 9Hze14d+EmCZo/UCs28NVs1w9Vs2rIWwne1R3L94kqBv+KGcP7aKoWyGIidq1Yfw5WbhK
	 uRNNo8Em4H1Z51f60Csjt/eXzzpdD5Lf3fIKQQup1dXlzA9oF1qh5KZJsIw9FgUVpZOo9
	 sUglpufVA6y9x4H5QCHExe7zK2ClUGGPPW7FD/yJcIRYkUvNFK3E7OsRpZ/BlwYU5QHfA
	 3P3726AJj8DKguMZMjx/CCKtk5gTfFzrFLwfNGEE7mS+kHuSeNC9g+9AUzJ/yet0RPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3CE541F000C5;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083211;
	bh=Rr6on0uRAsOBEndIgDHMMS/YTxNNhK+tWnM1lgzsqU0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Pp8Xed+nPEPjJ6ChxMkFKPF5kDdYnizKfGM3l2icNvoSpHmpWPZ16ZTeKyXzHgZ4S
	 yWTtdDZ6ze5C1SJquchww8+gcIL3jWoFYt+u4Z8cvzwv6OA9GaE8wtuHisGZiAXpb3
	 7byKMBLUkaqmoEb3X2cSwXOz6tglfcIrT+TG4jzqeEK6NV9wCxSCZ++/EBw5yZrtrD
	 weUGHQauzozAa1TuoFWkqWlKkqvzbF6oqgNZyzzBUqxU7UU/4K6T90PiXkMA9GpA8P
	 8eZhJ3lWOwqWeTgLOKft9khAg87GnIVroQQVpX0nA2zcGtELgLuDR5jrpkB42aa/ae
	 2/AbEqRFjIwqg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C009A4B227;
	Thu, 19 Nov 2026 10:13:30 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH v12 0/6] arm64: add Ambarella CV75 SoC support
Date: Thu, 19 Nov 2026 18:13:18 +0800
Message-Id: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7L/moC/22OwQ7CIAyGX8VwFlPYYODJ9zAeGHSKUWdAiWbZu
 wtbjMaY9NL2/752IBGDx0jWi4EETD76/pIbxpcLYg/mskfqXR4QDlwygIba1Agae0tRctVVoul
 ASpLj14Cdf0yu7W7u4709or0VviQOPt768JyOJV1yby2btSmXpkBrJa3lSpu6VRtzbk3A08msb
 H8mxZwYfMFMf37Km4y7SkmQArlz4i/OPjgD8Y2zjBsjEaHllQL3i4/j+AJQCLxyNAEAAA==
X-Change-ID: 20261007-cv75-soc-e628f357f066
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795083209; l=3925;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=XHnHiRFW/cpvMx3MDiecpOA+CTWKmRfU9ZlUEb77ms8=;
 b=UL3C/etXCyjfdrK/JlXgcrfA53b2Qv/EwDLNiV8ZHb+DYG9fF2Y18bClwzunZwiSRhUjRAlGn
 urnyrkfixO5AXihSn7YDc3hrI+WI1yoGgMmfd/FAcLjoYKVvQfh9ymY
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

Add the Ambarella CV75 SoC and EVK support: the board binding, the
RCT clock binding and driver, ARCH_AMBARELLA, the devicetree and
MAINTAINERS.

Apply the patches in this order:

1. board binding
2. RCT clock binding and clock ID header
3. ARCH_AMBARELLA
4. RCT clock driver
5. CV75 SoC and EVK device tree, plus defconfig
6. MAINTAINERS

The ambarella vendor prefix and the CV75 secure scratchpad syscon
binding are already in linux-next. This series does not repeat
either of them.

GPIO, UART and pinctrl bindings and drivers are separate series.
This devicetree references those compatibles.

Tested on the CV75 EVK. The board boots. That boot used a local tree
that also includes the GPIO, UART and pinctrl patches.

To: Arnd Bergmann <arnd@arndb.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: soc@lists.linux.dev
To: linux-arm-kernel@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: Brian Masney <masneyb@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Long Zhao <longzhao@ambarella.com>
Cc: Long Zhao <zl020895@163.com>
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Changes in v12:
- Split ARCH_AMBARELLA out of the EVK DT patch into its own patch,
  right after the two dt-bindings, so an immutable branch can carry
  the bindings and this symbol. The CV75 device tree and defconfig
  stay a separate patch. (Brian)
- Link to v11:
  https://patch.msgid.link/20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com

Changes in v11:
- clk: use builtin_platform_driver(). The Kconfig symbol is bool. (Brian)
- clk: drop CLK_IS_CRITICAL from the core PLL. It has no enable op. (Brian)
- clk: drop the misleading (u64) cast in the div_u64() call. (Brian)
- clk: add .suppress_bind_attrs = true to block sysfs unbind. (Brian)
- clk: drop MODULE_AUTHOR. (Brian)
- Link to v10:
  https://patch.msgid.link/20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com

---
Long Zhao (6):
      dt-bindings: arm: add Ambarella CV75 platforms
      dt-bindings: clock: add Ambarella CV75 RCT
      arm64: add ARCH_AMBARELLA
      clk: ambarella: add CV75 RCT clock controller
      arm64: dts: ambarella: add CV75 SoC and EVK
      MAINTAINERS: add ARM/AMBARELLA SoC support

 .../devicetree/bindings/arm/ambarella.yaml         |  24 ++
 .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++++
 MAINTAINERS                                        |  14 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/ambarella/Makefile             |   3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 ++
 arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/ambarella/Kconfig                      |   8 +
 drivers/clk/ambarella/Makefile                     |   3 +
 drivers/clk/ambarella/clk-cv75.c                   | 361 +++++++++++++++++++++
 include/dt-bindings/clock/ambarella,cv75-rct.h     |  14 +
 15 files changed, 708 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20261007-cv75-soc-e628f357f066

Best regards,
--  
Long Zhao <longzhao@ambarella.com>


