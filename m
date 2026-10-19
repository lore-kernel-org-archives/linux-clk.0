Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422181;
	b=cSHcFB0br6LX1ta3FnTqQizNRfaML/UqX5L7EFyGLfIo8uYE4Dakyu4CH1gPkCSXfP5f
	 1DrpofRw/ubjBFBoXLsWkfBA7Cw217w+BvoFZ3asnOPwCLozCfRZKscLwHmdW8zevU5O3
	 t90Y/6HKm3eC8Pz2n+6tpK8Vs0LxGbY6Ldl4NU7EV3PFRrBMK8j2f0IRfr7odUEw0odmD
	 hpsCLF4KSA3yIPHw0f5LSc/kMI7CLbaIGhNmyigI/dIW4BsX7RtXrcmH4GizNz+QMRsVA
	 CLqoI/xDUjOoJzUYQuCHUFgnuWBkgXvXjHPWZibJdLNmJx63QIP/HoxQa3G5UkguIeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422181;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Yo6/2OGJfxhXILo4QGIB9gHfvFskGfKjbh+hNyiFvf8=;
	b=OEY82Q0MGsqQ8iyTHnTR9woGPSiSpVcfI5HWvD34uFNL+ld/m3Xe5kfoY8wfCivulNl+
	 fEvUEwer62lQoJ97DCO5cMltoPwhl9d0X8Ibh3yijBcRfaIR+4ptRKUaGcaoq/eXc7f2k
	 4AAWlBe1wTZ9errQ7dUQGP2GmxcmJLSYMFMDuxbHejQG67MjMUdiNR91I3lW46NjyvyJv
	 I7FN4E5wZeEDjMCHY9b13boJ4Ty0ceY+olmDREBH/8V5fBO9xMjrYtz0cyZzUizmJ4RRs
	 amPL9YN+ImJa7qQeW4EJy/IIwh5WRaCfXX8QhJP2/9kXLg0dcTy3i8OINMYyW2+JcvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10CE607D347
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 15:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10CE607D347
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8acda240937so17097867b3.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 08:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422180; x=1793026980;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yo6/2OGJfxhXILo4QGIB9gHfvFskGfKjbh+hNyiFvf8=;
        b=xq7i03BZBQS25nq7sWXjoVciMEHkzjRKAtyvTznMFxyHzTs8jC79+WG8UR2ZnYmNIK
         hDEBAwbXOYO0w6/++pqX9Z2U44MGoWcMRxJO239EupFgLXIwRbtQkFlVuvQGzGZ6Cp3v
         v69PkTxC6UefY5CnxI4ClAcU9AirqJL5FtukwtvA8SsLMkvSVXeuNt09d66wMwFfF8/M
         vbIA0OjZ4rP1pQ9ldljs75xD2GeR3M8jdGV61hdvnFfi+WTlu9U3ArbE3z6Q7ipKFLGI
         rGc5MwSs/5INTzFd1wR6WV9oL606ay99Nygjug8JJieEqkQqj1FptQKItkRkjkiEQqa1
         StwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpH6apLWE+ZhPlYjIqU8+slCKv+QleQN2Br4qGtRGXBrYeZKtnKYEtOp3s4ft/zeO9ValEVIc7saM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0RR9I8Qhs63wpR9G1e6+paLKVtCuFih6a+i7AVffDrxe6p/Eb
	SVeAvfenDYB+Ht2yYbippGsVD/G87ereNImRftihFlgHKzQjenB9VZ979RV3CCAVMm8=
X-Gm-Gg: AYBFou0QH5iWeneGaGRsZtWM8JJsZMCAm8pQ5vPkuVzt6TkRi1fnNajyGwy62dG7I61
	VCb9nm9yIHpH5p+rytFcFCP0eLC10FRnQAMeztrUvmCOS6IMpt0Vlzz9YcfJLOv6+sdlL2/RmH4
	Ffmus37+HgHOvXR1mO0VTkdPOQk06T8s/S9cVFPdoGumTZ8XnOaqSQZ+hlHZkD27Eda52qbk7Es
	VkvqbB7mHFfoWh1E2y4ZRCKTozs3figWNAIsKYmrIEUd+dIzf+UF6NESWJN2oMiOuAQ12JkdSbU
	phOBp/qafrOD2ZrwuYtUQMEn9+wecbo6qL/xENTE+ZvlQ6+hjR3LNMelGfTAdAwtIHxXOkJwR/f
	cvnrx3vu/O5PpeimhoRxJnLPR5rMy58B4sqjpro470JZr4avnXzDus5xZL8YiSo6jL4qudblfrF
	hyz3CBwpLeRaEuhofDqOlOv8/RQkQC9Iy9D9Q2N8RdL4vEmW1OdZJdwJVew6JQh/fV7OnZEMzfe
	3snbFwOfwYn/9SaZQDFUaUQoB6B4J9GwWRSqd6U
