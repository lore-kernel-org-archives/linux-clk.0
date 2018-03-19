Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jeffy Chen <jeffy.chen@rock-chips.com>, alexandre.belloni@bootlin.com,
 broonie@kernel.org, linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180319035854.3265-1-jeffy.chen@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Jeffy Chen <jeffy.chen@rock-chips.com>,
 Gabriel Fernandez <gabriel.fernandez@st.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Arvind Yadav <arvind.yadav.cs@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20180319035854.3265-1-jeffy.chen@rock-chips.com>
Message-ID: <152149531811.242365.11094328182208620465@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v6] clk: lpc32xx: Set name of regmap_config
Date: Mon, 19 Mar 2018 14:35:18 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jeffy Chen (2018-03-18 20:58:54)
> We are now allowing to register debugfs without a valid device, and not
> having a valid name will end up using "dummy*" to create debugfs dir.
> =

> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>
> ---

Applied to clk-next
