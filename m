Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/3] clk: samsung: Add CLK_SET_RATE_PARENT to some AUDSS
 CLK CON clocks
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, cw00.choi@samsung.com,
	krzk@kernel.org, linux-samsung-soc@vger.kernel.org,
	b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <05c5b174-054d-0f6d-84a4-2355cb07053c@samsung.com>
Date: Thu, 10 Aug 2017 10:55:32 +0200
MIME-version: 1.0
In-reply-to: <1500655004-29816-2-git-send-email-s.nawrocki@samsung.com>
Content-type: text/plain; charset="utf-8"; format="flowed"
References: <1500655004-29816-1-git-send-email-s.nawrocki@samsung.com>
	<CGME20170721163751epcas1p2fd6ba68507923b767c043b38249535e8@epcas1p2.samsung.com>
	<1500655004-29816-2-git-send-email-s.nawrocki@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/21/2017 06:36 PM, Sylwester Nawrocki wrote:
> This allows clk rate propagation up to the clock tree so EPLL
> can be reprogrammed indirectly when setting rate of the Audio
> Subsystem clocks.
> The advantage is that sound machine driver can operate only
> on the leaf clocks rather than explicitly re-configuring
> the root clock (EPLL).
> 
> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>

I've applied patches 1..3 to my tree.
