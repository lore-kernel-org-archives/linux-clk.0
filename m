Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Joachim Eastwood <manabian@gmail.com>,  sboyd@codeaurora.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455994417-4471-2-git-send-email-manabian@gmail.com>
Cc: "Joachim Eastwood" <manabian@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <1455994417-4471-1-git-send-email-manabian@gmail.com>
 <1455994417-4471-2-git-send-email-manabian@gmail.com>
Message-ID: <20160224210553.2278.56679@quark.deferred.io>
Subject: Re: [PATCH v2 1/2] clk: add lpc18xx creg clk driver
Date: Wed, 24 Feb 2016 13:05:53 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Joachim Eastwood (2016-02-20 10:53:36)
> +static const struct clk_ops clk_creg_32k =3D {
> +       .enable         =3D clk_creg_enable,
> +       .disable        =3D clk_creg_disable,

There should be a .is_enabled here.

> +       .prepare        =3D clk_creg_32k_prepare,
> +       .unprepare      =3D clk_creg_32k_unprepare,
> +       .is_prepared    =3D clk_creg_32k_is_prepared,
> +};
> +
> +static const struct clk_ops clk_creg_1k =3D {
> +       .enable         =3D clk_creg_enable,
> +       .disable        =3D clk_creg_disable,

Ditto.

Otherwise patch looks good to me. Thanks a lot for all of the rework.

Regards,
Mike
