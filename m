Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0244028FA
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737551; cv=none; b=hccme/rMH41aJAEM5VeyFGasYk5iFNFRdbufN+7sjuwYv2drOdApmzuVTEU4kElqiaZUAzv+ZO53x4r6WBWeadL1lRfbTPwvj6ls7/+J1qg+QGXWTlBU4GJEyZuDZoyYmo/i0HzM26qIL4oGuXWSsW+MgzgbnQ4d7GMMPP5taGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737551; c=relaxed/simple;
	bh=e4bFcTetKCUY0BiWFDdCjYfdtTZJIAxrLcBYwnPJ6cY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ARg7t6ycX1bc1+Pkj9iWAMFjbYFRq2e/8hSiXiHgrYajm6+j4pbXe/6IeoxJq1FteOX4fk4UrTU8Wh3pRgBSQ0GwO9u9ocIrqFmwocT0o4zsySYOAI1B4PF7/7ti6afi2gT2j0TCLqmoFX0gzIYNl8EHKSXqJZtk5yuVQmbpgoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UN0yR38q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UN0yR38q"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so29038415e9.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782737548; x=1783342348; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0G67qeINcThvr9unh9wEXsyMZVKpN32CweVhhELeDY0=;
        b=UN0yR38qZupuDkHVCk/7Hw6NhlRMoDYZxkuznyZtluTSIlKTliB3H2zAN5W3JN5XJX
         3It6g+9/AbI5vhF67FeVYun6/SxR+ELAvUIyrGNVyVDX9Cp9uSTcYgQKpw0i0qTCdEjY
         0v4gQkM6+lFYw4iGeDH9lsabTOVM+hb2TwUcNvEMY5tFOByUKy/0nNve8VdAc979Km95
         LMN49H2i9WH1CD8N3CbrLJ+D4MPRrghzKy4PQSxZ7YQFhoaBXhLqf60Ej0qMfBumGDOr
         woxDdWTrhQn78SGuCMFTyQWUG5isIoBuNnqxQPxqzcE3VIFgDJRaprR2ZofQFN4Vmuj5
         bSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782737548; x=1783342348;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0G67qeINcThvr9unh9wEXsyMZVKpN32CweVhhELeDY0=;
        b=VzcCI/qktAbUo3qlb8Vtg+vQcRbvHK7eMYgO9Z4x2J3YvQIlOmMI0lt/+s9ep9zIlT
         Oo8/fV9hmVy795s5MUtHz4Ohbjp5IJ9tPYCVPKhXcSw7EAh2eeLQpKMlTpg55NCDFoA8
         hP0ZiPenbikF/aT6gj2dFqGlMSivAwXupodSDVN8wUtHDsyC5ZnGAFpdEyqlflXr6t9v
         Ky7c/RMMaJ/WIMIaje5E4u+wtedcJBKlQTG6SYC2FoomQ5BVkKAiVjbwABffyh59yWVM
         656SQVpU+3ETzov4A++b4py/vKdKNBp5vfQpQs0Wtgvx2hCz2w/MF2ZCVDAcsEIqRv5K
         kZyg==
X-Forwarded-Encrypted: i=1; AFNElJ8T9xdksUUlwfHaHuQzMxSRM6Pv89A+1mfYo+1UX9eMFozEJzcHiLqH26UJ2+fcOs8vPp/lDgx7uSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yziz87P5F7YgJQq91SVieUazDoSUg41TP5LTFWCkcurRn0NkEFj
	4JHJVfGUaJp47RrAJC0wPn7NuZwU6ne0sZ/bFpzsl7dGEOS/WR/zJ04S29PTgVBYikuXn2xU9y8
	ghJHb
X-Gm-Gg: AfdE7ckKfMkdk1lSNS91uttduReRUguPMG5zb+Eush8KkVeFhiA/wmVmV4KHuBPwCbK
	2iRh1Kr3IsDDirCvSMMWOIJYEhmgXJxJyqgd+3RtW1ISgG4Iq36yiDrIaHGfdUX1bamcWjRTr2N
	ypG2Qn0iyb81h3Assb5Qu5nYruY4SMZXnwK1uk8E8TFLrxaFD7Qjeuqz64oovnaiWzBdyahRN4t
	bpNkKMiSNOEUvyz6kRo0oV15TLqRmYG2Bstyy3zWNmbVh1XzhLhC9EwCcLybyrZaCfq9oUsu/Sx
	lx7TbUmUdDpi0YsUxpRGQnNdPUnsIvlLP4jndI3PemzNWNld0Fu3vI4G4cfKbrXeucnc4oAObJo
	3HD9dozwDFNEUdtYYe6aDbnzpjBgL9kMzMDAsXtDNKvvEmt8so3mjwTNLGFxfA1lZXuRqB5SyRN
	H9Ldqf66XsolU=
