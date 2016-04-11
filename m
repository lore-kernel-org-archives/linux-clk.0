Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1460350383-7661-1-git-send-email-vaishali.thakkar@oracle.com>
References: <1460350383-7661-1-git-send-email-vaishali.thakkar@oracle.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 11 Apr 2016 22:39:16 +0800
Message-ID: <CAGb2v64tjgJ54AYiDVDmCS3vJXbXmMxNBmhs0LxKA5hboAJ_xQ@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi: Use resource_size
To: Vaishali Thakkar <vaishali.thakkar@oracle.com>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Apr 11, 2016 at 12:53 PM, Vaishali Thakkar
<vaishali.thakkar@oracle.com> wrote:
> Use the function resource_size instaed of explicit computation.
>
> Problem found using Coccinelle.
>
> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@oracle.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
