Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-sn1nam01on0086.outbound.protection.outlook.com ([104.47.32.86]:30784
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751695AbdDKRT2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 11 Apr 2017 13:19:28 -0400
Message-ID: <1491931159.31718.16.camel@nxp.com>
Subject: Re: [RFC PATCH 1/3] clk: add clk_bulk_get accessories
From: Leonard Crestez <leonard.crestez@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>
CC: <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>,
        <broonie@kernel.org>, <yibin.gong@nxp.com>, <rjw@rjwysocki.net>,
        <viresh.kumar@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@codeaurora.org>, <shawnguo@kernel.org>,
        <fabio.estevam@nxp.com>, <anson.huang@nxp.com>, <ping.bai@nxp.com>,
        <octavian.purdila@nxp.com>, <linux-clk@vger.kernel.org>
Date: Tue, 11 Apr 2017 20:19:19 +0300
In-Reply-To: <1491969809-20154-2-git-send-email-aisheng.dong@nxp.com>
References: <1491969809-20154-1-git-send-email-aisheng.dong@nxp.com>
         <1491969809-20154-2-git-send-email-aisheng.dong@nxp.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2017-04-12 at 12:03 +0800, Dong Aisheng wrote:
> +/**
> + * clk_bulk_enable - ungate a bulk of clocks
> + * @num_clks: the number of clk_bulk_data
> + * @clks: the clk_bulk_data table being ungated
> + *
> + * clk_bulk_enable must not sleep
> + * Returns 0 on success, -EERROR otherwise.
> + */
> +int clk_bulk_enable(int num_clks, struct clk_bulk_data *clks)
> +{
> +       int ret;
> +       int i;
> +
> +       for (i = 0; i < num_clks; i++) {
> +               ret = clk_enable(clks[i].clk);
> +               if (ret) {
> +                       pr_err("Failed to enable clk '%s': %d\n",
> +                               clks[i].id, ret);
> +                       goto err;
> +               }
> +       }
> +
> +       return 0;
> +
> +err:
> +       while (--i >= 0)
> +               clk_put(clks[i].clk);

Shouldn't this be clk_disable?

And you can probably use clk_bulk_disable(i, clks) instead
