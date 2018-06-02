Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180529160804.1982-5-gregkh@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org>
 <20180529160804.1982-5-gregkh@linuxfoundation.org>
Message-ID: <152790646472.225090.14051710612236908948@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 5/5] clk: remove clk_debugfs_add_file()
Date: Fri, 01 Jun 2018 19:27:44 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Greg Kroah-Hartman (2018-05-29 09:08:04)
> No one was using this api call, so remove it.  If it is ever needed in
> the future, a "raw" debugfs call can be used.
> =

> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Applied to clk-next
