Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <1522403054-18691-4-git-send-email-hayashi.kunihiko@socionext.com>
References: <1522403054-18691-1-git-send-email-hayashi.kunihiko@socionext.com> <1522403054-18691-4-git-send-email-hayashi.kunihiko@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 2 Apr 2018 12:41:02 +0900
Message-ID: <CAK7LNAS=ZCnD0rAP9yrTZLuK=oBuQN4ZxwA5WCMenidohiNsKw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: uniphier: add additional ethernet clock lines
 for Pro4
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

2018-03-30 18:44 GMT+09:00 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>:
> Pro4 SoC has clock lines for Giga-bit feature and ethernet phy,
> and these are mandatory to activate the ethernet controller. This adds
> support for the clock lines.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>





-- 
Best Regards
Masahiro Yamada
