Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9D71DE4F1;
	Sun, 18 May 2025 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747587059; cv=none; b=cq1KOEjf9jtsj5oQUHZkp04o7oD+Femf9bIagD0nXBTLmYNugGFi2LfT+uR/bpUubAT4oh8ATgc3xu4Ox+oER98Ew0bLqPEs6O+OtNKs0dqncYgNGShtMt/6TEM243u4kb++E696YuqVQMcJ6FKUeGKrFmk/EBwaS2iDnShTSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747587059; c=relaxed/simple;
	bh=Cjf9RkohDGX9YYNtqE4vGQjyj1EQX8nQWRzC7QDYNLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZdQjZTMcHMGnHTr7s3Ju3JjeaBpDQcLsaIfwk5LDzoa7g9A7zwY5e7aY/VIyIrE5viotgNwigLgwzidoGF/FnvRJBOeA5vpAVFtpKGsws574Vl+o5Lm+n2ucBO6MjMhr/ghBiCD4gvWhhgHBgqIjeavlwUnU0mQ20DKrJt48gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso32606291fa.3;
        Sun, 18 May 2025 09:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747587052; x=1748191852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMCSgP1jqOSpYfOyIfGCKgapP8IcMXQbC49KZ7zqoq0=;
        b=SWQoIgcYZA8KJAhS/l6/GisgCYXw7/I/k1fH9jrLiSdKrVyZaTboIOBgYzNm97dEHK
         UF7L950XNQDfWaRe7qUlpTgqQZxAaMIChxhjCVU9mfnvIBdYpyn+2rYTJOWktk/05sDB
         WRonXjkxCQ1dKdyB0rLGCAMfxm2ssqKFjSwudI6KOxGNenFJotMlEZG8MXfM0FwJ8E3Q
         6OKvyGnRzGnovSJsP9PJ3Dm9xoFhH5XdH8V7MQvP3uphHTJLsgW1U+4hwxcLk1f1wxLP
         uOhDA3y2gXO9SaGsVzOo+7SHaJ/WccDPo8gutjTNhbA1a+xvc1n5IJLNduxEnUnurfpC
         SreQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZNuHz6+AFjIfUdAVfncxDzXtKUKOxfR3ChH5DBxXnzw1uiaWYAVnGdahNn5fleUAp+2qDwH1R9h6c@vger.kernel.org, AJvYcCWZxaeryIcCFvy30gyJXxSEvefO01kVqv5MEYOzlZU8SdNnexEQ36dx/cUqbvI/iUTpAtoQju7Duw33@vger.kernel.org
X-Gm-Message-State: AOJu0YwPzbwVeaq0/vzwugR2qn32VG6W0e+TXC5YK0hMEv9PwCvQxaq/
	AWsO8lY2bXcVcc4g4uQO2UJvoM30sWuU6+paaaibjNLWp/9axTUL1yAXS8gbe57BL5Q=
X-Gm-Gg: ASbGncsaEbGz4VNQ3Up8s11Q9sgrYzhgMstOO6D/vjLn3nZi92b0Kx7vb7rEp6shtyW
	uLq2l8ZIuK5pm4+BVT8P/NDoqaQ1/wOye9I/ep+cO3Da/cmz7YIBYkCLLEHf3EAzfawgzqXO2Nq
	+GeaNUq8kIiSGuLIMOJEyhtnmPRKKFdK/cbwGH/TgzCAGTQ73Gam0UJTxXqg0T0Trm9g9L5Ic60
	7QBQ/dwuVjk2iSeWsOnu+WAFgS65wkmby4SjOIyHwbp/iHaJFmfj1Cp6ARqr5Kj7LYEOW2ST92S
	mWnCS5wpal3YavL9wfNKumquETACn4DHYcR+M7Y4FPSCysN/WsLtLUOpbB/QkcsSOgEkJllYLub
	RdZsHg2y7
