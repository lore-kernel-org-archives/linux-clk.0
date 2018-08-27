Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726826AbeH0Wnp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 27 Aug 2018 18:43:45 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Stephen Boyd <sboyd@kernel.org>
To: Jiecheng Wu <jasonwood2031@gmail.com>, linux-clk@vger.kernel.org
References: <20180817014436.6104-1-jasonwood2031@gmail.com>
In-Reply-To: <20180817014436.6104-1-jasonwood2031@gmail.com>
Message-ID: <153539615648.129321.16092936507957611360@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk-pxa.c: fix missing return value check of kzalloc()
Date: Mon, 27 Aug 2018 11:55:56 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Jiecheng Wu (2018-08-16 18:44:36)
> Function clk_pxa_cken_init() defined in drivers/clk/pxa/clk-pxa.c calls k=
zalloc() to allocate memory for struct pxa_clk which is dereferenced immedi=
ately. As kzalloc() may return NULL when OOM happens, this code piece may c=
ause NULL pointer dereference bug.
> ---

Please line wrap at something like 75 characters or so and add a
'Signed-off-by' on this patch. Otherwise I can't accept it.
