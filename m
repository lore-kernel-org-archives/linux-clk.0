Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EE1327BF3
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770798899; cv=none; b=cqxztciKXuBKsI7CnPlCwz1olRDA9NerDImiCrE3UaQtmK1dNnjbqd/TGU4PxfNpazeVAZdEPMOra7zVwtO7FFrB2gytciqsjP34zgXQYNaCXtH6HtEwKqGH1VmcaAsg0zqc4S6Tu6nMe3iibOTtpJWgLLUHgnmLSmyQ9MOJdRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770798899; c=relaxed/simple;
	bh=cGq5QWXO0T3OHCprd8pgvsBLcjOO3QjwLDHuarQ5fkc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F5l10QUe1bM6tQUblt+Kq2N3V3uM8iDJrB8B+8uG7ljomn5GGMCUkWNyWh0mF+Twz+Dph0inrHx7JrsHVRFWqTTtFjss7Mj3KQ7XzwJXlmEv8hMKfWy8mGaxcRuAj+RnEz4WRKPUwxklY2vjVsabILS/nNk4w/R1/4bnRnO/y8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MBTqQ1PK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MBTqQ1PK"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4362d4050c1so4921283f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 00:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770798895; x=1771403695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfdcqFM0/eCHybIVXUmOHj6K5wyJWfZBIgSuomD2VWA=;
        b=MBTqQ1PKIlSd0cw60gvXDDHslwgDsssI8qvUYs8262Dp99GsXPuLStgX9gxwmVkD/D
         SAY2BePdai+nSqFLG3oWEI7bvrbMlbrMCtVf3uC9Q0bQDcM5iGpRb7HSJ10DfKp2fWNp
         xyXmDbSaXw2TJVR8wxFjFl3CJ7wM620w8Rh42RVpY5zG1NNO6uxfMR8n/LouRgxB4DJa
         BDVbscLnjXqJZkx5ok+KwyE/V/m1vkDpg0ALl0yvhRf52ClI/Okdpkiycz0oTjwECwKT
         7anU9AkoPrISvtB9R4GRoE7T7SZwd2EfaSlTx/At45uT8utf5Ffp5DqBOJuvuw4ZYbMP
         Xw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798895; x=1771403695;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfdcqFM0/eCHybIVXUmOHj6K5wyJWfZBIgSuomD2VWA=;
        b=rXtu+4nBNatdCzWGQlmHObwpEOaw5eC5XbZnbPUw7EdxqKTzdnN7SDTdhMb6jTkCex
         200iMrC3V1QYTRnG2ijcLgGzLiwzY7UB2akE+FK2D+gkYQR5BvQth7nodi3LCgvLV6HH
         6ZguTO74qqKrZ+LwptuJBE60teHT8GFrhljIpcYTa+x4ypMXg3GwJtF+0wH9qZMp+sdB
         rtxjuZ8ivUkS0VNh+tHpPnxuDt8uQ3DLK1C6jY6HG+ZBA5g70NUx9apmZuplRrUCSxIJ
         3FmtfbQ3q24SKH92Gf9uLk9r1hnl4jlrKPXMFtZKd4a/Ry1509kcjRe5+JfVsFxU4sYQ
         4Jtw==
X-Forwarded-Encrypted: i=1; AJvYcCVZOoZFspkCX/dr9pjY6F0cojCCxlVGyG5mfw1mbYrmVXXB35TG74mxuF7Bgcq2rlRe6IPmOdY623Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmwgGf2YQG4f3phXGGvpm+oBmN3QH667sYHtTFahUAp4XgqRyq
	6luz77yFiCkoApR3f4RzcDIq7NYi5QDiGAd5URZfV+nMjJ8kokqNZIo1vVhRQxU5EnQ=
X-Gm-Gg: AZuq6aL3Kk6w4SuaQGO57cJ/NhQWDsjfgZckPfYnoAZUwLKQRr5FkO2pwlQYqN38rOk
	3pC7PA/bNLzsVaSSCALA/gQBuU/8L46+44z0ZFcPwffyTX9+3H3qiqAGsuiBOpOQQGdilxjml5S
	84uk5IZ3GQ24S1h3EQbKYVFfUNF7qtipj6TnYwSjhQE+B2DT0ByHK6cFzS9GthC7NdbHA4ayqiY
	KykmqRHHLk5+XCnHfbxCp2pMBqWRZGiYWpP9u2n8K30zs/mhrf6zv+PKuEwsukoK4mSJnIAz4O9
	BfoqtXSynfFIkUKMWzTyoEQsS7n2vSNj8L5YZuPqBRmrnzAQwwuAwx9xNnVC1NDKBxvfYUm2Aa8
	f+b58de2UssZ9ztVMAzkhmC7tcKHcZMcEpy6zT6ui7i/jVPYF+1Z+Rsxw7paJ+IQrJRfcg92myq
	8k45qFc01dppgFSbkBXSRXLQ==
