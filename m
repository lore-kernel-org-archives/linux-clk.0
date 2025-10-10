Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE31273D66
	for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760081996; cv=none; b=n1dxN3hpXqFz9Y5vHA5OHxdYg+7tDtJcMCT7hKhWNfQPk8tfxq7T2MJQCpEwPnpcSbYYdLE5RdJHUF4PVXNG9ZRuFYhy2ZRJbuYKmr+YbGBcBKvVZpHtSG7VJY3t8ElL13tu0OW0vpg2x5sWLPlFTYHPCJJJzSVpNZnPBAqnbA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760081996; c=relaxed/simple;
	bh=UPchuvReFLKZUodDfs2E9bb42rO6Ub7zgDbedskMYJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HinrjPTuj8MIDnCO/O5K/opYAJWHjQF1LM7dANsQnDQSleO0qT7md5YE3fsYDs6qldw+fmpPBjv3LmbFTY7f6SE0M2/EYawfmAYWioboTGtYHJuOvzP5d24WGs0nA/Q3RwOQ7NgkmJUTY8QDDp/8mEGtAqxKljf6Z8R3Zmh35Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so1419857137.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 00:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760081994; x=1760686794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+ttZbolmltC88YmqqxciPmwAZI8Qy5cQcJ0WlW2Ejk=;
        b=SiCCKNCD1nXCJFn+MLqUDLfwgNJXOyP8wokqIEhWnh5HVH0+r16LP6vgybVx/sJp91
         /6SjN2D5BQnoIa+yg4ZL2og/GLx79dLqwlor5Z2BrIWpvCBFKx87vpVnmHhyXTNBBC9u
         9J7tUfX5fYJad8IP85LRgmBh/R/OOiy2jwKerIizLDWVRowaFoZbE5Da5W8FwtzrsIlW
         TsG9VnPdXW5Xa+YnmapoUn0SmfFC6Ne4/CLfqDExhR1X+9npkVDG7jzsIEqYeMexgtqG
         0xeivNiIfiPIVWcm+3rfTz5rgamfS5/swPTNDRehYqhzis55q70CDcTWk3uAw+Fa/IU5
         69gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH7cixfPkvSzhhI3l/XlPxO4B996vLRomxqvFGaVQdZ8nBJEATHZgZSyZWLcDTRuTxvC38odjxRHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZtABRF28dfRHzSMjfYIu7xb4kPC4peyvmBfhVMzYa1QkAEuV8
	g6j1ZfceU6PZxUKgxU3EkT5+6Rr+zJjy4hS4QwgeFqzir5ql4ERQEDCB8XOh0zx4
X-Gm-Gg: ASbGncvA/f3YaNP+ono9bmvZ7a7xYS7hXSOfpp6gIsrvmt+OfPGHN463ReIkjCMJaUT
	WK1aRXzBcYE/03sESMvfHcUEoVabaRPCbrfrwLyEMVQOO6RsWrKu/sLL/9mzW0jrN3Y0kiw58bG
	LH4Nr1YQpSOXjABqIGoS8W9Kr6KCvt+p68v6PAaaD5jSiDaP1acxTtaPfxeSFrao8XFxPmh+oKS
	JsCNsh7mW+sn3aZFXHVj+1YlfP37JxhSD25bHueN1bpuTE67By4cyNqPyYWKMjdeIlTste/O823
	YbTsvN2whpihZu8CL5yyuatJXUQQjD5ELOtpyPeCBSv+gYDUFw3S7rvB8VwRqEeFuC7WghKAXXy
	hBOIsH8uZnjxCV3fwbY6I5fmVBe3FT6W6R5wYQCKKmid6M86B/Q3Uj/BuqxpNPrt8JNh90pmDQT
	64oGU=
X-Google-Smtp-Source: AGHT+IHT3d/z4WMXf3tVHAMUQUu63MoKC7wnzWnkdh6U4Jg+6EacEcsU1dccKqAty3ETcjFccEtASw==
X-Received: by 2002:a05:6102:1483:b0:552:aa04:c61 with SMTP id ada2fe7eead31-5d5e23571dcmr5106373137.23.1760081993822;
        Fri, 10 Oct 2025 00:39:53 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf7ae894sm524322241.18.2025.10.10.00.39.53
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 00:39:53 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-556f7e21432so1630247137.2
        for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 00:39:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiEW5HMCdFovlVdjhMXMolLuUuYAjPKkpVcEasy2eLjuzhu0kr+tYaLVxPiSVKuBTKyW95wa8Rl64=@vger.kernel.org
