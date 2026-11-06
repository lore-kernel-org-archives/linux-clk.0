Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953836;
	b=YSbs5j1hRJyinC1uWqXvgxwDpELYs08NGhmBRXYBnslsswsP5GLI4+LbGdAeeXxqPBuy
	 NTxUd61XrQmMzNhx67naEhL16SHiCNHvzaGfW0mxdOlCXX0gyKt56L4+f4BW4egQEQPVF
	 RoKixIkUUABTZEjTh8Hqi9BHlvHDfAog3noNBFabMJ27w1aMYHOy7xPOD95LhFsETBofc
	 wBH2B2wBby4IE9KP/XrcUSHUixaFb90yzT8v96xxMRVkuBnliyo5tVY/1XbClm8/2G2iD
	 H5KBBSoAra8IyPxcALGuRYy5zUS/YDesvChxp/K80K3Y/S9N4THqMq23vtCq2UB5jUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
	b=A9jNk6ZvvrHI5c2SOfMLu37YQcKpk+ElB5XL3Io2x5L5CwzHWI9/L6mb5X4xNf6Dojqx
	 PhQSacy0atDkt7r4Apwyv+NrjQdqdZEnjC6pjNiQH2BZ47wX/cUPcQzFpUJv60WgiBvqY
	 Xrt/jhmEUyRY+4ezwkjZrrGA34+Ec9YgqpsDYEN+EmIOubb0n9m/3J67tc1evtNJdzyMr
	 ZkJjeOy/rlt8ZW8RDtX/VxpWdVUn3HWFhIVkI0ho1Vs2npsD8YdM+qTQPtpYN0J2fBBZV
	 WX/mVV6fexkv3hLgZcSZJ457QIkYLNL2dhw7ASDwupu6xPqcBqQxI926qKzL7UF+lRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KOpLB47E;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5E8606A33F
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 08:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB5E8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KOpLB47E
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so2897725e9.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 00:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953833; x=1794558633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
        b=KOpLB47Ed4bk+JKdsP7yqQLxUdlyrMVxvYibBOjeWaQanhi64o4SrNArejPjmdbfPb
         CtKq7OzYt9cdEl2TWRiaJvIzqSplkLYUu4gjXp0NF7LrIkcd+kP6/bZjNgSd9s94sj6+
         2vARPHzD7YWIO75zzdXzZStAR0ld+MhW58I6OxxxYI6O9hBppbLITOMiTYE9S+dcNfLb
         wNUvKeAX9ioMloEuyFyo6g8P97C/ozKkdv9WP4b1Oq/O4Z0FDA0dC42b3JTcUW1ZTjwN
         TSBygiPJMElMxgnaVcJ0lPcLM+UcLH5uVyr88bS2szahmOu85ZXCNunvq/UmxOD/exY0
         nY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953833; x=1794558633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
        b=etVnSmthcUgyKNqwhC4ZFDx0Nx5LUhHjuk91VOJOs0zyBXhXnIfI/BFP7AgiHq/uRC
         HTgEX4Vcf+NCCvZIb4Z2o70ZdhhD+gDblybdLsx4GQSpq5DWC/NpaPpnWluLFK0nqYkE
         bT7NWmSKP9wdu5JNZq0QXeLy2UfS5K6Zz+Ti49vQIKLOfCzIXLW0pfBhvsTEl3wgYoon
         lA/GJ1cd81G2Hi4xt8uPLfe8nQxBCY7B5Uo1z24FfRgOiqWXlX1BPbwYK5uSqjSwidr8
         JMohRKHxVtNsG035DTrx2XtcUvv/vzpqlNWenhrorh2zdpwnEpKnWXaqHL4rasjzN0KD
         1e+g==
X-Forwarded-Encrypted: i=1; AKwUvBxPLBwy0bKOIPukF0VK8rHSBscAv0+lLlGQijxx3Nu9SfKPyR7xWDAWCR9gmflXQ0/yKx06rBeKHI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vTx50rYTRC6J0GsQBgJVCEx0QBfFH3rSOMQBsfJobKVxfP2AT
	zR3FJrkOrJSD9p6JcFHEZbdt76ffdpM3oUPv85yWYhJ+hqvfzG+YRzxiCXbltd7pRvE=
