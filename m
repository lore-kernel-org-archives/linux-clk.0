Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426866;
	b=O9mvLyW2aNS4pfKdhBsliMSM8g1UsEtOkXSm1sbqBBetyNr/pXH7PRpw+JGZlzyz9AcU
	 Qf4AgYkPfxrEVO79Q3olubJktkrMuM6arNYzCrzsOcL6PjwCVSDSLifYcVfCJL/D0Nocm
	 XulBVVl1tfXeGZZ5hSV70MTyV7MRXgpRjlWExvKMp9UZEjUryYzpIVZgY/m1/kAcCfY+2
	 1hoywKAtyq+IJc7GJLcmea8k2RLznyKLKFlwmvmZfI796hzlP+5q6iJ2GSImqb9NVDhMo
	 KFb3AD18Y/cZe5OjbN5wGevCVdjxmBW61A3g5vTVU/TZ18Kwv4RQDCZuS+xYh/jlIZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426866;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VNVvlFmAYqdL7e0NbR8n4mhG40CW5PlDGJg9XCAnokY=;
	b=dI4GXGHkNuPEVFUMtjoiFKE26ei+V/2XLmnhK0JjHaRvzYBz0Uyf2l/OMMd/3PG8kMlC
	 GZdMQ4L2CRudZsW9pP6QL1ZJdCEsS+D1iEHmoZrrrEyb1Htw92qUCR8qRAbq1YGWTipga
	 Q2YNC+oSWNk88p3aGBEsoF9kJd3q0zn9SF63NMVA11zT2+8QwBiYK7adB3bPeRgFPxoOB
	 ONzkOwzhnP+lYyS4gvrRl8wd1xez481Nm+2upmtiOt7qgH0DqB32BeSeTGYSvWmb28yy9
	 6RpwXa0o3j8ynuVKGhW57fhyD+8FNB+VjO3I2vwXsCpz3LdAiHB31Vbhppdv4OI1u/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328B160A2604
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 16:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328B160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso13613931fa.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426863; x=1793031663;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VNVvlFmAYqdL7e0NbR8n4mhG40CW5PlDGJg9XCAnokY=;
        b=JoXqjHZusz1HF7kyKbuSORhCzutDJp7RP7qSRrmUsn6OFRJWELWyaz1uUssNmJ/6it
         Kn1uiuiW5EX6e9ciRZFdoebvluT8jbqKL2dCLXbaN44th27fVO6TU7QPpR52msl+qg4c
         97lhrnYMMfehfpFa1WKgaeQRvki2K/Xk1Kwg3I3CF7YpT0MEfH2hwUp82TMXxzaLfK/P
         YT0WPqbLRjrHb5dPSqsxCtkA96AWUzo6xXh2+KDs3Zf4v1pz03NhTSHlnuVR71Y3Nkxl
         FbqFGYc+z9Rk4Gy6TMriADaKwoZW8jA25JRvGDDEH42TAR+4hVwSEFFmSgQXLUL4EKYM
         6fsA==
X-Forwarded-Encrypted: i=1; AKwUvBzYJPc/TC4nlT2doTWDnF/bXgLSNQDOR9uGYTiGIYaHHDZ6PtaoZTJCNJVPk7Y9zYRNZJcXXjI5LRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvgbmPotcwozjZ8RL1vjmW8GBSAdb0pw5I7fyhmkP9n1rhGRK6
	jGGyCJP6A9yIcfbckmFtRKCTKZyOvmHrI2RjwqKWa2TM+zK0bbNI7/6Tas3dmcyPD1I=
X-Gm-Gg: AYBFou3ISxsPjfjnfAqInwLdSlMWjftKra3hMWEa7jLY0iVBIaN5dtG5mG+Mj0py18P
	2Ri1t/lpFsC1YXsLkdsqlwtVifvMN7yOfCgC7c3c4FPGTD9/8MuQC7KZroa4diYdGp80aOW1y8t
	00jB3N0qowyg+uA4IyEPqCsksk6tLVwNXypXE9bh1bL5wheIPL7LSHNLTnRX4MCf1KPiMY4pMGr
	qucwA61iSXWUxcot68UqZ8nWAONx/QXqpetegbCF02mqAt0i+UPvY4W8V2V/bUuqCwPML0eKH8J
	M4oRws4eAFkAW9VVSAY5hU5Hja78DkbhC8Kj/kKctxNzi0n/+oQlQ0lgwY8BjuSX/HKceQqJZuJ
	b1wboKUo9DvcLzTTMiZnlNr82ANGtbxuD1KSy0mq5GPj1eTf+tdnZ8nDdaNKqNjxLKxDczk9NHr
	5zZQ6JgEBGbCVpfnnC5NruyciTy4EgK18fyCVyKtQtjc8bOOPzzVYC2MfsyYm71Q0QIOn7jUqD9
	KrOkY+I+om4PS/cuxqexQ8s0CxyapmHPDT9T0rrHJsQcc1s
