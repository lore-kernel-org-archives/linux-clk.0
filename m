Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468B2C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 15 Mar 2022 22:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351610AbiCOWWE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Mar 2022 18:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348529AbiCOWWD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Mar 2022 18:22:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BAC5C656
        for <linux-clk@vger.kernel.org>; Tue, 15 Mar 2022 15:20:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 807FB612F0
        for <linux-clk@vger.kernel.org>; Tue, 15 Mar 2022 22:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA563C340E8;
        Tue, 15 Mar 2022 22:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647382849;
        bh=1BLiSYvdBeMOCAa5b8iHRxyB8gqdAjhCXxAARQjEHSs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fcyYrD9qEGqC/WIIo1WQnkg1XIDY/wlbGCfAF95fZUbZgrBaWEk5toHTPFADDSIaz
         51Iue+4DQGtbwdsl/7qfLOx2GDOjMolx19hELMWQcOYYV5b474TxArbtAva0MnTqLH
         eEvQ/qh5vx53Go6NO17maTVJZ4ciR8CyiX4l4TPdoOLAJexdZET+G4euwmPz+JSSvp
         SqQsK/k1HaORnThFDL+avVtYv9casExtUKPfa2sFFA/y6jfUoa6HJzCBSIJevehuDW
         7iTJql3J/3JO9Utpu6K4huTrH3gWUzZf3Qo2R9nhs4CXnPUylT+BYNPFwBAqz3GsFP
         MN12rb9UuANzw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220313232926.1004842-2-linus.walleij@linaro.org>