X-Received: by 2002:a05:690c:113:b0:882:309e:fcaa with SMTP id 00721157ae682-8b0f213a803mr24312837b3.15.1792422179843;
        Mon, 19 Oct 2026 08:02:59 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91be8f89b54sm61810816d6.7.2026.10.19.08.02.59
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 08:02:59 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5366463571cso12867211cf.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 08:02:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3qZ84Gkj6vcDUSrcylGV+Q4GYo73TZ7Hp245+cqA6rPntJklP1f5Ncb7M7KVzk5okMtGx2Enobbs=@vger.kernel.org
X-Received: by 2002:a05:6102:f86:b0:7cb:288a:b66d with SMTP id
 ada2fe7eead31-7cc369ac7b5mr1684195137.20.1792421799154; Mon, 19 Oct 2026
 07:56:39 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <20261019144256.GC763679@killaraus.ideasonboard.com>
In-Reply-To: <20261019144256.GC763679@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:56:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
X-Gm-Features: AclHuK9UZUEUyPMO3TO_vFhUiV57c9SStFUdXlV8TRdwkOQjKO9ySUhEkuMfo5c
Message-ID: <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 16:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> > Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> > pointer to the clk_map structure, and populating it up-front.
> >
> > Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> > needed afterwards, and drop NUM_FIXED_CLKS.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > @@ -16,19 +16,24 @@
> >
> >  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
> >
> > +struct clk_map_in {
>
> The "_in" suffix isn't very explicit.

I can add a comment...

> > +     int dt_id;              /* DT binding clock ID or -1 sentinel */
> > +     u32 fw_id;              /* FIXED_CLK() ID */
> > +};
> > +
> >  struct clk_map {
> >       int dt_id;              /* DT binding clock ID or -1 sentinel */
> >       u32 fw_id;              /* FIXED_CLK() ID */

BTW, do you think it would be worthwhile to reuse clk_map_in here?

> > +     struct clk_hw *hw;
> >  };

> > @@ -92,35 +94,69 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
> >       return hw;
> >  }
> >
> > -static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
> > +static struct clk_hw **register_fixed_clks(struct device *dev)
> >  {
> > -     struct device *dev = priv->dev;
> > +     unsigned int n = ARRAY_SIZE(fixed_clk_rates);
> > +     struct clk_hw **hws, *hw;
> >       unsigned long rate;
> > -     struct clk_hw *hw;
> >       const char *name;
> >
> > -     for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
> > +     hws = devm_kcalloc(dev, n, sizeof(*hws), GFP_KERNEL);
> > +     if (!hws)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (unsigned int i = 0; i < n; i++) {
> >               rate = fixed_clk_rates[i];
> >               name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
> >               if (!name)
> > -                     return -ENOMEM;
> > +                     return ERR_PTR(-ENOMEM);
> >
> >               hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
> >               if (IS_ERR(hw))
> > -                     return PTR_ERR(hw);
> > +                     return ERR_CAST(hw);
> >
> > -             priv->fixed_hws[i] = hw;
> > +             hws[i] = hw;
> >       }
> >
> > -     return 0;
> > +     return hws;
> > +}
> > +
> > +static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> > +                                       const struct clk_map_in *map_in)
> > +{
> > +     struct device *dev = priv->dev;
> > +     struct clk_hw **fixed_hws;
> > +     struct clk_map *map;
> > +     unsigned int i;
> > +
> > +     fixed_hws = register_fixed_clks(dev);
> > +     if (IS_ERR(fixed_hws))
> > +             return ERR_CAST(fixed_hws);
> > +
> > +     for (i = 0; map_in[i].dt_id >= 0; i++) { }
>
> This is avoidable by passing { map, ARRAY_SIZE(map) } as match data
> instead of just the map.

True, and I did consider this.
The same mechanism is used in the MDLC driver, where using ARRAY_SIZE()
would quickly became a bigger burden due to the presence of many
more maps.  So for consistency, I kept it the same in both drivers.
An initialization macro might make it more manageable, though.

> > +
> > +     map = devm_kcalloc(dev, i + 1, sizeof(*map), GFP_KERNEL);
> > +     if (!map)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (i = 0; ; i++) {
> > +             map[i].dt_id = map_in[i].dt_id;
> > +             if (map[i].dt_id < 0)
> > +                     break;
> > +
> > +             map[i].fw_id = map_in[i].fw_id;
> > +             map[i].hw = fixed_hws[map[i].fw_id];
> > +     }
> > +
> > +     devm_kfree(dev, fixed_hws);
>
> Why not plain kcalloc/kfree ?

To avoid having to free it manually at multiple (three) locations,
both in the error paths and the success path?

>
> > +     return map;
> >  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
