Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: , Akshu Agrawal <akshu.agrawal@amd.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1534834341-18345-1-git-send-email-akshu.agrawal@amd.com>
Cc: djkurtz@chromium.org, akshu.agrawal@amd.com, Alexander.Deucher@amd.com,
 Michael Turquette <mturquette@baylibre.com>,
 Akshu Agrawal <Akshu.Agrawal@amd.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <1534834341-18345-1-git-send-email-akshu.agrawal@amd.com>
Message-ID: <153549535306.129321.6563896874769936616@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: x86: Set default parent to 48Mhz
Date: Tue, 28 Aug 2018 15:29:13 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Akshu Agrawal (2018-08-20 23:51:57)
> System clk provided in ST soc can be set to:
> 48Mhz, non-spread
> 25Mhz, spread
> To get accurate rate, we need it to set it at non-spread
> option which is 48Mhz.
> =

> Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>

Does this need to go to 4.18 stable trees? I don't see a fixes tag so
I'm trying to understand merge priority of this patch.
