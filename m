Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A3417DE2D;
	Thu,  2 Jan 2025 19:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735846107; cv=none; b=oYebII3qGEMx02aZclJJJLSfGWyt1LTyDJuYQjg122no2HFCdOg4QsOhnaydvBI4eJAQge3k5sT8g3YzwEtOlwh4aVSG+oKKBglMRO9gbqks+ZlwvMdR/9ZjmmqDHvTdw9iSWtV6EWAbDAWlFWYgzN4B0BfeqwgcJ122+zZhHlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735846107; c=relaxed/simple;
	bh=6XcJHhfjfFG+ukoUJ0GTW/PXR2rh3vuGVHczWzTXsb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lz6sHRRF08Mc+nOJB3sYF5edqxRRIyYiv0gtVwx1Zy6DOzm0RoWU2fC60D663E39eKoV4tFOhD65w9YfPHI2uZBIWGhz+s8FYfHAP4EwCp6JC5Hdd84xfJeWGao5yzUUlPCjmPmA7yzoLYyJwPtxtkZVv2LbSosp6pdJlYQrUGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c559ed230so1988086241.0;
        Thu, 02 Jan 2025 11:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735846102; x=1736450902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ifrsZS6VTC65RgZqrSr3SMUWgTLKO2G/Lh7qiZeZxM=;
        b=QRTvQP0oAvzZ9+wyDq2AY00QDX4u66E34Fut7v9fKfOa37E+QmX+aPke31ncFDVqgl
         RkScfMTkmdWUhbtiFFJL/h1UtMIxurls81zppOrwq0W7i8Zo3ZebjK1HLjGfk7E+o7OE
         oi3OlUqyE9KFC4/vlTSNGotwUh63otuC2TQVGBWWQhP0YkFR5v9NBa7kWkdGswjjNwys
         WwEukuWXftDZhZ24HSSob4Lc9i5iyF9N2k8jEsWue0SCVcNOgulvTYlNEU4XZkNhKQDI
         eeTB2kyn0lo29UVNcqcjYUn8qqEEIHBxsL6y2BCP4jpnbzAdL9pI/85MhKy45k+9cR0i
         euog==
X-Forwarded-Encrypted: i=1; AJvYcCWNqbpRBwncNhvp0O+p4b8WqEHYkqDQ6SSLw/gjgyQwtjwoR7jPOCmXIS8SbKqPJDb757LRh2t/rLk=@vger.kernel.org, AJvYcCXGAlYQJCPLB0zLDWHBq+KUo6DvF8p/jop7aTP9zi3vCRvl/lny4JEKamZ2LJX2+j5hDx3LV7QChDhDUHyl@vger.kernel.org
X-Gm-Message-State: AOJu0YyrYnKPQ9TtDNylKiEwcZLRejkEMpTL1wztypA//E+KfT5Qw3mx
	zQEJqViuAMaYGtfn9Wsd+ANCDn3BaYojk9+g5Aphuwh1hrARr4MXvyy7C+0U
X-Gm-Gg: ASbGncv11BHEzVK+SAv03cgkAwrAbfI/boySS/6Ucvs+HBXZ+A0B5dtswtJAoxtUtSD
	PPihDipHKF/aq/F6Zrgss3x2NjcIR8usOvoJBlHQz8ubekQhrh4L131gDeAeMLaJwo0StA7dtjr
	4bOXXy3ruiqxJePApXMHShF18e42jgNHQp+XQiMWX1oGLEqQ/pwEcet74xK4GcNQL4S8ykH2OQR
	dPey/u7sP6RSu3/SpZ6jQVqZsKaxRqUaYXH+0/gb7nJukX5/U7mJj8CSrZ15XmqYQuy5PoBE78+
	n82dWyDq89nV56UOBHS/Y7c=
X-Google-Smtp-Source: AGHT+IHHgE/g2cAn01qIfaegqwLBAsz7Xnzj5L9ASu+uIxudiY8HlTg8SASp0SFpdY94ylIPKHay8w==
X-Received: by 2002:a05:6102:1623:b0:4b2:4b79:414 with SMTP id ada2fe7eead31-4b2cc35f0eamr37374971137.8.1735846102320;
        Thu, 02 Jan 2025 11:28:22 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfad385dsm4979101137.28.2025.01.02.11.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 11:28:21 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-51bc2363fd7so2110870e0c.2;
        Thu, 02 Jan 2025 11:28:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcc9z1Gd8TT44WtfV0GqLTaLWPRGpijEedmG/nPHfG5PJM1rMulh4ezmwQhVVc4lLafeDUf+WdWVE=@vger.kernel.org, AJvYcCXJ4KSUcyg9JIcY6tgv1lEx3DCvzFF4K1tkUwPQE5xxqcg+N0j9Ef6Tgrbjtfb+1HLL1BFAC62CH6QckaJ8@vger.kernel.org
X-Received: by 2002:a05:6102:549f:b0:4b2:7996:6ba4 with SMTP id
 ada2fe7eead31-4b2cc48a41cmr36642516137.25.1735846101400; Thu, 02 Jan 2025
 11:28:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102170359.761670-1-rohit.visavalia@amd.com> <20250102170359.761670-3-rohit.visavalia@amd.com>
In-Reply-To: <20250102170359.761670-3-rohit.visavalia@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jan 2025 20:28:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9iZK3FOXhSmvvxK=HqBe3hUnNcZZ2aL1G--XHFgN07A@mail.gmail.com>
Message-ID: <CAMuHMdV9iZK3FOXhSmvvxK=HqBe3hUnNcZZ2aL1G--XHFgN07A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: xilinx: vcu: don't set pll_ref as parent of
 VCU(enc/dec) clocks
To: Rohit Visavalia <rohit.visavalia@amd.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, michal.simek@amd.com, 
	vishal.sagar@amd.com, javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, 
	u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rohit,

On Thu, Jan 2, 2025 at 6:04=E2=80=AFPM Rohit Visavalia <rohit.visavalia@amd=
.com> wrote:
> CCF will try to adjust parent clock to set desire clock frequency of
> child clock. So if pll_ref is not a fixed-clock then while setting rate
> of enc/dec clocks pll_ref may get change, which may make VCU malfunction.
>
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---
> Changes in v2:
>   - none
>   - Link to v1: https://lore.kernel.org/linux-clk/20241226122023.3439559-=
3-rohit.visavalia@amd.com
> ---
>  drivers/clk/xilinx/xlnx_vcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.=
c
> index 88b3fd8250c2..c520ae1ba65e 100644
> --- a/drivers/clk/xilinx/xlnx_vcu.c
> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> @@ -547,7 +547,7 @@ static int xvcu_register_clock_provider(struct xvcu_d=
evice *xvcu)
>                 return PTR_ERR(hw);
>         xvcu->pll_post =3D hw;
>
> -       parent_data[0].fw_name =3D "pll_ref";
> +       parent_data[0].fw_name =3D "dummy_name";
>         parent_data[1].hw =3D xvcu->pll_post;
>
>         hws[CLK_XVCU_ENC_CORE] =3D

You completely ignored Stephen's comment, which suggests to not pas
CLK_SET_RATE_PARENT instead (see xvcu_clk_hw_register_leaf()).

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
