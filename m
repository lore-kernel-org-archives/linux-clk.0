Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5123F2EACF2
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 19:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767985288; cv=none; b=iHVlAvjTsYHChP9EtmgquGTNfaMSWyOIr6PDg3VBEV6d6hVEshueZr1JO0OFTrfO2kWgZ7ObDWqyzLRn7pyVwKZrEe5mZEltWfEvP+v419VFLfDTblIWXNp7emVN7ljAJhXnJgz7ti/Q74H7FnjG3d9i+AR3zJOVt83GA7apEqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767985288; c=relaxed/simple;
	bh=/OswgkBEItc3w8E3juVd/K2jBM1nZ0KXsKSQ6/hrhT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTXrXxVzUq7r0/Gel1ec89Wfc96GcmdcR8gVubwcUjhD8ZyeHvOjEQIxqV59Ld/plJLpA+am35TVOKHFNV+qN4hREhBWNFzY4xkzhH1hglv4YZceB5yxCIisZm39fSQOYYTOsdhGhdeDYBYkn4S6PPZed4eF9q3Ati437AapjB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7cdd651c884so2472572a34.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 11:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767985286; x=1768590086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kI7MDthQA3ktqoj3LLmvl8KmAEBVvsPZr76uV+u11SI=;
        b=il0UQmUQgoXDjjp50/Cv5RY0lLh0yqG/wVlsGua6AtJL8yRxwCbZD3/r3P8C8lfYLU
         +rb4Zn0zAhXMRRxkfyy2GI5KSyEt2mjh322NJJiwnv9bCeMOBoPyK+hlvM4qArWtkujf
         6kMWwjXIg9vSo+2eTzv5yMOwJo63L953IcbMFJZDkJDic5C28zYR70ER/wk6fSGnGHrw
         QgS6AT2ClHHdhFYrVp7xGGVtKMfWo7RsQHzQPyJD74xB65urRbfwHOeB4dzMNrreQEw6
         1D9+m0Lls8hcbjzQycTf/Ssyrp/r7dn4La3JWHUVoK2w6j2ckCoV06Jabh14n/UMb26X
         A1eg==
X-Forwarded-Encrypted: i=1; AJvYcCWpABN4Ai3l6QJbb1PlVUFbhcNiioM1E5RHUQBMy2P0RKQttSuFgz/PfoMiqtrlHSkrZgjuZsdoSIk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ztunfIG8MQ2c4MlfWmNUjfgbvz9ZFE7oEFs6tu+QtYHhv+bd
	eqGAfHO+xfrz3amgM3Ewm+P+/4VyKbjLAPZuS3MtacTmBshqM8u8/FE+UHa/d/vh
X-Gm-Gg: AY/fxX4Jpp1D8DkFC6ud/9yl8ld3foA+a00OF5XOk/eNJ+EaO3ZJNMPtwpQtDQlLxnB
	ea8wZ965NVYPL0FbPaTKtC+NLuYhYMcOFxSnv2UqBN+LnYlhHzIc1jdGPEyRsxS0KHSSZ1YDMCD
	paf7M88Yg/vkqoOIfKPmVWyhAK/J6h0r5msXOtDKsWEUvUL5eLHsVsNMcHsqVc+Icd8qlacJjyc
	d6rOf4xlgKA4rltGHMTJGUKOWLIAnSwtpMWBUy3zNPKZK+mOEwvn21yVXACbIglb6ValN7yQitv
	LhqHRIOOkUIhF8NalM8dsMN0PMIHswotciqcUTqzTV/PTuKyLqFAqcR1voHM+k+ggzr4I3V+Q6r
	SyzqbUIikA1JA9w/DD2whaHGq//H3mUYqP/KpN8hekPzUm2dEdOVAHTT/1cdRiR7BcA6stgiwhb
	kZYsQtwBSELo5gJorYWVI5XgmL/Ac1bJ/NLh5KZrzPPvK7deIjk/HZt4k/XIrjwpY=
