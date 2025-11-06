Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3800321430
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 14:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439321; cv=none; b=J6TKdd1SG6x7avVeZhSrC4UmB8uwIwlaEqW5Y5Ax5qQyG1VFENh2VPngn0MV1z9+nPR/zeTaiV8WLM6l3zSlfjOfn+oJP7WJ+c5wJDfeVlYSaAvyVo6YEUwnuHQL7023rNvgLDz4vcV5dBE/jmAojRs6WdChSTKFsxpxWs+PU0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439321; c=relaxed/simple;
	bh=3lgjqrw9oTLBZNzeCWRnYqfLBcostxc+8B8DcxRaSTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMgEvmnf6mK0fGbsJC85h4mhslBNAkybYtMuOqbjSX5b40mwYJPbydmJhO67apcZ7+IHQodiLK20+F0qT7lGk8S/3MP8oDQR9cGxszoku1mK0C7RsnaMUyfh1I/z0i9xWslZoxoXX446UN5ckYA3UHCYmKOgYlZYCcyXbOaezp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640f0f82da9so1803878a12.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 06:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439317; x=1763044117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFuhrM5Zx5faMXjiCvShw5ZF0br2pRJWjGUrf3CbngU=;
        b=DGTNHmKTNQaY2s8I80SajfchNxRxmpKUXd6CTBg+cHbWAj6iBgSjjFtssqfQGyfoT2
         fk3l6otzLC/zsKMR1Snq+Gn7FT1bo23s37Go7euai8pQWKt99/qn3I6Ksztuqi5kBBJB
         SpiOG2A9Rv3XTLtHuol2OTUPlS4pb5UO7AY4q0ctp3QNM+mv6M3I1mQHUuCbZ0NEiP6U
         SXm3TxGgo3a2WUJ14AJaMSy6B3cK+8bpE62zQkn7kBeGz58lPHmJ8BtncuNb6YGCJ5ah
         X6F7OsyFL5dcHMFbDKMP+24DqmEfScslhzT9skwLlMXaeHr9KftRw87b+uE1NoEakq0X
         UDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVq0ln4ovJo8zeN07VowkHGpDNQvlZy3jdGl6VD6IIXPortEkCAVUOhyfs4SlCeSqX3jYIAq2AtVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcEHWruUjy9YSr1UcyXZFcJqs9e+ppBTCI8BXQfhZa7sIEHXAS
	UlkdAWKSx/O9VyV82rgpSJd7a8NObPeP+TVhpb8xWmHLr5pjxNblKf4nCvz6bnvnixo=
X-Gm-Gg: ASbGnctEfvzSjiyeA6pNfiIjtHfU6AQE3B2pR41+gIxRGnsAhBbi4mcr3JQp7NgJpcF
	e3wjWfUMgcKarLXmtTKdWFVF4uVrAybsWr892rrrc6QDx1i05UkAf79ZHxwW/e2vNOJDIpjnH1P
	0uJ6s/OTDxHRumT3KYdyMqVGfElSB04xulEAF7skFnNvIjavOHV8DQRj4SqJyNGZdE2ShLipd2f
	zooIEyZ4CQSttFpww1z5gOUhVR8sJ1gUPU7FDZwlk3CjqiJPnQNBBU90wC2C5shV6f5ulBCwYdy
	Et7absgfEfR0jaMmKW3XOCmeWKRgEswM2//gTNL4e/KBxmqx8crZZbZPlfcRlhrYMsFkSINJfsm
	wYRbv/Ztd0sotVf/sPtitpmPRjQkCYGjLGwi2riufj9TgJBGd2SAtTkNjacS8UaCuMRuuNJFYZt
	Cb9jMbPcBRFYYB/GPvZXEd/AotRPtM66kIkli0pw==
X-Google-Smtp-Source: AGHT+IE2IwQyhNTHkSR4xzkbxlFz73hvo+YxIc8UwRsB6/GYZ4OQwbmYvASLzmXv6B+9vEyFwThlXg==
X-Received: by 2002:a05:6402:42ce:b0:640:bbd1:7d99 with SMTP id 4fb4d7f45d1cf-641058cd1b6mr6801360a12.16.1762439316625;
        Thu, 06 Nov 2025 06:28:36 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f8141e6sm2119783a12.15.2025.11.06.06.28.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:28:36 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640f8a7aba2so1509494a12.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 06:28:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsGP4YbRtXBAgOT3C8iMTSO7BLtUdLmidgQryni0nfIWdJzUPoemh4rBWcA5HOkxqS1hjcv9Ve+0k=@vger.kernel.org
X-Received: by 2002:a05:6402:510a:b0:640:c918:e3b with SMTP id
 4fb4d7f45d1cf-64105a58158mr7216116a12.26.1762439315884; Thu, 06 Nov 2025
 06:28:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105231815.1927239-1-niklas.soderlund+renesas@ragnatech.se> <20251105231815.1927239-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105231815.1927239-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:28:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZCakYhCCZGW5Z8-GrfNR5QYAGHSEZD1PvkBt+5SjbLg@mail.gmail.com>
X-Gm-Features: AWmQ_bmsJvzm6kKqBB7MkT_bl8ohnK3R2hPjSvFu5w5eS7KUaBTh6zw_38RYicg
Message-ID: <CAMuHMdUZCakYhCCZGW5Z8-GrfNR5QYAGHSEZD1PvkBt+5SjbLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r8a779a0: Add ZG Core clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, 6 Nov 2025 at 00:18, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the ZG Core clock needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c

> @@ -35,6 +35,7 @@ enum clk_ids {
>         /* Internal Core Clocks */
>         CLK_MAIN,
>         CLK_PLL1,
> +       CLK_PLL4,

Please preserve sort order (see CLK_PLL5 below, out of context).

>         CLK_PLL20,
>         CLK_PLL21,
>         CLK_PLL30,

> @@ -98,6 +103,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] =
__initconst =3D {
>         /* Core Clock Outputs */
>         DEF_GEN4_Z("z0",        R8A779A0_CLK_Z0,        CLK_TYPE_GEN4_Z, =
       CLK_PLL20,      2, 0),
>         DEF_GEN4_Z("z1",        R8A779A0_CLK_Z1,        CLK_TYPE_GEN4_Z, =
       CLK_PLL21,      2, 8),
> +       DEF_FIXED("zg",         R8A779A0_CLK_ZG,        CLK_PLL4_DIV2,  2=
, 1),

ZG is not a fixed clock, but has a programmable divider through the
FRQCRB.ZGFC register field.  Hence it should use CLK_TYPE_GEN4_Z.
As currently drivers/clk/renesas/rcar-gen4-cpg.c:cpg_z_clk_register()
supports only the FRQCRC(0) and FRQCRC1 registers, you will have to
extend the offset-to-register mapping support for that, too.

>         DEF_FIXED("zx",         R8A779A0_CLK_ZX,        CLK_PLL20_DIV2, 2=
, 1),
>         DEF_FIXED("s1d1",       R8A779A0_CLK_S1D1,      CLK_S1,         1=
, 1),
>         DEF_FIXED("s1d2",       R8A779A0_CLK_S1D2,      CLK_S1,         2=
, 1),

> --- a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
> +++ b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
> @@ -51,5 +51,6 @@
>  #define R8A779A0_CLK_CBFUSA            40
>  #define R8A779A0_CLK_R                 41
>  #define R8A779A0_CLK_OSC               42
> +#define R8A779A0_CLK_ZG                        43
>
>  #endif /* __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__ */

This should be a separate patch, so I can queue it in a branch shared
by clock driver and DT source files.

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
