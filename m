Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076388;
	b=UjiJu56Qbk9FOm1Ihd8zai9c8+l02uz2gWIy4ClsvsbN+DKMao1WnE859y9+wijRGgcm
	 r6UZMTZO7HR988NbamjA80CvY5+zszFUKhs0DI+KOoQsNYg7HWPcQeovfsu23V+tU3AFU
	 s+7b/IQV32LlG4k9owipnCmRMpsfrRhjI1QqNF3ztJ6Tj2cUtM/bkdYjf4lJPz5ctbHFB
	 m+C2VNoVfk8qUwJZIaQsuRVLXosUxDC2fp7jMPhrzHLR5nCgZQd1hGcnsRxGNGmFyEvcx
	 Giv9s65VUr5yrIV1ZbPGH7F3VT0/n/3vU6aGsbXEpvXussIYNjILeG0isvTthxNtHcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=p+dKc+IASGuU74BQrkjO8c1LFAuMGojRAMZOBhZUcyk=;
	b=3++DU+W4uNQTuLYBYfoqDjUUQthmlRmRN3gozgxGo8zSMmh/O09EJMdy5lyIq2FIeF16
	 VllfyvfINKx7nMnJnjsa4NBrnPpkqYIrpkIQIHwyJ2QG5zSwIEOpNNmaLhGMhl1vfF86c
	 M5Uw8RNQdGUgLc6POLgor0saN3dHbIcrciG2LFI4I3DN9IvLS8tfhHBSOoXJ5x4snmgzv
	 bVRRtfYloB3UY/C2GpoQPbb6XQZ00KpTp9oeMfR3n5rU+0aNvKX9v7xYVDd4LhRzJKEI0
	 ku/LoRLcPH8UTb6LAlZYOKWUU+lNoUtftmwqsKQFgCnN6d/rujHI9//1fstPTeH4UIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wknl9oxm;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EB8606A326
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 08:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4EB8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wknl9oxm
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so16759815e9.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 00:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795076386; x=1795681186; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+dKc+IASGuU74BQrkjO8c1LFAuMGojRAMZOBhZUcyk=;
        b=Wknl9oxm/wTcyejMFrf5muGsLwjYaLksGm1GPXm/Z4mLQhEZEwO5VKcss/pY83dgBl
         ZQZUU8SifI3V4VdMDA+xJaPUTFPwXsAtmhWh3SOfzBIR4EgyHND1fMDq+lhD017iSI0Q
         49ZXq/2NCZ6tGI4VNzjIvNHEA8iOlT5Qz431acJqtpWGdIk09FMJA4rJO9A/gajNjKEN
         dyEOso9ykAZurpuzpofjEI1WKIVp/tS3t25X00ve7J017D4KMiFF4mpt7+xHpUMQxWzZ
         K+5BDHi6WK4scNhXr3nn6GEt79Q+PsDfk3e9yncGm7RVGronLz57IA5nFEcyc3B071/2
         wBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076386; x=1795681186;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p+dKc+IASGuU74BQrkjO8c1LFAuMGojRAMZOBhZUcyk=;
        b=LRzDMTmoFe9XGXt2mgMKgoD7UJpn6t5k3RDbVobjy0IlBZA+y0ykexAS/VM71RhHt4
         33kivUWdz7HLi1wLQwqybkPLwCidEcmdxL5ijHv2AK4/IUFRLdEVmNA55YH3BdMDkuQP
         OJyaLTFWdaV6gmMIzTjtefxfdH9IaAvpYlO2V6wXshqSjuCBrSdvXzjGZsQxazsDbRKs
         QTJ8kyyoAwN4JMzxAyFkf4tWLsIPvFk6CHNF++esTb6/wRjPWvyT/c2Z1/lFZLBDasHb
         9P4hFOHLJgdu5n3MF9RQz7dWL9d1PsgatsmNC0b0jLHOEAv6fGub/+1sCRKPnTH97t/v
         8hSw==
