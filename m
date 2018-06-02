Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180529160804.1982-4-gregkh@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org>
 <20180529160804.1982-4-gregkh@linuxfoundation.org>
Message-ID: <152790646204.225090.14558095359430265201@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 4/5] clk: tegra: no need to check return value of debugfs_create
 functions
Date: Fri, 01 Jun 2018 19:27:42 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Greg Kroah-Hartman (2018-05-29 09:08:03)
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> =

> The return value of these functions were never checked in the end
> anyway, so it is obvious this does not change any functionality :)
> =

> Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
> Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Applied to clk-next
