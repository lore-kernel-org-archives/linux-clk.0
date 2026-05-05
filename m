Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D2139934D
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982728; cv=none; b=gukD908tkALaC7vrE2VIgVYrnNVgSTq/+XpqQrqSaFC/8ykhaoYL1J0libZsgm80PKUk0nOfCPEMl1UJCAOuALgs8AvmfoQotE28br1BbH+g4dTWcwRUtWIy0Dk5gCscXJhoBSW279/IYhT4ILKuI4a0HgwxnNiwF/j5scuRmFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982728; c=relaxed/simple;
	bh=6qmJB7Ugs0YgAfkUvBE9SVyIpJgfeZTTcqGmgTZ2Vr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVy9a5ezD04NT6vGtPy+FLiG93zXQLA43wc696K/UPTXva+PSamDFTOKEkVWLB/n5z9gZ/9KV0SmtU+KMCtyQAa9Ng0EvI85jR2TjJsVDzWzUOoyF2kBOpSL9dLBNAjn5kZOzMFHOCI/WrM0hOsJDK6Li+ITcmGom/Kk/7MlnyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5751136c561so2113512e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 05:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982726; x=1778587526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WSn3Gp8++tbsczQV3o+avsi3Hm1AnDhWAFzNoHqmYE=;
        b=VuiUATTF4DxHEbQwmFiN1mXNtQ2UV0xMAPB29Nvbw4Gs8uDNhjLKnA0BKKjEUUnMPW
         5SrGjXgY/MuLVSc367D7C/GNJa5U1uHeccD3t4ZQmEx8IOqXkhtEl6nT/Zto2H35duew
         Ho7DGH9QKF97Pa0cf1D+aSZfCUFbzWcdbUlEkzymuRSVRyclvfbuiyeIEB32M2EdUW+2
         +DYJ37wkLE8sFEFzUOH8duJxPF3AuDauoQOQz1Rlz5diy7Jjcby5y3u8vkEcXiQQktgG
         Tt24suSAYW8UBIaDKZTKs3Nk6hIy179OAHvFFTkRaoonbQ+mUJlQmOE42/oxn8+QaKiD
         zCQg==
X-Forwarded-Encrypted: i=1; AFNElJ8K2BazX5Eafqc9HVeWpY7IuEj/eHn9tKgKnSVp6JxWfwSWw6h5YFlxMb+ldxuaMpghLFufVVM70R0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1nTD7lSzUP22njnbAUE65Rwk2HEgx+VHAJBCi+foCq1XCYggV
	YNqsncSFlKyGQ+ayRMICINa5Ak2W7aln7iT+s99mx58AY976PiwasSW4oPtSC1/u
X-Gm-Gg: AeBDietnRDlYUOPsY9wp3cOYz9OnuZgiAvWh156FZfHkMtkUBRZDe18Yr0pgcBAeEw4
	jcDSxXG2KlJhiKEs/urE7evcuXiTog1GLsZ4MBh5DllxlHoSoqKrvClARi2G4jY3oMLxQyaqHOK
	B2K8VULBSQzl1kFev83VxwJUpp/e3Gl3hMzbcfIbX8V4nYWK5t2QcAeWo8QXCE8HkjM0bqXvCaX
	cuWBp8PfQDqr5MkGtZwLATCPq1ZriUcsNOc5qnirbLp1SrConec7/NXaCoa7oKot+HZVothW4/n
	7Mjg7gwhlqEVlkjDlbs9qTpFSeQ/TIRxFXpoklGH3S6LmYIi1exn8Ni25f8PFlF3tfQ8Nf1tSs3
	AnX9atb+GEuWCjiyTWn8STA90qRkk5/vwVqJjA2BwZ1oaGplmV78cWv/Eu6wghbHbikQvArzVgK
	p2jZmHktknCGlTLd4ahPLGPfkWh/2E99K8AGAPxFzy8Yghm4FmFgo4bbuLjg0tHBE0+a0g08aAQ
	pPrgPafWy6HQQ==
X-Received: by 2002:a05:6122:1796:b0:56f:696a:4fec with SMTP id 71dfb90a1353d-5754462b143mr1387279e0c.5.1777982726521;
        Tue, 05 May 2026 05:05:26 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5754dc8b662sm662042e0c.4.2026.05.05.05.05.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 05:05:26 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56f6afbd205so2628112e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 05:05:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8W3TXSoHKuJGuUl0J6G1eQCAaaOY1JrrvzC5f5snVUQR8/TgzHFqdJHcL8XFK/zxJk2+f48YkbyQ4=@vger.kernel.org
X-Received: by 2002:a05:6102:d8a:b0:607:d68f:d0f6 with SMTP id
 ada2fe7eead31-62f55a492fdmr1354982137.20.1777982236245; Tue, 05 May 2026
 04:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-14-cristian.marussi@arm.com> <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
In-Reply-To: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 13:57:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUG9cTH+WFAHymHeBrPK1vsE5XCJeWOxqF22efc_omMhw@mail.gmail.com>
X-Gm-Features: AVHnY4Lq3Zggrs4Qv91iMEofghVqKQUPPKW-R1C9WbhWCH-RGMfKoh_-yjYR4Ms
Message-ID: <CAMuHMdUG9cTH+WFAHymHeBrPK1vsE5XCJeWOxqF22efc_omMhw@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] firmware: arm_scmi: Use bound iterators to
 minimize discovered rates
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 11:59, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 28 Apr 2026 at 22:17, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Clock rates are guaranteed to be returned in ascending order for SCMI clock
> > protocol versions greater than 1.0: in such a case, use bounded iterators
> > to minimize the number of message exchanges needed to discover min and max
> > rate.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>
> Thanks for your patch!
>
> > +static int
> > +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> > +                             u32 clk_id, struct clock_info *cinfo)
> > +{
> > +       struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> > +       int ret;
> > +
> > +       /*
> > +        * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> > +        * be discovered in ascending order, lazy enumeration cannot be use for
> > +        * SCMI Clock v1.0 protocol.
> > +        */
> > +       if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> > +               ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> > +       else
> > +               ret = scmi_clock_describe_rates_get_full(ph, clkd);
> > +
> > +       if (ret)
> > +               return ret;
> > +
> > +       clkd->info.min_rate = clkd->rates[RATE_MIN];
> >         if (!clkd->rate_discrete) {
> >                 clkd->info.max_rate = clkd->rates[RATE_MAX];
> >                 dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
> >                         clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
> >                         clkd->rates[RATE_STEP]);
> >         } else {
> > -               sort(clkd->rates, clkd->num_rates,
> > -                    sizeof(clkd->rates[0]), rate_cmp_func, NULL);
> >                 clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> > +               dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> > +                       clkd->info.name, clkd->rate_discrete,
> > +                       clkd->info.min_rate, clkd->info.max_rate);
>
> Printing clkd->rate_discrete is futile, as it is always 1.
> It would be more useful to print clkd->r.num_rates instead, although

clkd->tot_rates (sorry, my local tree still had your v2)

> that may still be lower than the actual value, due to lazy handling.

clkd->tot_rates is the actual value, so there is no such issue.

>
> >         }
> > -       clkd->info.min_rate = clkd->rates[RATE_MIN];
> >
> >         return 0;
> >  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
