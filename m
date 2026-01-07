Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FC43242D6
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794943; cv=none; b=DNYFGHXrz9CGoMgicuBKg4fMgiUQbUyFpL+StdWmMmvT8sg+Sxkbgnd/uV15lP2JBl/oNGBuvu5mR/6uy8tvReFgvGHpvSR93tyTUUe0gS3FTHiUm7eIDKRIkidDQQM6a2lX7Ssi0jaPTrueP2mUZ8jTwuKMqOkzqdMPl+Mri5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794943; c=relaxed/simple;
	bh=TSVifhnKCRQucGHNHKutXyQ826re/F8Nmgcx00jenV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWzpl56FH2/txlMJR2X7GbI8QVRLtUfbi25WnlwXd2MhPerjHF9GsSockdioUo1FVC9wKFAgXz7PcQEkABdSqaXD4Wa/i1PQtXNYJ/s3p0l1nF/Gl4oQ97LB9dtdFHqocNs2hA7PJLh3k4CLQu1ccSmWRyufVR/rn+9ChMcmoqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9412cb281acso653145241.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 06:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794940; x=1768399740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPXHBYXXpkOfpOjUxAWvhytlRsam27J/BeRqWtdFd5c=;
        b=TxSc+TBhba1/RXkJ6JmwEroozajtH07zVYqiio4jk2o5beEQChjdALQxdC3UHvbso1
         9QFP6YRf2mj3hDvd+Sh821xW+/qUsL5ypo5oHb7OgdwWakwQDlABkKLgL5sgVRd7u1nD
         TeWU8b0rQkSIncIHzoZnFCbsESio7XNP6HW7JeZ7izzns1GkfWvj8kNZ1wiBI1WGa0lT
         bbY686O4vA0LvZH+SevLEdKWBa4VzizsGgXQCpgaWdzIw4kiTgqziIG7Ks+U1iElyuI/
         H89iuB414Pw25iD+ABuL7kkDgZ6HbDqv4bLOyzxcYKVfUFj/Q46GMaEAulKmgq6wGSjJ
         Pr8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUls70vRPAIDeDNmwPMR+jpo+eQLlBHfal5Z1ttqigqgyGr+NZj1OLfKurNTGpNgQtkrudtOOpjvKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfNVssr+t36vAN4+v85nne6zD7bRmNPym3peiNK77NTHP7RI1p
	ASM8q8yi0zonpBoYltA6p002WlYKVkT3c/Tjf5uPhmGoFjm7ccoe4Ned7+Y0rYld
X-Gm-Gg: AY/fxX4mMRBpD5GbPvBxSYT+opc3IBPMKKl+03Imab4EoRrwtjDu4r1Nz2eXg20AL9Z
	YvdTib/zI0EHsagKGTwD0VhQm/Ey0h0LEoDATkxkYaee0QfHRGAGE6KQAHlX/R+KUmt52+j7n/Y
	UkXUh2L5xh5N9gVqqeo+EW0O3H+Aof63rFoMLZY+dGpXPZdM7hnHI59fR86lVGH844iN3C0Glj4
	jWiOCZsZyROTHGp9ksuhgC0llPekFqgVrJ9VkxHPEdhCPOI2jpqH/175izqNXYkuKggN8l25zyy
	f3JTJNtPHZkRYsOn3IGRdH9W1KIIK2T3p3vANcYsm7dU686kbTg2spytl7YKK1h3K2uj58lugZp
	r626S4AZfyCyaCTQo7rUzr1ZBm3RW+fo0j+AY+4av4JTb3L96mGTFddERcoMO3hr1g2/LFdu95z
	FXmwPy5THD92aI2u//sl5ynMNu8Ke4qWO8U+VaCoYvNlAgToWc5d39
X-Google-Smtp-Source: AGHT+IEjWsLHV9UFbgVqGyjQrgA/C+QP6ZxTojaqIrtFVGNT4QT3DxlkYOGYyA8mjtMOdHKKqmDh9Q==
X-Received: by 2002:a05:6102:32c5:b0:5db:f850:b1de with SMTP id ada2fe7eead31-5ecb6928cb2mr825372137.25.1767794940226;
        Wed, 07 Jan 2026 06:09:00 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ed082abc75sm1418673137.1.2026.01.07.06.09.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:09:00 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-55ae07cf627so607324e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 06:09:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpRdaw4+k5pKFkCKRpQSVfrhFlT/JhNU/m18ELypKtgSGaHSSG6zGHFpkYA7eHOTQTCf3tFfRmVpM=@vger.kernel.org
X-Received: by 2002:a05:6122:4f9c:b0:559:6e78:a43a with SMTP id
 71dfb90a1353d-56347d600bbmr999355e0c.9.1767794939883; Wed, 07 Jan 2026
 06:08:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251127145654.3253992-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251127145654.3253992-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 15:08:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVh_B-tsAgU_pe4=QQVghxtuvQ0=yYce-1QMA+sL3GJGA@mail.gmail.com>
X-Gm-Features: AQt7F2rEh-n0UC7mrUlXv9V_Mi1tNA0_C3FMrdM40X2hHGBHysCIPhEzFsHF9uA
Message-ID: <CAMuHMdVh_B-tsAgU_pe4=QQVghxtuvQ0=yYce-1QMA+sL3GJGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: cpg-mssr: simplify pointer math in cpg_rzt2h_mstp_read()
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Thu, 27 Nov 2025 at 15:59, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Private state is available in all places where cpg_rzt2h_mstp_read() is
> called, remove the extra pointer math used to find it from clk_hw.
>
> While at it, put these statements on a single line as they do not exceed
> the 80 columns limit.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c

> @@ -286,17 +282,14 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
>                 barrier_data(priv->pub.base0 + priv->control_regs[reg]);
>
>         } else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
> -               value = cpg_rzt2h_mstp_read(hw,
> -                                           priv->control_regs[reg]);
> +               value = cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);

All callers of cpg_rzt2h_mstp_{read,write}() pass priv->control_regs[reg],
so a future consolidation could change that parameter to reg.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
