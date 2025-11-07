Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5FB245006
	for <linux-clk@vger.kernel.org>; Fri,  7 Nov 2025 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505178; cv=none; b=UJgFThoVS/Tp3RVMrLGkhQ5HOJqjoBlikuDSUyz5Msuj9AVfsnhKOUstpnCqedWsHyWjlJ9GFFsqgtIthuYg29XF+NG/5UZZeWTPN8cHb2ieLupbQtsA3NNvuFB+7c0oNtFQwvQEGHsoiVShN8FZy9IQFr2n109Pf4eYSYh8ozw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505178; c=relaxed/simple;
	bh=cbPm17O09V6lsegfM3GqXO19rmFeKE2vaUONa3e/JVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDJsb6vQo0rcfRpUiH87SpUIGliEToZ0kyb0sPGtr67yiHCsf33LoRasnQ0XggpQqmZ3xG6Z4o080/kYOWGpGskoW/O6VnoMGjuFpSKa/Tor/B/1/ITbUcv9mxstWwxftzugi0jtaw2nXuU7srjPhwQe/Kch9TKF7RQtfHgkXSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93524cd5516so269829241.3
        for <linux-clk@vger.kernel.org>; Fri, 07 Nov 2025 00:46:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505174; x=1763109974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RYljhwrU4HN65eQaadjk2lYVAnTSHmWGyK5wHOBjG5Q=;
        b=tpgnSUkH3/VhH5u9+a41H86JF3IY/VmwUpw92k5gEumh07Qfem5djCx04smDlD6hYL
         HCjL4TEW3VeJhEZTPRgsMjV+BQ8ytr2jynW5WEXeZ1Xwp1fi7hkeE6/+iex3TKDBpaYY
         HvnnQNcKNH140iJIjkSuGwHkkxmI+mycYd2rTbaUyZisezD/orVAsB6ENkpR8nrGAW9G
         xB+HZNPo+p6KFRD/ge32KCL7fnlM15lUqhOtu4z8IrUX7lGD+FOdzintkF6bHa9EbCrS
         OViYAGL22Q0mZ/gvKwUv09UCf6xtfzkLTJrCTj5jI8aDkLZzt4CN0JrRwMQtA2td6ESx
         8TZA==
X-Forwarded-Encrypted: i=1; AJvYcCUmc244KOMRpNN+Mp0mMJwrBCaLB+HuNwbdWay/CXY9h9vO46/aZIs2C8IJq2nJJJ2dOL0KYbQrq0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8MHSbsVtRX07yC0ql5KTwG9HZjxZtcMIdUkBVicnS+4rjLubH
	VUZH5qCSVXGJ/y603GrbFWtiwrbUM65UG2zciAct02Rp0XNyO6vt8b1L0vKRfKX29Pw=
X-Gm-Gg: ASbGncv7ZP9N5AfQayxG6OZlRCyCfPGJKTJZZvRMGf/t0jx/8xY6SVFjB4PfwfBMRX7
	ugjKMZyg3SpFq8pcIYFcl8h+iXVEhTUdfym5HoavyYJE8rUQiMUsytt1DZpqECycDah91eUyk5R
	4iCm/c2ZfjBpwf7i2xr76wzb6FnuGVoszHFGwkSF74nmN5jCUbX1/2rmC4mTzQ9cneHF7JdwSed
	5jbOosO+PA14e3qC940zx5G+OZ8iQAHERZwuGRjfRZsdE0cLyhWuJdwixgtCI2Nor7J9kjwo/ib
	MBeiwp4D4J9FtHR2Hs29TksUmRhRELX1Otpujf+AVgFez9OL3zphfDvnb8i9SByOS2zom/KnOdc
	xAKkfi0m58GjvqJ5tumXleLyTiAWQQHj7rTcsOP7eAoSVl0+egTH9kza0Lp0Xdjuy3w3CF8zeti
	aibN2pWSKS3Jt6uUi2XL5j3cr5dafcqrsG9ZvXiw==
X-Google-Smtp-Source: AGHT+IFxotb2wBtd8roIDoqp1uX57Tjdc/x2rJtm3q9i8qaWLSgy5qSBN10AgOvc44hg41468eVUhQ==
X-Received: by 2002:a05:6102:304f:b0:5db:27e9:934a with SMTP id ada2fe7eead31-5ddb22d85aamr865108137.42.1762505174383;
        Fri, 07 Nov 2025 00:46:14 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93708aaccdesm2134697241.16.2025.11.07.00.46.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:46:12 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dbdb139b5bso430261137.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Nov 2025 00:46:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGvCElCCfWxcXtqtuC86kEsyuqKJNOTQQ0i7Go4164Z7zfdManCqkGv0vrLix2Sdf26ChevSCVThQ=@vger.kernel.org
X-Received: by 2002:a05:6102:944:b0:5dd:89af:9074 with SMTP id
 ada2fe7eead31-5ddb2123781mr755368137.12.1762505172519; Fri, 07 Nov 2025
 00:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se> <20251106211604.2766465-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251106211604.2766465-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:46:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX64H3aT8KsPwu9SHwc4SxMEF8SNSEXJ-7okwBc_sKFyg@mail.gmail.com>
X-Gm-Features: AWmQ_bmeaZjB-Ll7mOxuADG2wKALQswRSm6S846VNNGBx0Mi3BhWOLgXGbSo5Ho
Message-ID: <CAMuHMdX64H3aT8KsPwu9SHwc4SxMEF8SNSEXJ-7okwBc_sKFyg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: rcar-gen4: Add support for clocks
 dividers in FRQCRB
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thanks for your patch!

On Thu, 6 Nov 2025 at 22:16, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The FRQCRB register on R-Car V3U, V4H and V4M do in addition to the
> already supported KICK bit contain settings for the frequency division
> ratios for the clocks ZTR, ZT, ZS and ZG. It is however not possible to
> use the later when registering a Z clock with the DEF_GEN4_Z() macro.

latter

>
> This change adds support for that by extending the existing practice of
> treating the bit field offsets at multiples of 32 to map to a different
> register. With this new mapping in palace
>
>     bit offset  0 - 31 maps to FRQCRC0
>     bit offset 32 - 63 maps to FRQCRC1
>     bit offset 64 - 95 maps to FRQCRB
>
> The change also adds an error condition to return an error if an unknown
> offset is used.
>
> The KICK bit defined in FRQCRB and already supported covers all three
> registers and no addition to how it is handled are needed.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
