Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7044143722
	for <linux-clk@vger.kernel.org>; Sun, 22 Dec 2024 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887142; cv=none; b=n0+S0cnC6GtnAQjOS59n95570qKxvTnUKo36KBLMcb2bL6HWXDo3GWgnw36vt478aHVRGXQ1RHwvof3lZKDdluWD4K44T2x6Hx3Sc5Cx3QzZGvtTuGcqoSdHZKiqB7dh6oWZ6UF0jerGPQx+oY9UK/JRhnGUsWgcf0A4YuiOzME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887142; c=relaxed/simple;
	bh=FduH27wYIXMaSCrVN8+PHj+Jt+MI3H3TFAHd9zqdL70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gp6qOUNTbCeTTh0Fzk0wUdfKraA9dGdwEW2zOoQK7ZzLCY5LQd3xYOb1rByVDv83ApnSIA3gx0XSw5WUpuxEPNZuKuXxyB77llCUWQyabIViNgtbB+jvHioXS1CBb2XprHSIt4iZjmAqOFMx7JY5PnDlQ0DSYJ1stdE310cdo6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RLC1ILYl; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RLC1ILYl"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa6997f33e4so598104366b.3
        for <linux-clk@vger.kernel.org>; Sun, 22 Dec 2024 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887138; x=1735491938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RhtmpZ+ZLYSsrqpu6pU/Lyj2nnsgcpK7OCWx/PXTdug=;
        b=RLC1ILYlfUt3r/YNm9E8tyYQkxzENE0rqQpYrtVn70F9aZgN2uaWcPXoaJRluhdJ0g
         eSrI/PDOK+ngwDGMhwSTuLP4livyxMKK3sUqQjZIcfiQyM5zjjVOKOm042TIh/dtmxhs
         iIyaWQdRgZES9wSjuSM3C6tGsjvxCw5qa2Xgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887138; x=1735491938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhtmpZ+ZLYSsrqpu6pU/Lyj2nnsgcpK7OCWx/PXTdug=;
        b=gga5CQIHf63PCq9YwSEQHeiGcbvo3onGz/UkMt2uR/0O9PjhBfK6b4R9bYgbNa0gJm
         pPnDVS/CURNP1ApOwBFOnGGMi5PZsoWJC520TekJ9Mn5E558jN3pWtjgg0SiqrOnaS9w
         rNGqu92iotUiRlnqF7vseMZr9qxqalI2fiCIQVd8DJTPynzD1G7fjQQ3GWm/SIDfNFC4
         /AZrVeC0uF2cMrQeBjSmf4YvmIbIMoHB6fWtF2dno4z9ifhvLsjhC+e3Ih2LbGFqBDHf
         +8XuhF/UthfcVurBvxDwNnME0bg3S1WabKm9c5NPTmaSTtLfDpwS/8pa2YmsHs4owgJ5
         OB+g==
X-Forwarded-Encrypted: i=1; AJvYcCUMji0PR6T8OuA9S4eun+E05gNTl+fd4TZeiTzlcoAXgSmNQRPgtNN8dH8Aj/bdmzIxkJcOoLwLnV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0G6M+fk1S5eNPHoIHxlAqBp9UWjDhkx6OBTp72rDyAht1NOQB
	PZBEwtVYPY/BSH3nkjbKBYBHOV0XI0+/dmKRuMP+h2EEWqzV4EUgWQ6f6a2Kqws=
X-Gm-Gg: ASbGnct0+GC91sCVgKhpehH7i9gQbk67aZsrrTL126mW9XHYIQJ1T/wgCti4Js2i9Oc
	uttBm5jR7gyDOt5bj+29OCvVfOJW9Dmn0eUXNSv4YxMtdGFm7oHrUFr9Ciau7NRu8hKtn3Fff/S
	CcKEnybJbPVdThFw2JrcRjJYOEzvfWl6XnSpaH46SF7L07Qh5ao8B7zFHTP5ovvSD28u0yIoToB
	RQn0LAGUPUlNA4RiUxAPlyuKWJzljE/XZAcdEFlmlnVRyH/d1L8ks7qE1BUo1GIX9IlI7yYGqnm
	jND9oah+QgL2oVXXwHfkbMWu0vRLnw08FKnmsUksCgwTRQ==
X-Google-Smtp-Source: AGHT+IHvooGlO7jo5Rwpwn79hajX/ICZcskpjcUPejd9ekku1o6JfbpIJup3jevoKr3K6wJwFlFcgg==
X-Received: by 2002:a17:907:1819:b0:aae:8308:532c with SMTP id a640c23a62f3a-aae830854dcmr621726066b.59.1734887137954;
        Sun, 22 Dec 2024 09:05:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v6 00/18] Support spread spectrum clocking for i.MX8N PLLs
Date: Sun, 22 Dec 2024 18:04:15 +0100
Message-ID: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for i.MX8MN
PLLs (audio, video and DRAM). It has been tested for the video PLL on
a board using i.MX8MN.

The patches added in version 4, such as the dt-bindings and the driver
for anatop, were inspired by the extensive email exchange from version 3:
https://lore.kernel.org/imx/20241106090549.3684963-1-dario.binacchi@amarulasolutions.com/

The series added spectrum spread support for the imx8mn platform only,
but in case it was merged, confirming that the directives and suggestions
made by the maintainers were correctly understood and implemented, I will
extend this support to the imx8mm and imx8mp platforms as well.

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (18):
  dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
  clk: imx8mm: rename video_pll1 to video_pll
  dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
  clk: imx8mp: rename video_pll1 to video_pll
  dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
  arm64: dts: imx8mm: add anatop clocks
  arm64: dts: imx8mn: add anatop clocks
  arm64: dts: imx8mp: add anatop clocks
  arm64: dts: imx8mq: add anatop clocks
  clk: imx: add hw API imx8m_anatop_get_clk_hw
  clk: imx: add support for i.MX8MN anatop clock driver
  dt-bindings: clock: imx8m-clock: add PLLs
  arm64: dts: imx8mm: add PLLs to clock controller module (ccm)
  arm64: dts: imx8mn: add PLLs to clock controller module (ccm)
  arm64: dts: imx8mp: add PLLs to clock controller module (ccm)
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +++-
 .../bindings/clock/imx8m-clock.yaml           |  65 +++-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +
 drivers/clk/imx/Makefile                      |   2 +-
 drivers/clk/imx/clk-imx8mm.c                  | 102 +++----
 drivers/clk/imx/clk-imx8mn-anatop.c           | 283 ++++++++++++++++++
 drivers/clk/imx/clk-imx8mn.c                  | 188 ++++++------
 drivers/clk/imx/clk-imx8mp.c                  | 118 ++++----
 drivers/clk/imx/clk-pll14xx.c                 | 134 +++++++++
 drivers/clk/imx/clk.c                         |  28 ++
 drivers/clk/imx/clk.h                         |  23 ++
 include/dt-bindings/clock/imx8mm-clock.h      |  76 ++++-
 include/dt-bindings/clock/imx8mn-clock.h      |  64 ++++
 include/dt-bindings/clock/imx8mp-clock.h      |  80 ++++-
 17 files changed, 1017 insertions(+), 234 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c

-- 
2.43.0

