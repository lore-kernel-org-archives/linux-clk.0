Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAC232C94A
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014616; cv=none; b=G0Rkmao6RBchRKm0Fj24W16MW8KyCBjSdWNqkognEo0xDCg3KIt0tB51HSacDuqZz9BXlNnrA+lYi1KId54GFHGCoDT1IZGt9X90rHWaL3LBuhxQIbAVbSyv6+ILn4u0TPvi4kUr/68L3iyhhPn9govPzykeMFH2jo2SuJiQQvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014616; c=relaxed/simple;
	bh=LIq2WZpBnpzd2Ev5F4Kt3DKCFE0DPJZT5JzFcd1U2S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KSrtHfwlx2fTRacI3V+dfd6uUSi+c+MxIAgrEY+F74e9r+s7Kyaf3xB/0k98J8glASjTyjKmGq8p0n1kcVg0i2WBjFhvtbqQumwS7puaryCwNyXWO1VePVpNHaLk+ltFMjZrKmKewoDDMC9Ib0IRMTdCY/s8Lsq1n7cvIuf7Iqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-60fea0840f3so5517711137.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 00:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777014614; x=1777619414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWOHnN+6eqD5mfsGVjdyXg1PSr4rRoWrvIXL10/Nauw=;
        b=h3javrzbNB9nV5BFgn+BE+2LTPpH59ygyr3Q4nH8uJQ8H00ckgH8I/Tbbum5N1tV2e
         +eREXYTOtBmckjaFZMj/wz1PtMmlAm3ZVHhGHZ0GFAAiKTq6n+loReAJZ4vrtrQxMXbH
         V1pR2xKPS+CukzJ9iEdTc2ewMznvacTZWer4cHNe8ucvXQkEC/Sbs0SX/5k+7nm1nV0H
         a+BydqMENcG4JyGdkpP73OLs0NUYoXIQPxUDx0s4npafOirxv4EvJaursky+BPjv136m
         ZVY34lxp57LD/kUp05P+XJ5vAYhUmbgIwEilzJZ4Gy046b8yp7gzflS94d+2KkRmer53
         dAZg==
X-Forwarded-Encrypted: i=1; AFNElJ+VQpIG8q1YXVWSLd59+gJiJlot7KQY4KvBI/15VPB3vOUe2esWjs2S5x1CCMi+t+dSt+G4MoYzyfA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyc5m/aua2p4mXh4DAN2JNIbhjr073/DRWk0MIjmoJhZrgqj2m
	A3t82NFzXvfCxvjd1eZqPetxmyumKct37wxQ6/WlPwZPkvcd60U59LOx4DIcxzKr3mQ=
X-Gm-Gg: AeBDiesJx3oMhy2SE4cuE0KUjgWXuOhN5juzWIzGnDCv+cgL3dLedOFMpbxKXz9EBAx
	iERRsgJAbA+b9Qql+AOyfSdTttWnX1kaDg8sN3RWDBjTg0a+RvsiLZ/0ipiYDuVbB/g/R+eBncT
	3eyKoMI7iLcMBRbccO/HjR5bjzoYbM+M0ZA30beL2dVw7yHCE0D+tMPhQrgFd99FwfZkynJBEmC
	EuwBBIiOoLqtdGlHPSuAws1kBIOj5T9jmvolQiW6SpX3Y8sDloD+QFgpiYsFoV1/H4JzGLWFmcj
	pCv75AHZMrlcnxLg+130GP0cya1aVzV/y99wOmvn39lNgq5oXtdzbQb7E8UShsQ4KSBhAnF5Bpu
	shCmFJG1OR8vUrQYPqWUVFHQp44oz0m0gCaZJFxMb6XAPzkBe4u0j+DPZijEUo4xPYqoXY691Kk
	T8sjMFqbxbKeQWvpTvzZEVkerttYwJP5t8Ilcrfu5qvv1MHM1NrNnvspFCC314tE0meD8rsQo=
X-Received: by 2002:a05:6102:424d:b0:600:57d:2203 with SMTP id ada2fe7eead31-616fc0a4743mr11039268137.8.1777014614013;
        Fri, 24 Apr 2026 00:10:14 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890bca3fdsm10645357241.10.2026.04.24.00.10.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:10:12 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-610f4cf6ddcso5963733137.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 00:10:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+w5mnvGXfSVtxpfVPUqZCd6RcamTjk6l+hnn1UKMtLRonSuy9vuPlvyjv/x07veDWPw8hNvhR9KZs=@vger.kernel.org
X-Received: by 2002:a05:6102:148d:b0:607:9b72:28c1 with SMTP id
 ada2fe7eead31-616feb804demr12593221137.22.1777014611387; Fri, 24 Apr 2026
 00:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
 <20260326110648.29389-4-biju.das.jz@bp.renesas.com> <CAMuHMdWEQpg8biC1BFJx1n4byXDWGDK+QZdLkpHFypX3zYFWCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWEQpg8biC1BFJx1n4byXDWGDK+QZdLkpHFypX3zYFWCQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:10:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUP0=wQ8A0EOR4GgLJcmiigGVJsp_8G9cv7uBHkEEESrA@mail.gmail.com>
X-Gm-Features: AQROBzASsJ8jLNRx0XhI12Xisy31etJ04Smzr_WDPM7mKm0bZr1QZGo4oQcDx3I
Message-ID: <CAMuHMdUP0=wQ8A0EOR4GgLJcmiigGVJsp_8G9cv7uBHkEEESrA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] clk: renesas: r8a08g046: Add support for PLL6 clk
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 11:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add support for PLL6 clk by registering with rzg2l-cpg driver.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
