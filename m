Return-Path: <linux+mturquette=baylibre.com@arm.linux.org.uk>
Date: Fri, 19 Feb 2016 16:48:44 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: gpio: Really allow an optional clock= DT property
Message-ID: <20160219164844.GA19428@n2100.arm.linux.org.uk>
References: <20160219030731.GS4847@codeaurora.org>
 <1455851525-18972-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455851525-18972-1-git-send-email-sboyd@codeaurora.org>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 18, 2016 at 07:12:05PM -0800, Stephen Boyd wrote:
> We mis-merged the original patch from Russell here and so the
> patch went almost all the way, except that we still failed to
> probe when there wasn't a clocks property in the DT node. Allow
> that case by making a negative value from
> of_clk_get_parent_count() into "no parents", like the original
> patch did.

NAK.  I'm not testing this patch, when I've already spent more than
enough time (a) developing the original patch and testing that, and
(b) re-diagnosing what's going wrong, and re-fixing the fuck up,
and testing that fix.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
