Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ED828313F
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646458; cv=none; b=ZCWeXagUKNS/HWfAJDqEYPmfnOvhic9xEL53e0WsYpr9JGh5SHAEVwROwlbq9q1nOOTRNNmAGrfSpR0kLuEilN1pDh6Sxi4Rkan8N7H+ATwMBSL3PE9bDjxSdN4w/4xt5Hqqf4J3BuoxkmQeaaGK8g4r0tZuq+odi+kU8UlVjrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646458; c=relaxed/simple;
	bh=MwCg4L2h46PDOS0g7q2n/0TFp7dWTy5pPJdpMQqZbyo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jpA9h9ikGNKj6gbSyPdDzzQBDFg75bxlt92Jl0dTA798VidvqhRiBDskxFxYnjhGl7CdwR9bMvInBzw66b1T8CXYRmDGoK1fwJTryZo9q+q3spB/xguyQnMTIiwuw7LyAY6BJcQeT+iKwMNd1KNzi5hCPoy1WCuD8ghO2SVEjgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XBQApjA9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XBQApjA9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a54690d369so3021966f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646455; x=1750251255; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hcVPfIPjKgnN/jxAK+0iuHy/Mp3frsm9eTH/rmctjg=;
        b=XBQApjA9RekG+xDMVRNFPp2xNja5Up/nP/YwFZRyqyXHHjF9i7dZWni7ctlNg1adR1
         j7KLLjS8rkziSQHvNl2S2dXMYvZdhmzb+52lxj5ybkpouwLpVrhheHi+ZQ4JxRNAxEq5
         evTWdkZ0zEwR7Ta2IKeAUFAI0RrZA/EUjKUTNE5vkpK55/woE4eIB+QRRny/DYPpe36r
         shDhpQ1+dVY0o0tURicTe6MH207nydo339rRWXk0uG06vK3NJH7kwap8vTq8jiD6g+dY
         cr29Q7Q0XSdRqq8broFa01XaR6Gf4mT86Xo5TpWyPrlwwlx3B7OhTgyfT0txU4NXyhwt
         OiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646455; x=1750251255;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hcVPfIPjKgnN/jxAK+0iuHy/Mp3frsm9eTH/rmctjg=;
        b=QmvYzyZwCfl4SbH6pTY3GHh5jD3bUBH8jZhBttbPOUnBh4KM+Y+y3VPS98ld22LL79
         YdGZuP8RXrTqOka9bBWUHMTDVAPoobEedGwDZaY2Abyqmu/2m4HqX7Chgm8hlf1ys0NR
         2bb1CwCZPYkCJ60IUxWY2IzUbNFQPh+s996BFEgsMsF/eZe+wzpSh1VxXAuVHzw7feOF
         tw383EMdTmQsEk7bB4KyKzlBzVcb82Et+J+Nw36KByDzrfL3Fo/qUfOJhs9SxtUWwTly
         MpP+sK8SdJRMPuztI46a1PdjeRCMHEVeFCOd6R7NsM0uILJQwJgNXrBjBGNC8YwP/fi5
         MU8w==
X-Forwarded-Encrypted: i=1; AJvYcCWVZUbHU964CvMe58/uYE6yGaVjgx2FQg9j+Z+tRMOy7W2RBq+u9nVYQ5Ea1MqVZovEabCObdrOZnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgk57xddsgoXwgswhGAqXn2ZuoGcXbef/S+Penu3XtMSeqJiwi
	0erIITpBknOuyI0PXhdoIOy0CdpV8ysneXMNiF5yZB7ZhQvtNbcm0/tFWW7FKG4ZvO8=
X-Gm-Gg: ASbGncsJrCypqO5OBQ6s97gFztuRMMh10CAEazUwo4sWedS6JiXAdis7DXRKFN1JKq+
	qMZ5uVTRf31OyWezPiJSXiUT7Z56DkgmQGC7Sucnp5ssLZYjze/wsjhAHlFgzix415DVcVNe99t
	nQv7OgOJ9V+PeWvoPXWC5Mfn1Et2vz5+BIRrGN/muOlUJ737PCqMJC8jD5hsZSjiUCUfi/oh7bj
	p0vO5NBluTpo18lh9Wqm/t8+aGeszlO/GsvY4gZyjEoCEJbnBhb09E7fKI/TmaLPIoRVnnm1/ec
	Uqh/+E3uALJr140F4MDhyD94YGv4hiJyygpPFcmnTRHKwQ9SPPwXCAXyBDCpKOx1sNYd5wLlPTL
	M
