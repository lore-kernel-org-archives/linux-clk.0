Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,  Michael Turquette <mturquette@baylibre.com>,  Carlo Caione <carlo@caione.org>,  linux-clk@vger.kernel.org,  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: gxbb: fix CLKID_ETH defined twice
References: <1485446749-12679-1-git-send-email-jbrunet@baylibre.com>
	<20170126234421.GG8801@codeaurora.org>
Date: Fri, 27 Jan 2017 10:58:06 -0800
In-Reply-To: <20170126234421.GG8801@codeaurora.org> (Stephen Boyd's message of
	"Thu, 26 Jan 2017 15:44:21 -0800")
Message-ID: <m2bmusuy81.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 01/26, Jerome Brunet wrote:
>> CLKID_ETH is define in the dt-bindings but has not be commented out in the
>> clock driver. Just do it now.
>> 
>> Fixes: 738f66d3211d ("clk: gxbb: add AmLogic GXBB clk controller driver")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>

Applied to amlogic v4.11/dt64 branch with Stephen's ack.

Kevin
