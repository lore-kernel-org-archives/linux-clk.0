Return-Path: <jcmvbkbc@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1432218373.27793.0.camel@ingics.com>
References: <1432218373.27793.0.camel@ingics.com>
Date: Thu, 21 May 2015 21:39:25 +0300
Message-ID: <CAMo8BfJS_Hr-56qUBYfcnXV+Vw=9cjeQiscXfU1nThdtw7Z2pQ@mail.gmail.com>
Subject: Re: [PATCH] clk: cdce706: Add missing of_clk_del_provider call in cdce706_remove
From: Max Filippov <jcmvbkbc@gmail.com>
To: Axel Lin <axel.lin@ingics.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 21, 2015 at 5:26 PM, Axel Lin <axel.lin@ingics.com> wrote:
> Remove a previously registered clock provider when unload the module.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/clk/clk-cdce706.c | 1 +
>  1 file changed, 1 insertion(+)

Good catch, thank you!
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