X-Google-Smtp-Source: AGHT+IGrOsdxa4zJCbGnTi4fEsX+7CHAps/JT+rDRqNsXkWOF1cXauuh0d8YfM1q6aZsNyF7ST0Luw==
X-Received: by 2002:a05:6000:1448:b0:3a4:f52d:8b11 with SMTP id ffacd0b85a97d-3a5586f1905mr2571117f8f.20.1749646454734;
        Wed, 11 Jun 2025 05:54:14 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/4] clk: use the auxiliary device creation helper
Date: Wed, 11 Jun 2025 14:53:55 +0200
Message-Id: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGN8SWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3eScbN3E0gpdA0tDs1QDMwvLJMM0JaDqgqLUtMwKsEnRsbW1AFE
 JXr9ZAAAA
X-Change-ID: 20250611-clk-aux-0916e0689b1f
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=MwCg4L2h46PDOS0g7q2n/0TFp7dWTy5pPJdpMQqZbyo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxt57wn6gj2MMaDJqXctxiVe/tEY4F+6WgSm
 BnehdmmFCqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8bQAKCRDm/A8cN/La
 hV6kD/4mGMjR2Csvf4Ac7+0h9kIkcrt+1BCIsyu7vwlVO5wjBbzWtmF7BE6DQqByhYj1kk2WBcj
 y167kxXU9BFQ41uDY1MCnyPCp3WYUj3c+RR93vorROw+S1ly382yPWEBrE8uhY+rHiiBTrdOwsI
 h/SJbofzfUdCnCYA1Nzj8mbOnR/F0Le8LFdXtcHEjXvHu7tq9YJg64XwjXCQ1NBndkGclowoBQ1
 YXn9L/WM6qXhVilWbeMq4pDMMoE2EKP7gIuj93iNbtuHqqSyTPTJBCbrYCXSVaJ8KOwKRzf/4S9
 KoiKe+nPFlHxM7fCBW65F/BrfxwBqjPhp7epi9iZvqIFg7OlDW69nCy+UogWg1lb62tAIA5lEjT
 kf+omgPU5kR9UgjbG34eKbe30yHput+jherUVzyWZAWJENmL3uEOt4BoTV45navcvdaIBPdJ96W
 8qq8vlmjdnwPqPZDOBj6/tPBre4GYpgxDIwrhlwRiqTrxRKlHe0V8yGGewu5ARh3Zu6oTVZrRCv
 pPJr05s++w6148vJUMNhFcTkuyQpIKBg7Ca+Qyt2Bh0YxKw3m+KF3YCU6Lr14zr6RmYPD1S8pVv
 0+xW+vylPjCd8KSajuG7qkmLX2dzHXoY2NDlPGSG6DcicgVxfEMbtP7apQ358uzjYH1c6uSy0mn
 RNqdkBmE81/FQ+Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This series is essentially a resend of the clock related changes of this
series [1] sent a few months ago.

The necessary auxiliary bus support has now been merged with
v6.16-rc1, so this change should be safe to apply.

I've included the reset change from Theo. It has been reviewed by Philipp
and it is probably best if it can go along the eyeq clock change to avoid a
WARN() in reset.

[1]: https://lore.kernel.org/r/20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (3):
      clk: eyeq: use the auxiliary device creation helper
      clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
      clk: amlogic: axg-audio: use the auxiliary reset driver

Théo Lebrun (1):
      reset: eyeq: drop device_set_of_node_from_dev() done by parent

 drivers/clk/clk-eyeq.c                |  57 ++++-------------
 drivers/clk/imx/clk-imx8mp-audiomix.c |  49 +++------------
 drivers/clk/meson/Kconfig             |   3 +-
 drivers/clk/meson/axg-audio.c         | 114 ++++------------------------------
 drivers/reset/reset-eyeq.c            |  13 +---
 5 files changed, 37 insertions(+), 199 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-clk-aux-0916e0689b1f

Best regards,
-- 
Jerome

