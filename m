Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B51A9F9D
	for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 03:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755229045; cv=none; b=k0cYyfjsE0pHuMybPl67lPOYba69TQ/2RxISuASBn3q2amhjE7MbxQL+ctBOiC0M0HMYAQ3D5i9l68AOcIRzqhBfp4JTThZNGyDKm+PIc+dS0C4r1dnfYxSz6fcdVlVdkVDKS839roEx20qwp99YSLbTbSCFxLyniIVl/DbHMus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755229045; c=relaxed/simple;
	bh=4L3ftiV6FWlAevWzOXOsHn1jvQVtmTSmAaXPAKjUsfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsfGJPQbgyeHRUj5sL4TPUATaG1AD9BWh+7dZlGDx5qfJn3mCFl5BZiHxFXq3PCzYmjIxxu90qZHHDPLSNPuN7VYksLhgVWHB7lDyTzxHx6BQfNTd/Im/7vgGfxU1BIM48WyrW32/AKyddAztT/jNl80Ba02eWaRnpMN1L5wSx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ly8jbZBK; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ly8jbZBK"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55ce4b9c904so1938507e87.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 20:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755229041; x=1755833841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXv9G7c+svq4lqcz4OBGpCl+m14S/SAGU1DXHucm83E=;
        b=ly8jbZBKbz0Ch6rxHFoS+lp6qdrihVWpKpuL89Gcju9Y2JVC2W/k/RAjaXajZ13uYI
         3cgrOGdl3eoZbmKFk9GIK8ZTIGQnuX1XnSO+OE2rLjZSInurI3zGy9aFcLEYXLPL/+wo
         npi/hc38D0lzL2roC03U3e/+PVGjN/TvK6b0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755229041; x=1755833841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXv9G7c+svq4lqcz4OBGpCl+m14S/SAGU1DXHucm83E=;
        b=OGEzUF+lRY/rRNkL8dEHUVmGvuoBLgcRUl7vuqqIeDTDsdPIdXDJ9nHX+nLyKwOQrS
         f2mg4VEBls7rw3c0ZB97U0iCHYSTGv7EpxEdO1UclTqqePJqCQy7Cjpo0Cqnu0GBHLdu
         MrziIX3Xj73Rfb4jV9j9SSbTAEiOJ5eeERoUt7VBUA/U2XGs+BnprqPOxJckZhMbuOEA
         QMLF8F/Xxzl7eDFmyW0GGJ8GJPBgeUtdFSP7RN5oWY8aQzj51Wdd9WeDp/0LDleqftlL
         5YRE1nCUD0/06tQ+haGeJ/APgMMvJyI/lbDU/bRti+fUT7Uk9XbyXSPPjQz1Taxum59M
         WITw==
X-Forwarded-Encrypted: i=1; AJvYcCXD42hS0m5hEP7P9+tkhtSUBrNeQKp45RFGo84ysM3T3bQCmbM7QGlUUaXyLJ1tqVbWE/GNuAYjjJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2DxMmUxuJ22n8l/iyzlicoGG9TcxmqnjTiB5zJEcCpKfYKt3o
	MYjJC/1zHGMnUHuMqOPNpUVRlxpci4HGG2vky2k2+yswTPjr3Cin2K78CiabdCLHGuH7Qwh8lbl
	azZ6nL1D1+QJj02cxi2LCXaHEdAKl2ZJNXFGW7Je2
X-Gm-Gg: ASbGncuQb4gRzBuyQmp4Qd3SncZ3+yuM0NaAhhzbZa7xUZq8R/sKy1SMrNKUGndPv1/
	WdxHoPDJhLjggYAWuqBW7PMUcabMGI6nxWiBPup2QBBsSL9qe1ojfJiga92N893Uaq2NaOcgv6Q
	IaDHG1pAW3J+MRfXnsQ/f4MaLoBD3CsdLCCHf1WKkxeTT1vwcQaJGm2cV/h0chMfs7tEQWtdqhS
	coScOdbO2G3Xo4YJQRoeEs9ri69pQLOPbZRt7kZY7Q7Wy4y
X-Google-Smtp-Source: AGHT+IE49Nkw8AqkoPWjH8rrU5caEV+oXUcux5DcWnc9n4SFkD9kc07Lncn2SXp+60xyQBp5APfIrw8/0vNtRBrb6YM=
X-Received: by 2002:a05:6512:2249:b0:55c:d730:c86f with SMTP id
 2adb3069b0e04-55cee824254mr223207e87.21.1755229041062; Thu, 14 Aug 2025
 20:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-8-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-8-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:37:10 +0900
