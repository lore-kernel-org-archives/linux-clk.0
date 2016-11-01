Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:46236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1169102AbcKAM75 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Nov 2016 08:59:57 -0400
Date: Tue, 1 Nov 2016 20:59:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH RESEND 1/3] clk: imx6: Mask mmdc_ch1 handshake for
 periph2_sel and mmdc_ch1_axi_podf
Message-ID: <20161101125935.GA23831@tiger>
References: <1476750554-21961-1-git-send-email-festevam@gmail.com>
 <CAOMZO5BQHKv7dxJTq2C1qdvhhRRRW8bafaXoQW77AKLNTWggAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAOMZO5BQHKv7dxJTq2C1qdvhhRRRW8bafaXoQW77AKLNTWggAg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Oct 26, 2016 at 01:48:56PM -0200, Fabio Estevam wrote:
> Shawn,
> 
> Are you collecting the imx clk patches in this cycle?
> 
> I see no response from Stephen on this series from a long time.
> 
> We missed 4.9, so hopefully this can land in 4.10.

Okay, I just applied the series to imx/clk branch, and will get it into
linux-next for wider testing.  If no issue is reported, I will send it
to Stephen and Mike then.

Shawn
