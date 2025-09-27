Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E214A21
	for <linux-clk@vger.kernel.org>; Sat, 27 Sep 2025 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758964855; cv=none; b=qDD9paZQL+Fg4Dlurws3YH9eabTg8243xbSRBrmPbYZVnAbc6enP7LBy3nQcgCBi/4YJMKnupo32Qr/TkNm4pn025mEYSvSRtGTBBMCCsf6zdcuq+vaY3bPwKbhC7gmmqPlh/QIzlvrwkxIQszc0uyC75yFRgfhaJSZSUxMdzVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758964855; c=relaxed/simple;
	bh=/t3TZT7OJrjKJml8DIU0qxdIMBB5wu0/exPcKbnLXnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cS0yVDg1Js6YXeB2O/3nGuomZUrzbl4A2ltoVmBY7o9BS6/fZHhabgXJOlK1kS/AB2Y+j6ZS15kF/BqpCVPOKMXy6BmVnI0zFyscVezRbPsJ1dzbt2WeuHTimiUzFMSq/J5BLqnejLLCJ7H+lfbZAxc3mcdidHrJDffY7dhO8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMuB4BRP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMuB4BRP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so2452542f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 27 Sep 2025 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758964852; x=1759569652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K9Vn9bWAnI4BE155GCPvaTjF5XBKFWlh0xk9agIzlA=;
        b=WMuB4BRPUhBt+bNq/DGyqc7vLAb9bi2ccfL3AxOEX6D6TbqIfzp93BoervgD3hu4UC
         XpUR7IHdC1YlskIUJHQd1LtPpsMGLTB2DKwsdlpEhxX8CrVtiGIMX7hZ5KXyeZHOrf9l
         UKyYCSWrhjjDhowJYtOPO9osFRoyjB7kgHJViS45HgTho/8YkbXXMMVouIgoY2mSMP0A
         nU9QX/h7ylR6ll+ex8LUzslz3RFrzGHOAYDR/5hQA36EB+j/6FihbhAs21zWxORcSXXy
         xvA++U3WEuR0U7A9RaCEC4CxgJw0xlLd0BeJdcBqO+Cl214WRd5282hTS/TS6QTQaU0m
         6s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758964852; x=1759569652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+K9Vn9bWAnI4BE155GCPvaTjF5XBKFWlh0xk9agIzlA=;
        b=FyVwf/tDQXKdYcld07nS9Fukho1aKIr8Hk8GuATtquBIafoINyoRwexymDfyjNP3RO
         ny2y5mbCGwlvg0Qh6erzWXdNUlb467u7eU09Srd6FEI6c3nbidgpVEbC0FBbhRB3KgtL
         gHlhBkJt8MsHmVl/gV7QSpyIXQKtszwhOK0XpW3rmRPTtLs9nV3lhdBrye/JjucKH+9t
         h98ZFWK//wfngq9DyPwerGCMhB8vXOd0IAdG6+RtKKOTCXTaoIrnpPaC1A+cnkvkorz5
         alym4EQ3lW8iXymJqyv+dxbppIH/JPnXDR+HQhShXHOHNMAnp/qhR7xviMmbjZrMeuKD
         bIcw==
X-Forwarded-Encrypted: i=1; AJvYcCVfP8movHv4D5uBBKRWffSvS31cptPX56Ce7rel2o8vmTq6XniHpmzzL63HWqCpHugK85er1VpYCqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUx0hSMxNQtp9TIDmz1C5SCypq6hqQ1v7dfp76j+34yB+pAXEo
	SJk9j3ZxchLGUzA2c7dI+pJYIQMw6CVuBAsfRyYXyGsfbcbdwjSrh+k8dqypWl1fJuOgRAuZVy1
	HP4GbG4YIId8mM7SfMBIOX/bPxQepjFy4nyFaHf4=
X-Gm-Gg: ASbGncsMObmtvIrNO17LFiLGaVRgCiJZGwxGe5/atlNStw01NiMWSRNSoth9PuftJOZ
	zfzadFRcpxpwuw6TPcfRiQKMbbJwAgjgmDFA1YhgiQNkp4JrA8w9qGfE9ZLVbYOLmAucipkh5ut
	44mcDGgn/AWzGJZ0NIt9O2319zjYcr0CP5YHE3rcX/kO68PL7oPCW4FHN6XegcC6gnW0M2YxHw1
	dG+jN9Jrvy0JNs6H2c=
X-Google-Smtp-Source: AGHT+IFrTxM9Q7PDjvaeqtIGpYhacKRy64PKIRSyugqmIbH/nwL4P9ZHMzWlj1q2unq+uw4xc3LL+ZZ5rcx2i+qxmE0=
X-Received: by 2002:a05:6000:420e:b0:3e8:f67:894f with SMTP id
 ffacd0b85a97d-40f65cb098emr8732361f8f.26.1758964851657; Sat, 27 Sep 2025
 02:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <81260328acb5c78e915ab04afad3901a31c16128.1758793709.git.geert+renesas@glider.be>
In-Reply-To: <81260328acb5c78e915ab04afad3901a31c16128.1758793709.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 27 Sep 2025 10:20:25 +0100
X-Gm-Features: AS18NWBrfcgOBOZDAaeK8p6RbP_plvyufDtAafY_khBrZmmD6GFm9c13OLsUcRw
Message-ID: <CA+V-a8u-FEfB7WyDRtz_q5ZKKmZMRrNbv6uoBg234ggkVD1BGg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Use IS_ERR() for pointers that cannot be NULL
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 10:53=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The use of IS_ERR_OR_NULL() suggests that "clk" can be a NULL pointer.
> Hence smatch assumes so, and issues a "passing zero to 'PTR_ERR'"
> warning.
>
> At these checkpoints, "clk" always contains either a valid pointer, or
> an error pointer (none of the functions called return NULL pointers).
> Hence replace IS_ERR_OR_NULL() by IS_ERR().
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408032025.ve2JMaoV-lkp@intel.com/
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-clk-for-v6.19.
>
>  drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/rzg2l-cpg.c        | 2 +-
>  drivers/clk/renesas/rzv2h-cpg.c        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas=
/renesas-cpg-mssr.c
> index 7d661beb09a0810b..0289a35e4e6a0e59 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -451,7 +451,7 @@ static void __init cpg_mssr_register_core_clk(const s=
truct cpg_core_clk *core,
>                 break;
>         }
>
> -       if (IS_ERR_OR_NULL(clk))
> +       if (IS_ERR(clk))
>                 goto fail;
>
>         dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk)=
);
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-=
cpg.c
> index 15b0b96373b03d16..2923961ec001079a 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1177,7 +1177,7 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_c=
lk *core,
>                 goto fail;
>         }
>
> -       if (IS_ERR_OR_NULL(clk))
> +       if (IS_ERR(clk))
>                 goto fail;
>
>         dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk)=
);
> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c
> index 0965f3d11213ed22..0509d1e338058f4e 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -591,7 +591,7 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk=
 *core,
>                 goto fail;
>         }
>
> -       if (IS_ERR_OR_NULL(clk))
> +       if (IS_ERR(clk))
>                 goto fail;
>
>         dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk)=
);
> --
> 2.43.0
>
>
