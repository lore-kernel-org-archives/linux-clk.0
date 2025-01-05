Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D16A1C3021
	for <linux-clk@vger.kernel.org>; Sun,  5 Jan 2025 18:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736100934; cv=none; b=fK3rRXTqzqqBs1xaAaewJun59em8Sme5PbA7e5mJKbgMP70vDyCKbnzVZDZtRZjAyGa5TByfTsgwK6XM0c/uh54+AR8LfzHZNG2pnizJsgeGFVH8tacRAcQBOHLay/AiYJcM4hEttKP5K+V69giGUvQRqSwA+uLjarAVDGaHb4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736100934; c=relaxed/simple;
	bh=OO7gbuzllcSGMPJv1dkhJSrGvVPCtEbrjNXZy8Vg/Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YHabN/aSXtXka24Doys3e89QU9DEYY5evHQ+SHLX/CMarq+zA09/+dwKzEP5/1IF5iV8C3lPNHIDOGYYXWee16a2MplfrUJx7ANjknhAM8zbCQyJo0BeaL2sP0Gjrdw2WtxaweCVMKc+wBMthZ/Jp1Kk9bcZ4r2LaH7RtsCbNfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kd9t151b; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kd9t151b"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so2248427166b.0
        for <linux-clk@vger.kernel.org>; Sun, 05 Jan 2025 10:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736100931; x=1736705731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7JaCiDSlWL3n6x9r8puiAFWGWFXePu89GjNolb6aW4M=;
        b=kd9t151bJXwmVO8dfzTukgz26JLNiy7NooTH7dJhpv9E0RwMZIHgzhlDOdRAiODzyh
         nzQ6VSi//tmJCfFoXI0z1nnTIEC7qrSbJQqYDZp9VygCsYTpo+E0H6qWjDdAjfB1hcOM
         g5haVtIJzvgZFVKc49E3J/q30sfVT3/d7A5eE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736100931; x=1736705731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JaCiDSlWL3n6x9r8puiAFWGWFXePu89GjNolb6aW4M=;
        b=br5otW7Ea2WozRBlz3L8jTAmkP6GM1c70NjY/54EYQooqHvf9KewBzBubXf0Y9Bl+q
         PprFr7rSqfRZtAcXOimrXKlbFNH5LLUAJ/bi9DJQccbzmly6xAugyroMxvPNuplLHaDV
         6NMKXpxQLgABfJo3hR9cHgRDD+ee/MrgcQr7pdXdpIl0y0bl0FM6k5mKrt3f7L2APBLD
         qyqoryb7bUUL//ukiO0sI38mlb3PXtE3qGDazf83vAeJ+2gfQGAMddbECg+75ab5IO08
         tau0rcdxSbkijs5V4SgRePZ5zxcBzIj3ajgokdj4HA1MGudiM2WzrZCTZIrYFOT28Zhr
         9ihQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpHJ8Hdi4aLWOKhq6ofXys8/VYq5I0S8BYOIqty+Fcchh8ObQyBc9li7HsKXAZBkv9g/Zpghc9cvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqQnDC9t6P9+UtAlK6drgEYyFdDLgBcD1dCCR0z89Ejm8oNWAb
	LEwfAJkHOPjpcWWkZP/gR2Y6Mj+xbtqG6Uc1gmkSgQPBg3ar6MYzY4Dp3IZx914=
X-Gm-Gg: ASbGncvPJAgupvWT2onj0a4vtVq2CexJPTG7q0KNPRJuWDABPBP2zK7A6qqL50PDFtK
	2tJSm8h5rzjtub9lzYLQfyB0oA7CsZWsZeH8Z0x2YBfyydnou9Z/QfVy0sMmzt2cE0v7cysiReW
	9G8Dr7yUDC+iR+ZZnU4Xixe+G+E5YaDTC5KJPosKtSoBAU4xdgbXoEk7LDBTEJun2EKlzJowg7E
	gVpxF2iTcPyMfhoiluhB5AvdWvLp8HFpMooi6hygKiF1tul3Sv4uj8FHa+P6JLC0Ldd491cyXj/
	Lc9LkNtJa9j+DZtoD/NhnOTb6FPsUhpOS5Jo0pwKYNw1kQ6NW6J2S1ME4lE7Tp3wDV68op1lh2l
	vad/Lorvk0WKHGMfHlQ==
X-Google-Smtp-Source: AGHT+IGx5I432/7zv90tAswquFGM3JlzRsAxUeSnbD4QR3LNzbPaGo4Vdu+XKbNBzzfORLPTWC5EKQ==
X-Received: by 2002:a17:907:7dab:b0:aa6:98c9:aadc with SMTP id a640c23a62f3a-aac2d45fb01mr5099786866b.31.1736100930471;
        Sun, 05 Jan 2025 10:15:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 10:15:29 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/6] Support spread spectrum clocking for stm32f{4,7} platforms
Date: Sun,  5 Jan 2025 19:14:12 +0100
Message-ID: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for stm32f{4,7}
main PLL.

To achieve this, it was considered necessary to also apply patches to
improve the documentation (conversion of st,stm32-rcc.txt according to
the json-schema) and the code (use of FIELD helpers).

The series has been tested on the STM32F469I-DISCO board.


Dario Binacchi (6):
  dt-bindings: clock: convert stm32 rcc bindings to json-schema
  dt-bindings: reset: st,stm32-rcc: update reference due to rename
  dt-bindings: clock: stm32fx: update reference due to rename
  dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
  clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
  clk: stm32f4: support spread spectrum clock generation

 .../bindings/clock/st,stm32-rcc.txt           | 138 --------------
 .../bindings/clock/st,stm32-rcc.yaml          | 170 ++++++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 drivers/clk/clk-stm32f4.c                     | 155 +++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 5 files changed, 321 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

-- 
2.43.0

