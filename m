Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753458;
	b=EJjJsoETSscgolqOuIPyBS5GFm6dtTgVerNrI5zKHdpD4iRpsl96MVlukoEzK4lbbcii
	 JwJrvkIeuvYedq/X9Xw2DJ9Jd6/hPCTdx+xAYiRNUttL9+mEuG7kEWFAiZ1lGwyb4RADh
	 daK1o2xu9xO5gsKvlB8DScJ5mj6G7suQFTCHr35YSripHs892kutXo3wuwuH41uXbvRqp
	 qe33ZHrkZyl7djJkJhQAjUgZR7KQZJbYIC0RinhjhgmPZuJeOzVneolCHRkU0YUjkweNN
	 lutoCxi+nbbyb0BPk5dGv7uHKS5AYYeeATvHUUiIFH1qWcZgxaxRVc1/bIhMWmWsQUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753458;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ou+D8+UafU+jp4Hw7Aa+E+nQ0dVT5dxPA488UsJVsjg=;
	b=uuPCWtAuaokyTDEX40c/bilYF2gPL6ibQ9PeToBfV+/3ArJUWs8LFmdOtivLArmLcZRc
	 22YhZSghNTrtOCbzP0XiMXcP9j7+9jc7VmfVbaSIS0SxtOX29OpbgLURXn/x6yi+IRT6x
	 DUMRBIvx6kev40lLmtRZySxFcNKHSsARr6Q6BcPNRnfW4Boc2qZAUngx2Y2ROTBE4FkNf
	 KiAxRt/UmjVm0z7rj9mZD1+c60TDCFr9LGMzx6euZHjIWxBmvOIRN6omWVejAD8i6s9Iu
	 ctWc6TTTgVQ88qdJ0nulOH7AOvdjan0Q/Hlw87fZ7VN8sw9zdKYiXZh4UGgPHeYykZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAg6Qxne;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BDB606A334
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAg6Qxne
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775AA1F00925
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794753458;
	bh=Ou+D8+UafU+jp4Hw7Aa+E+nQ0dVT5dxPA488UsJVsjg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=NAg6QxneUukEEMO/5KyW40RXWbYpgoyRdO8F0fApuPvpzdbZcgBdFBzuCnHyRQKm3
	 1i6xmcO08M3XbiEER05ZsQg9jmA1Vy/qXSm+OWetsz18ImZeiLjNaR7UPDWW9aaU5I
	 rsLIS80li64OvTApTvnSGNz7LwuLNAvHA45p+thSHkKJ+LcDj9MqbNkZg0mTsuQd0D
	 7R6vbWgXJT+G5IOfRUY+hU6vUdr32dk0l0VlJng9RBdywzBNq7vPLXCkl8muse76JR
	 XjTnh0GNCu2oTpBV9xi4gQi54wL67zSbAJkPQlWlZzkJ7wfd+DOBLocz7YsULyMr0T
	 TCXWp2BHHKLaQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adfe77d336so27722051fa.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:37:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHt4S/odaXGsvN2Bd0zIN8op5ZE43AiqmzCe2BIOTU+/TDzU7aTXpFnmNvmis7p8pWX6ikYlos8qvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nYrMu0Sbya9ZpZaP7EajLMfInFL0WrHqBjUliSDUPFVDq6MA2
	ksICu6zs1qVxWdUjZ2KU5h+xV59NE1T+WHwqUL6shB4NV2FkYgb7Kl8M62Qf92YKwgb+oUrLvi8
	BfxyVwmNnKpAShrOBsWkoAq9/wv2rG1I=
X-Received: by 2002:a2e:be8c:0:b0:3a9:9a2e:27fd with SMTP id
 38308e7fff4ca-3ae2b35bc76mr26369541fa.0.1794753456820; Sun, 15 Nov 2026
 06:37:36 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
 <20261115061102.229680-9-jernej.skrabec@gmail.com> <CAGb2v64wZv7TV1Jb-r0qtvRz=dWWO_YkhYxMwxBNcyVUoKi9VQ@mail.gmail.com>
