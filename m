Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74EE3BE16E
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454517; cv=none; b=eJaWeIoFqDImkZ9qdkyAto4Ft+FUd1puw9b5y+rbVmozDhJTABl+K42UnVJFODOYFnST9iTQACw0evIYpWtn8uZhXqJkgbOlsdlhJpQRHVyOKOqnIVVSWiHPUYQOFeL+GJIPZIaH3BkaMOvghpzd3b+8C8IKv93q5pOQIvzKFiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454517; c=relaxed/simple;
	bh=AIVPf3es6gRbVZD1OjJY+7NHbNGFfUFHbP5UCcb+Ibo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKI+Z3kTVwrXlAFH9/0yb03LpwPbEvyYgq9D164CpHh7FDE01oQSXTdwMiPV2VCCLdsjMiBAeNvie4C1v58i6QN1fSspYxuZgg905yq49914gEg4aRIKeXS1YX35UVGaqi6NmrdDl/dzoIZedrg7V6UUXbVPFY8H79X36du7vFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so1073869e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454516; x=1775059316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsaKl4jnMb/iLg/tAunTjLfMtEyxekduMqGv5XbCBMw=;
        b=hjYthlxt5xKNcmxjTKpHP96f0CyIkLthDRHz9+R1wKWd2vJwRLdo8qWp9jHsE0BNCZ
         nxi/2hJAhr3YDU2qL+8cM27Jc9UdhIO5irKJKyqiC6kWdTQVupafbr0/c39w1IDEs7Jg
         Okt5dChZU+kvQi+XfutzCkAiXqAALmtnA6oHZfX9Qiww6Z4ArQY1m4ZRVUAOO0ie0BuZ
         weQh2TrwH3ZRAR88fnhKDmnokiIOOmsQjSX4ZzG3xk4BtUUeGIm6SGwSIVbHrFLoYu5k
         K698SNB40XK79wwB/AuP5bfL3hT11B/5H9g6NZY7F9kc0DjkZjYe1qJApr9Hpkgat9S0
         w7ng==
X-Forwarded-Encrypted: i=1; AJvYcCXs4ilnVmvRk2TB8IPuhngBv/Bcm3s3qB8rwq8uI4N0LezlnGCgjJfqCXxm6pXErshmGh8j2s0NDMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTqjzPrR1toGkPKUjTlXFi0STanZGg+B6H37FL8kfHbgBzUCrS
	RQ9SoKcPt39lDGuGdBeu36+QSo8Ujk3EVp6MrXmEEIgheAEoYaRbvtnFjEmiO82XjeQ=
X-Gm-Gg: ATEYQzzdZRvz6s/9Q4kAhUna2F5XJKvJN6Qer1WMHGAq2dpgS5VzDlVzNyja5U/phh+
	Kfu7jey33ZHd/798mxFOp1zMVyPevB7dmJdbFmcLVtDBg3FZmxy77a6vDZ0dtJyRE5KX+e4jmCg
	PNvqfxEwIQh/eWepgNizTZX19mCRJA1SKCN9gEigJJc0z6KO4I2BxzWqwR+054+vgTH66/B0F+J
	F3SxXPWZAtg3ckkYDvt+43AgGq42c9QNYYIOtT8Us27o/MJglOvlZ5bpWRO66tlJ2j4bTXS5CHD
	/QBb3idyh3pZ5Q9S8eiOeg0zMdWRX+2TnTsbE5MSnGRqLRXZTs/lkopfYNqaIfbvscMirehD+aU
	TmjUwlVT2d/59Ah2+7eBaUzYlEVXuDw+ZyO5f0CJhULXaKW+kGaCjvA0Af7zvC/N1Fx+RCafPf5
	BI2FI2WdH/R/tamSlUw8ua/i0vFpFCW8r5eRm88rGPSqk6i7RGKR7TcVR/juU9ZWca
X-Received: by 2002:a05:6122:d1c:b0:56b:8ba0:fd58 with SMTP id 71dfb90a1353d-56d220f0b54mr1732684e0c.6.1774454492274;
        Wed, 25 Mar 2026 09:01:32 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be1066fasm429002241.1.2026.03.25.09.01.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:01:26 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so1072915e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdbhsOk2234TymcHzN1xJdeL7gA1TahC2cL2wy8jQNkH40XfhyRuuE0KjTNM0evoFVVqnikzv2wWI=@vger.kernel.org
X-Received: by 2002:a05:6122:488b:b0:567:4f98:fb82 with SMTP id
 71dfb90a1353d-56d221484dfmr1919276e0c.7.1774454483312; Wed, 25 Mar 2026
 09:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com> <20260318085119.44717-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260318085119.44717-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:01:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKCxfWPTyoV6nMGHkK32eeZFSEXnL3L2C5kGtOTUtJqA@mail.gmail.com>
X-Gm-Features: AQROBzDNP67-ZuO5q3SWFmFGIjuJmCxHdim9QMA2vOC8b_1VjWoGuY0s8rTuFQA
Message-ID: <CAMuHMdUKCxfWPTyoV6nMGHkK32eeZFSEXnL3L2C5kGtOTUtJqA@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] arm64: dts: renesas: r9a09g047e57-smarc-som: Add
 PCIe reference clock
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 18 Mar 2026 at 09:51, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ/G3E SMARC SoM has a fixed 100 MHz reference clock generator
> for PCIe. Model it as a fixed-clock and assign it to the PCIe port.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -43,6 +43,12 @@ memory@48000000 {
>                 reg = <0x0 0x48000000 0x0 0xf8000000>;
>         };
>
> +       pcie_refclk: clock-pcie-ref {

I will change the node name to "pcie-ref-clock" while applying,
for consistency.

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <100000000>;
> +       };
> +
>         reg_1p8v: regulator-1p8v {
>                 compatible = "regulator-fixed";
>                 regulator-name = "fixed-1.8V";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