X-Google-Smtp-Source: AGHT+IHkwpG+8xecYCrdO/ZVHxbbPZSw6mC6bUZ8Q0Tf71npwd4G6oGJ59zjGnodXUwDYW8pqngguQ==
X-Received: by 2002:a05:651c:324d:b0:31e:261a:f3e2 with SMTP id 38308e7fff4ca-328096a36dfmr27740601fa.1.1747587051449;
        Sun, 18 May 2025 09:50:51 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084caa90sm14970631fa.43.2025.05.18.09.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:50:50 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-327fcd87a3cso28950661fa.0;
        Sun, 18 May 2025 09:50:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVD2x2xmVULxhjwP4Apc4IU/wnqwAVxN04dreQBQBuKuaBthG6LQKxdJWnC8w1MJVhmi9gQne4UwDHn@vger.kernel.org, AJvYcCWrm3MIKzpsgNm7R1lkRuJkxSjbRWMuI1Gw1FQ4WfUllV2VQZnvNKZIOtxsTZ7SxcUxWRE9e2AxHw3S@vger.kernel.org
X-Received: by 2002:a2e:8a88:0:b0:328:685:7cc4 with SMTP id
 38308e7fff4ca-32809782356mr26567051fa.30.1747587050098; Sun, 18 May 2025
 09:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-7-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-7-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:50:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v67oQhoM9aFnOX9njcF3USmEz_80oqfrmY7jrMboHT8fEA@mail.gmail.com>
X-Gm-Features: AX0GCFthsimZ1Vpr-P15pdmflifaZ2Czon48jDxa1m9hAkmxkrKyvTCzCS0vxW4
Message-ID: <CAGb2v67oQhoM9aFnOX9njcF3USmEz_80oqfrmY7jrMboHT8fEA@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] drm: sun4i: de33: mixer: add Display Engine 3.3
 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>
> Notable features (from the H616 datasheet and implemented):
> - 4096 x 2048 (4K) output support
>
> Other features (implemented but not in this patchset):
> - AFBC ARM Frame Buffer Compression support
> - YUV pipeline support
>
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group, and adds a top register map.
>
> The DE33 also appears to remove the global double buffer control
> register, present in the DE2 and DE3.
>
> Extend the mixer to support the DE33.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
>
> ---
> Changelog v4..v5:
> - Whitespace fixes
> - Correct strict mode warnings from checkpatch.pl
>
> Changelog v7..v8:
> - Add top/disp regmaps to mixer for DE33
> - Remove YUV-specific code
> - Remove use of global double buffer
> - Remove unneeded if/then parentheses and fix an alignment issue as sugge=
sted by checkpatch.pl
>
> Changelog v9..v10:
> - Use names from vendor BSP kernel for register blocks.
>
> Changelog v10..v11:
> - move before vi_scaler patch as vi_scaler code references new DE33 enum.
>
> Changelog v10..v11:
> - Convert de_type enum to uppercase
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 82 +++++++++++++++++++++++++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 15 +++++-
>  2 files changed, 84 insertions(+), 13 deletions(-)
>

[...]

> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index b75008d05fc9..870f9b9daf0d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -21,6 +21,9 @@
>  #define SUN8I_MIXER_GLOBAL_DBUFF               0x8
>  #define SUN8I_MIXER_GLOBAL_SIZE                        0xc
>
> +#define SUN50I_MIXER_GLOBAL_SIZE               0x8
> +#define SUN50I_MIXER_GLOBAL_CLK                        0xc
> +
>  #define SUN8I_MIXER_GLOBAL_CTL_RT_EN           BIT(0)
>
>  #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE                BIT(0)
> @@ -154,6 +157,7 @@ enum {
>  enum sun8i_mixer_type {
>         SUN8I_MIXER_DE2,
>         SUN8I_MIXER_DE3,
> +       SUN8I_MIXER_DE33,
>  };
>
>  /**
> @@ -178,6 +182,7 @@ struct sun8i_mixer_cfg {
>         unsigned long   mod_rate;
>         unsigned int    de_type;
>         unsigned int    scanline_yuv;
> +       unsigned int    map[6];

This needs a corresponding change to the kernel-doc immediately
before it, or the doc generation build will produce a warning.

You can keep the reviewed-by after fixing it.

ChenYu