X-Gm-Gg: AYBFou34T9Lpg6JIB2diLtq8M5DGD4/b6UX6ybGoLRrNNIF/L4L6EXxBD3b0qPeEzFn
	UrNgeWOeOxy53j68ayfuiGXzIDAAYCgIoL+0iikk7ypHJDo92fDkXBcZXdeFn0fR/dttO1h57z4
	vriAZeIwiYcXTGpNHN1PWJT0im9uyUXatS9kiA564UfqoWXgKSUArn3muOmPOtigofjyCOsicAS
	PpsUTehlLEZhEOEbRhmtR0kXFUD0Z4M2iqXyxkQzQ/tTxHKbMNQkpruJZyqm1eNMmZmJO6bSVH4
	unADuk4z/Up1ZcwHEQRsB0wzUkEFF3Z9Sr7JxaNgzxSXFKPEIwrz9eJTOfaklMnI80wcmvXNGVz
	TY49CjY8VLDUudYthEhe+61J9TWXrBR0kmtHNX9BSkx3LXUySD+y3p3f0/7aS3VtkfEzDWw5kqK
	5EPdDWdtClBJ3WjeFi1F7ahBaMMZL6vLoxtYuEJg7e3PNKOYedZ7hxlz+fO8WI6AEZ9A3c+67Q2
	A+MlCotpj/3fxwtSjAkAoLOAqCJ4Ib3S+irt3teZLCFJQd2jnX+yQLofrMzr45SXbdyLO7AjKgn
	3pgmCMpi90jYyR9nMT7ij5IsXjignOLh6b6r3GQYvYxpyQ6Vew0Bnfzb417eqqMTHZnF/xQA1p+
	YpxdDwiWUoKzoi6z17OR5o7Luf/EnHCjLSWFCsF2Md7SKIJeafe36l0CrgVlBUWu0hFw=
X-Received: by 2002:a05:600d:8408:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4b6f7374730mr17693885e9.13.1793953832731;
        Fri, 06 Nov 2026 00:30:32 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:32 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/7] Add Amlogic S7 clock controllers
Date: Fri, 06 Nov 2026 09:30:23 +0100
Message-Id: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINYtLSguKUpNzNUtNtdNzsnWNU5LSjVLMzY2MzVKUQLqKihKTcusAJs
 YHQvhF5cmZaUml4CMgaooSi0sBVpVAlVWWwsAYXNdmIgAAAA=
X-Change-ID: 20261026-upstream-s7-clk-3fbe6f33652d
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

This series adds the clock controllers of the Amlogic S7 SoC family
(S905Y5, S805X3): the IDs of the clocks the firmware exposes over SCMI,
the PLL clock controller and the peripherals clock controller.

The peripherals controller is close to the S4 one. Two changes to the
common code come with the PLL controller: clk-pll handles PLLs without
a pre-divider and PLLs with an active-low reset, like the HDMI PLL.

The new clock headers are covered by MAINTAINERS once [1] is applied.

[1] https://lore.kernel.org/all/20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com/

---
Carlo Caione (7):
      dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
      clk: meson: pll: Support PLLs without a pre-divider
      clk: meson: pll: Support active-low resets
      dt-bindings: clock: Add Amlogic S7 PLL clock controller
      clk: amlogic: Add S7 PLL clock controller driver
      dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      clk: amlogic: Add S7 peripherals clock controller driver

 .../clock/amlogic,s7-peripherals-clkc.yaml         |  126 ++
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        |   73 +
 drivers/clk/meson/Kconfig                          |   30 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/clk-pll.c                        |   52 +-
 drivers/clk/meson/clk-pll.h                        |    1 +
 drivers/clk/meson/s7-peripherals.c                 | 2149 ++++++++++++++++++++
 drivers/clk/meson/s7-pll.c                         |  648 ++++++
 .../clock/amlogic,s7-peripherals-clkc.h            |  245 +++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    |   42 +
 include/dt-bindings/clock/amlogic,s7-scmi-clkc.h   |   27 +
 11 files changed, 3380 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-s7-clk-3fbe6f33652d

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

