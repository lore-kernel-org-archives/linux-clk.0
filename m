Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1528090479-20861-1-git-send-email-mike.looijmans@topic.nl>
Cc: linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 Mike Looijmans <mike.looijmans@topic.nl>
References: <1528090479-20861-1-git-send-email-mike.looijmans@topic.nl>
Message-ID: <153029536217.143105.2743197030332094857@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk-si514,
 clk-si544: Implement prepare/unprepare/is_prepared operations
Date: Fri, 29 Jun 2018 11:02:42 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Mike Looijmans (2018-06-03 22:34:39)
> This adds prepare/unprepare/is_prepared functionality to the drivers for
> the SI544 and SI514 chips, allowing the clock output to be disabled when
> the clock is not in use.
> =

> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---

Applied to clk-next
