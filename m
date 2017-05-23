Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33415 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752602AbdEWPeR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 May 2017 11:34:17 -0400
Received: by mail-oi0-f54.google.com with SMTP id w10so206563767oif.0
        for <linux-clk@vger.kernel.org>; Tue, 23 May 2017 08:34:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1494849305-1405-1-git-send-email-festevam@gmail.com>
References: <1494849305-1405-1-git-send-email-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 23 May 2017 12:34:16 -0300
Message-ID: <CAOMZO5CAPZ1f9Mh2E1T9Hx++-c6aaOnR=KEfZApHCNQJOpR9NA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: imx7d: Fix the powerdown bit location of PLL DDR
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        linux-clk@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
        Fabio Estevam <fabio.estevam@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Mon, May 15, 2017 at 8:55 AM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
>
> According to the MX7D Reference Manual the powerdown bit of
> CCM_ANALOG_PLL_DDRn register is bit 20, so fix it accordingly.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> Reviewed-by: Stefan Agner <stefan@agner.ch>

A gentle ping.
