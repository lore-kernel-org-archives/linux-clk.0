Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:43571 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750710AbdFTECK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Jun 2017 00:02:10 -0400
Subject: Re: [PATCH v5 6/6] ARM: dts: imx6: RIoTboard provide standby on power
 off option
To: Stephen Boyd <sboyd@codeaurora.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
References: <20170619050245.2632-1-o.rempel@pengutronix.de>
 <20170619050245.2632-7-o.rempel@pengutronix.de>
 <20170620001936.GU20170@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From: Oleksij Rempel <ore@pengutronix.de>
Message-ID: <e1cd6a98-479c-b188-1417-5ead29a89273@pengutronix.de>
Date: Tue, 20 Jun 2017 06:02:06 +0200
MIME-Version: 1.0
In-Reply-To: <20170620001936.GU20170@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 20.06.2017 02:19, Stephen Boyd wrote:
> On 06/19, Oleksij Rempel wrote:
>> This board, as well as some other boards with i.MX6 and a PMIC, uses a
>> "MPIC_STBY_REQ" line to notify the PMIC about a state change.
>
> PMIC_STBY_REQ?

Ok, thanks.
