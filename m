Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1530019690-32685-1-git-send-email-dinguyen@kernel.org>
Cc: dinguyen@kernel.org, mturquette@baylibre.com
References: <1530019690-32685-1-git-send-email-dinguyen@kernel.org>
Message-ID: <153090061568.143105.11421489091672128596@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/2] clk: socfpga: stratix10: fix the parents of mpu_free_clk
Date: Fri, 06 Jul 2018 11:10:15 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Dinh Nguyen (2018-06-26 06:28:09)
> Add a clock mux that is used as a parent for the mpu_free_clk.
> =

> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
