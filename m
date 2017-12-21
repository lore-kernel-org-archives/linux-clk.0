Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 15:40:43 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Lee Jones <lee.jones@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Jeremy Kerr <jk@ozlabs.org>, Rick Altherr <raltherr@google.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v6 0/5] clk: Add Aspeed clock driver
Message-ID: <20171221234043.GF7997@codeaurora.org>
References: <20171128071908.12279-1-joel@jms.id.au>
 <CACPK8XcQ_ZcgPK1PwEwCuWHQ_j5qS+PejRVhr2rYuH_Nn_nPLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACPK8XcQ_ZcgPK1PwEwCuWHQ_j5qS+PejRVhr2rYuH_Nn_nPLQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/06, Joel Stanley wrote:
> Hello clk maintainers,
> 
> Has anyone had a chance to review these patches?
> 

Besides the sleeping call that should be a delay it looks OK.
Send v7?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
