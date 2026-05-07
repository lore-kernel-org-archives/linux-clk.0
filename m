Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF93F661F
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158634; cv=none; b=oh9rdnUktF7KbNRVTXydTQQD6j5Nq+Z19yO7EjjTwxq7inc+Tt8l9lOYnyOQZ6Hwo7Q1FMg89+cSea4cbmU3Q4KXqxdhdiHIldKXv/rHXBzGnN4mIy5Qvg9bpJy7t94nv/+5bRaZGFWSu+OFjnnf5EB+6cRcqNchvIUfdKHu6fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158634; c=relaxed/simple;
	bh=9LlYWn9a1daIT7AtTifSQR5OMN7I5+6EnOhEk/VkzEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7siSoO6FnQ6O53CntQarCHNpTA1+34HqnVIo7H/+ZMuFNvBeqEmoFlZ2oT4d6WVOb5K8JfLO/qOmY7Is8N+yFnqjwin4MdaeuycMTV3D1MZzjL7dpfM1lRO1W+B2dTGVLyBvg3XcAE/hDDsC0Pvt4Z4RwLeUY6q7j5lsO7iaGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-575212eb419so609100e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158632; x=1778763432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufXhHtNlE4YNqXItZBW0sALbZeYV1ohvIQBPsjtJDWs=;
        b=RlYkuxXkKPG4Sb0mqpRr6bXq+/dit3z4xZ6J++9QsHNFKF54uQhf9ozqcudwDPW2jg
         Ff2vo/oGaOiz4aaY9tIKyhdixYuGs/tJh78gQguTORHr/nN3SFroo6b2Al93Nk01p6pe
         jEZ7RutfY6QJU3HAoi+CEGx19lCCztJqVnGnb6ZE1L+Pm8QhLFRAIZDfRhGvT/XvhdSa
         FoK/6YlgxVjNw8dUn/5FAV3g3ATxSTQBSctnX5WXHSOOjRA8U/GXoSOeStnnTTmEp/9Q
         04waduj8EQR1qNopUOp2j+z7P3KNwYOzriR5ZGuI+S4fpY026I0fIvzUzTu0ThlDqpJJ
         qoTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RVC02+gYghN3/w03lGQRv3whPR/gDEqqKy6Gq+HNGid9SM2fDuWOAXprsk6oLURuAhC8jPLYzCLs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0TKeEa3mAsVoX7ZHiM/bjGZ0Hlofp7f5L0pwnn2B03a7INjNO
	ujM6UtWOy/PFsQ2WUzmoMhbXKT9zWfUmsPVtslrV4Tao09Kd8G7AQqD8kr+JAHuwwfo=
X-Gm-Gg: AeBDiet2Z5LYFY36JnEZYVP/r2veO2W/Jj0edROd9Wxfoonf+HxD1nvf36s85FKvalg
	WU4QLAaAnzdrQUFZ+bgmiEEd/ecfRQ09YRmJYUROaOqsmQoFDCAy6iyIyF5owvrVWbbUKmbET02
	5BvjKvdbhV5yfM8qeFmkeU3ATBf2FtX/7RFfKJhpZYwfj8Qb0cQJv8etKVHJuygJNT6PG3khkEu
	f7OwVVuvyWNdiHpxGMUbDgGdVHITX7GCotnX2G8aaeiqlKTTakenwuibKtJsi4jvdOSXhzFp2XW
	CpYf19fdPBNHv5TzBBEBwW6BN+Y41wsJ11IudrFEq98KORkqfxOWA9m8+Uz5gnljmy5RRpyCbx0
	+umRc8ZLZOwl+9WW/+2DTsdyzRFpgg0DSI2aJpz8uZIKJgqOiYgNo8d/Fjeq/7oLXBeH6VaaVo4
	KnH8snoDcAhHI4NEag2qTf1W9uggyPLhs0rACpFa29zB0wmwtKWJ0GMyMzOjPbts7JbgS91KFDP
	QaRAQGRFWVo6w==
X-Received: by 2002:a05:6123:49:b0:56f:3b3b:eea with SMTP id 71dfb90a1353d-5757011a4e8mr915020e0c.2.1778158631856;
        Thu, 07 May 2026 05:57:11 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5749f7e8c25sm12050957e0c.2.2026.05.07.05.57.10
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:57:11 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso1847523e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:57:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+YBo+TgKl8oD34hQsZyaxmMig4/AHngGkgiYx65mJctBGuchqxqjRQ+7dVUc1IxyFr7kUUl/YvIcc=@vger.kernel.org
X-Received: by 2002:a05:6122:a22:b0:575:20ca:573f with SMTP id
 71dfb90a1353d-575702d4fc6mr894465e0c.8.1778158630507; Thu, 07 May 2026
 05:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144523.153906-1-biju.das.jz@bp.renesas.com> <20260504144523.153906-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260504144523.153906-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:56:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7bhV9moQhJocP1haY6dTFSU2fqBmXR0P1HJLimSfvcw@mail.gmail.com>
X-Gm-Features: AVHnY4IKdN7QedDZ-7MbAan2r3jOABajb6Y5Cbcj19lgk1Utd-zT852fOF601S0
Message-ID: <CAMuHMdW7bhV9moQhJocP1haY6dTFSU2fqBmXR0P1HJLimSfvcw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: rzg2l: Simplify SAM PLL configuration macro
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 16:45, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the PLL146_CONF() macro and its associated CPG_SAMPLL_CLK{1,2}(n)
> helpers with a single CPG_SAM_PLL_CONF(stby) macro that takes the PLL
> standby register offset directly.
>
> This removes the implicit coupling between PLL index n and register layout
> and eliminates the now-redundant GET_REG_SAMPLL_CLK2() macro. The RZ/V2M
> PLL4 definition is also updated to use the new macro with its explicit
> standby offset (0x100), removing the local PLL4_CONF define.
>
> No functional changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