X-Received: by 2002:a05:651c:50f:b0:3ab:4b23:c130 with SMTP id 38308e7fff4ca-3ab4b23c1cdmr2359641fa.1.1792426863010;
        Mon, 19 Oct 2026 09:21:03 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab1ecd6d31sm23312061fa.17.2026.10.19.09.21.02
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:21:02 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso586504e87.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:21:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZNFypddldHoSaJz8R+lUIx9EnYDVDL4FjiKvuYjlfohjVJ8cbBnYOXb0D1qNKgmP0lx25NrtIqkU=@vger.kernel.org
X-Received: by 2002:a17:906:99c2:b0:c41:825d:ed8c with SMTP id
 a640c23a62f3a-c41825dfa20mr602336266b.26.1792426550419; Mon, 19 Oct 2026
 09:15:50 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be>
 <20261019155619.GB3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019155619.GB3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:15:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDgc+NMFQ2HgkngsvyhVd1+yEgnk3DQpyVmVUQ_aLvEA@mail.gmail.com>
X-Gm-Features: AclHuK_Wqb_TY8SIlHzico7Y9pGZs0pikimfidJslyUcM_WsFGAezgyxmzAMr2w
Message-ID: <CAMuHMdXDgc+NMFQ2HgkngsvyhVd1+yEgnk3DQpyVmVUQ_aLvEA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: renesas: r8a78000: Add SCMI remapping support
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

On Mon, 19 Oct 2026 at 17:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:41PM +0200, Geert Uytterhoeven wrote:
> > Extend the Clock Pulse Generator driver for R-Car X5H with SCMI support,
> > to remap DT clock IDs to abstractions (clocks) offered by the SCMI
> > firmware when running on a system with SCMI, and SCMI support is
> > enabled.  Take into account some peculiarities of the current SCMI
> > firmware implementations, and fall-back to fixed-rate clocks as
> > replacements for SCMI clocks that are not available.
> > Support for bus clocks used by serial, I2C, and SPI devices is included.
> >
> > This lets us avoid putting SCMI IDs in DT, and allows us to use the same
> > hardware description in SoC DTS for systems with and without SCMI
> > firmware.
> >
> > For now, it is assumed SCMI clock IDs are stable, and match SCP FW
> > SDKv4.31.0 and later.
> >
> > Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c

> > @@ -94,6 +113,21 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
> >       return hw;
> >  }
> >
> > +static struct device_node *scmi_find_proto(struct device_node *scmi, u32 proto)
>
> This is the kind of function name that looks prone to a namespace clash.
> I'd name it r8a78000_clk_scmi_find_proto().

I deliberately picked that name, as a suggestion for a future common
helper ;-)

> > @@ -145,7 +184,46 @@ static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> >                       break;
> >
> >               map[i].fw_id = map_in[i].fw_id;
> > -             map[i].hw = fixed_hws[map[i].fw_id];
> > +             if (map[i].fw_id >= FIXED_CLK_OFFSET) {
> > +                     enum fixed_clk idx = map[i].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                     map[i].hw = fixed_hws[idx];
> > +                     continue;
> > +             }
> > +
> > +             scmi_spec.np = scmi_clk_np;
>
> This seems to be safe because a NULL scmi_clk_np implies usage of the
> default map, which only contains fixed clock offsets, but that makes the
> code a bit too fragile for my taste.

Fair enough, I can add a check for a non-zero scmi_clk_np...

>
> > +             scmi_spec.args_count = 1;
> > +             scmi_spec.args[0] = map[i].fw_id;
> > +
> > +             clk = of_clk_get_from_provider(&scmi_spec);

... but please note of_clk_get_from_provider() will return -ENOENT
in that case.

> > +             if (IS_ERR(clk))
> > +                     return dev_err_cast_probe(dev, clk,
> > +                             "Failed to get SCMI clock %u\n", map[i].fw_id);
> > +
> > +             hw = __clk_get_hw(clk);
> > +             if (!hw && fallback != map_in) {
>
> And if the above is correct, fallback should always be different from
> map_in when fw_id corresponds to an SCMI clock.

True.

> What issue does this catch ? Should the fw map contain a fixed clock
> entry for clocks not available in SCMI ?

Originally it had entries for fixed clocks, too, as the firmware
restricted access to several bus clocks.
Recent firmware provides access to more bus clocks than before, hence
I figured it would be better to use the SCMI clock when available,
and only use the fixed clock when the SCMI clock is not available.

> > +                     for (unsigned int j = 0; fallback[j].dt_id >= 0; j++) {
> > +                             if (fallback[j].dt_id == map_in[i].dt_id) {
> > +                                     enum fixed_clk idx = fallback[j].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                                     map[i].hw = fixed_hws[idx];
> > +                                     break;
> > +                             }
> > +                     }
> > +                     if (map[i].hw)
> > +                             continue;
> > +             }
> > +
> > +             if (!hw) {
> > +                     /* CLOCK_ATTRIBUTES is not supported */
> > +                     dev_warn(dev, "SCMI clock %u is NULL\n", map[i].fw_id);
> > +                     continue;
> > +             }
> > +
> > +             dev_dbg(priv->dev, "SCMI clock %u is %s at %lu Hz\n",
> > +                     map[i].fw_id, clk_hw_get_name(hw), clk_hw_get_rate(hw));
> > +
> > +             map[i].hw = hw;
> >       }
> >
> >       devm_kfree(dev, fixed_hws);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
