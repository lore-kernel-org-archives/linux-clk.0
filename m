Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195961;
	b=NKTcpnnbQSfHrtpbD3I6R113yXkkQ3qJgNhNIen3BENmYyjeUbrTC/rG3+tRkosdZbaH
	 qkoRFXIW4QCxzuwf9qXWcIfdJ/ELSZDpLIDHk+glqr6YAjJQo/hn4W4GHsSBN5QV38CLX
	 HKebQgXgvnifWNd6DIjydbgJzjFRLd/jEHM3hfeRdkOf4hB7ugArhurjkJvMXvrjMC0qO
	 wRrUi8WgPAlwv1uusA9Wurs7KDMg7ruW97AOAcDjtrRBh9H9goyShRW73ggGYbZp95LB7
	 7H2dBfdccVMZ/vK0u3EqgzQIkmSg6WWsihbEgtvuH9ib0xXlo3ZIYNppZElnCwX9KJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=;
	b=lCUqrzEXDWgCWYf3t4Q5Eu6rR9xbDLmojdxxRnaBEgMOs3s5UYwbnf5oUlm8yEFlSjqZ
	 TvkTWePicJPyxrLjP9zzzs8v4nn5/3Pux/znpi6Dz5L+BbHmCO+esAQHB2ERXDKVFzU1R
	 UZgTnM7v91dnZ3/AH4c/i24l4ozb726vpzFVu6l62xGNTW3u9qqU3PA1YuHCRWI8ro8Te
	 M3oMyHNgDRwteA0vQhRV8HD2jzJlFBDCOlLV0I49rIN8BjrbMXQxtFfeXQ7pSIkqIyIoD
	 myVB6KgydNW9vQ/5MAdKlCvDqHCkBNkw5hxSKcRw1QmAbPgSDjHvmKWIUIcjgBgmgCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=d135ZkWZ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7037606A31D
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 13:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7037606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=d135ZkWZ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso5898715e9.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195959; x=1793800759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=;
        b=d135ZkWZ0M6ftIv8qzLvPuqcdeM5tiOBVyUBSN3wwckCuVNuqXSnhL2Buf1IoYHKIu
         B6jnFQVFZiphxcWZz+Dx9fEfUWyZZoC0l0rG/AdsZ7VIwPMfLuM8Gll06pKM5n7gO2Jz
         3fx14VVhccXZZwEV6t81TRS5U8smBXLzBV/8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195959; x=1793800759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=;
        b=PbOBpxfHYftm3LMYaEQeDdlnUCi/U7gQ0V+1b0hsEI5RAJh+Hsp383CRI/5pWWjGNK
         ZEZ2OZGGnTxDK+LwKlEiw4JHIi7FkwIb76wp3UANxg5wwYlFOwUcSOCRmIxAqz+02mgs
         7OmjN5Hg1h7qrLTXKlMjuoFsspf63ElcKgyUOJrcKvzk97EGSxsUB9gHNOBEWsxDS83J
         P6zNCfFcNQsb/vbXBf1KfG0h3lXB37REGwbxzpT/tRxTUeAxNRjg1shFL1nQoAb3Ci3t
         n9THxt4oQLXTBh8Jp9XmqHSGWUQm3AxiRdg1sn7kXpKAg8SemA4uZ4kKjPvEkL6thGE/
         kK5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWyW27In2H7pXedW2Ql1N80JpkIeTjDxPct5KZoZcRUDlKt4TeamgSq1882A5ZTsFo1UlfLWdEXco=@vger.kernel.org
X-Gm-Message-State: AFq9FYInrcWacwO571TrojBk2vPNNwsGJzljfYdUBOf74odt8OILT+wK
	zNFEE8WnBazxn0Vtpb+rOmASLQ/eq4N45HbZMSRcUJZPcbPwUrHQd1c57DU1Pp9lidM=
