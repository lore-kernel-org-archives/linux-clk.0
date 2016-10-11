Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Neil Armstrong <narmstrong@baylibre.com>,  sboyd@codeaurora.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20161005150752.22618-1-narmstrong@baylibre.com>
Cc: "Neil Armstrong" <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-oxnas@lists.tuxfamily.org
References: <20161005150752.22618-1-narmstrong@baylibre.com>
Message-ID: <147617274057.17481.2362814012745242458@resonance>
Subject: Re: [PATCH 0/6] clk: oxnas: Rework driver to add support for OX820
Date: Tue, 11 Oct 2016 09:59:00 +0200
List-ID: <linux-clk.vger.kernel.org>

Quoting Neil Armstrong (2016-10-05 17:07:46)
> In order to to support the Oxford Semiconductor OX820 Soc clock gates,
> rework the original driver with a structure inspired from the Qcom or Mes=
on
> drivers and using the new devm_clk_hw_register() call.
> =

> The first patches add dt-bindings include file to clarify the clock indic=
es.
> =

> In future work, OX820 PLLs should also be handled by this driver.

Series looks good to me. Will apply after -rc1 drops.

Regards,
Mike

> =

> Neil Armstrong (6):
>   clk: oxnas: Add dt-bindings include file for OX810SE
>   clk: oxnas: Add dt-bindings include file for OX820
>   clk: oxnas: Rename to clk_oxnas_gate
>   clk: oxnas: Refactor to make use of devm_clk_hw_register()
>   clk: oxnas: Add OX820 Gate clocks
>   dt-bindings: clk: oxnas,stdclk: Add OX820 bindings
> =

>  .../devicetree/bindings/clock/oxnas,stdclk.txt     |  19 +-
>  drivers/clk/clk-oxnas.c                            | 232 ++++++++++++++-=
------
>  include/dt-bindings/clock/oxsemi,ox810se.h         |  30 +++
>  include/dt-bindings/clock/oxsemi,ox820.h           |  40 ++++
>  4 files changed, 231 insertions(+), 90 deletions(-)
>  create mode 100644 include/dt-bindings/clock/oxsemi,ox810se.h
>  create mode 100644 include/dt-bindings/clock/oxsemi,ox820.h
> =

> -- =

> 2.7.0
> =

> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
