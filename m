Return-Path: <jacmet@gmail.com>
Return-Path: <jacmet@gmail.com>
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Emilio Lopez <emilio@elopez.com.ar>,  Mike Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: sun8i: Add the A33 AHB1 gates clock driver
References: <1441977997-29041-1-git-send-email-maxime.ripard@free-electrons.com>
	<1441977997-29041-3-git-send-email-maxime.ripard@free-electrons.com>
Date: Sun, 13 Sep 2015 17:13:12 +0200
In-Reply-To: <1441977997-29041-3-git-send-email-maxime.ripard@free-electrons.com>
	(Maxime Ripard's message of "Fri, 11 Sep 2015 15:26:35 +0200")
Message-ID: <87wpvu2vzr.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 > The A33 has different a different gates array than the A23, add the node to
 > the DT.

NIT: 2x different.

Shouldn't the a23 one then move from sun8i-a23-a33.dtsi to
sun8i-a23.dtsi?

-- 
Bye, Peter Korsgaard
