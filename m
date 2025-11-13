Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD635A92E
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 16:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052898; cv=none; b=ZlNo/eM1BxlhjB7CNL22LS3y/8A4XAnvc/Mo4GCvca3PM4P0RCrM+a1gE03ozRqPqq4LcqLPgxThGGrBHrFM+9iE3wQbdU/9OCCr/lBP2JY9Z5Aa+dFLnrFczSYiW27gIyjx8oBtO+3yeBC3P71jMaKhkkIZXHuvAsACEvGkHTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052898; c=relaxed/simple;
	bh=/w7U1lULN0Wt5cy2n+o8BXmaQCUvdOw6lpumB8VVy08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmYiZ2k3c+n6vXgSGdQbZxBko8QOIfoRSKEO+1PShw8VYhn3GcsNY0PrE2vqes805ENNp4+IGJEXTeVwHbir6C4VKRchjOEyJU0/FDU7QkvzsrMDZgDsAF2nCEVCdxu4NTD2YFwzItTA4EV7UApJw5vBnHrHjyytPiVQD3D5jZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ddf9c25c2cso769440137.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 08:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052895; x=1763657695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiVTOOriFml3/StIKpZ5dwhW9Hno3lDZNqDkWyJuxDU=;
        b=t7urd6JJkKWYj7ACAnZ+cLzhL9QhH3Nz4OP+W4EeJWdEku3HPyj2CORa4nPOooeFBn
         HMlOIEmH1NwdG62xCZfqBdCO5eBooBoTHlCytKXGS+t63aUUrnD/s5BZPa+nn76R/oY/
         OiAgfcipGuGcsQwAxePJDWLol9oNXdqYR+KiWLjyHU6jhI7Lzm62hYzFU+BQUtZR13sR
         rJhnXLym1iUoJeDQ1YFKEMshLMdoEMcVoWrr9fBZiWTorqPE/kQuBz496Ub1xUQSIpr0
         RLAt68yc6k5INtL94F2NlTLe7Af9DYFfZBpcyLKNgiRjhlip4TVgt9ynOUz87HjCJE8Z
         1+6w==
X-Forwarded-Encrypted: i=1; AJvYcCVfyJpaqfUREGbZvaO9hQ1ftdvj4LYPZaspVrvmBJDyEz1rQl2zHeqpLzaz6s4Fp83Ddd/gZLyeYQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV2+eL8zaNSdft4IjzFMehzIdCxqY/APWYuiuUiLP+v0JmpDp0
	71XG/6bsEbwpm6KcW8+yTn1liyIZ15JRQV0at4EsdoqufoIk2ryIrAs99ElWtgbA9lo=
X-Gm-Gg: ASbGncu77beYp60sEWwXwUcIeb3QZX4jylfSQIBcLIfawJuXVDckIAFGWtGYTlZcvS1
	5emXOiKQJTV8KO61SaggxIvtgdqiuqnAIhiyoaVYjZ72morhErzbtb4PFpPAulVqqOdj5rd5KHf
	WtZ+a5eAJv8/LjHHLRjTej0z+FhrKyi5ATyJ8ORq9vLRKzZvP17sUK88A/m5Zhy8g2fP/4vLkup
	RejoU7JhUZNB1+mNj7GVQCITXSmzGvrEB0VOcr7xfMYD0KtuIAVMTxocvyw2FrhqNpdsM4Bll3G
	CGab9I4KbqscnJFyb7wVu/FSBDQ6HUIq/XHvSTivHtYleYUhZqsK6o0bBtuPWev3svmxpuJImXv
	iRW4HZuZqB45xz1LQaRbvp+F0pm2Msu/TkkqY2eLvZqRAI9PPDE7jX6ovvpSxfU8Fo2tmIyge+n
	e+NXiC5yu6fCN6utCjzV4q+vvoBi4LIiHlL1hT2Q==
X-Google-Smtp-Source: AGHT+IHXiRg1doZzUfI36Q07+GsknV4bFvrqujTtpyR5BkncQGE33LtZbAz2qKJW7yoZB8Ad6mnAdg==
X-Received: by 2002:a05:6102:919:b0:5db:e373:f0a2 with SMTP id ada2fe7eead31-5dfc5c05298mr187820137.44.1763052895209;
        Thu, 13 Nov 2025 08:54:55 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93761119965sm743136241.6.2025.11.13.08.54.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:54:54 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-93729793469so615209241.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 08:54:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlG888mKQM7ILXyo0V9XoygYJTEA5MqFA8jFztwmlcIgjiymVgA5uabwsw32owDRXn/6DHDv6+BiI=@vger.kernel.org
X-Received: by 2002:a05:6102:3751:b0:5dd:c538:b85c with SMTP id
 ada2fe7eead31-5dfc5b9485dmr175827137.24.1763052894285; Thu, 13 Nov 2025
 08:54:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251101050034.738807-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251101050034.738807-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 17:54:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRkiJHSFj1QsQjH_6g-WqVK0aYE4Q1+WS2zGKLXWoj1Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmUKyeVUtnm2gNnWCtpgD7bmlT9Yk_sNHgyVVXH3XqZY-ChGkFlPHKyXXU
Message-ID: <CAMuHMdXRkiJHSFj1QsQjH_6g-WqVK0aYE4Q1+WS2zGKLXWoj1Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a09g056: Add USB3.0 clocks/resets
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 06:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add USB3.0 clock and reset entries.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
