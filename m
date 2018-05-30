Return-Path: <david@lechnology.com>
Subject: Re: [PATCH 3/5] clk: davinci: no need to check return value of
 debugfs_create functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org>
 <20180529160804.1982-3-gregkh@linuxfoundation.org>
From: David Lechner <david@lechnology.com>
Message-ID: <db9ed94b-675e-d2e1-d132-7c676e6c4312@lechnology.com>
Date: Wed, 30 May 2018 14:03:36 -0500
MIME-Version: 1.0
In-Reply-To: <20180529160804.1982-3-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 05/29/2018 11:08 AM, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Cc: David Lechner <david@lechnology.com>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Acked-by: David Lechner <david@lechnology.com>
