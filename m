Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CE53570BF
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071588; cv=none; b=m6mCm3vtX47gqNPfMJhJIhv1er3/yzQaGeUhP/fytara8F82m9f033/bW5xafjR3Xmzzjut0Cypoq2T4bP8+jiVnQasomG0wsH+WOg4zkqlgfn4pfHKXysxZ1edw61QqHjy/3S167hod4GXeAaI2s4D6kr7yI0mftmajls4jZRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071588; c=relaxed/simple;
	bh=MZFYNuXybRkvVzjEOIC4+EfAayF8myAFp7P6EDOSejQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAIsibD0Y7cmk4M79xYfLPc2EGIEoACH1JGTBSqgjL+VmM3Ays18KUsJ5XujPAxXhSuPMzIrovG+Z+TvkGoHwSnJTn/+ZGKzX+tjCmySHWTgVTXrcR7TsMqT1CBAp86eD/LVqICqx0hTPYGM6rAs53dGnXI0fQAaAZnUkEflc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f5905e60eso469792241.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 07:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071584; x=1766676384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dY9hOfw+nsqpN2twCEfuG3WmlvEURTIXg7HZZOHeWk=;
        b=cXsnl4ucLS2p8Px9/OEM+QfXfsQMvHl8ZE0jSkHkf2Spv2wZKGUjJaQPBtJJBpp52Z
         onpZUwfiWPpl6JuqbjQcEv36ksw3uRfq1G5AP5MagkhHbUYkYCD5RrucjEGvjAtAKlnN
         4fm13Jh43JZ6lPMjcNBYrbn5Fu1rk0e6fSNARYhnLpMSGNgJXzaCKW2AHoA1aeoJHPNk
         vDrqpZ16vsarAJWksLTjxW8NQf+tYOXTNaGEog3+HUCKt50CXKxFMFu8zJWKy+DVrPgH
         TuxC12uSAqpwNmQBd4L0gPXjO2AgFJQhRfHjA0cAa/UpSLiBrizJIBcFO2+6PRFLVuya
         p+oA==
X-Forwarded-Encrypted: i=1; AJvYcCW4RroC649ss8a1ARtnXD/df8gpwJT3fX5KuF8ulXSLPrK8mRX2iJ39Kya3HB9K7vTSL9HazM9teME=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPQtGymI8VAdy3nprFPa6hwhtQ2ufwQ0Oo6+1NNkv7eZq3Yr+D
	ZJFmWxJLbeQ6JgPHNuXayW2n6rz7D0jLVj/RWpPUTdCQ9yvPXXVDQDK7BuDIEarQ
X-Gm-Gg: AY/fxX6762kAlb2Rvq5sVm4e5xFcPGIHEcAMRwDHOYlWZpbvDzDM8k2u/G7DEEtDno+
	ylQ+DWTVflAr5OZOoTZXYA45M2yLDao3VAHUOt/FHG0AxY2gac+V+e+IuTV4y5KRkjYYdRHMkfK
	FMlojCDbdqJA0wDXwBFEli8EMMQkIaT11dLtFwDCZY9RsN5DK/VlVwv9+/B1Bge6H5roEUch0+9
	vrN8I+aatJMqyriktpJpSrSxw1MrMmjXcvUR11l8RucTtKr8M7pOUYP+UIpbxC9V3+IxnJtAcz3
	PE0EVgoFPBc1etur+YRTCttJHyhTTtdYtSkRfuSF6NhBjRwOXVd51gqtUGWCxiL6OEc9mA6gr7a
	MnaccyARWXnuBIb5J1e/WkHVhEK+0xUC3PWaARwidc/M2aE1Qkyo9Ci3zYta2in6D3cVF19YlCx
	DGMc7fm+J3jedZRaWocdLtWhO2N9NAHIYbhKSLQDe3flDM6dFu
X-Google-Smtp-Source: AGHT+IFyeASK9fbXg1NJfvDORR3UQ4FEMw+rqUw6N5hie/NmQ+PM9zxodGs4TrekH7+DCukcbdqpAw==
X-Received: by 2002:a05:6102:5e86:b0:5df:aff3:c433 with SMTP id ada2fe7eead31-5e8276926f8mr8419092137.16.1766071583697;
        Thu, 18 Dec 2025 07:26:23 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-943313c0b08sm983178241.11.2025.12.18.07.26.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 07:26:23 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5dfccb35b10so438743137.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 07:26:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2lPceMcucr4TxDAxQpSHhsK+HSPwHpJKDnrXfTAx5sPxUe74x5jRtQn7r35uWA3wr29WG4/LRdc4=@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:5db:f15a:539d with SMTP id
 ada2fe7eead31-5e827475423mr7568578137.7.1766071582885; Thu, 18 Dec 2025
 07:26:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com> <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Dec 2025 16:26:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
X-Gm-Features: AQt7F2orA3yT0lOZg8JX_FxOJmakbvS5h-4BSNrnlwxZlZ9eRsbqovvybB3Xhko
Message-ID: <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Thu, 18 Dec 2025 at 16:21, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> Add "clock-output-names" which is a standard property for clock
> providers.

Why? Isn't that property sort of deprecated?

Will be replying to the cover letter next...

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
