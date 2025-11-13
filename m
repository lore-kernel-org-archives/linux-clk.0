Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794D51D5ADE
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763059180; cv=none; b=WGvUQ5Emy5uf2OBROmWYPB2YRc0OHsvLH+jLOjVHmY/8QjlpfaQp0rQpvCKV9knHHmXDOFvEY66T8iUYr2DO1jtEhosarZpvfO4eA+ywzIczIgpZjanSCRNLxe/d3c99gaa2iggvxc7WijPoyK6Jzht+W4jJTNnORM2awAwIREY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763059180; c=relaxed/simple;
	bh=3c0sAkDQu1qBVzE7td1x+QSCl8WUFk7pNS0yIvPZ3RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1cAsXty1Awvj7k/4P9otn+i0Q2cZKp4e7g3FdYd0cSEg0QIFN6I0mHfZqv/zGz/696mWD68kCfpz1cjZ/j+1MjqItvs9EREq69myJWN7HlM1N3ui28hDXAF4eKaNBb3/627EVNHFzm0OafWrM5Yzt+h12ZxVJ9kNIXaGqk/U7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dd6fbe5091so481090137.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 10:39:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763059177; x=1763663977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fn33ddPk9bS9PgY509eYuCfPPBWfLh0ylYRDGrpE/Zo=;
        b=XQieaXjJO/cZZj3ETsjor8VhZ+HYo53CIIiNIcFQP18u0vyGUJs7sM3UzeSdHDzePo
         g3J32cbiiwSFhYhLujwqFDk9WetUbRKHnOF7XTMBEyJi6KRh9OzJBcFq4McNzj7jkqC3
         CXtxaOPP+ZoK7vEB7NCaRicWm5SaZO/gKDX0COJH1U9yCbvGgY+m7Ke3vWkNPaCWYJhQ
         0HJBs8OBBHNP8LJqHU7Y49JIqfYmf35rYXf5PlVONDIvBLI3NO0y8JU0Dh5uuWQuvBAA
         Om7+4f/AzC0n/dG3UwyR9AcNcJSFB2QfqZ6qdLMKcYXEDh0/negXvS9pGeEnSOVuJi/X
         vFVw==
X-Forwarded-Encrypted: i=1; AJvYcCU1SHw4GngerzWoOdmIgy2W+Ed4Lw99UFPdW0BpiMSItrxz4dcq+SkKVGmwWZ6z2L6N/AF6pOCupgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEOlujfTVDBtt8rA4iRAxulQN50sm7plMeqnSFabUVISqedgag
	UAcW4KULT5HNwxT6SJTEAfpeM8H+e84g6n2A8OWnM8lAOlIBuhi3dqxHn0aQot95M14=
X-Gm-Gg: ASbGncuT3iQJL++qMokzV4sUqPwpQ9XJzJjyfbbyQmolIHQ6B76uHzxcB4k/XVdwHC9
	uYio4AufoqInhU15zLhYII2WVDUL5gwZqFe0e/vjpCRBOmv1WjQsw5hARSUTKletOk/7DZnTx2q
	X2yq2Eb0C7bkHkXfpvCnLUeALXTgrHDf6tpuEx5uFS4r+bj2lAFJ0njD2J9U99fz9BiQsP88P2p
	OwxPzIyvSQdfakdy3x/AGjQQzIaKs7RnAzKBNZzmCS8Z2mFb7DNTqTpYEijVYuPjzZmW/Azpspw
	HhO5lIEwPq0Gr/yjaQrNZCPLVJikeaw2zERBsNVvGJe+2LzTNXkDw+i26hzHuehncZUbtJzap8K
	O8j4SKDFfZ6/BylEnsBK3+tTqNcSK856UlqzWG4zqOk0k2XVh/gYA1n45b+Xtmk98JbX49TqoEs
	jIqF8exIxRB3232Mp+az2o9mmI27k4Jmxepq0v2Q==
X-Google-Smtp-Source: AGHT+IFH9Nf7owTqdB1hTOM35NOnCsjkTeJNZ3uyKL4TTSK02II6CixYVVRtvnDG8faAUuFdimDQcg==
X-Received: by 2002:a05:6102:5a8f:b0:5df:b2cd:12b4 with SMTP id ada2fe7eead31-5dfc566d2cfmr376171137.24.1763059177048;
        Thu, 13 Nov 2025 10:39:37 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb6ca9d47sm945949137.0.2025.11.13.10.39.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 10:39:35 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dd6fbe5091so481082137.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 10:39:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXam39QXaAz/avYraCJng00IMKXEOGGFCHYPQWT7RYAKBxhdMnj5IChzxQBdhLYVciio0XhYJikGyo=@vger.kernel.org
X-Received: by 2002:a05:6102:4b88:b0:5db:eeb6:812c with SMTP id
 ada2fe7eead31-5dfc5b96e0amr374019137.43.1763059175404; Thu, 13 Nov 2025
 10:39:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105104151.1489281-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251105104151.1489281-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251105104151.1489281-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 19:39:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEjnPWzwLF49ryooEUPNeLtXEuHDipcCMq=wsXN=zD_Q@mail.gmail.com>
X-Gm-Features: AWmQ_blsF688r-SQvCXnNFqKgHzgSK8u69yJh9wFop3IkqSYjXU8VHfHFzFl3OY
Message-ID: <CAMuHMdXEjnPWzwLF49ryooEUPNeLtXEuHDipcCMq=wsXN=zD_Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] clk: renesas: r9a09g077: add SPI module clocks
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Wed, 5 Nov 2025 at 11:43, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have four SPI
> peripherals, each with their own clock divider, which divides PLL4 by
> either 24, 25, 30 or 32, similar to the SCI peripheral.
>
> The dividers feed into the usual module clocks.
>
> Add them all.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c
> @@ -54,6 +54,11 @@
>  #define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
>  #define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
>
> +#define DIVSPI0ASYNC   CONF_PACK(SCKCR3, 0, 2)
> +#define DIVSPI1ASYNC   CONF_PACK(SCKCR3, 2, 2)
> +#define DIVSPI2ASYNC   CONF_PACK(SCKCR3, 4, 2)
> +#define DIVSPI3ASYNC   CONF_PACK(SCKCR2, 16, 2)

I'll move these up while applying, so all SCKCR2 and SCKCR3 definitions
are grouped and sorted.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
