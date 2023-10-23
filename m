Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B0ECDB474
	for <linux-clk@archiver.kernel.org>; Mon, 23 Oct 2023 06:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjJWG67 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 02:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjJWG66 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 02:58:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C99188
        for <linux-clk@vger.kernel.org>; Sun, 22 Oct 2023 23:58:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507cee17b00so4255961e87.2
        for <linux-clk@vger.kernel.org>; Sun, 22 Oct 2023 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698044334; x=1698649134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AggOw4gyhQlmzq+AcacEhd6fE3kwcmhNbn+RHnF4ZA=;
        b=IUMCVp1yu2Y8zd+5T9P/RpuF6cBfOiYo98MakUI/1LyVIvI9kCsv2XSUZZ6qQFyD96
         D2uPBersQAWgwGyn+wwbYU4J844one7EVxoYl3N1Nbo4Lzn7JA0h3CJZ97sfSk6fs8Zr
         G6SV5jA4ZeOpwebgt1AT0PhrR0TB25segP3Zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698044334; x=1698649134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AggOw4gyhQlmzq+AcacEhd6fE3kwcmhNbn+RHnF4ZA=;
        b=ENCKU2hj6aa1YdRI1ajbY/pbTz/0OEoo4TkIWLfxRzAKuLB65pNM7sG7luFH4S6mke
         0oBdUrioHgm+M/fFnEtVWOXgo+l6+4l6375SEbzDEsa2j8GcQj1S80bfILg+lTGKuOlL
         aY61o8XKA2l+ccVsi5p2QqIVb8jE76io0EB7KNyghCVmp8hHcYOaOm77cOQAFjMMZLtP
         AmWuSMYCFzUOzI2ajNQZNNvVTX08Ufi7GeZ9wjkX6wgx4ch0x8qKqGzzpYd9HlNRF06d
         tdNkhu4j9Ubpl4WstL9y6qC4Oqg1qpQEZPtkmUvOUxVGdkzHrxvXi0p67MJQ7cUH0nuo
         m3Hw==
X-Gm-Message-State: AOJu0Yx9SsBuUtoaZtxvXnUqclxBv6ufWSXFLt2KcLtUecv6jU8MmnXr
        iwZJL6QcUu41EAjzd6pw+hTk69j5iHXiIFeZlNTBLg==
X-Google-Smtp-Source: AGHT+IEDEEegpRAkeIAJjsJe5uw5u6Zg24Rc0CspNAaKu7rz0BnbylYUTnsliwahaGAHqAtyyNPM2eftcw6EcoW+izM=
X-Received: by 2002:a19:645c:0:b0:505:6c99:bd7c with SMTP id
 b28-20020a19645c000000b005056c99bd7cmr4901040lfj.57.1698044334323; Sun, 22
 Oct 2023 23:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231018103546.48174-1-angelogioacchino.delregno@collabora.com>
 <20231018103546.48174-2-angelogioacchino.delregno@collabora.com> <CAGb2v674=OTe9oDktH_BdrV7bdWQfk_2KkC-xdSckBu4ZoLrcQ@mail.gmail.com>
In-Reply-To: <CAGb2v674=OTe9oDktH_BdrV7bdWQfk_2KkC-xdSckBu4ZoLrcQ@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 23 Oct 2023 14:58:43 +0800
Message-ID: <CAGXv+5FTFght35TFzHO4H_hWumKoBqemeiun2wssEVcxrLGO6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: mediatek: clk-mux: Support custom parent
 indices for muxes
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        msp@baylibre.com, amergnat@baylibre.com, yangyingliang@huawei.com,
        u.kleine-koenig@pengutronix.de, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 23, 2023 at 2:57=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Wed, Oct 18, 2023 at 6:36=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Add support for customized parent indices for MediaTek muxes: this is
