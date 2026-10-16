Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934504E56C2
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166916; cv=none; b=koF/thTYM10x2XKX+hWCsfGAbU2fqr5uHXX4oFRszlxw4bCis/o2+tBk8kQJF4UMdrK8QVLJHijbyLOGtwi/Q5s0xp8ZGX9Rg4+bEmUEr4u3SG/PyOhG0gpiYpjxNFRAIcqdQqkWfUrKxf2zwuSIPiXQ0nxNmqDTqms6fPmrPeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166916; c=relaxed/simple;
	bh=8A1d+qHHMFQaSJTrPG2tv/uY9JQA2ctyWGVH/vz47R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i35J9tKTGBxsI4GpJSal6yNj2JJCgJdE5uWbsGtexuZBgvnOTG+DusPFPIuuybJXkZLs4/ORt/d0wK8EeTEBydXZfD7LiLbQexTul6GMK7gctDiDcu/1Hbjy9orbieTWBAh165/ETHpWT/nn0E5mVs2ulStpwuYUFu/Iv0hstPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7c2f48f3a96so7950137.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 09:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166913; x=1792771713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EBoejTYsbTcBCosEo6zoo5hOecy+fLbrjfkaXbBdKs=;
        b=ulAQ3vqU5kZ69QGGIVhWpjtB3n3KoTewB3Wwku6TE888IKpmxyboQWD2MOcD7N+XTR
         EHH2lOXIqcMM8mAPpA+CCoMhucrohAHNSjgsyx/3qYnO/XgE5Kry1036u6Khm0JNs7ON
         87tJpCGhmNWNQ3zWTMyyJBltlPG3b6W6SBXudFFtTJrgiWsNqSGrbRiDwF+v6ru91nj7
         io8rqf6sLzvjcjP6fHxS5TsBHU/4LO+OjSD5SOxMVxjsthMgTqT5nN2NCOk71WqX1yXC
         4CsZyC8oVbqo/8r5JzP1TfOawJCxURJc2I6duXc5QRuKOVF9TWJT1VjEocFDi7Nad/t1
         YPaQ==
X-Forwarded-Encrypted: i=1; AKwUvByipah9HWjJ2CBNdCntPaVNHpt1HS/p/ehblRSbaJyxgF5bHVa25ThFljym412wAjYhiKlpTenruJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIL9E/CsZ+LHKYILfPUHbfy3HmOls9or0LvtCdr44bLcU2PXgg
	WgRGhEo1BSrBOPU7U1ms1LRucJO+vQlhc9pmMjVQSO7fRz9Q2ELQb2aucwgp+OkH
X-Gm-Gg: AYBFou0d+zijvYcSrM5i3SbA7aYsRxYKqxlZOCmWupkyXRIZpeVIOlK7MSGB4K+1cfR
	6MZekmYNwgPeIvbha6keChciBPMdmMHIDLCVxHpVKYeKChYR9UtScz2X2kYDxNk3Y9eeVWTnecx
	DmJAOW1WihLXacsX7OMg22+8sOUilIHo5XdFeRC41ZqfRj9wEPvaHIGvhJpSDhK3BTRf+tqjM/i
	Ay3Ei4+qH7mllAmd/f5EQMJ9mFShd0ocbT78K182QvjhpenOKA6fUEqu2qsCx0p6vSL/OEoiBzU
	N7rT2myp39EfmjBE/EFeR/t13EWuIWnjfuTJtebpbNNSLpeMZIuiHbmxckY0LG6CFFpfZSQpkKf
	ej/5KnOU+kwXgVS/gpffC/D3xxFZMpe2sr2meRqBQf/1VktkifhO6aPYGQFDGVCAi5xWtRVYFkB
	bchuenh97hqZuNE2+5dN/7enUkQevDzZCIrjmkkmE1APJMxXKOFyGY7zF11k8BtiDfFVxE9PIc+
	hv87PIDssNb5bO96JQaybm/pL5//BifLnlp
