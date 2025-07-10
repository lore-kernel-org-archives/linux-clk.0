Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD31E505
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139971; cv=none; b=d/aCcIQReLCWj/F0gXtmz0PdybXjYP2aQj2tYT4kp0F8ydxo607SiqIIkFbMXM8Fpf+lt9TB6kWNEuDzXJnNM+8drDAUPSnxkN3XqCNoa89ky9fUIn2O0hsdYO8GW41XrONnZivi6z94NIKiQyqQFP9xINA3OCrtF9BLXDf3uGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139971; c=relaxed/simple;
	bh=/4AJhQ3AaDhcZ7WK23PKcdKMPfxtIlrU49yIOourqpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mRzQYSTsuos3WVVxgVRVpArW4v6FAVLV/r22yrnBgnaUskqc7oMrAfeX103Cyb72B+RgZjZI1VEOWktPZVT1VmXVladUGSzKYofaKpAT13K1a7d99G6+ptcvbNdKmzUewCv35yqX/+ZZyTH715JBZ7igOG8hW7B3Lu2yG/0agEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ioIYiq6m; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ioIYiq6m"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so535993f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 02:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752139967; x=1752744767; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0R0Hr4CE1RY0MwuVSGpjrdEwFEFKJYZxZJ8a7zSdbcY=;
        b=ioIYiq6m/kmQYXHEQIswz1o+pc2EQ/70S894qelGyNplel0Vz4q3vq65AHoNXFHiKb
         2QRrTcnXrNoIRhtaih8HbG8h5wfbgQPCcDpjV4S/mkJV2XPku7zdTef59y5mm2AuIl7A
         R4Vzew9EBvEJheWXsKfE5+JG+KqWWraJb6vfiGbVF2JLk/EyysbNBs3fy/WvUgqZPf5e
         p2Er34UL9rCw66hUgLc+lKLad6ieBxqFCIYefq9b1RIHGlw2uFyeiXbxfeWsLDUXhsxQ
         YUMmKRxIlNPXPfD6asv+de+RGXh75zI9VI6P9WIdlr0LlGZNBTVcNIQj7QnNGdkUtlUr
         FrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139967; x=1752744767;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R0Hr4CE1RY0MwuVSGpjrdEwFEFKJYZxZJ8a7zSdbcY=;
        b=qE9Yeo2rzKy0H2xgYczCv+6nnjYbZJg9jiiWn2w+73nojWGhJyqzuPtQWqXj4pSWUY
         xevCFxDDa+UpBIklaqz7fDSXnHeC7on7oD7zseSp/nD85xOQlSIPoHz0w7QHa9rUGhHe
         IwD/aY+ORkGyHxCZezePGVmgCDYYRmsC70hf9YpJ8F5kpwuIyXikeks/xI6EawxryMBh
         t85cviw4/XrWP2xW2HGPUCAFUIswIqAoJzRDgx4w+cLimXX3yfzEZzExf2LDoJs+y7Yr
         JEp3PVlUE2YG210/0+PgHBGbahaJT0iBlXKzLETjZQxkIwiw2YhUvpP7JmNBmtgva6SR
         ePJg==
X-Forwarded-Encrypted: i=1; AJvYcCXl+ICC+ytGl8E6nsI+yOlMhzpa/ORj2NJxIMQrINHKQcb0PuRS9sH1TpmHVTw6/xrbnggLdWKhD5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4z/qXd4CCM0iDrxORujXUwF94/FP8mdXAK+SvtUYcFtRVZOZD
	ISenTqDozID7qCBM55wHQHhnGrm5ag5bYp8Q5WMw2F0BjUfwRduBp2Hw47lPUHngqV8=