> > necessary for the case in which we want to exclude some clocks from
> > a mux's parent clocks list, where the exclusions are not from the
> > very bottom of the list but either in the middle or the beginning.
> >
> > Example:
> > - MUX1 (all parents)
> >   - parent1; idx=3D0
> >   - parent2; idx=3D1
> >   - parent3; idx=3D2
> >
> > - MUX1 (wanted parents)
> >   - parent1; idx=3D0
> >   - parent3; idx=3D2
> >
> > To achieve that add a `parent_index` array pointer to struct mtk_mux,
> > then in .set_parent(), .get_parent() callbacks check if this array
> > was populated and eventually get the index from that.
> >
> > Also, to avoid updating all clock drivers for all SoCs, rename the
> > "main" macro to __GATE_CLR_SET_UPD_FLAGS (so, `__` was added) and
> > add the new member to it; furthermore, GATE_CLK_SET_UPD_FLAGS has
> > been reintroduced as being fully compatible with the older version.
> >
> > The new parent_index can be specified with the new `_INDEXED`
> > variants of the MUX_GATE_CLR_SET_UPD_xxxx macros.
> >
> > Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  drivers/clk/mediatek/clk-mux.c | 14 +++++++++++
> >  drivers/clk/mediatek/clk-mux.h | 43 ++++++++++++++++++++++++++++++----
> >  2 files changed, 53 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-=
mux.c
> > index c93bc7f926e5..60990296450b 100644
> > --- a/drivers/clk/mediatek/clk-mux.c
> > +++ b/drivers/clk/mediatek/clk-mux.c
> > @@ -89,6 +89,17 @@ static u8 mtk_clk_mux_get_parent(struct clk_hw *hw)
> >         regmap_read(mux->regmap, mux->data->mux_ofs, &val);
> >         val =3D (val >> mux->data->mux_shift) & mask;
> >
> > +       if (mux->data->parent_index) {
> > +               int i;
> > +
> > +               for (i =3D 0; i < mux->data->num_parents; i++)
> > +                       if (mux->data->parent_index[i] =3D=3D val)
> > +                               return i;
> > +
> > +               /* Not found: return an impossible index to generate er=
ror */
> > +               return mux->data->num_parents + 1;
> > +       }
> > +
> >         return val;
> >  }
> >
> > @@ -104,6 +115,9 @@ static int mtk_clk_mux_set_parent_setclr_lock(struc=
t clk_hw *hw, u8 index)
> >         else
> >                 __acquire(mux->lock);
> >
> > +       if (mux->data->parent_index)
> > +               index =3D mux->data->parent_index[index];
> > +
> >         regmap_read(mux->regmap, mux->data->mux_ofs, &orig);
> >         val =3D (orig & ~(mask << mux->data->mux_shift))
> >                         | (index << mux->data->mux_shift);
> > diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-=
mux.h
> > index 7ecb963b0ec6..943ad1d7ce4b 100644
> > --- a/drivers/clk/mediatek/clk-mux.h
> > +++ b/drivers/clk/mediatek/clk-mux.h
> > @@ -21,6 +21,7 @@ struct mtk_mux {
> >         int id;
> >         const char *name;
> >         const char * const *parent_names;
> > +       const u8 *parent_index;
> >         unsigned int flags;
> >
> >         u32 mux_ofs;
> > @@ -37,9 +38,10 @@ struct mtk_mux {
> >         signed char num_parents;
> >  };
> >
> > -#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,        =
 \
> > -                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,    =
 \
> > -                       _gate, _upd_ofs, _upd, _flags, _ops) {         =
 \
> > +#define __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,       =
         \
> > +                        _num_parents, _mux_ofs, _mux_set_ofs,         =
 \
> > +                        _mux_clr_ofs, _shift, _width, _gate, _upd_ofs,=
 \
> > +                        _upd, _flags, _ops) {                         =
 \
>
> Nit: I would take this opportunity to fix up the alignment of the lines
> here, as well as for the new macros. Also you needn't wrap the lines at
> 80 characters. Instead I would wrap where it makes more sense, like group
> arguments for the same type (parents / mux / gate / update ...) on the
> same line if possible.
>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

And of course I meant to send this from my chromium.org address...

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> >                 .id =3D _id,                                           =
   \
> >                 .name =3D _name,                                       =
   \
> >                 .mux_ofs =3D _mux_ofs,                                 =
   \
> > @@ -51,11 +53,28 @@ struct mtk_mux {
> >                 .gate_shift =3D _gate,                                 =
   \
> >                 .upd_shift =3D _upd,                                   =
   \
> >                 .parent_names =3D _parents,                            =
   \
> > -               .num_parents =3D ARRAY_SIZE(_parents),                 =
   \
> > +               .parent_index =3D _paridx,                             =
   \
> > +               .num_parents =3D _num_parents,                         =
   \
> >                 .flags =3D _flags,                                     =
   \
> >                 .ops =3D &_ops,                                        =
   \
> >         }
> >
> > +#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,        =
 \
> > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,    =
 \
> > +                       _gate, _upd_ofs, _upd, _flags, _ops)           =
 \
> > +               __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,         =
 \
> > +                       NULL, ARRAY_SIZE(_parents), _mux_ofs,          =
 \
> > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,    =
 \
> > +                       _gate, _upd_ofs, _upd, _flags, _ops)           =
 \
> > +
> > +#define GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents, _paridx, =
 \
> > +                        _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift, =
 \
> > +                        _width, _gate, _upd_ofs, _upd, _flags, _ops)  =
 \
> > +               __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,         =
 \
> > +                       _paridx, ARRAY_SIZE(_paridx), _mux_ofs,        =
 \
> > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,    =
 \
> > +                       _gate, _upd_ofs, _upd, _flags, _ops)           =
 \
> > +
> >  extern const struct clk_ops mtk_mux_clr_set_upd_ops;
> >  extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
> >
> > @@ -67,6 +86,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd=
_ops;
> >                         _gate, _upd_ofs, _upd, _flags,                 =
 \
> >                         mtk_mux_gate_clr_set_upd_ops)
> >
> > +#define MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,      =
 \
> > +                       _paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs, =
 \
> > +                       _shift, _width, _gate, _upd_ofs, _upd, _flags) =
 \
> > +               GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,   =
 \
> > +                       _paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs, =
 \
> > +                       _shift, _width, _gate, _upd_ofs, _upd, _flags, =
 \
> > +                       mtk_mux_gate_clr_set_upd_ops)
> > +
> >  #define MUX_GATE_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,          =
 \
> >                         _mux_set_ofs, _mux_clr_ofs, _shift, _width,    =
 \
> >                         _gate, _upd_ofs, _upd)                         =
 \
> > @@ -75,6 +102,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_up=
d_ops;
> >                         _width, _gate, _upd_ofs, _upd,                 =
 \
> >                         CLK_SET_RATE_PARENT)
> >
> > +#define MUX_GATE_CLR_SET_UPD_INDEXED(_id, _name, _parents, _paridx,   =
 \
> > +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,  =
 \
> > +                       _width, _gate, _upd_ofs, _upd)                 =
 \
> > +               MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name,         =
 \
> > +                       _parents, _paridx, _mux_ofs, _mux_set_ofs,     =
 \
> > +                       _mux_clr_ofs, _shift, _width, _gate, _upd_ofs, =
 \
> > +                       _upd, CLK_SET_RATE_PARENT)
> > +
> >  #define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,               =
         \
> >                         _mux_set_ofs, _mux_clr_ofs, _shift, _width,    =
 \
> >                         _upd_ofs, _upd)                                =
 \
> > --
> > 2.42.0
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
