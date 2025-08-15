Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC4D294A0C
	for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 03:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755228215; cv=none; b=iuFV55THPu9wXrJ5eH6VKTyfudRguH4U/Iz+84IzpOfo7DijwppUEPdMt4huIOpnYtr3p0jqGuvUMTlHlLGkNfA3srmJRpv/wvDSEvkl1c3vEiwYvB1Mm8+V1L0HBKlaQvlzQQZDa2RPGPAyIBKaasHQBo/L1Dj6kzX1V+vh5kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755228215; c=relaxed/simple;
	bh=Jj/EHb6IFTCIJ9Esh8qax0aW/OSeKywMQ3N9/K1fMkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RuH5nsgIB/lDlxmxq/EWn4qhanALOzDCmg1x9+GohKr3jyECafSKNb+ehPWWs+sDrEhkSg/7JrI3ZyNarXkSZTZZlzdPzj1p1iL3ca3l9jxztS1M4K2aKLoJW0b6vNzW/ciN2ftGZyrH1h4a6NN++Kkg/ILNfaxp2RXKztItMm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=albJYN59; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="albJYN59"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55ce528022eso1694247e87.3
        for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 20:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755228211; x=1755833011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loZthR9RzPQDn5YAIwnBCElKX3TDSMbtkyZ9fbUSqGg=;
        b=albJYN59aXR4vSY0hiDIiSXjrQgfrnN0yIE4+t2VzduZzBKMKwWmK6NmsIxQcEkwWV
         csJTjqo2eaaG1+gD0R34574AncSpdbDZxISc2duybsJDspFq0RMpf47w/tkulyVBl3U5
         VlTtMjxDtUb/vn18I1iAg6rKlIXBTRClHx1pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755228211; x=1755833011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loZthR9RzPQDn5YAIwnBCElKX3TDSMbtkyZ9fbUSqGg=;
        b=OOLgKB2qfgNRy92XZjc127guPkxWqBQnE+7MuRyLlWsacN5/YhE5T+5dpMkN6MCnJM
         gfmV95ii3hLoxnmnc+meGRA9zvkBg+0eKaMDn3vOEie7moIHfC5eW+ZilYD4f1Ib2pVP
         iFWb//NZByFafBemb4JXZxoDaui5nBYyAvzbtNXAgX27B+WUHgkkF1X/Zh7h02md7Zd8
         uUfu0jQ8l3BfF4Hd7m+OQdL2esXiDMqWmBM9Si6M3JssXdze6y/0h/M5zKyxnXGoLn7I
         8JYtrDfr/3AVKqX7ScO7ysqhjhrAYmZAvmibsi9n7d/9ZCaRwY85vXxYQQ65VzviaPjD
         YtWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqBHFJRA1PS9BzrUM4C3L5dEj78ZQCWQALYn3cxRv6+7b+M26DyUmLR25rnarBAcrZH2xZ3OiuZBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxarl7IZAy06XYiBPPuarGoWe4xzXrI0Hpq+PnNm2U2Cs2gniL+
	vqAdj3np6E3SyVMpxn5n+6jHsz+0y4aZ8qjy7MdCm7V/nbltPAU35TW49/0IphLT3UWSbvgSy+A
	mDxkKQL7EiNmE5d67Y0vbE0VGhoN3MTDAsdsT5xLwBngLgoBQJIpzoI+H
X-Gm-Gg: ASbGncvWnC1yGgVaa0nnuHNaNZPz8QS/A9eUgEiQbraVL5mFlN77hYaM6rfX6aY1zNL
	xeXBfkTQwuRFBtdwI5zrx4CEGUyEPb4Cvl3I7Ly0xJ6yO8MKyD+M0Q8nHUZ2lVP/D2x2hKLYHEV
	02ncU8zbIz70Z6ioaSowt3R2d827SPEM3FYxcOEmsfsORpOpDOiRZszdbY+KU9N7b5WnT4dvpaM
	2vnF9QDAAi2FviQeqjiosEC5SJlvoyWsO8LKw==