X-Gm-Gg: ASbGnct5StCTCZeqCcYHxMGI7C2waorYouyfl319aPqtP05zgTkN9tBeg0wmH2/r3sj
	4G6B59wf3qT3aZBvNyqkGlE0w7m06tljpQstToZVA0sckzjIzh874L5rusPr7/nnac7EMbS3ht/
	qZJ/KPNfn12/HlhfkBHL2QouaPkL6znCCuVnyZksQM88ZlOAjGMqui3MxW7LQL/897BacGP7+qL
	O9khANSXp4/99Cq3q8Iy//QLDSl2vx2U1di6PRMhUrMfQ5naI1WdkNCeG5Es1jDSmdOUgDsIOdt
	3B4XfKkIh8s+dRh7T/OKoP0LRyPJKiuiIqSMBVDC1R5MRs4nMsc6F1Bn5t4e4g==
X-Google-Smtp-Source: AGHT+IE1D9auCg4xgGpZ6zuosoUHXOAtKOoG+1ROyX+EBevhLJgYW2QgO4A9PEzjJQELPZ9swbZlmg==
X-Received: by 2002:a05:6000:4a12:b0:3a5:2f23:3783 with SMTP id ffacd0b85a97d-3b5e44ea414mr5599937f8f.24.1752139966897;
        Thu, 10 Jul 2025 02:32:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9fcc:5953:3d1a:6b41])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc3a54sm1402833f8f.39.2025.07.10.02.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:32:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v5 0/6] Add support for S4 audio
In-Reply-To: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com> (jiebing
	chen via's message of "Thu, 10 Jul 2025 11:35:36 +0800")
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 10 Jul 2025 11:32:45 +0200
Message-ID: <1jo6tspf0i.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 10 Jul 2025 at 11:35, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
>
> 1 Device Tree Bindings Updates 
> Added audio power domain support for S4 SoC.Defined mclk/sclk pad clock IDs in AXG audio bindings.
> Add S4 audio tocodec binding support.
>
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Add mclk pad divider support for S4 in AXG audio clock.
>
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.

Several subsystem in a single patchset spams a lot of people.
It is not strictly necessary here.

Ideally, one patchset per subsystem please.

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> Changes in v5:
> - Fix warning Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yam when make dt_binding_check
> - The audio reg is mounted below the APB bus in dts file.
> - Deal with pad clock in a distinct controller.
> - Fix warning for sound/soc/meson/g12a-toacodec.c
> - Link to v4: https://lore.kernel.org/r/20250319-audio_drvier-v4-0-686867fad719@amlogic.com
>
> Changes in v4:
> - fix dtb check warning 
> - add maxItems of power domain for dt-bindings
> - fixed audio clock pads regmap base and reg offset 
> - use dapm widget to control tocodec bclk and mclk enable
> - Link to v3: https://lore.kernel.org/r/20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com
>
> Changes in v3:
> - remove g12a tocodec switch event
> - Modify the incorrect title for dt-bindings
> - Link to v2: https://lore.kernel.org/r/20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com
>
> Changes in v2:
> - remove tdm pad control and change tocodec base on g12a
> - change hifipll rate to support 24bit
> - add s4 audio clock
> - Link to v1: https://lore.kernel.org/r/20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com
>
> ---
> jiebing chen (6):
>       dt-bindings: clock: meson: Add audio power domain for s4 soc
>       dt-bindings: clock: axg-audio: Add mclk and sclk pad clock ids
>       dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
>       ASoC: meson: g12a-toacodec: Add s4 tocodec driver
>       clk: meson: axg-audio: Add the mclk pad div for s4 chip
>       arm64: dts: amlogic: Add Amlogic S4 Audio
>
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  55 ++-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 218 +++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 387 ++++++++++++++++++
>  drivers/clk/meson/axg-audio.c                      | 435 ++++++++++++++++++++-
>  drivers/clk/meson/axg-audio.h                      |   6 +
>  include/dt-bindings/clock/axg-audio-clkc.h         |  11 +
>  sound/soc/meson/g12a-toacodec.c                    |  42 ++
>  8 files changed, 1152 insertions(+), 3 deletions(-)
> ---
> base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
> change-id: 20250110-audio_drvier-07a5381c494b
>
> Best regards,

-- 
Jerome