X-Received: by 2002:a05:6000:2386:b0:435:dd81:4f4d with SMTP id ffacd0b85a97d-4377a534f67mr8447959f8f.26.1770798894983;
        Wed, 11 Feb 2026 00:34:54 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:550e:9544:443b:8507])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43783d746a3sm3075953f8f.17.2026.02.11.00.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:34:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] clk: amlogic: Introduce A9 PLL and CCU driver
 support
In-Reply-To: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com> (Chuan
	Liu via's message of "Mon, 09 Feb 2026 13:48:46 +0800")
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 11 Feb 2026 09:34:52 +0100
Message-ID: <1jseb7y8yb.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On lun. 09 f=C3=A9vr. 2026 at 13:48, Chuan Liu via B4 Relay <devnull+chuan.=
liu.amlogic.com@kernel.org> wrote:

> This patch adds driver support for Phase-Locked Loop (PLL) controllers
> and Clock Control Units (CCUs) in A9 SoC family.
>
> In the A9 SoC architecture, PLLs and clock control units are implemented
> as standardized hardware instances to reduce unnecessary differentiation
> across individual units.
>
> All A9 PLLs and CCUs are exposed as device tree nodes, providing an
> accurate representation of the SoC's internal clock hardware structure.
>
> These drivers are designed for reuse in subsequent SoC generations,
> guaranteeing code inheritance and maximizing reusability.
>
> Makefile rules compile A9 PLL and CCU drivers into clk-amlogic.o (see
> drivers/clk/amlogic/Makefile), simplifying deployment and enhancing load
> efficiency (single insmod for kernel module).
>
> Since the foundational A9 DTS hasn't been upstreamed yet, I'm temporarily
> pushing the PLL/CCU DTS files to github for driver comprehension [1].
> These patches will be included in a later release after the base A9 DTS
> is merged.

Creating a new vendor directory and re-inventing supported driver
without an explanation, coding style, build problems ... the list goes
on. You've outdone yourself !

So NACK.

Chuan has been warned numerous times about his submission to the kernel
mailing lists, without a noticeable effect. I can only suggest other
reviewers do not waste their time reviewing this.

>
> [1] https://github.com/torvalds/linux/commit/d6a82e4cce675fa5146c5f638c2a=
926c1c8cb1d9
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Chuan Liu (13):
>       dt-bindings: clock: Add Amlogic A9 standardized model clock control=
 units
>       dt-bindings: clock: Add Amlogic A9 PLL controllers
>       dt-bindings: clock: Add Amlogic A9 misc clock control units
>       clk: amlogic: Add basic clock driver
>       clk: amlogic: Add composite clock driver
>       clk: amlogic: Add noglitch clock driver
>       clk: amlogic: Add duandiv clock driver
>       clk: amlogic: Add PLL driver
>       clk: amlogic: Add DT-based clock registration functions
>       clk: amlogic: Add A9 standardized model clock control units driver
>       clk: amlogic: Add A9 PLL controllers driver
>       clk: amlogic: Add A9 misc clock control units driver
>       clk: amlogic: Add support for building as combined kernel module
>
>  .../bindings/clock/amlogic,a9-misc-ccu.yaml        | 523 +++++++++++
>  .../bindings/clock/amlogic,a9-model-ccu.yaml       | 435 +++++++++
>  .../devicetree/bindings/clock/amlogic,a9-pll.yaml  | 134 +++
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/amlogic/Kconfig                        |  52 ++
>  drivers/clk/amlogic/Makefile                       |  23 +
>  drivers/clk/amlogic/a9-misc-ccu.c                  | 970 +++++++++++++++=
++++++
>  drivers/clk/amlogic/a9-model-ccu.c                 | 475 ++++++++++
>  drivers/clk/amlogic/a9-pll.c                       | 156 ++++
>  drivers/clk/amlogic/clk-basic.c                    | 219 +++++
>  drivers/clk/amlogic/clk-basic.h                    |  39 +
>  drivers/clk/amlogic/clk-composite.c                | 280 ++++++
>  drivers/clk/amlogic/clk-composite.h                |  20 +
>  drivers/clk/amlogic/clk-dualdiv.c                  | 365 ++++++++
>  drivers/clk/amlogic/clk-dualdiv.h                  |  27 +
>  drivers/clk/amlogic/clk-module.c                   |  42 +
>  drivers/clk/amlogic/clk-module.h                   |  53 ++
>  drivers/clk/amlogic/clk-noglitch.c                 | 584 +++++++++++++
>  drivers/clk/amlogic/clk-noglitch.h                 |  29 +
>  drivers/clk/amlogic/clk-pll.c                      | 701 +++++++++++++++
>  drivers/clk/amlogic/clk-pll.h                      |  43 +
>  drivers/clk/amlogic/clk.c                          | 464 ++++++++++
>  drivers/clk/amlogic/clk.h                          |  56 ++
>  include/dt-bindings/clock/amlogic,a9-misc-ccu.h    |  53 ++
>  25 files changed, 5745 insertions(+)
> ---
> base-commit: 4d310797262f0ddf129e76c2aad2b950adaf1fda
> change-id: 20260130-a9_clock_driver-ddd90357848c
>
> Best regards,

--=20
Jerome
