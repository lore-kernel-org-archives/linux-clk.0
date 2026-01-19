Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096E230C625
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819277; cv=none; b=eL85zLN5R3/BfYk/os41Uqz6z8Jy3tTrmYiW7V7+HJBA78yOJnH2ugLxuoQn0Vsqs7bxod/I54k8ah8QQ81yld7XBpWZ/jiFvd2GHJmjioLsL6rLi4NfaswqKErOaJipTsEPGWw1QJ+7qd9hqBtcUz6pF6SG2CdmkG1ZsxAVTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819277; c=relaxed/simple;
	bh=M6Md/ZnKDENz5gO3yNGqGHP4CdV1B4Mkprugcxjh/co=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MOHXEzt2SOdElahMK4+qfMFTCRLu6k74uhBzN0govl7lkdgQ6DeSe5UUEaq//wo6CpjpA+2ETdJryOpL02oe+ral6XXSLX1g9ZmLF6VchTSz9uxjaXsE3jVhcsmeHv+tgPFhM3nmMaHCWS8TvUNvhBXNtBZ7BbVmfSP8AB6rhdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BHiWIh0l; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BHiWIh0l"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbc305914so3423495f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 02:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768819273; x=1769424073; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l9gn8n87XJ5T0VI7Qxiz0fxtpXeAFOD0jhdWC60Um7U=;
        b=BHiWIh0lwUsHI9z9f3GqmL0mhtRY23Fxia2vsINW8Xyn8ZnSOblEPkSBrKIhrfwfEp
         5Byhe/hszprDeAnGXp5Uf2jImdLb79VjtpUYeotoj2kQVyaOHUAGpJOv9iMU3OxrydO3
         Zd9ZrwpCeHBe+VYgHETt5EdhaHl/nbjzLr2aekpEYyu/rddVGoh4MROnEKI/aVYJSV3R
         JsU4MOq7FU2R2gmxQGhqikpq2TbUpUfEJtDY/oOrX2lsQcnZ7i3An8SejkV+tQPDTWd1
         EtqhzZQLyVPuWDhf6MQqk5fWfp57kb93KcoNMOPwQXuy5+ORxUpijntkmB7Wrx8WI9ai
         Hypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819273; x=1769424073;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9gn8n87XJ5T0VI7Qxiz0fxtpXeAFOD0jhdWC60Um7U=;
        b=wclGqXnG9y2cTaaLfKPu6yqJu1xWbvj4vfMPdU5UGA+cki5QwtpayzKZD/AX8AHNuQ
         h7Y7tb1xabS3OMYiIxO5YAWY8q1yEF9bzsDFfusaCfKiJAPW+T2UEX82C3zqgLQdsCUp
         5VGnW4hL+vJAOTuflBlIK8TyP442c14pSMZzDw/Bd1DTHXQ0LXb295YnyP0twB1SgZ2f
         2LalCvoDAyNjg2QChkSUP1Par/2L4yvgfpPoAGLQIB8CfvdUs/anPbsQrrHndbyjusFs
         QnDCAPRfnNWlhO6tij4zuvc3NEGvoDVDFKWEkEcp65hKH+/CavqzZ9AqStBmwyHGwBNZ
         Y8bw==
X-Forwarded-Encrypted: i=1; AJvYcCUk+3YAi4Oz4wbPQSWcUCnpCVvnXXq66nVZWll+ltdHK0WvZXv8G4mBLIiysjbnMUgucUT9kefgPFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY9HAQITbBGqZ89sWNTRat2oMIKC8PzYJ0ycw4gFVbkxdt+Smg
	8XeiO3jS1bmCNYqcsFeXNGOmmNh+v7vlu+lw5EYDTOZTAg9KUbbslfiTEZlRSc3qAQs=
X-Gm-Gg: AY/fxX7gKQRpUn5Xz7JKC7dBX6Vh32OjeBGif1w0Pyfa8Io9tPvE4ozP0n6gfZiVXlb
	+EEpZxLZDqyaRkfo88w3glN7HqBkZXDLlKs06XXM6f9QF/y1y0SolJCHXr1zK5J5MN7fnFkArzx
	w4yzZV1UBcNHireH+bEU+NFCs1IO9dgYwHYOkQtpskQO9aOhnLTUNdzaN5/lZfmhRhgDO4cs4a5
	CZe4hZzxROnD4qyvHC44Jf4E2y2nouyWDcKV3IxhDSR3UHf83WdaLSQR4yEUVpMVSNge67DZaoG
	d/Sne9o2jMZAr5SmtBk6CZR+kBKiObm3t+7nBPZ86pZpsghnZgz8BsRbay2vSJe5l17nJ/4rCec
	goB1Js796ZGRevBLEcl1GAd1B4JjZny37GiC1TAgPT+BsH04a9QIUQWBIM1o5vQgIFsvCj9/lQf
	v383unLReX9/QufFqx5O1v
X-Received: by 2002:a05:6000:186c:b0:42f:b9c6:c89a with SMTP id ffacd0b85a97d-43569bc5a34mr12693121f8f.49.1768819273243;
        Mon, 19 Jan 2026 02:41:13 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:4154:6ad6:c781:df9c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4356997e79asm22422921f8f.33.2026.01.19.02.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:41:12 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.20
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 19 Jan 2026 11:41:11 +0100
Message-ID: <1jjyxdvq9k.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here are the Amlogic clock updates for v6.20

Just fairly usual stuff this time around, a new clock controller SoC
support, a few clocks added and some fixups. Business as usual.

Please pull
Cheers

Jerome

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.20-1

for you to fetch changes up to 2fe1ef40b58c2256f4682594f48bfbd584501ec5:

  clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro (2026-01-06 09:52:21 +0100)

----------------------------------------------------------------
Amlogic clock updates for v6.20

* Add support for t7 clock controllers
* Add video clocks on s4
* HDMI PLL post divider fixes on gx/g12 SoCs

----------------------------------------------------------------
Chuan Liu (3):
      dt-bindings: clock: add video clock indices for Amlogic S4 SoC
      clk: amlogic: add video-related clocks for S4 SoC
      clk: amlogic: remove potentially unsafe flags from S4 video clocks

Jian Hu (5):
      dt-bindings: clock: add Amlogic T7 PLL clock controller
      dt-bindings: clock: add Amlogic T7 SCMI clock controller
      dt-bindings: clock: add Amlogic T7 peripherals clock controller
      clk: meson: t7: add support for the T7 SoC PLL clock
      clk: meson: t7: add t7 clock peripherals controller driver

Martin Blumenstingl (3):
      clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
      clk: meson: g12a: Limit the HDMI PLL OD to /4
      clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro

 .../clock/amlogic,t7-peripherals-clkc.yaml         |  116 ++
 .../bindings/clock/amlogic,t7-pll-clkc.yaml        |  114 ++
 drivers/clk/meson/Kconfig                          |   28 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/g12a.c                           |   17 +-
 drivers/clk/meson/gxbb.c                           |   23 +-
 drivers/clk/meson/s4-peripherals.c                 |  206 +++-
 drivers/clk/meson/t7-peripherals.c                 | 1271 ++++++++++++++++++++
 drivers/clk/meson/t7-pll.c                         | 1074 +++++++++++++++++
 .../clock/amlogic,s4-peripherals-clkc.h            |   11 +
 .../clock/amlogic,t7-peripherals-clkc.h            |  228 ++++
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h    |   56 +
 include/dt-bindings/clock/amlogic,t7-scmi.h        |   47 +
 13 files changed, 3180 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/t7-peripherals.c
 create mode 100644 drivers/clk/meson/t7-pll.c
 create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h

