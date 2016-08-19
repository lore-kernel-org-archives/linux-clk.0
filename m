Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:33269 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752430AbcHSGBu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2016 02:01:50 -0400
Received: by mail-ua0-f193.google.com with SMTP id u13so4931039uau.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Aug 2016 23:01:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1471026416-11769-1-git-send-email-fabio.estevam@nxp.com>
References: <1471026416-11769-1-git-send-email-fabio.estevam@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 19 Aug 2016 01:52:24 -0300
Message-ID: <CAOMZO5CFmvTCeHmTyp5qYnR-Qiz=27PCCLeZmaD3bDDOz=r32A@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: imx7d: Add the clock for SDMA
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Fri, Aug 12, 2016 at 3:26 PM, Fabio Estevam <fabio.estevam@nxp.com> wrote:
> Add IMX7D_SDMA_CORE_CLK clock so that SDMA can be functional.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Are you happy with this series?

I have some more patches for the clk-imx7d driver that I would like to
send for 4.9.

Thanks
