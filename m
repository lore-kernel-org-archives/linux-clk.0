Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, afaerber@suse.de,
 mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180317100952.28538-6-manivannan.sadhasivam@linaro.org>
Cc: liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com,
 devicetree@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org,
 daniel.thompson@linaro.org, amit.kucheria@linaro.org,
 viresh.kumar@linaro.org, hzhang@ucrobotics.com, bdong@ucrobotics.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, manivannanece23@gmail.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20180317100952.28538-1-manivannan.sadhasivam@linaro.org>
 <20180317100952.28538-6-manivannan.sadhasivam@linaro.org>
Message-ID: <152150786513.254778.147481994658886771@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v5 05/12] clk: actions: Add gate clock support
Date: Mon, 19 Mar 2018 18:04:25 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Manivannan Sadhasivam (2018-03-17 03:09:45)
> diff --git a/drivers/clk/actions/owl-gate.c b/drivers/clk/actions/owl-gat=
e.c
> new file mode 100644
> index 000000000000..25dd94ac0f35
> --- /dev/null
> +++ b/drivers/clk/actions/owl-gate.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// OWL gate clock driver
> +//
> +// Copyright (c) 2014 Actions Semi Inc.
> +// Author: David Liu <liuwei@actions-semi.com>
> +//
> +// Copyright (c) 2018 Linaro Ltd.
> +// Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +
> +#include "owl-gate.h"
> +
> +void clk_gate_set(const struct owl_clk_common *common,

owl_gate_set?

> +                const struct owl_gate_hw *gate_hw, bool enable)
> +{
> +       int set =3D gate_hw->gate_flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
> +       u32 reg;
> +
> +       set ^=3D enable;
> +
> +       regmap_read(common->regmap, gate_hw->reg, &reg);
> +
> +       if (set)
> +               reg |=3D BIT(gate_hw->bit_idx);
> +       else
> +               reg &=3D ~BIT(gate_hw->bit_idx);
> +
> +       regmap_write(common->regmap, gate_hw->reg, reg);
> +}
> +
> +static void owl_gate_disable(struct clk_hw *hw)
> +{
> +       struct owl_gate *gate =3D hw_to_owl_gate(hw);
> +       struct owl_clk_common *common =3D &gate->common;
> +
> +       clk_gate_set(common, &gate->gate_hw, false);
> +}
> +
> +static int owl_gate_enable(struct clk_hw *hw)
> +{
> +       struct owl_gate *gate =3D hw_to_owl_gate(hw);
> +       struct owl_clk_common *common =3D &gate->common;
> +
> +       clk_gate_set(common, &gate->gate_hw, true);
> +
> +       return 0;
> +}
> +
> +int clk_is_enabled(const struct owl_clk_common *common,

Can this be called owl_gate_is_enabled?

> +                  const struct owl_gate_hw *gate_hw)
> +{
> +       u32 reg;
> +
> +       regmap_read(common->regmap, gate_hw->reg, &reg);
> +
> +       if (gate_hw->gate_flags & CLK_GATE_SET_TO_DISABLE)
> +               reg ^=3D BIT(gate_hw->bit_idx);
> +
> +       return !!(reg & BIT(gate_hw->bit_idx));
> +}
> +
> +static int owl_gate_is_enabled(struct clk_hw *hw)
> +{
> +       struct owl_gate *gate =3D hw_to_owl_gate(hw);
> +       struct owl_clk_common *common =3D &gate->common;
> +
> +       return clk_is_enabled(common, &gate->gate_hw);
> +}
> +
> +const struct clk_ops owl_gate_ops =3D {

Everything going to be builtin? If anything is a module then this needs
to be exported.

> +       .disable        =3D owl_gate_disable,
> +       .enable         =3D owl_gate_enable,
> +       .is_enabled     =3D owl_gate_is_enabled,
> +};

Otherwise looks good.
