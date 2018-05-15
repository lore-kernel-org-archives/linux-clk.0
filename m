Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1525271313-24427-2-git-send-email-dinguyen@kernel.org>
Cc: dinguyen@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org
References: <1525271313-24427-1-git-send-email-dinguyen@kernel.org>
 <1525271313-24427-2-git-send-email-dinguyen@kernel.org>
Message-ID: <152642120192.237094.12936695477697525600@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/2] clk: socfpga: stratix10: suppress unbinding platform's clock
 driver
Date: Tue, 15 May 2018 14:53:21 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Dinh Nguyen (2018-05-02 07:28:33)
> The Stratix10 clock driver is essential to system operation, so their
> removal should never happen.
> =

> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
