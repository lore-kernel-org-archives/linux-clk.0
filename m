Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:33268 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934164AbdEOLfF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2017 07:35:05 -0400
Received: by mail-oi0-f44.google.com with SMTP id w10so126699502oif.0
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2017 04:35:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6350d43f82a6bea3867777de46082fb6@agner.ch>
References: <1494791940-12499-1-git-send-email-festevam@gmail.com> <6350d43f82a6bea3867777de46082fb6@agner.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 May 2017 08:35:04 -0300
Message-ID: <CAOMZO5BYWzfoASZfBOW0LpERb4OtU9=vjUiMronFmbDR70ngSw@mail.gmail.com>
Subject: Re: [PATCH] clk: imx7d: Fix the powerdown bit location of PLL DDR
To: Stefan Agner <stefan@agner.ch>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        linux-clk@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 15, 2017 at 2:54 AM, Stefan Agner <stefan@agner.ch> wrote:

> BM_PLL_POWER_IMX7_DDR?

I will name it IMX7_DDR_PLL_POWER to make it consistent with
IMX7_ENET_PLL_POWER.

> The other PLL on i.MX 7 still have it at 12...

PLL Audio and Video have the powerdown bit at 12, ENET has it at bit 5
and is already handled by the special IMX7_ENET_PLL_POWER.

Will send a v2 with just the bit rename.

Thanks
