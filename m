Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Joachim Eastwood <manabian@gmail.com>,  sboyd@codeaurora.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1456351460-15483-2-git-send-email-manabian@gmail.com>
Cc: "Joachim Eastwood" <manabian@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <1456351460-15483-1-git-send-email-manabian@gmail.com>
 <1456351460-15483-2-git-send-email-manabian@gmail.com>
Message-ID: <20160302230159.12762.59247@quark.deferred.io>
Subject: Re: [PATCH v4 1/2] clk: add lpc18xx creg clk driver
Date: Wed, 02 Mar 2016 15:01:59 -0800
List-ID: <linux-clk.vger.kernel.org>

Hi Joachim,

Quoting Joachim Eastwood (2016-02-24 14:04:19)
> +static struct clk *clk_register_creg_clk(struct clk_creg_data *creg_clk,
> +                                        const char **parent_name,
> +                                        struct regmap *syscon)
> +{
> +       struct clk_init_data init;
> +
> +       init.ops =3D creg_clk->ops;
> +       init.name =3D creg_clk->name;
> +       init.parent_names =3D parent_name;
> +       init.num_parents =3D 1;
> +
> +       creg_clk->reg =3D syscon;
> +       creg_clk->hw.init =3D &init;
> +
> +       return clk_register(NULL, &creg_clk->hw);

This should be devm_clk_register with your struct device *dev passed
into it.

Otherwise this patch looks good for merge.

Regards,
Mike
