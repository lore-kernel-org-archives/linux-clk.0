Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:58555 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbcHSTxx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2016 15:53:53 -0400
Date: Fri, 19 Aug 2016 12:53:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: imx7d: Add the clock for SDMA
Message-ID: <20160819195332.GH6502@codeaurora.org>
References: <1471026416-11769-1-git-send-email-fabio.estevam@nxp.com>
 <CAOMZO5CFmvTCeHmTyp5qYnR-Qiz=27PCCLeZmaD3bDDOz=r32A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAOMZO5CFmvTCeHmTyp5qYnR-Qiz=27PCCLeZmaD3bDDOz=r32A@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/19, Fabio Estevam wrote:
> Hi Stephen,
> 
> On Fri, Aug 12, 2016 at 3:26 PM, Fabio Estevam <fabio.estevam@nxp.com> wrote:
> > Add IMX7D_SDMA_CORE_CLK clock so that SDMA can be functional.
> >
> > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Are you happy with this series?
> 
> I have some more patches for the clk-imx7d driver that I would like to
> send for 4.9.

Patches look fine. It sounds like you want me to apply them
directly so I'll do that now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