In-Reply-To: <CAGb2v64wZv7TV1Jb-r0qtvRz=dWWO_YkhYxMwxBNcyVUoKi9VQ@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 22:37:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Kh_dTmZ715-RSsQD=Y=hjmi2kZ0ESLqxxs8aPZ7ydaA@mail.gmail.com>
X-Gm-Features: AclHuK_SACmwWg6PkvqxFn5K18kN5QhlBxadj6BOscc2Q_hjlnBtJkiANF8wPgA
Message-ID: <CAGb2v67Kh_dTmZ715-RSsQD=Y=hjmi2kZ0ESLqxxs8aPZ7ydaA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] drm/sun4i: Switch DE33 to split plane bindings
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, sboyd@kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:26=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Sun, Nov 15, 2026 at 2:11=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > The shared plane driver and split register resources are now in place.
> > Switch DE33 mixer discovery to the new bindings and remove the legacy
> > per-mixer plane setup. Mixer register space now covers only display
> > blending control, so limit its regmap accordingly.
> >
> > The old DE33 binding is not supported anymore, since it can't describe
> > shared planes and was never used by any device tree. If it's detected,
> > print an error asking the user to update the device tree, instead of
> > failing silently or misusing the plane register space as blender
> > registers.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c | 195 ++++++++++++++++++++--------
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h |  10 +-
> >  2 files changed, 140 insertions(+), 65 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4=
i/sun8i_mixer.c
> > index dbde80b32080..0970be6aa035 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> >  #include <linux/of_graph.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/reset.h>
> >
> > @@ -25,6 +26,7 @@
> >  #include <drm/drm_probe_helper.h>
> >
> >  #include "sun4i_drv.h"
> > +#include "sun50i_planes.h"
>
> Nit: doesn't seem to follow the order we use elsewhere. I think we normal=
ly
> would do:
>
>     sun4i_drv.h
>     sun8i_*
>     sun50i_planes.h
>
> >  #include "sun8i_mixer.h"
> >  #include "sun8i_ui_layer.h"
> >  #include "sun8i_vi_layer.h"
>
> [...]
>
> > @@ -566,12 +582,34 @@ static int sun8i_mixer_bind(struct device *dev, s=
truct device *master,
> >         if (!mixer->cfg)
> >                 return -EINVAL;
> >
> > +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33) {
> > +               /*
> > +                * The original DE33 binding described planes as part o=
f
> > +                * the mixer, which can't work with more than one mixer=
.
> > +                * It was never used by any device tree, so it's not
> > +                * supported.
> > +                */
> > +               if (of_property_match_string(dev->of_node, "reg-names",
> > +                                            "layers") >=3D 0 ||
>
> No need to wrap this bit.
>
> > +                   !of_property_present(dev->of_node, "allwinner,plane=
s"))
> > +                       return dev_err_probe(dev, -EINVAL,
> > +                                            "Unsupported DE33 mixer bi=
nding, please update the device tree\n");
> > +
> > +               mixer->engine.ops =3D &sun50i_engine_ops;
> > +       } else {
> > +               mixer->engine.ops =3D &sun8i_engine_ops;
> > +       }
> > +
> >         regs =3D devm_platform_ioremap_resource(pdev, 0);
> >         if (IS_ERR(regs))
> >                 return PTR_ERR(regs);
> >
> > -       mixer->engine.regs =3D devm_regmap_init_mmio(dev, regs,
> > -                                                  &sun8i_mixer_regmap_=
config);
> > +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> > +               mixer->engine.regs =3D devm_regmap_init_mmio(dev, regs,
> > +                                                          &sun50i_mixe=
r33_regmap_config);
> > +       else
> > +               mixer->engine.regs =3D devm_regmap_init_mmio(dev, regs,
> > +                                                          &sun8i_mixer=
_regmap_config);
>
> At some point we need to move most of the bind function to the probe func=
tion.
> None of the devm_* stuff gets released if the bind function fails.

It seems I was wrong. Though it probably still makes sense to move anything
that could return -EPROBE_DEFER to the probe function to make it fail / ret=
ry
early.


ChenYu