X-Received: by 2002:a05:6102:1483:b0:552:aa04:c61 with SMTP id
 ada2fe7eead31-5d5e23571dcmr5106366137.23.1760081993484; Fri, 10 Oct 2025
 00:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV-6A+vV4bZLoT2NtXiqMQLTRRbNJXC1z2ttXX=aXFEGw@mail.gmail.com>
 <9864e81d-3b62-4513-9deb-1ce154cdc571@mailbox.org> <CAMuHMdVEK5MaJNWwpT_7yo0=tk+Pm+99QRD3SStkWsHHDDVJ7A@mail.gmail.com>
 <8220c385d69bd46adf65f58d8e95b247dff6ae1e.camel@pengutronix.de>
In-Reply-To: <8220c385d69bd46adf65f58d8e95b247dff6ae1e.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Oct 2025 09:39:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXf5-tajON6bu8E8riuKTYev+wr=F08oSsmR0rJgCF3YA@mail.gmail.com>
X-Gm-Features: AS18NWD8vsVGbk4pjXdOCbjlrmtFfZ_mqBe9nTk9CWR-xxNlIBE48LR0lCcl3Sc
Message-ID: <CAMuHMdXf5-tajON6bu8E8riuKTYev+wr=F08oSsmR0rJgCF3YA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add missing 1ms delay into
 reset toggle callback
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marek Vasut <marek.vasut@mailbox.org>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

On Mon, 6 Oct 2025 at 16:10, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Mo, 2025-10-06 at 16:03 +0200, Geert Uytterhoeven wrote:
> > On Mon, 6 Oct 2025 at 15:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
> > > On 10/6/25 3:43 PM, Geert Uytterhoeven wrote:
> > > > > R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> > > > > Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> > > > > after reset has been asserted by writing a matching reset bit into register
> > > > > SRCR, it is mandatory to wait 1ms.
> > >
> > > [...]
> > >
> > > > > +        * On R-Car Gen4, delay after SRCR has been written is 1ms.
> > > > > +        * On older SoCs, delay after SRCR has been written is 35us
> > > > > +        * (one cycle of the RCLK clock @ ca. 32 kHz).
> > > > > +        */
> > > > > +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> > > > > +               udelay(1000);
> > > >
> > > > 1ms is a bit long for busy waiting, so I'd really like to avoid this.
> > > >
> > > > While the documentation does state this 1ms, I understand the
> > > > issue we saw in the field was fixed by
> > > > https://patch.msgid.link/20250922162113.113223-1-marek.vasut+renesas@mailbox.org
> > >
> > > This synchronizes the asynchronized resets, this is a separate topic
> > > from the 1ms delay.
> > >
> > > > so perhaps we can do without this longer delay?
> > >
> > > This aligns the driver with hardware operation charts in the V4H RM,
> > > which mandate the 1ms. If we want to follow the RM accurately, then we
> > > do need the 1ms delay, otherwise who knows what kind of fringe failures
> > > we could run into.
> >
> > All true...
> >
> > > > FTR, it looks like the reset controller documentation doesn't say
> > > > anything about the context from which it is safe to make reset calls?
> > >
> > > What does this mean ? Please clarify .
> >
> > Are you allowed to call reset_control_reset() from atomic context,
> > like the ISP driver does?
> > For the clock subsystem, this is clearly documented: e.g. clk_enable()
> > can be called from atomic context, clk_prepare() cannot.
>
> The reset_control_assert()/deassert() APIs are de-facto only safe to
> call from contexts that can sleep, because some reset drivers sleep or
> call gpio_set_value_cansleep().
> This is not properly documented and the reset functions don't enforce
> it with might_sleep() either, which is an oversight.

Thanks for confirming!
So I keep v1 in renesas-clk-for-v6.19, using usleep_range().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
