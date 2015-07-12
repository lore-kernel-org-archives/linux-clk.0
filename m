Return-Path: <shawn.guo@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1436571223-10959-20-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
	<1436571223-10959-20-git-send-email-sboyd@codeaurora.org>
Date: Sun, 12 Jul 2015 10:47:02 +0800
Message-ID: <CAAQ0ZWQZWLWu1GJUyXZ18JtnzAX7ey39Vks8vzaqz2WXrpVJYw@mail.gmail.com>
Subject: Re: [PATCH 19/45] clk: mxs: Include clk.h in C files that use it
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jul 11, 2015 at 7:33 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> Clock provider drivers generally shouldn't include clk.h because
> it's the consumer API. The clk.h include is being included in all
> mxs files because it's part of mxs/clk.h even though nothing
> actually requires it in that file. Move the clk.h include to the
> C files that are actually using it and remove the clk.h include
> from the header file. The clkdev.h include isn't used either, so
> drop it too.
>
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
