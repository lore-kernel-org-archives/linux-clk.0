Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>, Paul Burton <paul.burton@mips.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180510065951.fiojonx5f776z5jm@mwanda>
Cc: Colin King <colin.king@canonical.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-mips@linux-mips.org,
 linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20180509134031.11611-1-colin.king@canonical.com>
 <20180509140135.4dndt3baomtxups5@mwanda>
 <20180509163311.alvyibwwuwkumyxf@pburton-laptop>
 <20180510065951.fiojonx5f776z5jm@mwanda>
Message-ID: <152640892003.34267.13202118557714072290@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: boston: fix memory leak of 'onecell' on error return paths
Date: Tue, 15 May 2018 11:28:40 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Dan Carpenter (2018-05-09 23:59:51)
> It would be nice to make things static check clean.  One idea would be
> that the static checker could ignore resource leaks in __init functions.
> =


Typically if the stuff is so important that it doesn't work without it
then we throw in a panic() or a BUG() call to indicate that all hope is
lost. Otherwise, I'm not sure what's wrong with adding in proper error
paths for clean recovery.
