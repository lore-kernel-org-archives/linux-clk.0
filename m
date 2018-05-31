Return-Path: <sergey.senozhatsky.work@gmail.com>
Return-Path: <sergey.senozhatsky.work@gmail.com>
Date: Thu, 31 May 2018 18:45:08 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: bhelgaas@google.com, pmladek@suse.com, sergey.senozhatsky@gmail.com,
	rostedt@goodmis.org, Al Viro <viro@zeniv.linux.org.uk>,
	Greg KH <gregkh@linuxfoundation.org>, corbet@lwn.net,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: Can printk() sleep at runtime?
Message-ID: <20180531094508.GC477@jagdpanzerIV>
References: <ba98332d-7013-f5cb-7d49-645ee6f49156@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <ba98332d-7013-f5cb-7d49-645ee6f49156@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Cc-ing CLK people.

On (05/31/18 17:08), Jia-Ju Bai wrote:
> [FUNC] __might_sleep
> kernel/locking/mutex.c: 747: __might_sleep in __mutex_lock_common
> kernel/locking/mutex.c: 893: __mutex_lock_common in __mutex_lock
> kernel/locking/mutex.c: 908: __mutex_lock in mutex_lock_nested
> drivers/clk/clk.c, 123: mutex_lock_nested in clk_prepare_lock
> drivers/clk/clk.c, 1369: clk_prepare_lock in clk_core_get_rate
> drivers/clk/clk.c, 1393: clk_core_get_rate in clk_get_rate
> lib/vsprintf.c, 1450: clk_get_rate in clock
> lib/vsprintf.c, 1944: clock in pointer
> lib/vsprintf.c, 2286: pointer in vsnprintf
> lib/vsprintf.c, 2385: vsnprintf in vscnprintf
> kernel/printk/printk.c, 1853: vscnprintf in vprintk_emit
> kernel/printk/printk.c, 1947: vprintk_emit in vprintk_default
> kernel/printk/printk_safe.c, 379: vprintk_default in vprintk_func
> kernel/printk/printk.c, 1980: vprintk_func in printk
> drivers/pci/pci.c, 5364: printk in pci_specified_resource_alignment
> drivers/pci/pci.c, 5313: spin_lock in pci_specified_resource_alignment
> 
> In fact, I suspect that my report is false, because I always have an
> impression that printk() cannot sleep.
> But according to the call path, I cannot find where I make the mistake...
> 
> So could someone please help me to point the mistake?

I think you are right.

number(buf, end, clk_get_rate(clk), spec) indeed locks the `prepare_lock'
mutex from atomic context.

	-ss