X-Received: by 2002:a05:6102:26c2:b0:7c2:635a:4f4b with SMTP id ada2fe7eead31-7cb3a178b48mr6014115137.29.1792166913344;
        Fri, 16 Oct 2026 09:08:33 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990835c253csm1937531241.5.2026.10.16.09.08.32
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:08:32 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-77bf892b496so11209137.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 09:08:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByB3xWb4ZlZwE3gxL3uXOtXHtX1v+eU8lPWbZcpTnJXBpZmOm/FyvV55oQMOixF0WtwUsOhl86oTvM=@vger.kernel.org
X-Received: by 2002:a05:6102:5ccb:b0:7a1:fa0f:1106 with SMTP id
 ada2fe7eead31-7cb3a1baeabmr5620835137.36.1792166912166; Fri, 16 Oct 2026
 09:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <b9e68c8df1e545191e0359dba23fe53de31a4ce5.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174595@kernel.org>
In-Reply-To: <sashiko-outbox-174595@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Oct 2026 18:08:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyr7MN3Q_p2xYWukmbwdSPCmR90++AJWohsS7TWqxp-g@mail.gmail.com>
X-Gm-Features: AclHuK94_MM_qmX3UtowEDModV_nQO7Yoe2DHkKw0PQAKUP0rJtGNhubnONEYfQ
Message-ID: <CAMuHMdWyr7MN3Q_p2xYWukmbwdSPCmR90++AJWohsS7TWqxp-g@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] reset: Add reset_control_get_from_provider_exclusive()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, 16 Oct 2026 at 18:02, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] of: memory leak of device node reference on error path
> --
>
> commit 6e1c5e27c808997c3ce5fe5fc257fedbfabb6954
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> reset: Add reset_control_get_from_provider_exclusive()
>
> This patch introduces reset_control_get_from_provider_exclusive() to allo=
w
> looking up and obtaining an exclusive reference to a reset controller fro=
m
> a provider. It modifies the existing __reset_control_get_from_provider()
> helper to support this lookup.
>
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index 0e11f4c81c10d..421bcc4c89cc2 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c
> > @@ -1153,18 +1154,30 @@ __reset_control_get_from_provider(const struct =
fwnode_reference_args *args,
> >       if (WARN_ON(args->nargs !=3D rcdev->fwnode_reset_n_cells))
> >               return ERR_PTR(-EINVAL);
> >
> > -     if (rcdev->of_xlate && is_of_node(consumer)) {
> > -             struct device_node *np =3D to_of_node(consumer);
> > +     if (rcdev->of_xlate && is_of_node(fwnode)) {
> > +             struct device_node *np =3D to_of_node(fwnode);
> >               struct of_phandle_args of_args;
> >               int ret;
> >
> > -             ret =3D of_parse_phandle_with_args(np,
> > +             if (consumer) {
> > +                     ret =3D of_parse_phandle_with_args(np,
> >                                        gpio_fallback ? "reset-gpios" : =
"resets",
> >                                        gpio_fallback ? "#gpio-cells" : =
"#reset-cells",
> >                                        gpio_fallback ? 0 : index,
> >                                        &of_args);
> > -             if (ret)
> > -                     return ERR_PTR(ret);
> > +                     if (ret)
> > +                             return ERR_PTR(ret);
> > +             } else {
> > +                     of_args.np =3D of_node_get(np);
> > +                     of_args.args_count =3D args->nargs;
> > +
> > +                     for (unsigned int i =3D 0; i < args->nargs; i++) =
{
> > +                             if (args->args[i] > U32_MAX)
> > +                                     return ERR_PTR(-EINVAL);
>
> [Severity: Medium]
> Will this leak the device node reference acquired above?
>
> When consumer is NULL in __reset_control_get_from_provider(), the code
> acquires a device node reference via of_args.np =3D of_node_get(np).
>
> If an argument exceeds U32_MAX, the function immediately returns
> ERR_PTR(-EINVAL). This early return skips the of_node_put(of_args.np) cal=
l
> at the end of the block, permanently leaking the OF node reference count.

Yes it will!

This can easily be fixed by moving the for-loop to the top of the
branch, i.e. before the of_node_get().

BTW, perhaps the time is ripe for helper functions to convert between
fwnode_reference_args and of_phandle_args?

>
> > +
> > +                             of_args.args[i] =3D args->args[i];
> > +                     }
> > +             }
> >
> >               rstc_id =3D rcdev->of_xlate(rcdev, &of_args);
> >               of_node_put(of_args.np);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792163045.=
git.geert+renesas@glider.be?part=3D4

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
