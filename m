Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:50866 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751042AbeGJFom (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 10 Jul 2018 01:44:42 -0400
Date: Mon, 9 Jul 2018 22:44:38 -0700
From: Tony Lindgren <tony@atomide.com>
To: Faiz Abbas <faiz_abbas@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        bcousson@baylibre.com, paul@pwsan.com, t-kristo@ti.com,
        mark.rutland@arm.com, sboyd@kernel.org
Subject: Re: [PATCH v5 2/6] clk: ti: dra7: Add clkctrl clock data for the
 mcan clocks
Message-ID: <20180710054438.GE99251@atomide.com>
References: <20180709164841.14182-1-faiz_abbas@ti.com>
 <20180709164841.14182-3-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180709164841.14182-3-faiz_abbas@ti.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

* Faiz Abbas <faiz_abbas@ti.com> [180709 16:50]:
> Add clkctrl data for the m_can clocks and register it within the
> clkctrl driver

I'll apply patches 2 to 5 to omap-for-v4.19/ti-sysc. The clock
patch is trivial enough to not have to wait for Tero to be back
online.

And I'll apply the dts changes into omap-for-v4.19/dt-mcan based
on omap-for-v4.19/ti-sysc because of the dependency to the clocks.

Regards,

Tony
