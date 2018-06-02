Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180529160804.1982-3-gregkh@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org>
 <20180529160804.1982-3-gregkh@linuxfoundation.org>
Message-ID: <152790645859.225090.17927860777726364571@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 3/5] clk: davinci: no need to check return value of
 debugfs_create functions
Date: Fri, 01 Jun 2018 19:27:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Greg Kroah-Hartman (2018-05-29 09:08:02)
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> =

> Cc: David Lechner <david@lechnology.com>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Applied to clk-next
