Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1534885532-26558-1-git-send-email-khoroshilov@ispras.ru>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
References: <1534885532-26558-1-git-send-email-khoroshilov@ispras.ru>
Message-ID: <153566760504.93865.7380493717123451991@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: cdce925: release child device nodes
Date: Thu, 30 Aug 2018 15:20:05 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Alexey Khoroshilov (2018-08-21 14:05:32)
> of_get_child_by_name() returns device node with refcount incremented,
> but there is no decrement in cdce925_probe(). The patch adds one.
> =

> Found by Linux Driver Verification project (linuxtesting.org).
> =

> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> ---

Applied to clk-next
