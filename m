Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33810 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S943189AbcJ1A0j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2016 20:26:39 -0400
Date: Thu, 27 Oct 2016 17:26:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>
Subject: Re: [PATCH RESEND 1/3] clk: imx6: Mask mmdc_ch1 handshake for
 periph2_sel and mmdc_ch1_axi_podf
Message-ID: <20161028002632.GO26139@codeaurora.org>
References: <1476750554-21961-1-git-send-email-festevam@gmail.com>
 <CAOMZO5BQHKv7dxJTq2C1qdvhhRRRW8bafaXoQW77AKLNTWggAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAOMZO5BQHKv7dxJTq2C1qdvhhRRRW8bafaXoQW77AKLNTWggAg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10/26, Fabio Estevam wrote:
> Shawn,
> 
> Are you collecting the imx clk patches in this cycle?
> 
> I see no response from Stephen on this series from a long time.
> 
> We missed 4.9, so hopefully this can land in 4.10.
> 

These patches are in the queue. If Shawn wants to pick up patches
and send pull requests that's fine too.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
