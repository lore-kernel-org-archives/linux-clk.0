Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78B9302773
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784675; cv=none; b=CoEREWa78e/jU7HcGLBPEwRsdhxLU7NNbRqdSkTDOdWXz4/u7kq1BDk2GPdGGRbJaUJ0RTK871OQrfiTtoBhkknYtrqbEBm2TNsrBaTf9rlKN7JbcbPs3BxK1PFTVxJz1RYxDloAZ8A83O8PmgAZwDVinaU1pgpZmoEeynycqvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784675; c=relaxed/simple;
	bh=BU2zF0S3mv+/DgWWcbZd1AF3XocUunMy7BAPkCdJ31o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rg6fRixw9WfBGRqrC9JjMWwQLhKTRDcBPgWU/rfQRC8bRZURrITUE6y9mprtdM3PwD1XphB+aNcrB2wTYWI9m+JqzFmeTn81Oe9kiknHMci0VH/vcmlkanO47XZhyGiS4maEAEYYGKv+Sm1cJLCadwcBFubXnYRsKG3wW0GXPKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f65.google.com with SMTP id a1e0cc1a2514c-943d0cafe77so637568241.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 03:17:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784672; x=1768389472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2xoUaAszeiwsol2C34FUeUV6F5U7+1lQLKuib8MADg=;
        b=Ht7rrBj3kz+GchFjQ2K0hGbbf0IpzKj+HjJeyWDZzvkqgnPPEP/mT+Bjv7xpWL0LgP
         eR8zyySGqSVsV37W7PSsMK2DSTqUBhkAL3i76LSgCHUDYrFQMh3kup/YI8GS1OMUCKn8
         T1pFKbUTY7DxQMh/3kCHNNSWPnpob+8t569d2QHcU9Q/qwUmVLI8CaHeUJes4Sk39Rkm
         JRaj3qrFvwBU5ZIIoyPhp5zzxq9/1/Yy3JLT938iOomP3rN0rwZHJSiP0RMjWJ/K17wh
         Gh5MwkuaAMNSoVqJYqFkLw/Hx/B3KO4StLGnb09ABjKUFtHLEQNRRjyl3B2qJzpdK8Oy
         oo+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBY4TuhXBkwkYOM6QBt0nZr8lokwyG3wlqJg4AkXijreToaL5WocRywRm95Vh5AUPaoArcnUFvmMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0JfaI6WK3tEFbVXNvDwZ8s5vO+AfqrBPDkedwzZXqlHBaKCrX
	0racOfpE/kfjwpOJKzbRbdTlYUUhj+wLNy2hpA87hjIy5+KhHp9FkXKLOvDGUGMANYg=
X-Gm-Gg: AY/fxX5QuEkwF2onJ2jmRbyqZ6YRokHVJwTr+sCpTV6EQiOBwKxQTCegXL8lNZUiEPz
	RvR8qqXIwHMATjuPGaUeLs3PJt6vd5YqQ/nCzLgJD54DPdABJGXGGaBV+1RTI15x9Nn8RtEPwXI
	e5Uy70zFYhRWn5v5PPkuDpjpoapG/JyXun+e+58i2cJWHtIoZ9oUfMt0baEYOeDF1uYtx7pFcWg
	4hH7zC4QDhSqxztpfVZRE75HXQ2777DMPaSVRmhZH4k3kcqTiq/gUShpwVgR+egJSB4eKe3ou1i
	eEPSLw1TxntSlt5uNSiqOVUBjU7/rhW2yWyCMi8eiDxY0kyGnHYSsru2OtjFzZRHWdGW4Hk+3OS
	GQERarANb3XXIzq7alRDp4vpAGDkQdZRYxcK1uxY7cGXXc+cznwS14XFsX1l7v6ew2iEfRDnAPO
	4G0nv+zV3wfC9my9iWUIJ52TNuaKMRbSlUs0Vxcjw72jixJlCZH3VM
X-Google-Smtp-Source: AGHT+IGHLaIbIE5SZ62cSs5Hit3Zs1B2YWNT5V5L415UO2Lp5C8GSQ/MSnzu9i4CSTBvX/giAoFm4g==
X-Received: by 2002:a05:6102:5043:b0:5b1:15:1986 with SMTP id ada2fe7eead31-5ecb6859ca0mr630100137.15.1767784672585;
        Wed, 07 Jan 2026 03:17:52 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772afecasm2478424137.11.2026.01.07.03.17.52
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:17:52 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-559966a86caso547881e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 03:17:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmCUeQ9Gc6IhSd2yNvAjWAaylKLFD43LNWLnSGZjXEN+RgUMHKRGLpANnPWKY/ILyE5Xx8OOH7Rbw=@vger.kernel.org
X-Received: by 2002:a05:6122:18b5:b0:563:4a88:6ecb with SMTP id
 71dfb90a1353d-5634a88727dmr391501e0c.18.1767784672114; Wed, 07 Jan 2026
 03:17:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208101356.101379-1-biju.das.jz@bp.renesas.com> <20251208101356.101379-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251208101356.101379-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 12:17:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUbAU68yuW7aok1WXMzNOVGTZtVJNZQLJyyrbvk976szg@mail.gmail.com>
X-Gm-Features: AQt7F2rbOvROcLbmdVhiAEERGEuuY21engHsV7c_FEPthrjOFbc3I4Drmat3D7o
Message-ID: <CAMuHMdUbAU68yuW7aok1WXMzNOVGTZtVJNZQLJyyrbvk976szg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Deassert reset on assert timeout
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 8 Dec 2025 at 11:14, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> If the assert() fails due to timeout error, set the reset register bit
> back to deasserted state. This change is needed especially for handling
> assert error in suspend() callback that expect the device to be in
> operational state in case of failure.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -1366,8 +1366,11 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
>
>         ret = readl_poll_timeout_atomic(priv->base + reg, value,
>                                         assert == !!(value & mask), 10, 200);
> -       if (ret && !assert) {
> +       if (ret) {
>                 value = mask << 16;
> +               if (assert)
> +                       value |= mask;
> +

Same here: if readl_poll_timeout_atomic() would use its own
variable:

    value ^= mask;

>                 writel(value, priv->base + GET_RST_OFFSET(priv->resets[id].reset_index));
>         }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