References: <20220313232926.1004842-1-linus.walleij@linaro.org> <20220313232926.1004842-2-linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] clk: ux500: Implement the missing CLKOUT clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 15 Mar 2022 15:20:48 -0700
User-Agent: alot/0.10
Message-Id: <20220315222049.DA563C340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2022-03-13 16:29:26)
> diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
> index 937b6bb82b30..e6a27c917126 100644
> --- a/drivers/clk/ux500/clk-prcmu.c
> +++ b/drivers/clk/ux500/clk-prcmu.c
> @@ -14,6 +14,7 @@
>  #include "clk.h"
> =20
>  #define to_clk_prcmu(_hw) container_of(_hw, struct clk_prcmu, hw)
> +#define to_clk_prcmu_clkout(_hw) container_of(_hw, struct clk_prcmu_clko=
ut, hw)
> =20
>  struct clk_prcmu {
>         struct clk_hw hw;
> @@ -23,6 +24,15 @@ struct clk_prcmu {
>         int opp_requested;
>  };
> =20
> +struct clk_prcmu_clkout {
> +       struct clk_hw hw;
> +       u8 clkout_id;
> +       u8 source;
> +       u8 divider;
> +       int is_prepared;
> +       int is_enabled;
> +};
> +
>  /* PRCMU clock operations. */
> =20
>  static int clk_prcmu_prepare(struct clk_hw *hw)
> @@ -344,3 +354,144 @@ struct clk *clk_reg_prcmu_opp_volt_scalable(const c=
har *name,
>         return clk_reg_prcmu(name, parent_name, cg_sel, rate, flags,
>                         &clk_prcmu_opp_volt_scalable_ops);
>  }
> +
> +/* The clkout (external) clock is special and need special ops */
> +
> +static int clk_prcmu_clkout_prepare(struct clk_hw *hw)
> +{
> +       struct clk_prcmu_clkout *clk =3D to_clk_prcmu_clkout(hw);
> +       int ret;
> +
> +       ret =3D prcmu_config_clkout(clk->clkout_id, clk->source, clk->div=
ider);
> +       if (!ret)
> +               clk->is_prepared =3D 1;
> +
> +       return ret;
> +}
> +
> +static void clk_prcmu_clkout_unprepare(struct clk_hw *hw)
> +{
> +       struct clk_prcmu_clkout *clk =3D to_clk_prcmu_clkout(hw);
> +       int ret;
> +
> +       /* The clkout clock is disabled by dividing by 0 */
> +       ret =3D prcmu_config_clkout(clk->clkout_id, clk->source, 0);
> +       if (!ret)
> +               clk->is_prepared =3D 0;
> +}
> +
> +static int clk_prcmu_clkout_is_prepared(struct clk_hw *hw)
> +{
> +       struct clk_prcmu_clkout *clk =3D to_clk_prcmu_clkout(hw);
> +       return clk->is_prepared;
> +}
> +
> +static int clk_prcmu_clkout_enable(struct clk_hw *hw)
> +{
> +       struct clk_prcmu_clkout *clk =3D to_clk_prcmu_clkout(hw);
> +       clk->is_enabled =3D 1;

If this isn't reading the hardware then we can just let the core figure
it out and remove these functions and 'is_enabled'/'is_prepared'
variables.

> +       return 0;
> +}
> +
> +static void clk_prcmu_clkout_disable(struct clk_hw *hw)
> +{
> +       struct clk_prcmu_clkout *clk =3D to_clk_prcmu_clkout(hw);
> +       clk->is_enabled =3D 0;
> +}
> +
> +static int clk_prcmu_clkout_is_enabled(struct clk_hw *hw)
> +{
> +       struct clk_prcmu_clkout *clk =3D to_clk_prcmu_clkout(hw);
> +       return clk->is_enabled;
> +}
> +
> +static unsigned long clk_prcmu_clkout_recalc_rate(struct clk_hw *hw,
> +                                                 unsigned long parent_ra=
te)
> +{
> +       struct clk_prcmu_clkout *clk =3D to_clk_prcmu_clkout(hw);
> +
> +       if (!clk->divider)
> +               return 0;
> +       return (parent_rate / clk->divider);
> +}
> +
> +static u8 clk_prcmu_clkout_get_parent(struct clk_hw *hw)
> +{
> +       struct clk_prcmu_clkout *clk =3D to_clk_prcmu_clkout(hw);
> +       return clk->source;
> +}
> +
> +static int clk_prcmu_clkout_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct clk_prcmu_clkout *clk =3D to_clk_prcmu_clkout(hw);
> +
> +       clk->source =3D index;
> +       /* Make sure the change reaches the hardware immediately */
> +       if (clk->is_prepared)
> +               return clk_prcmu_clkout_prepare(hw);
> +       return 0;
> +}
> +
> +static const struct clk_ops clk_prcmu_clkout_ops =3D {
> +       .prepare =3D clk_prcmu_clkout_prepare,
> +       .unprepare =3D clk_prcmu_clkout_unprepare,
> +       .is_prepared =3D clk_prcmu_clkout_is_prepared,
> +       .enable =3D clk_prcmu_clkout_enable,
> +       .disable =3D clk_prcmu_clkout_disable,
> +       .is_enabled =3D clk_prcmu_clkout_is_enabled,
> +       .recalc_rate =3D clk_prcmu_clkout_recalc_rate,
> +       .get_parent =3D clk_prcmu_clkout_get_parent,
> +       .set_parent =3D clk_prcmu_clkout_set_parent,
> +};
> +
> +struct clk *clk_reg_prcmu_clkout(const char *name,
> +                                const char **parent_names, int num_paren=
ts,
> +                                u8 source, u8 divider)
> +
> +{
> +       struct clk_prcmu_clkout *clk;
> +       struct clk_init_data clk_prcmu_clkout_init;
> +       struct clk *clk_reg;
> +       u8 clkout_id;
> +
> +       if (!name) {
> +               pr_err("clk_prcmu_clkout: %s invalid arguments passed\n",=
 __func__);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       if (!strcmp(name, "clkout1"))
> +               clkout_id =3D 0;
> +       else if (!strcmp(name, "clkout2"))
> +               clkout_id =3D 1;
> +       else {
> +               pr_err("clk_prcmu_clkout: %s bad clock name\n", __func__);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       clk =3D kzalloc(sizeof(*clk), GFP_KERNEL);
> +       if (!clk)
> +               return ERR_PTR(-ENOMEM);
> +
> +       clk->clkout_id =3D clkout_id;
> +       clk->is_prepared =3D 1;
> +       clk->is_enabled =3D 1;
> +       clk->source =3D source;
> +       clk->divider =3D divider;
> +
> +       clk_prcmu_clkout_init.name =3D name;
> +       clk_prcmu_clkout_init.ops =3D &clk_prcmu_clkout_ops;
> +       clk_prcmu_clkout_init.flags =3D CLK_GET_RATE_NOCACHE;
> +       clk_prcmu_clkout_init.parent_names =3D parent_names;
> +       clk_prcmu_clkout_init.num_parents =3D num_parents;
> +       clk->hw.init =3D &clk_prcmu_clkout_init;
> +
> +       clk_reg =3D clk_register(NULL, &clk->hw);

Please use clk_hw_register()

> +       if (IS_ERR_OR_NULL(clk_reg))
> +               goto free_clkout;
> +
> +       return clk_reg;
> +free_clkout:
> +       kfree(clk);
> +       pr_err("clk_prcmu_clkout: %s failed to register clk\n", __func__);
> +       return ERR_PTR(-ENOMEM);
> +}
> diff --git a/drivers/clk/ux500/clk.h b/drivers/clk/ux500/clk.h
> index 40cd9fc95b8b..0a656a7212ae 100644
> --- a/drivers/clk/ux500/clk.h
> +++ b/drivers/clk/ux500/clk.h
> @@ -59,6 +59,10 @@ struct clk *clk_reg_prcmu_opp_volt_scalable(const char=
 *name,
>                                             unsigned long rate,
>                                             unsigned long flags);
> =20
> +struct clk *clk_reg_prcmu_clkout(const char *name,
> +                                const char **parent_names, int num_paren=
ts,
> +                                u8 source, u8 divider);
> +
>  struct clk *clk_reg_sysctrl_gate(struct device *dev,
>                                  const char *name,
>                                  const char *parent_name,
> diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_o=
f_clk.c
> index e86ed2eec3fd..dfe8794b3e78 100644
> --- a/drivers/clk/ux500/u8500_of_clk.c
> +++ b/drivers/clk/ux500/u8500_of_clk.c
> @@ -18,6 +18,7 @@
>  static struct clk *prcmu_clk[PRCMU_NUM_CLKS];
>  static struct clk *prcc_pclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIP=
HS_PER_CLUSTER];
>  static struct clk *prcc_kclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIP=
HS_PER_CLUSTER];
> +static struct clk *clkout_clk[2];
> =20
>  #define PRCC_SHOW(clk, base, bit) \
>         clk[(base * PRCC_PERIPHS_PER_CLUSTER) + bit]
> @@ -46,6 +47,70 @@ static struct clk *ux500_twocell_get(struct of_phandle=
_args *clkspec,
>         return PRCC_SHOW(clk_data, base, bit);
>  }
> =20
> +/* Essentially names for the first PRCMU_CLKSRC_* defines */
> +static const char *u8500_clkout_parents[] =3D {

const char * const ?

> +       "clk38m_to_clkgen",
> +       "aclk",
> +       "sysclk",
> +       "lcdclk",
> +       "sdmmcclk",
> +       "tvclk",
> +       "timclk",
> +       /* CLK009 is not implemented, add it if you need it */
> +       "clk009",
> +};
> +
> +static struct clk *ux500_clkout_get(struct of_phandle_args *clkspec,
> +                                   void *data)
> +{
> +       int id, source, divider;

unsigned int id?

> +       struct clk *clkout;
> +
> +       if (clkspec->args_count !=3D 3)
> +               return  ERR_PTR(-EINVAL);
> +
> +       id =3D clkspec->args[0];
> +       source =3D clkspec->args[1];
> +       divider =3D clkspec->args[2];
> +
> +       if (id < 0 || id > 1) {

Because clkspec->args is uint32_t and so unlikely to be negative.

> +               pr_err("%s: invalid clkout ID %d\n", __func__, id);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       if (clkout_clk[id]) {
> +               pr_info("%s: clkout%d already registered, not reconfiguri=
ng\n",
> +                       __func__, id + 1);
> +               return clkout_clk[id];
> +       }
> +
> +       if (source > 7) {
> +               pr_err("%s: invalid source ID %d\n", __func__, source);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       if ((divider =3D=3D 0) || (divider > 63)) {

Remove extra parenthesis please.

> +               pr_err("%s: invalid divider %d\n", __func__, divider);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       pr_debug("registering clkout%d with source %d and divider %d\n",
> +                id + 1, source, divider);
> +
> +       clkout =3D clk_reg_prcmu_clkout(id ? "clkout2" : "clkout1",
> +                                     u8500_clkout_parents,
> +                                     ARRAY_SIZE(u8500_clkout_parents),
> +                                     source, divider);
> +       if (IS_ERR(clkout)) {
> +               pr_err("failed to register clkout%d\n",  id + 1);
> +               return ERR_CAST(clkout);
> +       }
> +
> +       clkout_clk[id] =3D clkout;
> +
> +       return clkout;
> +}
> +
>  static void u8500_clk_init(struct device_node *np)
>  {
>         struct prcmu_fw_version *fw_version;
