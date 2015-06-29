Return-Path: <mcoquelin.stm32@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1435485332-14951-1-git-send-email-daniel.thompson@linaro.org>
References: <1435485332-14951-1-git-send-email-daniel.thompson@linaro.org>
Date: Mon, 29 Jun 2015 10:50:47 +0200
Message-ID: <CALszF6D7_MQ0V=-RNsbFWYw22fXbcE+dFTOH3F9Tu4cCJ_Dwsw@mail.gmail.com>
Subject: Re: [PATCH] clk: stm32: Fix out-by-one error path in the index lookup
From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@linaro.org,
	linaro-kernel@lists.linaro.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Daniel,

2015-06-28 11:55 GMT+02:00 Daniel Thompson <daniel.thompson@linaro.org>:
> If stm32f4_rcc_lookup() is called with primary == 0 and secondary == 192
> then it will read beyond the end of the table array due to an out-by-one
> error in the range check.
>
> In addition to the fixing the inequality we also modify the r.h.s. to
> make it even more explicit that we are comparing against the size of
> table in bits.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/clk/clk-stm32f4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks for the patch.

Acked-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>

Regards,
Maxime