X-Google-Smtp-Source: AGHT+IHVtC4Alxt8AWwZST4v89xIyMs9zLoVRtml2n78wl63Mvb3mMjCwjWs3lTr5lXzzhW6dAAnYS4ErrmaVz2N51k=
X-Received: by 2002:a05:6512:39d6:b0:553:a740:18aa with SMTP id
 2adb3069b0e04-55ceeb2d2b6mr153164e87.22.1755228211106; Thu, 14 Aug 2025
 20:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-4-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-4-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:23:20 +0900
X-Gm-Features: Ac12FXz6uzhVa5mzNMAxjzWWhn_Ab-739zVQPdyqAO9BXTYqTIf4635L7GMmTws
Message-ID: <CAGXv+5Fhsm=JrBP9y-kScw-zK_XFc4Dqfd3VUXx+rA6oBxptJg@mail.gmail.com>
Subject: Re: [PATCH v4 03/27] clk: mediatek: clk-mux: Add ops for mux gates
 with set/clr/upd and FENC
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 uses set/clr/upd registers for mux gate enable/disable control,
> along with a FENC bit to check the status. Add new set of mux gate
> clock operations with support for set/clr/upd and FENC status logic.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  drivers/clk/mediatek/clk-mux.c | 48 ++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-mux.h | 45 +++++++++++++++++++++++++++++++
>  3 files changed, 95 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index c17fe1c2d732..136a4bc6dbe6 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -20,6 +20,8 @@
>
>  #define MHZ (1000 * 1000)
>
> +#define MTK_WAIT_FENC_DONE_US  30
> +

Nit: I think it would be nicer if you define this locally in the mux type
clk code, just to keep the two completely separate.

