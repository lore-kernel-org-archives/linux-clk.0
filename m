Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [GIT PULL] clk/samsung updates for 4.17
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc
	<linux-samsung-soc@vger.kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <d875c043-e3b2-0144-6bd2-eec4e01ea1a3@samsung.com>
Date: Wed, 21 Mar 2018 16:26:17 +0100
MIME-version: 1.0
In-reply-to: 
	<152122345522.70929.15804290996122965031@swboyd.mtv.corp.google.com>
Content-type: text/plain; charset="utf-8"
References: <CGME20180315190219epcas1p364b2b0777c6f60c55a60119ea3d16480@epcas1p3.samsung.com>
	<a64f8f5e-2d6b-a277-17cc-4c6102dc7aaa@samsung.com>
	<152122345522.70929.15804290996122965031@swboyd.mtv.corp.google.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/16/2018 07:04 PM, Stephen Boyd wrote:
> Thanks. Pulled into clk-next. I also threw a patch on top to fix some
> sparse warnings that came out when I compile tested stuff.

Thank you for fixing these issues. I have finally added building with sparse
enabled for all related architectures to my release build script so I don't
miss such things in future.
