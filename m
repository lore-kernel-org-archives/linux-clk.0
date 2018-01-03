Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20180103013516.18844-4-sboyd@codeaurora.org>
References: <20180103013516.18844-1-sboyd@codeaurora.org> <20180103013516.18844-4-sboyd@codeaurora.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 3 Jan 2018 16:37:32 +0100
Message-ID: <CAK8P3a1L4Z4S41RkV3h6BbGMmUSLEHBc3a0-xSX61nuUkmE8eQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] arch: Remove clkdev.h asm-generic from Kbuild
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 3, 2018 at 2:35 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> Now that every architecture is using the generic clkdev.h file
> and we no longer include asm/clkdev.h anywhere in the tree, we
> can remove it.
>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: <linux-arch@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
