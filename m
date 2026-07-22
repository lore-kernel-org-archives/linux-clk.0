Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF12137419B
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734823; cv=none; b=pDd8vgDigBRUgb+bDjOudlB9mMhSoUwr7Zv+HC7y1o1NTNfR0PEnQ12twRnrIARKMf4Yk0m6QYhxnfM76SKsitVVaciPRl3tefCNOM2E+2W0b5c8VrXChYLP19B6Gf+m+e2qo+F8U/lZ7VM2/fPStH2uI+9DN55oomD7W65Z7M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734823; c=relaxed/simple;
	bh=uDRLKiyy6QvKST8aNXCndqp2adi/H+h0f0Z2GZrCrZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvo31Voj5OjjbmxIyuPDipUvQyFZZ8C+Cmh/imB7bJWHmUIJDFzUYfN379T0jS92heO6GDOzDgUw+gTGDOFXdC5NrIGCIQy6qdDCpmne1CZG4qwhmb06OsETmU1zgu5k0BO7VKZeFqrHjxMEusZ2Sx3wBF5VM4W1sQPaXv/DjGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhosqB+K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhosqB+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0891F00ACF
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784734821;
	bh=GL5QMlueg+RBLunCViI0gP82K0VD9Crkblqj+RkN+xc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=fhosqB+KhhiTdsQfGQkeDjyUtd5YE3/L+IrGPc0MkVZDYXMgo09Gkkm9p7JjHNVHe
	 lbsJKvxh3kr4qpZxNmBcH3EorfMJ2SWOf+pDJth6e/ZVfCpQVjuH5ZNbIlNB8LolX+
	 9zA9yG2WBC/JEaPr1kjKbV6WkCo9bEOQB1QBttkr+43Ljavy4PD70JV+Gu7N55fk5y
	 61fqos+KW0D8uCmDPzmTRxnl+zKtT6wbeHKXsQz7LJD7JJ9MZ9WppXtA/qYx8hLmQy
	 qoqbi9DoiSgAGezwy27LAcRTjDQfx69W0BVTwbqfgMSkVDkrjy6WSxzw9mdA1a3HAb
	 xY5PGis/7yc3w==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2a8e4c77eso1592817e87.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 08:40:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr8g4M6LFHOw2ZgJbXNBfPCpaoEABhmxl/vI5bxyfTyv/VoaqInLG/+bB4fcywESyGuhakLjHx7XIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5axO23Yl5NEkbw8ZZFOjSh85ocSpd4AfKN+yG8oG6JzVu1syn
	leEnlnqVL2/Kk8zw7a+C3DiSSUzexhl9ue8gX+tg07OsLri5xhgZv4z/K20OXNvDWeiJTpTPfQl
	oAoCYTnAxdHoFH7gXhITXbToCxmg0UNA=
X-Received: by 2002:a05:6512:2212:b0:5ae:b6b6:c86c with SMTP id
 2adb3069b0e04-5b28fad669dmr5721907e87.63.1784734820147; Wed, 22 Jul 2026
 08:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com> <20260722-a733-rtc-v6-2-631cca28cc9a@baylibre.com>
In-Reply-To: <20260722-a733-rtc-v6-2-631cca28cc9a@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 22 Jul 2026 23:40:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v64HjXygw76zaNi9KaG-zfc+hZoeyp4EHyz68fcdK-AXNw@mail.gmail.com>
X-Gm-Features: AUfX_mzq6njx4TtR0siTbEAlTZtN0hsrmD9OVcdXfDqLxwDI3Q-I_SIq3FthBu8
Message-ID: <CAGb2v64HjXygw76zaNi9KaG-zfc+hZoeyp4EHyz68fcdK-AXNw@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] clk: sunxi-ng: div: add read-only operation support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 10:48=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> Add support for sunxi-ng read-only dividers. This will be
> useful to the a733 oscillator detection logic.
>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/sunxi-ng/ccu_div.c | 31 +++++++++++++++++++++++++++++--
>  drivers/clk/sunxi-ng/ccu_div.h |  1 +

>  drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
>  drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++

Left over stuff?


>  4 files changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> index 62d680ccb524..c385e0160f13 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -20,8 +20,22 @@ static int ccu_div_determine_rate_helper(struct ccu_mu=
x_internal *mux,
>         if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>                 req->rate *=3D cd->fixed_post_div;
>
> -       ret =3D divider_determine_rate(&cd->common.hw, req, cd->div.table=
,
> -                                    cd->div.width, cd->div.flags);
> +       if (cd->div.flags & CLK_DIVIDER_READ_ONLY) {
> +               unsigned long val;
> +               u32 reg;
> +
> +               reg =3D readl(cd->common.base + cd->common.reg);
> +               val =3D reg >> cd->div.shift;
> +               val &=3D (1 << cd->div.width) - 1;
> +
> +               ret =3D divider_ro_determine_rate(&cd->common.hw, req, cd=
->div.table,
> +                                               cd->div.width, cd->div.fl=
ags, val);
> +
> +       } else {
> +               ret =3D divider_determine_rate(&cd->common.hw, req, cd->d=
iv.table,
> +                                            cd->div.width, cd->div.flags=
);
> +       }
> +
>         if (ret)
>                 return ret;
>
> @@ -143,3 +157,16 @@ const struct clk_ops ccu_div_ops =3D {
>         .set_rate       =3D ccu_div_set_rate,
>  };
>  EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
> +
> +const struct clk_ops ccu_rodiv_ops =3D {
> +       .disable        =3D ccu_div_disable,
> +       .enable         =3D ccu_div_enable,
> +       .is_enabled     =3D ccu_div_is_enabled,
> +
> +       .get_parent     =3D ccu_div_get_parent,
> +       .set_parent     =3D ccu_div_set_parent,
> +
> +       .determine_rate =3D ccu_div_determine_rate,
> +       .recalc_rate    =3D ccu_div_recalc_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
> diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_di=
v.h
> index be00b3277e97..a30a92780a05 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.h
> +++ b/drivers/clk/sunxi-ng/ccu_div.h
> @@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct cl=
k_hw *hw)
>  }
>
>  extern const struct clk_ops ccu_div_ops;
> +extern const struct clk_ops ccu_rodiv_ops;
>
>  #endif /* _CCU_DIV_H_ */
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mu=
x.c
> index 4503c9780c39..12bfc99c9172 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -67,7 +67,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_co=
mmon *common,
>         return parent_rate / ccu_mux_get_prediv(common, cm, parent_index)=
;
>  }
>
> -static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *co=
mmon,
> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>                                             struct ccu_mux_internal *cm,
>                                             int parent_index,
>                                             unsigned long parent_rate)
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mu=
x.h
> index c94a4bde5d01..272a2c36a8f2 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.h
> +++ b/drivers/clk/sunxi-ng/ccu_mux.h
> @@ -134,6 +134,10 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu=
_common *common,
>                                           struct ccu_mux_internal *cm,
>                                           int parent_index,
>                                           unsigned long parent_rate);
> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
> +                                           struct ccu_mux_internal *cm,
> +                                           int parent_index,
> +                                           unsigned long parent_rate);
>  int ccu_mux_helper_determine_rate(struct ccu_common *common,
>                                   struct ccu_mux_internal *cm,
>                                   struct clk_rate_request *req,
>
> --
> 2.47.3
>
