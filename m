Return-Path: <SRS0=4m2Q=TA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50830C43219
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 17:33:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21F1F21670
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556645627;
	bh=IHqm3zUDY+gV5AAYDtAtAiFWDf5x+p4KQi/t2wwkgHM=;
	h=In-Reply-To:References:From:Subject:To:Cc:Date:List-ID:From;
	b=u0mRER4xpjx5fe4PyB2ZbDgy2Kg9URBsTcGFqwWZzSf3Eo334AHEh4st9odwhRkPq
	 Zf51rEiOUrvIuGgU/zZgQt8Si44hrIrQSrnt4tU/LkAMvywpz35b77lnh6G0PF6iqa
	 jar1s5qfsAKVdVUsGdTZ2NZjBlnh/tWaz+eQJg98=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfD3Rdq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Apr 2019 13:33:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:47774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbfD3Rdq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 30 Apr 2019 13:33:46 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B984B2147A;
        Tue, 30 Apr 2019 17:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556645625;
        bh=IHqm3zUDY+gV5AAYDtAtAiFWDf5x+p4KQi/t2wwkgHM=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=rxJaEtbcOn0BpLxM0umKA6dvu9cFs6kkPsd4vt2MPUL4nJMEExsk8FvW4kK//GsfQ
         hqZb8epQ+pQdHmghzZr+X9MASuKyQy3nyNH3KZ2gK6RJUXtDLLYaAOONcLg/zPXiCv
         mo3WOUhxH5H7IXFe21ZzvlavcAz+cB9VHQDbvmhY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190430144412.20950-2-ckeepax@opensource.cirrus.com>
References: <20190430144412.20950-1-ckeepax@opensource.cirrus.com> <20190430144412.20950-2-ckeepax@opensource.cirrus.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: lochnagar: Use new parent_data approach to register clock parents
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        patches@opensource.cirrus.com
Message-ID: <155664562498.168659.12612639062763571583@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 30 Apr 2019 10:33:44 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Charles Keepax (2019-04-30 07:44:12)
> diff --git a/drivers/clk/clk-lochnagar.c b/drivers/clk/clk-lochnagar.c
> index ced832e82f46b..58576db6e31a3 100644
> --- a/drivers/clk/clk-lochnagar.c
> +++ b/drivers/clk/clk-lochnagar.c
> @@ -42,46 +42,45 @@ struct lochnagar_clk_priv {
>         struct regmap *regmap;
>         enum lochnagar_type type;
> =20
> -       const char **parents;
> -       unsigned int nparents;
> -
>         struct lochnagar_clk lclks[LOCHNAGAR_NUM_CLOCKS];
>  };
> =20
> -static const char * const lochnagar1_clk_parents[] =3D {
> -       "ln-none",
> -       "ln-spdif-mclk",
> -       "ln-psia1-mclk",
> -       "ln-psia2-mclk",
> -       "ln-cdc-clkout",
> -       "ln-dsp-clkout",
> -       "ln-pmic-32k",
> -       "ln-gf-mclk1",
> -       "ln-gf-mclk3",
> -       "ln-gf-mclk2",
> -       "ln-gf-mclk4",
> +#define LN_PARENT(NAME) { .name =3D NAME, .fw_name =3D NAME }

Is the name in DT really the same as the globally unique name of the
clk? I wouldn't expect that to be the case.

> +
> +static const struct clk_parent_data lochnagar1_clk_parents[] =3D {
> +       LN_PARENT("ln-none"),
> +       LN_PARENT("ln-spdif-mclk"),
> +       LN_PARENT("ln-psia1-mclk"),
> +       LN_PARENT("ln-psia2-mclk"),
> +       LN_PARENT("ln-cdc-clkout"),
> +       LN_PARENT("ln-dsp-clkout"),
> +       LN_PARENT("ln-pmic-32k"),
> +       LN_PARENT("ln-gf-mclk1"),
> +       LN_PARENT("ln-gf-mclk3"),
> +       LN_PARENT("ln-gf-mclk2"),
> +       LN_PARENT("ln-gf-mclk4"),
>  };
> =20
> -static const char * const lochnagar2_clk_parents[] =3D {
> -       "ln-none",
> -       "ln-cdc-clkout",
> -       "ln-dsp-clkout",
> -       "ln-pmic-32k",
> -       "ln-spdif-mclk",
> -       "ln-clk-12m",
> -       "ln-clk-11m",
> -       "ln-clk-24m",
> -       "ln-clk-22m",
> -       "ln-clk-8m",
> -       "ln-usb-clk-24m",
> -       "ln-gf-mclk1",
> -       "ln-gf-mclk3",
> -       "ln-gf-mclk2",
> -       "ln-psia1-mclk",
> -       "ln-psia2-mclk",
> -       "ln-spdif-clkout",
> -       "ln-adat-mclk",
> -       "ln-usb-clk-12m",
> +static const struct clk_parent_data lochnagar2_clk_parents[] =3D {
> +       LN_PARENT("ln-none"),
> +       LN_PARENT("ln-cdc-clkout"),
> +       LN_PARENT("ln-dsp-clkout"),
> +       LN_PARENT("ln-pmic-32k"),
> +       LN_PARENT("ln-spdif-mclk"),
> +       LN_PARENT("ln-clk-12m"),
> +       LN_PARENT("ln-clk-11m"),
> +       LN_PARENT("ln-clk-24m"),
> +       LN_PARENT("ln-clk-22m"),
> +       LN_PARENT("ln-clk-8m"),
> +       LN_PARENT("ln-usb-clk-24m"),
> +       LN_PARENT("ln-gf-mclk1"),
> +       LN_PARENT("ln-gf-mclk3"),
> +       LN_PARENT("ln-gf-mclk2"),
> +       LN_PARENT("ln-psia1-mclk"),
> +       LN_PARENT("ln-psia2-mclk"),
> +       LN_PARENT("ln-spdif-clkout"),
> +       LN_PARENT("ln-adat-mclk"),
> +       LN_PARENT("ln-usb-clk-12m"),
>  };
> =20
>  #define LN1_CLK(ID, NAME, REG) \
> @@ -252,16 +211,54 @@ lochnagar_of_clk_hw_get(struct of_phandle_args *clk=
spec, void *data)
>         return &priv->lclks[idx].hw;
>  }
> =20
> -static int lochnagar_init_clks(struct lochnagar_clk_priv *priv)
> +static const struct of_device_id lochnagar_of_match[] =3D {
> +       { .compatible =3D "cirrus,lochnagar1-clk", .data =3D (void *)LOCH=
NAGAR1 },

Maybe this enum should just be a structure of parents and the size of
the parents?

> +       { .compatible =3D "cirrus,lochnagar2-clk", .data =3D (void *)LOCH=
NAGAR2 },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, lochnagar_of_match);