X-Received: by 2002:a05:600c:4f8f:b0:493:a75e:cf2e with SMTP id 5b1f17b1804b1-493a75ed171mr81258945e9.25.1782737548101;
        Mon, 29 Jun 2026 05:52:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926f94f213sm276984895e9.12.2026.06.29.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:52:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Paul Walmsley <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,
  Richard Cochran <richardcochran@gmail.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org,  netdev@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733
 CCU and PRCM
In-Reply-To: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech> (Junhui Liu's
	message of "Tue, 10 Mar 2026 16:33:53 +0800")
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 14:52:25 +0200
Message-ID: <1jo6gta4qe.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 10 mars 2026 at 16:33, Junhui Liu <junhui.liu@pigmoral.tech> wrote:

> Add support for the main CCU and the PRCM module (R-CCU) found in the
> Allwinner A733 SoC. The clock architecture of the A733 is an evolution
> of the previous A523 design but introduces several significant changes.
>
> One of the key changes is the introduction of a "pll-ref" clock that
> normalizes the physical oscillator frequency (which can be 19.2MHz,
> 24MHz, or 26MHz) into a consistent 24MHz reference for the entire clock
> tree. Additionally, while the A733 inherits many module clock structures
> from the A523, the MCU_CCU has been removed, and the overall clock tree
> has been expanded to support more new functional units.
>
> Also update the sunxi-ng SDM (Sigma-Delta Modulation) helper to support
> a new dual-pattern register design. On the A733, the SDM enable bit has
> been moved from the main PLL register to a second pattern register
> (PATTERN1). The driver is updated to handle this register layout to
> ensure accurate frequency synthesis for "pll-audio0".
>
> This is marked as RFC because the parent clocks for several instances in
> the main CCU are difficult to determine as the user manual provides
> limited information on their specific clock sources. In these cases, the
> implementation follows vendor practices and previous SoC designs,
> generally defaulting to "hosc" where documentation is lacking. In
> contrast, the bus clock gates in the PRCM (R-CCU) are explicitly defined
> based on the Memory Map in the manual, which clearly associates each
> module with its respective bus. Feedback or insights on these specific
> clock parents would be greatly appreciated.
>
> This functionally relies on the RTC series for the A733 SoC [1].
>
> Link: https://lore.kernel.org/all/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech/ [1]
>

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> Junhui Liu (8):
>       dt-bindings: clk: sun60i-a733-ccu: Add allwinner A733 support
>       clk: sunxi-ng: sdm: Add dual patterns support
>       clk: sunxi-ng: a733: Add PRCM CCU
>       clk: sunxi-ng: a733: Add PLL clocks support
>       clk: sunxi-ng: a733: Add bus clocks support
>       clk: sunxi-ng: a733: Add mod clocks support
>       clk: sunxi-ng: a733: Add bus clock gates
>       clk: sunxi-ng: a733: Add reset lines
>
>  .../bindings/clock/allwinner,sun60i-a733-ccu.yaml  |  107 +
>  drivers/clk/sunxi-ng/Kconfig                       |   10 +
>  drivers/clk/sunxi-ng/Makefile                      |    4 +
>  drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c           |  276 +++
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c             | 2375 ++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_sdm.c                     |   51 +-
>  drivers/clk/sunxi-ng/ccu_sdm.h                     |   32 +-
>  include/dt-bindings/clock/sun60i-a733-ccu.h        |  289 +++
>  include/dt-bindings/clock/sun60i-a733-r-ccu.h      |   39 +
>  include/dt-bindings/reset/sun60i-a733-ccu.h        |  131 ++
>  include/dt-bindings/reset/sun60i-a733-r-ccu.h      |   23 +
>  11 files changed, 3311 insertions(+), 26 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260202-a733-clk-0d4fc00a9f9c
>
> Best regards,

-- 
Jerome
