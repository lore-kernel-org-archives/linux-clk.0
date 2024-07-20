Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AB2144D21
	for <linux-clk@vger.kernel.org>; Sat, 20 Jul 2024 17:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721497100; cv=none; b=CQK+MCEt9NlgliPTc/CCBE8e/kIY0UG+TFi/eIXDGtSwYprfikC9TpjJe4/EXF4cJY9w6O88ksuMm8d0gVIL1Xf8UwyJKt+422n5x81noVsaQgLJxNwYFlncRTk2ag7ielGGCyOWv5SYdGeEl1VxLOfDW6MM2AGeGNb+3/CcAX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721497100; c=relaxed/simple;
	bh=tE3tp8gaxhwp2gKoWeh8kQuL//yIMJqCdlXobYU4jTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+Y6c/q/htrs57j+qWh8avMk4wotnjrtU3P1wnUOI2LOtJeAFzkswTHidtnn/IvUrFRf0Gsdgshu7llQKkZrTUy1Nxet4W42gYBi3OBugLv68GiLS+RxPCFVe41ZiZd3x3pTGTqGYfO0aPK8S4MqkZA/ZCES0OKaX9RFpthxUTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=nJBVhH0K; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="nJBVhH0K"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70d138e06e3so316110b3a.2
        for <linux-clk@vger.kernel.org>; Sat, 20 Jul 2024 10:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1721497097; x=1722101897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sWCpCh1RT5YH2JXj048b4CuDC0szEul1kcrCj/vFPLU=;
        b=nJBVhH0KNsK7pgmuTgmT4SaW3nBO0Kip5u5Tc9FmUXIRpongXy0+nrX8TxlgaH3BER
         SxeO5poQ49EXDXPJS3qnXzUWUNwQZ7thGTcx/n1x8ex5m/ALJuBQza944KSqRI+brC4B
         +W5U8Xd/Ue8iMCmxCVaOw3uwCb8K2jE3qB80sCSDfjRHTmdPCm4nuFwvq+60IQrEVldZ
         N7vdGPPs6Kd1gQVIoGNE29cBeX5PVm2I5tximXlXOsiZL2QxlGCemrrORSLA+4OqTpRV
         G7wa3/GU0tPIX4809opnjUr8f7gjInmMtWDtOScjtmpmQD3dfiM9oHXpQ274l7kTgkQZ
         F8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721497097; x=1722101897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWCpCh1RT5YH2JXj048b4CuDC0szEul1kcrCj/vFPLU=;
        b=wcMDEpI+S2feiXVISMDB9LzQrWz7F41Rac+64lP/OLrceTED3lFYNVwAzdk7wIVcSK
         vPvzFV0hLw2/PhST8W/pGd4RkabmKKcYy7i0XHu01iQpiX/1dwQzWrRQNzC1FvC97h2h
         FVW3AlbB+VdSjIv+enJES+9i+s4/k1UUb5l8r2ITGIWi1apPn/bwmVuP+RIVR24FSnng
         eRTH9mY1yUq2zdyIjgiZQsMfSkWoLMJQZRAGJlqoFBzerdyowJNmtv4bgkqf2ROm1feV
         6Z4GIMQUoy1t3XbsxwM6RuuPXoMrgm6OOUg0NLwuKGTTI1iqQmrEqjdZq/Z+oY1EmdxY
         0KJA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7hXbbfQcUP3A6UyedhSOtbUjcu+AbCtyzKQquuuytgS75oGLVrZIp9dRizrLGoc8mHQD0dTK4mbYr9U+8AFN5uMozCV7yPqc
X-Gm-Message-State: AOJu0YyJaRscgMsk1am3+Srf2UpEhPTNMSlslBMaF+5g8XBMY5Bx8rJI
	Lcoe6OUSUJn7MsoWw6iUff/1R7/xc9VvnPmFlmMFdyglV5pp3KGjNX/qrGO+tDI=
X-Google-Smtp-Source: AGHT+IEZBuHQCUjuHktI2zZF92KPVH9iMx+hzhdgFbNzWtZpsCoZ0ZRMaTcAb2VDQAUawu8u74y0Qg==
X-Received: by 2002:a05:6a00:3e21:b0:70b:2ffd:424f with SMTP id d2e1a72fcca58-70d084f41bamr4758393b3a.15.1721497097427;
        Sat, 20 Jul 2024 10:38:17 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:9097:70ec:aab6:b6a8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d19312aa1sm388877b3a.121.2024.07.20.10.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 10:38:17 -0700 (PDT)
Date: Sat, 20 Jul 2024 10:38:14 -0700
From: Drew Fustini <drew@pdp7.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, jszhang@kernel.org,
	dfustini@tenstorrent.com, frank.li@vivo.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: T-Head: Disable on 32-bit Targets
Message-ID: <Zpv2Btw3dUXaJxp9@x1>
References: <20240719151027.16152-1-palmer@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719151027.16152-1-palmer@rivosinc.com>

On Fri, Jul 19, 2024 at 08:10:27AM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This fails to build on 32-bit targets because of a missing __udivdi3.
> IIRC the right way to fix that is to avoid the division, but I just want
> a tree that builds and the only real T-Head platforms are 64-bit right
> now.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  drivers/clk/thead/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/thead/Kconfig b/drivers/clk/thead/Kconfig
> index 1710d50bf9d4..95e0d9eb965e 100644
> --- a/drivers/clk/thead/Kconfig
> +++ b/drivers/clk/thead/Kconfig
> @@ -3,6 +3,7 @@
>  config CLK_THEAD_TH1520_AP
>  	bool "T-HEAD TH1520 AP clock support"
>  	depends on ARCH_THEAD || COMPILE_TEST
> +	depends on 64BIT
>  	default ARCH_THEAD
>  	select REGMAP_MMIO
>  	help
> -- 
> 2.45.2
> 

Acked-by: Drew Fustini <drew@pdp7.com>

Sorry about that. This patch makes sense as the TH1520 SoC is 64-bit
and I see no valid use case to run a 32-bit kernel on it.

Drew
