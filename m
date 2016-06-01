Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Jun 2016 15:07:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Roman Volkov <v1ron@mail.ru>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Volkov <rvolkov@v1ros.org>,
	Tony Prisk <linux@prisktech.co.nz>
Subject: Re: [PATCH 2/2] clk/vt8500: Fix compilation warnings
Message-ID: <20160601220744.GE28218@codeaurora.org>
References: <1464120473-1808-1-git-send-email-v1ron@mail.ru>
 <4814911.mY88HjlURn@wuerfel>
 <20160531213854.343e6129@v1ron-s7>
 <30846983.uaNfNPJlta@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <30846983.uaNfNPJlta@wuerfel>
List-ID: <linux-clk.vger.kernel.org>

On 05/31, Arnd Bergmann wrote:
> On Tuesday, May 31, 2016 9:38:54 PM CEST Roman Volkov wrote:
> > 
> > Arnd, your version is fine for me. We may apply it instead.
> > 
> > As you can see, I attached another patch where the logic for WM8650 is
> > completely reworked. This patch also removes the warning, that is why
> > fixing the wm8650 function is not necessary.
> > 
> > What about the WM8650 enhancement? Can I apply it on top of your
> > changes?
> 
> I think the easiest way is if you pick up my patch and submit it together
> with your other patch as a series (keeping my From: line and adding your
> Signed-off-by: below mine).
> 
> My patch should probably go first so we can get it into linux-4.7, while
> I assume your other one is for 4.8? If we want both in 4.7, either order
> is fine.
> 

Yes please do this, but we'll just merge both for v4.8.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
