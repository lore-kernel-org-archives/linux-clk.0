Return-Path: <dan.carpenter@oracle.com>
Date: Wed, 16 May 2018 14:42:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Paul Burton <paul.burton@mips.com>, Colin King <colin.king@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>, linux-mips@linux-mips.org,
        linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: boston: fix memory leak of 'onecell' on error
 return paths
Message-ID: <20180516114254.wffddft537t45yfg@mwanda>
References: <20180509134031.11611-1-colin.king@canonical.com>
 <20180509140135.4dndt3baomtxups5@mwanda>
 <20180509163311.alvyibwwuwkumyxf@pburton-laptop>
 <20180510065951.fiojonx5f776z5jm@mwanda>
 <152640892003.34267.13202118557714072290@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <152640892003.34267.13202118557714072290@swboyd.mtv.corp.google.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 15, 2018 at 11:28:40AM -0700, Stephen Boyd wrote:
> Quoting Dan Carpenter (2018-05-09 23:59:51)
> > It would be nice to make things static check clean.  One idea would be
> > that the static checker could ignore resource leaks in __init functions.
> > 
> 
> Typically if the stuff is so important that it doesn't work without it
> then we throw in a panic() or a BUG() call to indicate that all hope is
> lost. Otherwise, I'm not sure what's wrong with adding in proper error
> paths for clean recovery.

In clk_boston_setup() then we'd have to put a ton of BUG()s in there to
silence all the warnings.  Right now the static checkers only care about
kmalloc() but in a year or two they'll be clever enough to care about
everything leaked in this function.  I don't think adding BUG() calls
is a good idea.

Plus, I have a private static checker warning for that.  When the BTRFS
filesystem was merged 10 years ago it used to call BUG() all the time if
allocations failed so I made a static checker warning to spot that
anti-pattern...

regards,
dan carpenter
