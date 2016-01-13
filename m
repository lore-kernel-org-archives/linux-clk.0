Return-Path: <rklein@nvidia.com>
Subject: Re: [PATCH 9/9] clk: tegra210: Initialize PLL_D2 to a sane rate
To: Thierry Reding <thierry.reding@gmail.com>
References: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
 <1452278714-10751-10-git-send-email-rklein@nvidia.com>
 <20160113140309.GB15782@ulmo>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette
	<mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen
 Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang
	<bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung
	<bleung@chromium.org>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Rhyland Klein <rklein@nvidia.com>
Message-ID: <56967ADD.8090904@nvidia.com>
Date: Wed, 13 Jan 2016 11:27:09 -0500
MIME-Version: 1.0
In-Reply-To: <20160113140309.GB15782@ulmo>
Content-Type: text/plain; charset="windows-1252"
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 1/13/2016 9:03 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, Jan 08, 2016 at 01:45:14PM -0500, Rhyland Klein wrote:
>> Initialize PLL_D2 to a sane rate at the start of the day.
>>
>> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
>> ---
>>  drivers/clk/tegra/clk-tegra210.c | 1 +
>>  1 file changed, 1 insertion(+)
> 
> There are a lot of assumptions in this commit message. I'm asking myself
> why does it need to be initialized to any rate at all? Isn't it up to
> the user driver to set the PLL to whatever it knows to be a sane rate?
> Why is 594 MHz a sane rate?
> 
> A good commit message should answer those questions.
> 

Thanks. This patch came about in response to some work with
suspend/resume logic in the ChromeOS kernel. In the suspend/resume patch
there, it reads all clk rates and caches them in suspend, then re-sets
them on resume. We hadn't been using pll_d2 at all, and its rate (when
read in suspend()) came back as 0. Then in resume, we would tr to set
it, clk_set_rate(pll_d2, 0) and would generate a warning/error that 0
wasn't a valid rate.

As for the specific rate I chose, I simply took one off the table of
supported frequencies in the clk-tegra210 code, so that it was non-zero.

Since we don't support suspend/resume right now in the clk drivers, I
don't think its urgent to merge this patch. I can drop in in the next
rev if thats easier.

-rhyland


-- 
nvpublic
