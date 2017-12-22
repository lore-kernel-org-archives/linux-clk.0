Return-Path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <20171221234043.GF7997@codeaurora.org>
References: <20171128071908.12279-1-joel@jms.id.au> <CACPK8XcQ_ZcgPK1PwEwCuWHQ_j5qS+PejRVhr2rYuH_Nn_nPLQ@mail.gmail.com>
 <20171221234043.GF7997@codeaurora.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 22 Dec 2017 12:12:17 +1030
Message-ID: <CACPK8Xf51mWz7_5s_+MP6Xnmy4jEGJ72+fpejc-O7pSaAH09jQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] clk: Add Aspeed clock driver
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>,
	Rick Altherr <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, Dec 22, 2017 at 10:10 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 12/06, Joel Stanley wrote:
>> Hello clk maintainers,
>>
>> Has anyone had a chance to review these patches?
>>
>
> Besides the sleeping call that should be a delay it looks OK.
> Send v7?

Thanks for taking a look. I'll fix the sleep call and send it out now.

Cheers,

Joel
