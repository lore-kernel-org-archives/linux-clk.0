Return-Path: <dan.carpenter@oracle.com>
Date: Thu, 10 May 2018 09:59:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Paul Burton <paul.burton@mips.com>
Cc: Colin King <colin.king@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-mips@linux-mips.org,
        linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: boston: fix memory leak of 'onecell' on error
 return paths
Message-ID: <20180510065951.fiojonx5f776z5jm@mwanda>
References: <20180509134031.11611-1-colin.king@canonical.com>
 <20180509140135.4dndt3baomtxups5@mwanda>
 <20180509163311.alvyibwwuwkumyxf@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180509163311.alvyibwwuwkumyxf@pburton-laptop>
List-ID: <linux-clk.vger.kernel.org>

It would be nice to make things static check clean.  One idea would be
that the static checker could ignore resource leaks in __init functions.

regards,
dan carpenter
