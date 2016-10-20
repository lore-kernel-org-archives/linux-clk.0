Return-Path: <tony@atomide.com>
Date: Thu, 20 Oct 2016 06:06:48 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv4 11/15] clk: ti: clockdomain: add clock provider support
 to clockdomains
Message-ID: <20161020130648.azdsai47atynsdzn@atomide.com>
References: <1476805568-19264-1-git-send-email-t-kristo@ti.com>
 <1476805568-19264-12-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1476805568-19264-12-git-send-email-t-kristo@ti.com>
List-ID: <linux-clk.vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [161018 08:47]:
> Clockdomains can now be used as clock providers in the system. This
> patch initializes the provider data during init, and parses the clocks
> while they are being registered. An xlate function for the provider
> is also given.

Good to see this happen:

Acked-by: Tony Lindgren <tony@atomide.com>