X-Gm-Gg: AYBFou1WKnvmPRnxZvQtdla5sk6s0MltFUMtvSnrJGTOdaR67JesGdaA6sV3OABEQWE
	jeKVwoHcIncSNZqOHiXpLeu/14gEVVDg23ZLHEZuqmmPXKcsQJBN0havRUka2bBRuRWLoS1bYwi
	iprUn2rOJ9jJWW8tvDoueHsIBAHRIXvA0mb29kxxso57qzepRrEeImQ/kwzjzNgo1BjhTp6s3jI
	LySeonN/58GPkNYQNdFuXApyFdnjBi4YHmnYimkkNV83hxE/ASWSCqtiLvDX/GLyzpVm+SbgOPR
	3R9GhQJ5B5FEA6czyQ/iYkUc/cf81QGxF0oBCC9quxIJ4PJL+lfKx8TzcLTWpxoL5rkk6OFVNNJ
	64JNcyhdKYIlp+kKhzrr9t65/h25nIlW1Lvid79yi5rcuWK1/A0tATWZEIS4J4DuTOsmz/YVCdA
	QjcQGmXMIDl7zEuO5Y7lhWyxVlDoEzdcOeqTAVj8IerGqsaOE6DNL9jX6FTUFAnz8Sw5YRpTfWH
	jxyVJ1E0yEycF2zTHjvpcsg9IuFv+4OKp3B6ROZmN29jev2gWxPFpnzxtDTOvmYTRn/rXEhcs6P
	rHX21z1FUwFXpkWPWMdHUAel2piyYNW+pttC6eXNlIQ+tM2DQijuIyV0FN2qBw93MMXH7GuCOT5
	RckHFhb3h5yHID6AM6TC+DNSOQtiiEHCvNHDd/bwPk/NAhz8NNCjeWtsdbhvyJWWW5Ruq7g==
X-Received: by 2002:a05:600c:3510:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4a966774dc4mr52485205e9.18.1793195959170;
        Wed, 28 Oct 2026 06:59:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 0/4] Select the STM32MP25 LTDC pixel clock source for the RGB output
Date: Wed, 28 Oct 2026 14:59:04 +0100
Message-ID: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On STM32MP25 the LTDC pixel clock is selected in the SYSCFG
DISPLAYCLKCR register among the DSI byte lane clock, the LVDS PHY pixel
clock (reset value) and the LTDC kernel clock. The SYSCFG node is
already described as provider of this clock, which the LTDC references
as "ref" clock, but no driver registers it, so the RGB (DPI) output
can't work.

This series adds a driver for this mux, probed as an auxiliary device
of the STM32MP2 SYSCFG driver, and selects the pixel clock source on the
Engicam MicroGEA-STM32MP257D-RMM display overlays. Patch 1 is an
independent fix for the RGB display overlay.

Tested on the Engicam MicroGEA-STM32MP257D-RMM board with both the RGB
(Rocktech RK050HR345-CT106A) and the LVDS (Ampire AM-1280800W8TZQW-T00H)
displays.

I am sending it as RFC since I am not sure about:

- the mux parents are referenced by their global names. Should they
  rather be described by clocks/clock-names in the SYSCFG binding?
  Moreover, no driver registers "txbyteclk" yet.

- the pixel clock source is selected in the board devicetree by
  assigned-clock-parents. Should the LTDC driver rather select it
  according to its output (RGB, LVDS or DSI)?


Dario Binacchi (4):
  arm64: dts: st: fix the Engicam RMM RGB display pixel clock
  clk: stm32: add STM32MP25 SYSCFG clock driver
  soc: st: stm32mp2-syscfg: register the STM32MP25 clock device
  arm64: dts: st: select the Engicam RMM display pixel clock source

 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso |   3 +
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso |   5 +
 drivers/clk/stm32/Kconfig                     |  12 ++
 drivers/clk/stm32/Makefile                    |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c      | 111 ++++++++++++++++++
 drivers/soc/st/Kconfig                        |   1 +
 drivers/soc/st/stm32mp2-syscfg.c              |  28 ++++-
 7 files changed, 159 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/stm32/clk-stm32mp25-syscfg.c

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: stm32mp25-ltdc-pixclk

-- 
2.43.0

