Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942969;
	b=cBA6DcZzoSDwzueZNHXprNHRglortuE1bSzjvCw2KYYXkc8k9IxkOCg0ZI8KITL/WHFa
	 dBgSkwnskqp38qG0nqUfvqccaJHgdH0rYpjB9dd4UtyBmXK4l5cqK/C++OT39lsm4Rs6z
	 vXXu8cniEyxMdk7ma6N5ls1D+1L+Vaer8/CF/FLqVr1SjLnmkiaabqr0p4g00gtfDPLGI
	 RJdGWp3fs8nk4IEiRwM8sqypxCOubtBjzfbI4BP8mH70b0ApOZhAAryFgnqrA6vtLROnZ
	 vOTQON5upHGGh/UNHEAJodthEn8FUDrF+B+uvvnKdWSHtKp3rnTWL5vkSL7n7+UROvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=;
	b=SSwmkWKC7IgY+iyK9AwLxE/B++Syl1LAPb5ECohF/9jVlnY6N4hVZfsGX+e6M4HEAA9n
	 6zNFmjnn4RuHET5U1k4tqrvTmgfqNnuvabkQjGGKCYp0GmT7ou8OPDNiaManPPrUPsDxz
	 JlGLzyZnxOa9sJ1uyuH1x1SSe+UbB23F4zzlORQp3wXsUhu+yn7b5cQrwyI7qNciLpdMT
	 xJK1wtsdepXWaQXSH4CBf2Xsp+LoX52iHuU/eyzvPm1ruUlAmt9OwIIkXHG5InnsC8Y+C
	 W3LPxr8hWU/I87PIjxGxx3+lx/6bpIReswcRyRLvmvHtMCZWfpDR8ams9+uzg1x9dDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mz0pJHTw;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564E7606A337
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 19:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 564E7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mz0pJHTw
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso2359695e9.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 11:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942967; x=1795547767; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=;
        b=mz0pJHTw+7QpxzzAKLuXN6/+s2NFA3soOVmbRbVNrqy9Yj66hIqODj7kB2i0gD/Fjd
         iHhZPAIaVP7va9Du8/DCsHiUqAUUCwhCp6jI5UoBoPvJZoLHekheEgx2eaZ3HonuPAI3
         nm/B6dxOsR8RI9uwg3qZfol5spcmO6U0IIgTgDIc+tKJoN6hx7r/uN1nafOG3tmzR0PP
         UGmAKbm6lkptFPo8lYDQVR/DDO1IB0C8P1qoOpMNPCr2ld+kJWrW3qjbH3P9lXxq4cWh
         /C7ct7q39AQdLdz6GMaZvcRJyzAPt44Q3qSCdpiwVNl7i7ZrTMKOlJwfL4o6YpiRT/KX
         Vi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942967; x=1795547767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=;
        b=K8GoUtgiIv7tOSbqK66ynDApTXeDkwraM3WKNct2akjaEFLTm0gzondvpdtn3eVE2E
         CBU6uRck5PLDjf9aa9841qe+egKgcwfmcWqMdMtShvNpn6m271ixrJ4tDXkBs5f4JS6M
         5IzTsYw2kKluNkcGARrcw6w5BwGtMIPgHpuajP63Qsza3dIOznwg1O+6xTzQzkN5Xkwg
         H9Nkpy6580Q4yLJIIDXBAEYyWgEjD0rROJMHHE8g8izejbFJdCKOzeM3OcsJALOmJZJx
         AIgEBtK92mFx4En6lexuh4gkiqxja9MvHy0rT04Xyl2afThim+05dRiIHkCWad6MJbf7
         Y6+g==
X-Forwarded-Encrypted: i=1; AL+hErGI7Uk6k6e+aO7B1xoNINJgvpRTDCDDCMOnZrcyW5qO0A1KXBBOZTLdaCQg+pI9Uvr13OGpJajXJtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t45wiqrq0AM2oGB04kD0+/b3qCcNuUORNFxxdkH3o73WdquFo
	kDRCsPp4wyACq/I2+DKGkaLnTcFXlJwDyV3pSPt827E4WL+fPyMxFgZ/0mchkqP4pdI=
X-Gm-Gg: AYBFou0OD+UzA06HBEFTbQuSz9hoGyB2igx/fPd/LS1EAzxLdMa8aFiky0D0UqPpcX4
	6egOWLTc7OVH/pA4zG3GKMl/nUsu7GEJuqcDPC/PWNT98PnJ5pfe4XppQSwf/4jrlKsDsJt//6Y
	gnVOi5iJa9Y9UHI2xyTu84bEtRLycicwi/5X+RSOjMCjhF+OY8rSoRCVmm1k6Vb3E9B0DuJb0H+
	wFP87TqQW3mt0/zofpu6NRQxa3nrzqWPY0XQkTH3K+PpmP8KgzycNyEUwAirIN5hs1H97pZfypC
	vrn7c26u6U3eBXOHknMYi8QaRrNYtbYcKwj1+tabWlpV1YsHWpAN5lzMqV3EmcC6jeAZ2Vh84OW
	NiehAQ07kq/fk/267akJVA2Sc8T+ncAnCD6c85jTwqCKpnpsLEjfArBs1tGjK7eU07/3ODO9uTx
	l7Vmvh0tY0zRPeLMrS+x3bqADFYdlPGBqzX05Nnnfe/V+J7TqWrsEAJmJta5abu5zUFwY2X9VXm
	Cwp2SxnpdDuUnD6Vty+y8zHsFQfnt7QUJGK8dAgFXQTO24sOuNXNjw0QydJsanNfNEzBv1+9vwI
	TjNJeRAVUAldWjFmjAsqtEl3K4cGz2gO2zYr+5HJUJviAvP2YW0smoja
X-Received: by 2002:a05:600c:8b8a:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb7da2240amr3295515e9.6.1794942966666;
        Tue, 17 Nov 2026 11:16:06 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/3] clk: mediatek: Model MT8196 PWM source selectors
Date: Tue, 17 Nov 2026 19:16:01 +0000
Message-Id: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAPGn/GoC/y2Nyw7CIBQFf6VhLQkgD/FXTBc8LopKW4GqSdN/F
 63LSebMWVCBHKGgY7egDM9Y4jg0oLsOuYsZzoCjb4wYYZJSqnCqB6olnl4Ju/sNk0AFN4aAYgS
 10ZQhxPcveOo3LrO9gqvfyt/I8JjbU900ZE0B7MaUYj12QUoutdeaCLvXnjkmiaHCKy+95YIE7
 q1UjqJ+XT8P9MwYvgAAAA==
X-Change-ID: 20261117-mt8196-pwm-clk-0f154aa0e720
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

On MT8196, a PWM channel can run at the wrong period: on the test
board, a 10 ms request on PWM1 gives a period of about 8 s. The
clock driver does not model the selector that picks the input of
each PWM channel clock, so the PWM driver can compute its counters
for the wrong rate.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      clk: mediatek: clk-mtk: Add composite mux tables
      clk: mediatek: Add MT8196 PWM source muxes

Chris Chen (1):
      dt-bindings: clock: mediatek: Add MT8196 PWM muxes

 drivers/clk/mediatek/clk-mt8196-peri_ao.c         | 38 ++++++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.c                    |  1 +
 drivers/clk/mediatek/clk-mtk.h                    | 16 ++++++++++
 include/dt-bindings/clock/mediatek,mt8196-clock.h |  5 +++
 4 files changed, 55 insertions(+), 5 deletions(-)
---
base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
change-id: 20261117-mt8196-pwm-clk-0f154aa0e720

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>

