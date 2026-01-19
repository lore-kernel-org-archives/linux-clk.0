Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A385D8632B
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838410; cv=none; b=IEn1lEUPUVb5McMGY9yWJKilbRi9JaZEXDHFXqq6IHIKts1TY7YpFOBmrrbEeH2vWKRCHHdlLm1DANH2aDv2nDTs3NdQrq3lTlKXqljMyO2vTQRgeDZblO5gsMsbNgb0txCugoK+LVgGo5RWp3wlYoOR6wwbF51NGZ4DJpByd98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838410; c=relaxed/simple;
	bh=eb6D6/a55vm9al21kajs54FVPI2y4Ag9eZRWr0kdwgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJGltvrjEpPMgF704eAVZm2s4nSihVGcb5Q8+cCeDMzhRGLw88xRLGMdZlHU9srXGa5RWa97ulLi1DUo1h6wWFP0p3LlG1S4956UyIOhAwieUNn16pwpz+ivMm8TlKpN5px5xv0xIxyF2k7a1WRGe9BvVkvHgPsTnqsUiqeg6RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5636dce976eso3451924e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 08:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768838407; x=1769443207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hT58BDTF1pvqexWRcVDA+bO694WnbhM+to2RCxxMZI=;
        b=VvouR9+gap7dVdx+NvV6nbrl5gB4VGBTDD1dDKh2XF+JM9jlrkq4Nncy9Z64rHfewd
         U8Vp0CCJ2Grwoj39p/8AHbQrxpK452zvXrn9Hk8iFgqnOQuoUtdFNNYN0HoNhVh08JsS
         CLrCPQC6FzZZKVhYkqdwEzwX+mV41bpApTdJznk54qAZPDyilWJ9cA7EHxQADB2x7xZW
         pkjGtwA5ljv+DZtQ4EMqDjmHCHNfn0xl9LVSzI0YDN6uFKCcNN5d9piNPMrxW4h7NGtf
         RpQYJj0oXAKV2LISBUii3aK2468SPWj2QaDjfgk1VKq/iOyHb0US1JP9noGUuidFO0wi
         N89A==
X-Gm-Message-State: AOJu0Yy0qEavl/EaVP8rHD/4kaAGAi1ELeYO0GKbjYeltVdtFhLY6YYv
	RxPoUkVL+3TfcQveQCQEVC8DRzWtNnSF2/8+B5wj2svSZ5qIzpewBwko7fZ8jsKK
X-Gm-Gg: AY/fxX7KHDm0FWNNz43scgW7/hgDBPCGyJWd/bElJv+d4XuMJlpeAPrp7Z77/0WzOzd
	9+sgcLkTiHUpnv1J0htxPsd48S73abyVQsT8NvIFBm/1RUqSPm4rA4qJwvIB5bVaGRTHA+Hj23R
	cyp2LWIoUxFFt3SKqvswmm/Uex7WOXICtGFm+45NUtraEM6phJHeyoqUKysdYEG2f3B5QosEge0
	eYPb4YdXy/wkqoLWDUIAeueVl/7eLGyClvIO8XiYYCFlD5LV8QcYZgxcd3I9DxnWz1YCOg/rkEo
	MCnsoeBTCWvp73c3tut0iGC2d8W0BZS4Ok15oTE/ndFGa6Sq9aY+xV0muGPX22FtjvVv5bM+BYV
	0FJpb+bQ7Tnl6nekdBdlNjDUB6Riy8lNEV3r0X9nv5pucflumgi1we0pAWJK2PvJ/bpWHNggqBp
	Zxo1JqF6ixkVZt8bdidCK1MJ7T8Ekmn63bFb85HY5rYJqhad1B
X-Received: by 2002:a05:6122:8c04:b0:559:14e2:9fc7 with SMTP id 71dfb90a1353d-563b61b3c7dmr3885106e0c.0.1768838407370;
        Mon, 19 Jan 2026 08:00:07 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b6eae96asm3029722e0c.0.2026.01.19.08.00.07
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 08:00:07 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ef31a77afbso3690824137.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 08:00:07 -0800 (PST)
X-Received: by 2002:a05:6102:c54:b0:5df:abc1:e6b5 with SMTP id
 ada2fe7eead31-5f192539aa3mr5432025137.17.1768838406940; Mon, 19 Jan 2026
 08:00:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119150242.29444-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260119150242.29444-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 16:59:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwD9+hYbut37gnJML-Fhz+6kDqUWOcgKSo1eycZRgsvw@mail.gmail.com>
X-Gm-Features: AZwV_QiLc3qN2dSh2kpzFDVeY21PCd07Pkeq9W0NJqI963gYqgaIk1PGN_jervk
Message-ID: <CAMuHMdUwD9+hYbut37gnJML-Fhz+6kDqUWOcgKSo1eycZRgsvw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, stable@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Jan 2026 at 16:02, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The 9FGV0841 has 8 outputs and registers 8 struct clk_hw, make sure
> there are 8 slots for those newly registered clk_hw pointers, else
> there is going to be out of bounds write when pointers 4..7 are set
> into struct rs9_driver_data .clk_dif[4..7] field.
>
> Since there are other structure members past this struct clk_hw
> pointer array, writing to .clk_dif[4..7] fields corrupts both
> the struct rs9_driver_data content and data around it, sometimes
> without crashing the kernel. However, the kernel does surely
> crash when the driver is unbound or during suspend.
>
> Fix this, increase the struct clk_hw pointer array size to the
> maximum output count of 9FGV0841, which is the biggest chip that
> is supported by this driver.
>
> Cc: stable@vger.kernel.org
> Fixes: f0e5e1800204 ("clk: rs9: Add support for 9FGV0841")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>

Closes: https://lore.kernel.org/CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91WOFnnYErLyg@mail.gmail.com

> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Update the commit message crash paragraph
>     - Add RB/TB from Geert

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
