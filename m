Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF83C234994
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850608; cv=none; b=V+zFkMdj2U3BpMipDrc3aItHXbbyQfXobFlUVRifFCp2qj2l5PMTn/4TMBGmDwrj4dO0dRc2+B4z08BJs53tAlKFfebdj27yVO4hA12MFD7BFyrN8Agi57vkTqQ0L1Zpu0DM4f9TFX51ikY86+57SVohrVSzJmUxyIoLsQVwycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850608; c=relaxed/simple;
	bh=1yCY8csuIIkAJNzv1qjS14X6EKiSfNjbmMw/2hqxjeI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dKmYUCpstUvL2NkxQHhzzb6jv2PVrXot54o39rfWcPaEldY60cuysdDB5WeWmKYznLW0eYWYlT/FTcUMPgV+fBfj0UyLtJSgMfP67qCYEFtPTnLx66X/5Zyn58I+lhuNC0nkwDeuwVffk/WsteM1ySSVgtW01Qjidjh5/D/onTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Wm7a+na0; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Wm7a+na0"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so5213455a12.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850605; x=1734455405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4vF/MqNtR19jOp/V/GGowSlg++EQ79hE7qG7Vk7joIg=;
        b=Wm7a+na0q7Joc9m89S3ZCSM+6f84RQF7v/5vb7DnRc11SkeEGtbS/2BABa67i4bQjA
         UsfmaKl1F8JY0uSjgEW7dvoFNXN1IH31S5CVMTj++MzysaGIhrJoNW8fP70WZeZteCtq
         vfLOLV954BZ0gaDvXDupOU6fT5aI9YcLlpNXg4wBh2tCeTeYj98TQ4stP1dDZPhURHf2
         WQ8XMxRAE+LODDOuuIIim6MrkdW1uQnRT+qtXNAI5VSPj/HBsYacTCIwcKray6Gi2IYi
         oKF1fwPySiqddzxYKEGHbCjak06vKLTODyY25zL1o5g9tQ8IJDzA36QSRMbiDEANQzWO
         b1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850605; x=1734455405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vF/MqNtR19jOp/V/GGowSlg++EQ79hE7qG7Vk7joIg=;
        b=cslLbX2PUKPuM8BL/Le6+t4Grobv4r99mbxDi/Jp8znKtfeu8UG10XdcpDETQ7fIva
         S6bKizeQQYivvetZWuPw2zo/7nYWJB3iB9KDRCS9RmI8A7P+qUkUr+NdAwiPbOmBpf+c
         pQz7aJUo6Mr10sepR8pFLjHhajZYQbKM4uKxKzX5G+4yItln2L+y8I2bf1A8VoACzP2Z
         FLV6wncW64gKXlT5nlxRyC2uKPuPt4LJjXOIdAx2CJoWPcVzp8FAIlpfkQevoNVbUgcv
         8fZljsvRq62G0wAaID/jVQYO6OI+zNqVIwJNkfXRi1imYLXvCoH0Enjiep8qJJmEIoxM
         7x5w==
X-Forwarded-Encrypted: i=1; AJvYcCXnUETBRdMkXijIer8NpPPJJcV9DHH5ax9Trl7dPAFkAkaIhfA+9WSS5/JM0JDwT/p928fWO3ExcLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Yt4bPzjxkBsqHG2yM50EV/HMwPQpazjckWN5sd2PjKI4UL1j
	W2ySSmC71tYceP7vWFipf/jof0zADHr0d5fDGguModdXZ2A76qkUQOZj69WhffI=
X-Gm-Gg: ASbGncutGLV8NlH52RrDpjkofam9T0REPtXyFgL4MxJQHSnW88LIWxuCcq6HU3kDdUD
	wAfcoFcXssg7np4K4K5lB9XiVfPQtYTtJzNc/oZZIsrs5OKPkqX8T/2B+2v9dYrPj1cqOWXI3NR
	50KE3CGnDpWhK5XkqxcSO+WSs/JF1wA+J14ipMzhS7cFRwK1CX+ALoUsit8PdwZUogx3urU5UN8
	eB7LZo8pZS1G2+iPqstNcWtyvt6UBPxCgSSsuujcUla1IhOlUu16v8zD+jxK2V39UD0bKabEWLv
	+8JTb0Er
