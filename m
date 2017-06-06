Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ot0-f178.google.com ([74.125.82.178]:34939 "EHLO
        mail-ot0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751281AbdFFPq4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jun 2017 11:46:56 -0400
Received: by mail-ot0-f178.google.com with SMTP id a2so17910265oth.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Jun 2017 08:46:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1496763146.28352.39.camel@nxp.com>
References: <1494849305-1405-1-git-send-email-festevam@gmail.com> <1496763146.28352.39.camel@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 Jun 2017 12:46:54 -0300
Message-ID: <CAOMZO5DysAoczSpn7eNzC=2W+f-8_Jgj9W3OhJfzdR=sivOOMg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: imx7d: Fix the powerdown bit location of PLL DDR
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        linux-clk@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
        Fabio Estevam <fabio.estevam@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Leonard,

On Tue, Jun 6, 2017 at 12:32 PM, Leonard Crestez
<leonard.crestez@nxp.com> wrote:

> Maybe you mean IMX7_DDR_PLL_POWER here?
>
> This patch made it way into next-20170606 and broke boot on imx7d-sdb.
> There is no console output but bisection points to this patch.
>
> Changing power_bit to IMX7_DDR_PLL_POWER seems to make it work.

Ops, sorry about that! Just sent a fix. Thanks for reporting.
