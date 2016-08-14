Return-Path: <corbet@lwn.net>
Date: Sun, 14 Aug 2016 12:13:18 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti
 <andi.shyti@samsung.com>
Subject: Re: [PATCH v2] Documentation: clk: update file names containing
 referenced structures
Message-ID: <20160814121318.22c09fe3@lwn.net>
In-Reply-To: <1471005685-505-1-git-send-email-geert+renesas@glider.be>
References: <1471005685-505-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Fri, 12 Aug 2016 14:41:25 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> From: Andi Shyti <andi.shyti@samsung.com>
> 
> Commit 'b09d6d991' removes include/linux/clk-private.h and
> re-arranges the clock related structures contained in it in
> different files. The documentation has not been updated
> accordingly, thus it wasn't anymore consistent.
> 
> Place the structures referenced by Documentation/clk.txt in the
> correct files and update their contents to the latest status.

OK, I've applied this to the docs tree.  Someday it would be nice to do
this properly with kerneldoc, but, in the meantime, what we have should be
current.

Thanks,

jon