X-Google-Smtp-Source: AGHT+IHX7D0VZac2OpV5zIhG7uOkYF6yZPZ2uD/kFS5dPh0MnqtLk/kGTm631hc2EJtzO9WCSR3/NQ==
X-Received: by 2002:a05:6830:1302:b0:7c6:cd8b:2e5c with SMTP id 46e09a7af769-7ce46d11651mr6577264a34.18.1767985285793;
        Fri, 09 Jan 2026 11:01:25 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9f54sm8152035a34.23.2026.01.09.11.01.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 11:01:25 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-459a6261428so2164417b6e.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 11:01:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVmO2ItT6igv0VC2HPT6LfWAcaMeYxMM4Kqldqo5mXeOqf0votKqixmP1a4cXw7QCdW3IN9QpJlBgQ=@vger.kernel.org
X-Received: by 2002:a05:6102:50ab:b0:5e5:6396:48e2 with SMTP id
 ada2fe7eead31-5ec7573b1dfmr6430422137.16.1767983754869; Fri, 09 Jan 2026
 10:35:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <1d7a6c1380a80d82680e606a8523c76e0000390a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <1d7a6c1380a80d82680e606a8523c76e0000390a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:35:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-CSVVDHXEXA5GwjERKaUHO4xxd9HCX0nez0vtCT18PA@mail.gmail.com>
X-Gm-Features: AZwV_Qhl0ZCxFQW4Tw2z2j1hLTuejm9SEcPf1C0HVyWLKtwLrOiE5-4aIHJu94g
Message-ID: <CAMuHMdW-CSVVDHXEXA5GwjERKaUHO4xxd9HCX0nez0vtCT18PA@mail.gmail.com>
Subject: Re: [PATCH 03/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add support for the PLLDSI{0,1} clocks in the r9a09g047 CPG driver.
>
> Introduce CLK_PLLDSI{0,1} also, introduce the
> rzg3e_cpg_pll_dsi{0,1}_limits structures to describe the frequency
> constraints specific to the RZ/G3E SoC.
>
> On Renesas RZ/G3E:
>
>  - PLLDSI0 maximum output frequency: 1218 MHz
>  - PLLDSI1 maximum output frequency: 609 MHz
>
> These limits are enforced through the newly added
> RZG3E_CPG_PLL_DSI{0,1}_LIMITS().
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -153,6 +153,26 @@ struct rzv2h_pll_div_pars {
>                 .k = { .min = -32768, .max = 32767 },                   \
>         }                                                               \
>
> +#define RZG3E_CPG_PLL_DSI0_LIMITS(name)                                        \
> +       static const struct rzv2h_pll_limits (name) = {                 \
> +               .fout = { .min = 25 * MEGA, .max = 1218 * MEGA },       \
> +               .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },     \
> +               .m = { .min = 64, .max = 533 },                         \
> +               .p = { .min = 1, .max = 4 },                            \
> +               .s = { .min = 0, .max = 6 },                            \
> +               .k = { .min = -32768, .max = 32767 },                   \
> +       }                                                               \
> +
> +#define RZG3E_CPG_PLL_DSI1_LIMITS(name)                                        \
> +       static const struct rzv2h_pll_limits (name) = {                 \
> +               .fout = { .min = 25 * MEGA, .max = 609 * MEGA },        \
> +               .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },     \
> +               .m = { .min = 64, .max = 533 },                         \
> +               .p = { .min = 1, .max = 4 },                            \
> +               .s = { .min = 0, .max = 6 },                            \
> +               .k = { .min = -32768, .max = 32767 },                   \
> +       }                                                               \
> +
>  #ifdef CONFIG_CLK_RZV2H
>  bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
>                         struct rzv2h_pll_pars *pars, u64 freq_millihz);

So these definitions are shared with the DRM driver, and thus are a
hard dependency from DRM to clock driver.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
