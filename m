Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A99C31A045
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975215; cv=none; b=BYWbP0MTf/O5/hx0AiROfIlX7tNxiIBhEVMIg3zzsmJY254+20p6Y8J9Jes3K97Y71RLTMalexjA2MM/FutJd3vFTGYhyxlQkZMNkmh5tugdtmF5QRYq5QJXEepg3Y61dNrCtDNlmPEhzeXzJWztCCWFa6F8U1M0+YH/rIO6+/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975215; c=relaxed/simple;
	bh=Iqxgz7zIZ5MLQToUPdhTKIGhc6pvVg0Zo/Agn5ekWxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DKjyTYtLEw++iKvmio3qzQ91gWiJoF8ZivklRsZPOUKfQtUWXnFacnexr1cPmq3+gGFoN6/DjCMVMv1Q0dWKr5Q2VsBSDRPScmY8Bti4+JcMQ58JiVHj036wzfNII20MLz/NcLe7g2cbHJ+37VDFvaG9HlQjB/UOu2GCa9Un83s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-57513ac61f0so798212e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 03:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975213; x=1778580013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuHpybwjKLKCiao/+mTwUndwe61THQbcI6j1mq+muAs=;
        b=LZA4xEofjv30vR4gNoW/Cm4CDaduwbmEd5TLiUGJZx6wNvc7Ia/+GtplEAjrQTOFx1
         heDJtkfnuiT5ZQ+Dqt8udKxKiAU7ftD+TqDKcGrsBNDEQATPQfJWTZjofibxMHnDLyqp
         mVL8t8470ypLqz6sigs1mI/CwQdfM/ODmEqal6YTCDodL7tCDrdAnCsITK0RTQKdTcXj
         8dnx3jgR6XPDnAuL/kCsTfQs2Ee0f2AyIQW/gueF1MtfsdqFU5PNMQf2IegelV+dmxW9
         VN9ZENo5kuMibP693RXC0zvSZajt7VVRsTWXaX7+Pich3xtVCh0C5jFv++1DSqKTVr7g
         LYgA==
X-Forwarded-Encrypted: i=1; AFNElJ9JAI7d5fY1BlXUNnou7PGQ8gVlWDnSfKdBTMZRHVW4EFctcCYVQ+C2YqxXBaiYvmaPaya3EJef4hE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuH3UGfX/YWwmfIMXIiWyX+A8WgUVUWAGhoB+BgcFSkhlXv5cq
	fHNgBROP/Mf7QSk6PgAMBb+NVREqRyAnp+xr4h0B2bPO/qhNj37Uf4Kfj5sTt8qv
X-Gm-Gg: AeBDiesKKlBdo5hBg0npxy4j825YF9m4cJzgY104CLLszm1NABKF+MjYVOV38ZGOQs7
	KGKo4umh4Nl2VLk64XIez9uH9I21cN7gQS5XXgbYzWl2zVX4rxtmO4s8h5uLNe5TvtShZmGlwLX
	CPKqwVJfL9+uDXIdHUn2ocrqKqIA7kzIJLh2PgWorCG0ynLfdORkgMff4vFxw81ysMkixhQZ6Q/
	Jr9hrajhn+S7WazTNG9QvDbnkm4izjOaxX+ExhTPB0OfYSvqdEPz8jWhHdWxBe1kr51d2iPkecN
	rjxfAiyUWIVHxtLZNeDuyan27D9hysg2jB4U155DG/H2ZXVgQqZxoJgfLu7XH4l3/foeXR3S2WO
	OIKDvT6m15T2N15goB/LXB72kehh7PgGzyCJbO4J3c1Kbp94CozNSJqzsmFx+Ag/4VhUd5JLg4Q
	Cq+64oXkmz0zncmiaifcIBe+s2wLCs+J0aAQezCty/U86iiP2SzAA10sEVcgBZE1El3lgaIAA=
X-Received: by 2002:a05:6122:1354:b0:56f:6cc0:681e with SMTP id 71dfb90a1353d-5750c6b4595mr6387601e0c.1.1777975213624;
        Tue, 05 May 2026 03:00:13 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce08972bdsm6539075241.1.2026.05.05.03.00.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 03:00:13 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-60fbbac2938so2209537137.1
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 03:00:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+sDL/i1EtDlUZy+nGd2zvMmQZ+893NIoSRrA/h1XxqZjbJQiYRB/mUpSD6m/W1CQDGR9Lhdc+jAh8=@vger.kernel.org
X-Received: by 2002:a05:6102:50a3:b0:5f5:4055:4556 with SMTP id
 ada2fe7eead31-62d84f62cfcmr5756702137.4.1777975211494; Tue, 05 May 2026
 03:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com> <20260428201522.903875-14-cristian.marussi@arm.com>
In-Reply-To: <20260428201522.903875-14-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 11:59:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
X-Gm-Features: AVHnY4JmctwdZMNWtvo6vN96jl6lMZtYIshncwB9zfTSrryPHUlTFUdh6bCKhZs
Message-ID: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
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

Hi Cristian,

On Tue, 28 Apr 2026 at 22:17, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Clock rates are guaranteed to be returned in ascending order for SCMI clock
> protocol versions greater than 1.0: in such a case, use bounded iterators
> to minimize the number of message exchanges needed to discover min and max
> rate.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> +static int
> +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> +                             u32 clk_id, struct clock_info *cinfo)
> +{
> +       struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> +       int ret;
> +
> +       /*
> +        * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> +        * be discovered in ascending order, lazy enumeration cannot be use for
> +        * SCMI Clock v1.0 protocol.
> +        */
> +       if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> +               ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> +       else
> +               ret = scmi_clock_describe_rates_get_full(ph, clkd);
> +
> +       if (ret)
> +               return ret;
> +
> +       clkd->info.min_rate = clkd->rates[RATE_MIN];
>         if (!clkd->rate_discrete) {
>                 clkd->info.max_rate = clkd->rates[RATE_MAX];
>                 dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
>                         clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
>                         clkd->rates[RATE_STEP]);
>         } else {
> -               sort(clkd->rates, clkd->num_rates,
> -                    sizeof(clkd->rates[0]), rate_cmp_func, NULL);
>                 clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> +               dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> +                       clkd->info.name, clkd->rate_discrete,
> +                       clkd->info.min_rate, clkd->info.max_rate);

Printing clkd->rate_discrete is futile, as it is always 1.
It would be more useful to print clkd->r.num_rates instead, although
that may still be lower than the actual value, due to lazy handling.

>         }
> -       clkd->info.min_rate = clkd->rates[RATE_MIN];
>
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