X-Forwarded-Encrypted: i=1; AL+hErHfmaFcRt68SEk/edhSOoRJtCDNHCHvi1yk30xb0zg9vr1vrgmEW+Ppp9r6nnLz9v+Dg4X1aSpTIMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8N8MWaAfqwW1U4fgSaSF2YoS5r7KmHPEv+xwsOd0TKuAhLToO
	isPEZqRhAFnEzxsTTCUTqXQcVh0xQ+27LQG8RskIJRb/Oqp8A5i524ZEkfNklmpKiiI=
X-Gm-Gg: AYBFou2rIfiUJVobH1EoP/io9aOAPLtttuhWlDREAS7CeFCQyaUDWjMaf9SAyBPZcjs
	KOiHB9lGmkuc8a912jIjrJr74Yt8/LpfN2rNuYAJO/iVr/IfSqHyHfun0tIWfUUUpm4yY3R65wT
	DygOSNSN35gjAJiQSTrnNu1+ws4ZqW3uZMc8/WUGQ6R3nA8bL6SmWcT5Zpfo1zr0A1xWqsmMVVH
	FlgfJuQpHD9Y+saKYLb03c/d635DALueOZsHUG+HiYzZdBagBdrwO3KjPp7q96s4hFBq7ZlX0OG
	gfZkPuZjDSXxd4WR7TCcPLTAsE1XbcgTui472ZKV4keeEfM+M7Btrwv3E/fvy/1OkxvRaTeYpOn
	+ZI0f8cS0wvE9KaLnoTCaK4mmoWJ9WCJRPV0e3mmXOgwmhoXBAMBBmzMRH8ZnleegH8r+m4m/WW
	yBqsTyQlX94G3UzWc75t6gA7QC4nNi+++Fl3/JpIL74yb3pTc3Pruxm1Y/S0BGNbycickSa7018
	REjUN7uiQ8R9NsXtsaR9hSNZ8KgoXRXYVAOo/7hhUBiLuBB1P0R5k1wlORjzs3fvrucTINjCgYv
	LypQtGE7fZd6cUMb6k8LMQFZIp6ww2bcWO8SzF7U7yVQEyYn
X-Received: by 2002:a05:600c:8b63:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb7da27088mr96761205e9.28.1795076386236;
        Thu, 19 Nov 2026 00:19:46 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5656asm17330585e9.3.2026.11.19.00.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:19:45 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Gregory Williams <gregory.williams@amd.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>, kishore Manne <nava.kishore.manne@amd.com>, Izhar
 Ameer Shaikh <izhar.ameer.shaikh@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 Ronak Jain <ronak.jain@amd.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/15] accel: Add AMD Versal AI Engine driver (with
 Versal Gen 2 firmware support)
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
Date: Thu, 19 Nov 2026 09:19:45 +0100
Message-ID: <1jcxs12py6.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On mer. 18 nov. 2026 at 15:31, Gregory Williams <gregory.williams@amd.com> wrote:

> This series adds a driver for the AMD AI Engine (AIE) found on Versal
> devices, together with the firmware changes the driver depends on. AI Engine
> is a tile array based accelerator used for applications such as beamforming and
> machine learning inference. Tiles are organised in columns, and groups of
> columns form partitions that an application requests, initialises and releases.
>
> Several registers in the AI Engine array (column and shim resets, memory
> zeroisation, tile clock gating, NoC and interrupt routing) are privileged
> and can only be written by the trusted firmware. The driver therefore
> packs operations into a DMA buffer and hands it to the platform firmware,
> which executes them in order.
>
> Firmware patches included
> -------------------------
> Patches 1-10 are not part of the AI Engine driver itself, but the driver
> cannot work without them, so they are included here to keep the series
> self-contained and reviewable in one place:
>
>   - 1-5:  zynqmp firmware driver refactoring and a va_start()/va_end()
>           fix (patch 2 carries Fixes: tags), preparing for the extended
>           SMCCC call format.
>   - 6-7:  Versal Gen 2 compatible string and firmware support, where all
>           EEMI APIs use the extended SMCCC payload.
>   - 8-9:  Versal Gen 2 clock binding and clk driver match entry.
>   - 10:   firmware IOCTL support for the Versal Gen 2 AIE run time
>           operations, used by the driver.
>
> I am happy to split out or reorder the firmware and clock patches if the
> maintainers prefer to take them through their own trees, and would
> appreciate guidance on how the series should be merged.

