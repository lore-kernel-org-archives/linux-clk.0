Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Yisheng Xie <xieyisheng1@huawei.com>, linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1527765086-19873-10-git-send-email-xieyisheng1@huawei.com>
Cc: andy.shevchenko@gmail.com, Yisheng Xie <xieyisheng1@huawei.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
References: <1527765086-19873-1-git-send-email-xieyisheng1@huawei.com>
 <1527765086-19873-10-git-send-email-xieyisheng1@huawei.com>
Message-ID: <152792025666.225090.11039188217774859492@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 09/21] clk: use match_string() helper
Date: Fri, 01 Jun 2018 23:17:36 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Yisheng Xie (2018-05-31 04:11:14)
> match_string() returns the index of an array for a matching string,
> which can be used instead of open coded variant.
> =

> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Yisheng Xie <xieyisheng1@huawei.com>
> ---

Applied to clk-next
