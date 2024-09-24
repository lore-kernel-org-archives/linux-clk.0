Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657714EB45
	for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2024 08:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167807; cv=none; b=JmI8qRp7tPyZ/LreljlFSBAl/Ht0Kc6STCGzWF4+Jqg9Io4+b/4D+IqxIKVcL9mJCL8yUuQRvJgwRZg32yyhj04Ft9RaRjaE3Tlm849GJdVeip9WODCsuFQ8srpJOy3fqha0nEY4vc24fSMZKvwXBSGQuc8Wz1e6Yy0ztq6k6CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167807; c=relaxed/simple;
	bh=+2CeGMYiRSlh6fQ4E7yyz4z3vxxW7Xvs3yhXhBWBcvM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=byHQPFMAdojxySDFoJS/9zYhqFc0qV26rcwmoHMloZH8dZPokhoSRQxsqLFslyc/YNkAysq+8UzCZX/qrcjRMbdmycvMWiDm6cIfYDOh6RA4+uNjhX2ntjAV66uO32wStsRDYLmUHCiI5dYhrWAuQMm4sJoyJRKLZ1gJjMmh+G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mWFibbOB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mWFibbOB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so45447485e9.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2024 01:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727167803; x=1727772603; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RLT/SzHIzy0JlAtGhmMyl4zLyv9ksuRCgSOREEXXts4=;
        b=mWFibbOB/2p3Vw2yoNTfa56GPOlSJ2O6UtnsBsjUZnGi0uPBj17jnnayPfu6Nu5lDG
         iPqHneroLwfliwVABMUJQed8qrEBPX7DJ753DNLxXwxEY+SvPdXJTCMwqqhj9lOzv+on
         LjLACu6uC6YZyPUHbXyrBrSKh8oUY4kPiTmuEEp2FlBb83JIUjlEA6UhLOGy7yjBJ7xX
         22QC7ePgmaSd46EI2Q1Bv6ftFYcoBz5Qlu6ZPhQjmqukCQ8LvXtwepjm+FQBFuzOYCPv
         KSlVfMjoMdwGj8bMifXRIdrp3kD1q3w+WVcEfcZSOvlcvd0sh72hWyA+zfMlvuZHoOhA
         4P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727167803; x=1727772603;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLT/SzHIzy0JlAtGhmMyl4zLyv9ksuRCgSOREEXXts4=;
        b=Kt/P8eHWmz3Ruz6hfD+aQdPLejJMbJbLLh60YWPKVCLyQDRWH7LgU7mLzv92+bxIJk
         0ceK8dj6qdAcAWFcDCbKqDcVnOhQEPXFyOCAOGaRuZgSS6rV2QBX18Bolcs6tyqScBCO
         FcFjvRysxaROfanXLqteBz2CiAbm+V3lj2jIKVSAjOYU/Ycyu6fYz3/ZEZ5mH02216Ih
         hciKkb8RcqktsjUWlgLnUONOPLMVPwlZ3mfjJoywV1GxEysoGEZS2xOuTLX+oG9i2HYE
         JETmJNfxqHfu6GxAse2X22/XIobXyfCzykIEO7TQSB00eyjQ1USlzq6U9B3v+gp91zQj
         6ZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBQ5cAzOzeZmzNow8XAL6kjK0B19rtPSG0tpFWN5aFx5SL7UzbWr+4X1Sw4KxAkBC3KtDt5b5k3Ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTYqFb5iSIjko4haBp4ch+IbU6uOPsUAaKZVaGQCz0xLIyd8R
	a0srM/ThJujX1jm8omLjVNZJp1SJxfL/gpZDK4YwfK8ee7g4GbFIB/DVkQbVTC8=
X-Google-Smtp-Source: AGHT+IHYZcZN14sAyjcj8icXnMsQC74eoX/nukjCHNul7eCR0WgqA8i2UkpQG3AvK2nx7uxN33w1yg==
X-Received: by 2002:a05:600c:4fcd:b0:42c:baf9:beed with SMTP id 5b1f17b1804b1-42e7ad968d7mr87957755e9.27.1727167802666;
        Tue, 24 Sep 2024 01:50:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:885c:440c:fff5:ed00])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e9029eeafsm14811755e9.25.2024.09.24.01.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 01:50:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: pll: Update the meson_clk_pll_init
 execution judgment logic
In-Reply-To: <20240920-optimize_pll_flag-v1-1-c90d84a80a51@amlogic.com> (Chuan
	Liu via's message of "Fri, 20 Sep 2024 16:13:13 +0800")
References: <20240920-optimize_pll_flag-v1-1-c90d84a80a51@amlogic.com>
Date: Tue, 24 Sep 2024 10:50:01 +0200
Message-ID: <1jy13hxwp2.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 20 Sep 2024 at 16:13, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> The hardware property of PLL determines that PLL can only be enabled
> after PLL has been initialized. If PLL is not initialized, the
> corresponding lock bit will not be set to 1, resulting in
> meson_clk_pll_is_enabled() returning "false".
>
> Therefore, if PLL is already enabled, there is no need to repeat
> initialization, and the judgment "CLK_MESON_PLL_NOINIT_ENABLED" in
> meson_clk_pll_init() appears redundant.

Apparently you messed something up with b4 ...

>
> ---
> The hardware property of PLL determines that PLL can only be enabled
> after PLL has been initialized. If PLL is not initialized, the
> corresponding lock bit will not be set to 1, resulting in
> meson_clk_pll_is_enabled() returning "false".
>
> Therefore, if PLL is already enabled, there is no need to repeat
> initialization, and the judgment "CLK_MESON_PLL_NOINIT_ENABLED" in
> meson_clk_pll_init() appears redundant.

If the PLL is enabled, it has been initiallized, to some extent
yes. However we have no idea what the setting was. In general, I really
don't like inheriting settings from bootloader. It brings all sorts of
issues depending on the bootloader origin and version used by the
specific platform.

So in general a PLL should be re-initialized when possible. When it is
not possible, in most case it means the PLL should be RO and linux
should just use it.

Someone brought a specific case in between, where they needed to keep
the PLL on boot, but still be able to relock it later on. The flag
properly identify those PLLs. Much like CLK_IS_CRITICAL or
CLK_IGNORE_UNUSED, each usage shall be properly documented.

>
> In actual application scenarios, PLL configuration is determined during
> the bootloader phase. If PLL has been configured during the bootloader
> phase, you need to add a flag to the kernel to avoid PLL
> re-initialization, which will increase the coupling between the kernel
> and the bootloader.

The vast majority of those PLL should be RO then.
If you can relock it, you should be able to re-init it as well.

>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 3 +--
>  drivers/clk/meson/clk-pll.h | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 89f0f04a16ab..8df2add40b57 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -316,8 +316,7 @@ static int meson_clk_pll_init(struct clk_hw *hw)
>  	 * Keep the clock running, which was already initialized and enabled
>  	 * from the bootloader stage, to avoid any glitches.
>  	 */
> -	if ((pll->flags & CLK_MESON_PLL_NOINIT_ENABLED) &&
> -	    meson_clk_pll_is_enabled(hw))
> +	if (meson_clk_pll_is_enabled(hw))
>  		return 0;

I'm not OK with this.

>  
>  	if (pll->init_count) {
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 949157fb7bf5..cccbf52808b1 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -28,7 +28,6 @@ struct pll_mult_range {
>  	}
>  
>  #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
> -#define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;
>
> ---
> base-commit: 0ef513560b53d499c824b77220c537eafe1df90d
> change-id: 20240918-optimize_pll_flag-678a88d23f82
>
> Best regards,

-- 
Jerome
