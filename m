Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Avi Fishman <avifishman70@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Michael Turquette <mturquette@baylibre.com>, Nancy Yuen <yuenn@google.com>,
 Patrick Venture <venture@google.com>, Tomer Maimon <tmaimon77@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180823230654.GA11576@embeddedor.com>
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
References: <20180823230654.GA11576@embeddedor.com>
Message-ID: <153549440786.129321.7169734992268309360@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: npcm7xx: fix memory allocation
Date: Tue, 28 Aug 2018 15:13:27 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Gustavo A. R. Silva (2018-08-23 16:06:54)
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
> =

> struct foo {
>         int stuff;
>         void *entry[];
> };
> =

> instance =3D kzalloc(sizeof(struct foo) + sizeof(void *) * count,
> GFP_KERNEL);
> =

> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
> =

> instance =3D kzalloc(struct_size(instance, entry, count), GFP_KERNEL);
> =

> Notice that, currently, there is a bug during the allocation:
>         =

> sizeof(npcm7xx_clk_data) should be sizeof(*npcm7xx_clk_data)
> =

> Fix this bug by using struct_size() in kzalloc()
> =

> This issue was detected with the help of Coccinelle.
> =

> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Applied to clk-fixes
