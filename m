Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, arm@kernel.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] Allwinner arm64 DT changes for 4.10, bis
Date: Wed, 30 Nov 2016 16:54:49 +0100
Message-ID: <5466789.d5zjXGQ0JJ@wuerfel>
In-Reply-To: <20161122144731.c6q6jxgd7cyeieqr@lukather>
References: <20161122144731.c6q6jxgd7cyeieqr@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Tuesday, November 22, 2016 3:47:31 PM CET Maxime Ripard wrote:
> Hi Arnd, Olof,
> 
> Here is a second run at the arm64 PR I sent earlier.
> 
> We had a (build) dependency against the clock patches that have been
> merged by Stephen and Mike through the clock tree.
> 
> Hence, this new PR is based on top of the tag I sent their way, and it
> supersedes the previous arm64 PR.
> 
> I used this occasion to rename the patches prefix as Olof suggested in
> the earlier pull request.

Just to document what we discussed on IRC: I've dropped this pull
request, as we had already merged the previous one, and some other
patches on top. Instead, I changed the data in the sun50i-a64.dtsi
to reference the clocks and resets by numerical value rather than
by name, which fixes the build.

	Arnd