X-Gm-Features: Ac12FXy4p8YRr4aG5a7_JIWdQm-9n2bHamyXaYwe_ClxduFqvhUqhAoMHloBxT8
Message-ID: <CAGXv+5HRKFrdjjXkwN6=OLtk=bK3C3mBnrDtmkEWeuxjz0pFKg@mail.gmail.com>
Subject: Re: [PATCH v4 07/27] clk: mediatek: clk-gate: Add ops for gates with
 HW voter
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
> MT8196 use a HW voter for gate enable/disable control. Voting is
> performed using set/clr regs, with a status bit used to verify the vote
> state. Add new set of gate clock operations with support for voting via
> set/clr regs.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-gate.c | 77 +++++++++++++++++++++++++++++++--
>  drivers/clk/mediatek/clk-gate.h |  3 ++
>  2 files changed, 77 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-g=
ate.c
> index 0375ccad4be3..426f3a25763d 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -5,6 +5,7 @@
>   */
>
>  #include <linux/clk-provider.h>
> +#include <linux/dev_printk.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/printk.h>
> @@ -12,14 +13,19 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>
> +#include "clk-mtk.h"
>  #include "clk-gate.h"
>
>  struct mtk_clk_gate {
>         struct clk_hw   hw;
>         struct regmap   *regmap;
> +       struct regmap   *regmap_hwv;
>         int             set_ofs;
>         int             clr_ofs;
>         int             sta_ofs;
> +       unsigned int    hwv_set_ofs;
> +       unsigned int    hwv_clr_ofs;
> +       unsigned int    hwv_sta_ofs;
>         u8              bit;
>  };
>
> @@ -100,6 +106,28 @@ static void mtk_cg_disable_inv(struct clk_hw *hw)
>         mtk_cg_clr_bit(hw);
>  }
>
> +static int mtk_cg_hwv_set_en(struct clk_hw *hw, bool enable)
> +{
> +       struct mtk_clk_gate *cg =3D to_mtk_clk_gate(hw);
> +       u32 val;
> +
> +       regmap_write(cg->regmap_hwv, enable ? cg->hwv_set_ofs : cg->hwv_c=
lr_ofs, BIT(cg->bit));
> +
> +       return regmap_read_poll_timeout_atomic(cg->regmap_hwv, cg->hwv_st=
a_ofs, val,
> +                                              val & BIT(cg->bit),
> +                                              0, MTK_WAIT_HWV_DONE_US);
> +}
> +
> +static int mtk_cg_hwv_enable(struct clk_hw *hw)
> +{
> +       return mtk_cg_hwv_set_en(hw, true);
> +}
> +
> +static void mtk_cg_hwv_disable(struct clk_hw *hw)
> +{
> +       mtk_cg_hwv_set_en(hw, false);
> +}
> +
>  static int mtk_cg_enable_no_setclr(struct clk_hw *hw)
>  {
>         mtk_cg_clr_bit_no_setclr(hw);
> @@ -124,6 +152,15 @@ static void mtk_cg_disable_inv_no_setclr(struct clk_=
hw *hw)
>         mtk_cg_clr_bit_no_setclr(hw);
>  }
>
> +static bool mtk_cg_uses_hwv(const struct clk_ops *ops)
> +{
> +       if (ops =3D=3D &mtk_clk_gate_hwv_ops_setclr ||
> +           ops =3D=3D &mtk_clk_gate_hwv_ops_setclr_inv)
> +               return true;
> +
> +       return false;
> +}
> +
>  const struct clk_ops mtk_clk_gate_ops_setclr =3D {
>         .is_enabled     =3D mtk_cg_bit_is_cleared,
>         .enable         =3D mtk_cg_enable,
> @@ -138,6 +175,20 @@ const struct clk_ops mtk_clk_gate_ops_setclr_inv =3D=
 {
>  };
>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_setclr_inv);
>
> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr =3D {
> +       .is_enabled     =3D mtk_cg_bit_is_cleared,
> +       .enable         =3D mtk_cg_hwv_enable,
> +       .disable        =3D mtk_cg_hwv_disable,
> +};
> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr);
> +
> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr_inv =3D {
> +       .is_enabled     =3D mtk_cg_bit_is_set,
> +       .enable         =3D mtk_cg_hwv_enable,
> +       .disable        =3D mtk_cg_hwv_disable,
> +};
> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr_inv);
> +
>  const struct clk_ops mtk_clk_gate_ops_no_setclr =3D {
>         .is_enabled     =3D mtk_cg_bit_is_cleared,
>         .enable         =3D mtk_cg_enable_no_setclr,
> @@ -153,8 +204,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv =
=3D {
>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
>
>  static struct clk_hw *mtk_clk_register_gate(struct device *dev,
> -                                               const struct mtk_gate *ga=
te,
> -                                               struct regmap *regmap)
> +                                           const struct mtk_gate *gate,
> +                                           struct regmap *regmap,
> +                                           struct regmap *regmap_hwv)
>  {
>         struct mtk_clk_gate *cg;
>         int ret;
> @@ -169,11 +221,22 @@ static struct clk_hw *mtk_clk_register_gate(struct =
device *dev,
>         init.parent_names =3D gate->parent_name ? &gate->parent_name : NU=
LL;
>         init.num_parents =3D gate->parent_name ? 1 : 0;
>         init.ops =3D gate->ops;
> +       if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv) {
> +               dev_err(dev, "regmap not found for hardware voter clocks\=
n");
> +               return ERR_PTR(-ENXIO);

return dev_err_probe()?

I believe the same applies to the previous patch.

> +       }
>
>         cg->regmap =3D regmap;
> +       cg->regmap_hwv =3D regmap_hwv;
>         cg->set_ofs =3D gate->regs->set_ofs;
>         cg->clr_ofs =3D gate->regs->clr_ofs;
>         cg->sta_ofs =3D gate->regs->sta_ofs;
> +       if (gate->hwv_regs) {
> +               cg->hwv_set_ofs =3D gate->hwv_regs->set_ofs;
> +               cg->hwv_clr_ofs =3D gate->hwv_regs->clr_ofs;
> +               cg->hwv_sta_ofs =3D gate->hwv_regs->sta_ofs;
> +       }
> +
>         cg->bit =3D gate->shift;
>
>         cg->hw.init =3D &init;
> @@ -206,6 +269,7 @@ int mtk_clk_register_gates(struct device *dev, struct=
 device_node *node,
>         int i;
>         struct clk_hw *hw;
>         struct regmap *regmap;
> +       struct regmap *regmap_hwv;
>
>         if (!clk_data)
>                 return -ENOMEM;
> @@ -216,6 +280,13 @@ int mtk_clk_register_gates(struct device *dev, struc=
t device_node *node,
>                 return PTR_ERR(regmap);
>         }
>
> +       regmap_hwv =3D mtk_clk_get_hwv_regmap(node);
> +       if (IS_ERR(regmap_hwv)) {
> +               pr_err("Cannot find hardware voter regmap for %pOF: %pe\n=
",
> +                      node, regmap_hwv);
> +               return PTR_ERR(regmap_hwv);

return dev_err_probe();

ChenYu

> +       }
> +
>         for (i =3D 0; i < num; i++) {
>                 const struct mtk_gate *gate =3D &clks[i];
>
> @@ -225,7 +296,7 @@ int mtk_clk_register_gates(struct device *dev, struct=
 device_node *node,
>                         continue;
>                 }
>
> -               hw =3D mtk_clk_register_gate(dev, gate, regmap);
> +               hw =3D mtk_clk_register_gate(dev, gate, regmap, regmap_hw=
v);
>
>                 if (IS_ERR(hw)) {
>                         pr_err("Failed to register clk %s: %pe\n", gate->=
name,
> diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-g=
ate.h
> index 1a46b4c56fc5..4f05b9855dae 100644
> --- a/drivers/clk/mediatek/clk-gate.h
> +++ b/drivers/clk/mediatek/clk-gate.h
> @@ -19,6 +19,8 @@ extern const struct clk_ops mtk_clk_gate_ops_setclr;
>  extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
>  extern const struct clk_ops mtk_clk_gate_ops_no_setclr;
>  extern const struct clk_ops mtk_clk_gate_ops_no_setclr_inv;
> +extern const struct clk_ops mtk_clk_gate_hwv_ops_setclr;
> +extern const struct clk_ops mtk_clk_gate_hwv_ops_setclr_inv;
>
>  struct mtk_gate_regs {
>         u32 sta_ofs;
> @@ -31,6 +33,7 @@ struct mtk_gate {
>         const char *name;
>         const char *parent_name;
>         const struct mtk_gate_regs *regs;
> +       const struct mtk_gate_regs *hwv_regs;
>         int shift;
>         const struct clk_ops *ops;
>         unsigned long flags;
> --
> 2.39.5
>