>  struct platform_device;
>
>  /*
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mu=
x.c
> index 60990296450b..b1b8eeb0b501 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -15,6 +15,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
>
> +#include "clk-mtk.h"
>  #include "clk-mux.h"
>
>  struct mtk_clk_mux {
> @@ -30,6 +31,33 @@ static inline struct mtk_clk_mux *to_mtk_clk_mux(struc=
t clk_hw *hw)
>         return container_of(hw, struct mtk_clk_mux, hw);
>  }
>
> +static int mtk_clk_mux_fenc_enable_setclr(struct clk_hw *hw)
> +{
> +       struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> +       unsigned long flags;
> +       u32 val;
> +       int ret;
> +
> +       if (mux->lock)
> +               spin_lock_irqsave(mux->lock, flags);
> +       else
> +               __acquire(mux->lock);
> +
> +       regmap_write(mux->regmap, mux->data->clr_ofs,
> +                    BIT(mux->data->gate_shift));
> +
> +       ret =3D regmap_read_poll_timeout_atomic(mux->regmap, mux->data->f=
enc_sta_mon_ofs,
> +                                             val, val & BIT(mux->data->f=
enc_shift), 1,
> +                                             MTK_WAIT_FENC_DONE_US);
> +
> +       if (mux->lock)
> +               spin_unlock_irqrestore(mux->lock, flags);
> +       else
> +               __release(mux->lock);
> +
> +       return ret;
> +}
> +
>  static int mtk_clk_mux_enable_setclr(struct clk_hw *hw)
>  {
>         struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> @@ -70,6 +98,16 @@ static void mtk_clk_mux_disable_setclr(struct clk_hw *=
hw)
>                         BIT(mux->data->gate_shift));
>  }
>
> +static int mtk_clk_mux_fenc_is_enabled(struct clk_hw *hw)
> +{
> +       struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> +       u32 val;
> +
> +       regmap_read(mux->regmap, mux->data->fenc_sta_mon_ofs, &val);
> +
> +       return val & BIT(mux->data->fenc_shift);

Nit: Do a double negate.

> +}
> +
>  static int mtk_clk_mux_is_enabled(struct clk_hw *hw)
>  {
>         struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> @@ -168,6 +206,16 @@ const struct clk_ops mtk_mux_gate_clr_set_upd_ops  =
=3D {
>  };
>  EXPORT_SYMBOL_GPL(mtk_mux_gate_clr_set_upd_ops);
>
> +const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_ops =3D {
> +       .enable =3D mtk_clk_mux_fenc_enable_setclr,
> +       .disable =3D mtk_clk_mux_disable_setclr,
> +       .is_enabled =3D mtk_clk_mux_fenc_is_enabled,
> +       .get_parent =3D mtk_clk_mux_get_parent,
> +       .set_parent =3D mtk_clk_mux_set_parent_setclr_lock,
> +       .determine_rate =3D mtk_clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_GPL(mtk_mux_gate_fenc_clr_set_upd_ops);
> +
>  static struct clk_hw *mtk_clk_register_mux(struct device *dev,
>                                            const struct mtk_mux *mux,
>                                            struct regmap *regmap,
> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mu=
x.h
> index 943ad1d7ce4b..c65cfb7f8fc3 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -28,11 +28,13 @@ struct mtk_mux {
>         u32 set_ofs;
>         u32 clr_ofs;
>         u32 upd_ofs;
> +       u32 fenc_sta_mon_ofs;
>
>         u8 mux_shift;
>         u8 mux_width;
>         u8 gate_shift;
>         s8 upd_shift;
> +       u8 fenc_shift;
>
>         const struct clk_ops *ops;
>         signed char num_parents;
> @@ -77,6 +79,7 @@ struct mtk_mux {
>
>  extern const struct clk_ops mtk_mux_clr_set_upd_ops;
>  extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
> +extern const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_ops;
>
>  #define MUX_GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,     \
>                         _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> @@ -118,6 +121,48 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd=
_ops;
>                         0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,         \
>                         mtk_mux_clr_set_upd_ops)
>
> +#define MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,  =
       \
> +                       _num_parents, _mux_ofs, _mux_set_ofs, _mux_clr_of=
s,     \
> +                       _shift, _width, _gate, _upd_ofs, _upd,           =
       \
> +                       _fenc_sta_mon_ofs, _fenc, _flags) {              =
       \
> +               .id =3D _id,                                             =
         \
> +               .name =3D _name,                                         =
         \
> +               .mux_ofs =3D _mux_ofs,                                   =
         \
> +               .set_ofs =3D _mux_set_ofs,                               =
         \
> +               .clr_ofs =3D _mux_clr_ofs,                               =
         \
> +               .upd_ofs =3D _upd_ofs,                                   =
         \
> +               .fenc_sta_mon_ofs =3D _fenc_sta_mon_ofs,                 =
         \
> +               .mux_shift =3D _shift,                                   =
         \
> +               .mux_width =3D _width,                                   =
         \
> +               .gate_shift =3D _gate,                                   =
         \
> +               .upd_shift =3D _upd,                                     =
         \
> +               .fenc_shift =3D _fenc,                                   =
         \
> +               .parent_names =3D _parents,                              =
         \
> +               .parent_index =3D _paridx,                               =
         \
> +               .num_parents =3D _num_parents,                           =
         \
> +               .flags =3D _flags,                                       =
         \
> +               .ops =3D &mtk_mux_gate_fenc_clr_set_upd_ops,             =
         \
> +       }
> +
> +#define MUX_GATE_FENC_CLR_SET_UPD(_id, _name, _parents,                 =
       \
> +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs,           \
> +                       _shift, _width, _gate, _upd_ofs, _upd,          \
> +                       _fenc_sta_mon_ofs, _fenc)                       \
> +               MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents,   \
> +                       NULL, ARRAY_SIZE(_parents), _mux_ofs,           \
> +                       _mux_set_ofs, _mux_clr_ofs, _shift,             \
> +                       _width, _gate, _upd_ofs, _upd,                  \
> +                       _fenc_sta_mon_ofs, _fenc, 0)
> +
> +#define MUX_GATE_FENC_CLR_SET_UPD_INDEXED(_id, _name, _parents,        _=
paridx,        \

                                                                   ^^^^^^
This looks like a tab when it should have been a space?

ChenYu

> +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs,            =
       \
> +                       _shift, _width, _gate, _upd_ofs, _upd,           =
       \
> +                       _fenc_sta_mon_ofs, _fenc)                        =
       \
> +               MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents, _pa=
ridx,  \
> +                       ARRAY_SIZE(_paridx), _mux_ofs, _mux_set_ofs,     =
       \
> +                       _mux_clr_ofs, _shift, _width, _gate, _upd_ofs, _u=
pd,    \
> +                       _fenc_sta_mon_ofs, _fenc, 0)
> +
>  int mtk_clk_register_muxes(struct device *dev,
>                            const struct mtk_mux *muxes,
>                            int num, struct device_node *node,
> --
> 2.39.5
>