For the clock, it would defenitely be prefered if you could split out
clock part, especially if you later need an immutable branch.

`b4` makes it very easy to handle series deps, please consider using the
related tags

https://b4.docs.kernel.org/en/latest/contributor/prep.html#working-with-series-dependencies

>
> AI Engine driver
> ----------------
>   - 11:   devicetree binding for the AI Engine.
>   - 12:   driver core: device probe, partition request and release.
>   - 13:   pm ops: building and sending firmware operation packets.
>   - 14:   enabling and disabling tile clocks.
>   - 15:   partition initialize and teardown (reset operations).
>
> Previous submission
> -------------------
> This driver was posted for review a little over a year ago:
>
>   https://lore.kernel.org/dri-devel/20250702155630.1737227-1-gregory.williams@amd.com/
>
> Since then the scope of what is proposed for upstream has changed, this series
> is considerably different from that posting, in particular targeting only Versal
> Gen 2 support. All comments received on the earlier posting have been addressed
> or in this version.
>
> Abhyuday Godhasara (1):
>   drivers: firmware: xilinx: Add IOCTL support for the AIE run time
>     operations
>
> Gregory Williams (5):
>   dt-bindings: soc: xilinx: Add Versal AI Engine DT binding
>   accel/amd-ai-engine: Add AMD AI Engine device driver
>   accel/amd-ai-engine: Add pm ops for firmware calls
>   accel/amd-ai-engine: Add support to enable/disable tile clocks
>   accel/amd-ai-engine: Add reset operations
>
> Naman Trivedi (1):
>   dt-bindings: clock: versal: add Versal Gen 2 compatible string
>
> Senthil Nathan Thangaraj (8):
>   firmware: xilinx: Separate TF-A checking
>   firmware: xilinx: Call va_start after pm feature check
>   firmware: xilinx: Add comments about number of arguments
>   firmware: xilinx: Use match data for ZynqMP/Versal
>   firmware: xilinx: Rename zynqmp_pm_invoke_fw_fn()
>   dt-bindings: firmware: xilinx: Add Versal Gen 2 compatible string
>   firmware: xilinx: Add support for Versal Gen 2
>   clk: zynqmp: Add Versal Gen 2 compatible string
>
>  .../bindings/clock/xlnx,versal-clk.yaml       |   5 +-
>  .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |   3 +
>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml   |  61 +++
>  MAINTAINERS                                   |   9 +
>  drivers/accel/Kconfig                         |   1 +
>  drivers/accel/Makefile                        |   3 +-
>  drivers/accel/amd-ai-engine/Kconfig           |  15 +
>  drivers/accel/amd-ai-engine/Makefile          |  14 +
>  .../accel/amd-ai-engine/ai-engine-aiemlv2.c   | 441 ++++++++++++++++
>  drivers/accel/amd-ai-engine/ai-engine-clock.c | 154 ++++++
>  drivers/accel/amd-ai-engine/ai-engine-dev.c   | 255 ++++++++++
>  .../accel/amd-ai-engine/ai-engine-internal.h  | 377 ++++++++++++++
>  drivers/accel/amd-ai-engine/ai-engine-part.c  | 140 ++++++
>  drivers/accel/amd-ai-engine/ai-engine-pm.c    | 472 ++++++++++++++++++
>  drivers/accel/amd-ai-engine/ai-engine-res.c   | 184 +++++++
>  drivers/accel/amd-ai-engine/ai-engine-reset.c |  69 +++
>  drivers/clk/zynqmp/clkc.c                     |   1 +
>  drivers/firmware/xilinx/zynqmp.c              | 340 +++++++++++--
>  include/linux/amd-ai-engine.h                 | 115 +++++
>  include/linux/firmware/xlnx-zynqmp.h          |  65 ++-
>  20 files changed, 2679 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>  create mode 100644 drivers/accel/amd-ai-engine/Kconfig
>  create mode 100644 drivers/accel/amd-ai-engine/Makefile
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-aiemlv2.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-clock.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-dev.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-internal.h
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-part.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-pm.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-res.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-reset.c
>  create mode 100644 include/linux/amd-ai-engine.h
>
> -- 
> 2.34.1
>

-- 
Jerome
