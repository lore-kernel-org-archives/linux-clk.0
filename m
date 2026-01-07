Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560DA3081AD
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 14:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795574; cv=none; b=EkcrMejcLsw63Kx6BdOUwVAmys9X/DSJYHZ3YsZdSvd7quesfN1iscwTjkNmube52oYXlTCforzKx3ggVpJFf4F1A+FyLBFsvbn5PViX5OYxeRxTnH0FkebNoQeqPz4UfTat3IqgOU/2ud5+lUEra4CP7aItAe1H9INefA9jTRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795574; c=relaxed/simple;
	bh=FRXg7sG8lsjROMniNEltYNxRSN7jB6UHa+E5teGuZoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IXmpdZMhIDVmO7UV7MLhiOVexru1zDWgZlI8BXgMvfBzqlcwy0UlzTaAVBrHuNUOTf+ERptS2hWGKHbs2ec8+o0q/AmejJxfsw2wctibLW+g/u1ciB9za7BGFS7uzzayTjhlVDs/5I+gxxvUppqzhdVU1Y05rm4zfqOoZx797MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55fe7eb1ad1so1556036e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 06:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795570; x=1768400370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f9ObBXDi5tfc8gx6dpzNjEt6gAEUaQj0PlEscHQbzxY=;
        b=A96cRgnEc3DOvIh4WDdkTGgTzdYynqitI3IWadfEW/yRl0oAJvBhueizjJ/x0AJbkg
         ZjUWF7Ocs6iruVsl6FKyD6n2uzBOw1NROWfrbtAQfVaFE28ZIumtF9I+XzT/W2naTiMJ
         qQD673qUGxZq3MG3HkOn9RbmWaeY4UE5PvxJ6JxlVeXY5ju4c5Vee9OEyXjhW+Y65h0P
         ut806S5qI8L2rpS1KTQt6L4DXjoUxkmG3bLeZNzN5JwMdcwxYEqs4BJimbHK2vfL8f2d
         8iNe1k8Cqa3pnxOS5SIFXOOsXNd8NqOJSmslOXk6MuCSdLYrKIKbTAmEZMVnLJ3YV9cO
         IkRw==
X-Forwarded-Encrypted: i=1; AJvYcCVHd/oxM0K6w3e8HX6MC1Rzcbd8jOXKHPAv03+57C9zOUSeD5RJZDn9xVwDlu/quHCabgRIi36N0OE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHVqn5OhSCJrnof4twAvv5NgdOwwoLBZTD5Ud1+K3w/Peqeif2
	iXntWDkDu72cZ5Kph+RGniZlvgBXH6K52zYWUPlsZXIsz/GwWrZlaeQIcl9K9j1U
X-Gm-Gg: AY/fxX4P2RgL6qFSdlb3kgtBg6HSoZdP+EsaeDfRbtcdvLb9rUbaKyiM7/I559Sz8td
	pPAiBkIhs0qmyCZRX4rCLTpCLwJHygGeqzDH52ElcHoaIPUjRvhJ+UzpxOdjWd52zp/nHSwf0Hd
	4iQlZ7V4gzWgTKAxW3/KWcHV9qlniIEE19Z9oGYQODH1YWrGQNYP1jm5gImwdPC9r7r/TrJiLbP
	ieMDfC793dHe1HS9JiwvAPwR8wSutLkIJqDLBcnockhC48Olc1h0RCoaNpdGoXM0fHSc0kFQw1U
	pec9sIeX39vkyjiXKmD7xA4uh+GeChr4YMNqHGSZLVZUEXC5cuUH52Eglf3xFPBoA2ApZWzhkIE
	EWjsCr9w7RmOVWOC1vzL3Lt0dZWJ5soQEcVxR2Iwi9KtC70qJfTi5G6jNQOsY/99tVkAJ42avOu
	kOA7r+y8onF0gl7h98cYZ3TO0lDmeFDG4fsf4GjQSqWdzwoqyjhosx
X-Google-Smtp-Source: AGHT+IEcLlE094dqbGL3eBWs91aROTuG18lqXZ6d1OyZtCwIk4K0nVtlg5pIcOc6vcnygt6T19VEhw==
X-Received: by 2002:a05:6122:9001:b0:557:c743:e14c with SMTP id 71dfb90a1353d-56347fe355emr873377e0c.11.1767795570220;
        Wed, 07 Jan 2026 06:19:30 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a443e32sm3092064e0c.22.2026.01.07.06.19.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:19:29 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5597330a34fso1427298e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 06:19:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEyB9Cv0/rtEAyuZILYo6PTxeVoCqgCKjq+ch5y+TON/ae66RLZo/vOiCzqHdv/+g1POK5t32BnJQ=@vger.kernel.org
X-Received: by 2002:a05:6122:322b:b0:55b:305b:4e41 with SMTP id
 71dfb90a1353d-5634800fd9dmr995463e0c.18.1767795569488; Wed, 07 Jan 2026
 06:19:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104205601.1587576-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260104205601.1587576-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 15:19:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUymUsH-SjwpwEyf=pX9-KSbGk1ZSt9WdwgUHaV79MGEA@mail.gmail.com>
X-Gm-Features: AQt7F2rnYYi11tOD3YvyO23uJExnpdeLT9PEMdnnytj40vDkgqchRlHVqHG1d68
Message-ID: <CAMuHMdUymUsH-SjwpwEyf=pX9-KSbGk1ZSt9WdwgUHaV79MGEA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77995: Add ZG and 3DGE support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Sun, 4 Jan 2026 at 21:56, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the ZG and 3DGE clocks needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> @@ -80,6 +80,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] _=
_initconst =3D {
>         /* Core Clock Outputs */
>         DEF_FIXED("za2",       R8A77995_CLK_ZA2,   CLK_PLL0D3,     2, 1),
>         DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
> +       DEF_FIXED("zg",        R8A77995_CLK_ZG,    CLK_PLL0D3,     5, 1),

On R-Car D3 (and E3), the ZG parent and clock divider are not fixed, but
configurable through the FRQCRB.ZGFC register bit field.

>         DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
>         DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),
>         DEF_FIXED("zx",        R8A77995_CLK_ZX,    CLK_PLL1,       3, 1),

The rest LGTM.

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