X-Google-Smtp-Source: AGHT+IHSX6HgwX58RDNMjWxEUiBxZF49DY7PE972rvdQuS2JxVwMHBYkw/019YuVN5dqWY39BwVGSw==
X-Received: by 2002:a05:6402:2696:b0:5d2:719c:8bf3 with SMTP id 4fb4d7f45d1cf-5d3be67e27fmr16737798a12.9.1733850604950;
        Tue, 10 Dec 2024 09:10:04 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:03 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 00/24] Add audio support for the Renesas RZ/G3S SoC
Date: Tue, 10 Dec 2024 19:09:29 +0200
Message-Id: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series enables the audio support for the Renesas RZ/G3S
SoC along with runtime PM and suspend to RAM.

Patches:
- 01-03/24 - update versaclock3 clock generator driver to support the
             5L35023 hardware variant; versaclock3 provides clocks for
             the audio devices (SSIF, DA7212 codec)
- 04-19/24 - add SSIF support for the RZ/G3S SoC; fixes and cleanups
             were also included
- 20-24/24 - add device tree support

Merge strategy, if any:
- clock patches (01-03/24) can go the clock tree
- audio patches (04-19/24) can go through the audio tree
- device tree patches (20-24/24) can go through the Renesas tree

Thank you,
Claudiu Beznea

Changes in v4:
- added patch 18/24 "ASoC: dt-bindings: renesas,rz-ssi: Remove DMA
  description"
- collected tags
- addressed review comments
- dropped already integrated patches
- the changelog for each patch is detailed within the individual
  patches

Changes in v3:
- use renesas instead of sh in audio patches title
- use proper fixes tag for patch
  "ASoC: renesas: rz-ssi: Terminate all the DMA transactions"
- collected tags

Changes in v2:
- fixed typos pointed out in the review process
- dropped da7213 patches already applied
- dropped patch "ASoC: sh: rz-ssi: Use a proper bitmask for clear bits"
  as requested in the review process


Claudiu Beznea (24):
  clk: versaclock3: Prepare for the addition of 5L35023 device
  dt-bindings: clock: versaclock3: Document 5L35023 Versa3 clock
    generator
  clk: versaclock3: Add support for the 5L35023 variant
  ASoC: renesas: rz-ssi: Terminate all the DMA transactions
  ASoC: renesas: rz-ssi: Use only the proper amount of dividers
  ASoC: renesas: rz-ssi: Fix typo on SSI_RATES macro comment
  ASoC: renesas: rz-ssi: Remove pdev member of struct rz_ssi_priv
  ASoC: renesas: rz-ssi: Remove the rz_ssi_get_dai() function
  ASoC: renesas: rz-ssi: Remove the first argument of
    rz_ssi_stream_is_play()
  ASoC: renesas: rz-ssi: Use readl_poll_timeout_atomic()
  ASoC: renesas: rz-ssi: Use temporary variable for struct device
  ASoC: renesas: rz-ssi: Use goto label names that specify their actions
  ASoC: renesas: rz-ssi: Rely on the ASoC subsystem to runtime
    resume/suspend the SSI
  ASoC: renesas: rz-ssi: Enable runtime PM autosuspend support
  ASoC: renesas: rz-ssi: Add runtime PM support
  ASoC: renesas: rz-ssi: Issue software reset in hw_params API
  ASoC: renesas: rz-ssi: Add suspend to RAM support
  ASoC: dt-bindings: renesas,rz-ssi: Remove DMA description
  ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add SSI nodes
  arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node
  arm64: dts: renesas: Add da7212 audio codec node
  arm64: dts: renesas: rzg3s-smarc: Enable SSI3
  arm64: dts: renesas: rzg3s-smarc: Add sound card

 .../bindings/clock/renesas,5p35023.yaml       |   1 +
 .../bindings/sound/renesas,rz-ssi.yaml        |  19 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  94 ++++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  47 +++-
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |  63 +++++
 drivers/clk/clk-versaclock3.c                 |  67 ++++--
 sound/soc/renesas/rz-ssi.c                    | 226 +++++++++++-------
 7 files changed, 388 insertions(+), 129 deletions(-)

-- 
2.39.2

