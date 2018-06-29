Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180605062046.31437-1-nm@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20180605062046.31437-1-nm@ti.com>
Message-ID: <153029553467.143105.13657696052641478062@swboyd.mtv.corp.google.com>
Subject: Re: [RFC PATCH] clk: keystone: Enable TISCI clocks if K3_ARCH
Date: Fri, 29 Jun 2018 11:05:34 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Nishanth Menon (2018-06-04 23:20:46)
> K3_ARCH uses TISCI for clocks as well. Enable the same
> for the driver support.
> =

> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> =

> Hi,
> =

> This patch depends on https://marc.info/?l=3Dlinux-arm-kernel&m=3D1528178=
66312732&w=3D2
> and is an RFC based off next-20180604 and will post formally once
> v4.18-rc1 is available.
> =


Did you plan on sending it again soon? Otherwise I can just merge this
patch now.
