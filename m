Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8415EC4741F
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 01:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A09020789
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 01:54:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDwX3EKc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730702AbgKJByr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Nov 2020 20:54:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:35604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730305AbgKJByr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Nov 2020 20:54:47 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36767206B2;
        Tue, 10 Nov 2020 01:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604973286;
        bh=c95oosAIazQ+zFoT034izMGL3r61ZyLS5wzTBkq8ltA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TDwX3EKciL5MsasruAx5xJS43plNhRB7rM1z0KSwTWMW/EwwpSkpLOLYHB3tX6yS5
         WQ7NnTzMf70LSV+L1DY0urVyk6T6cWdmgIjW9VwZY3Y/wHxp1NPrqfZcgZYbXNl8Vu
         gO44PpStzoGzZC+azpe+5Ml0uVJiw0bACDTyWJ8w=
Date:   Tue, 10 Nov 2020 09:54:40 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Peng Fan <peng.fan@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/8] clk: imx8mp: drop of_match_ptr from of_device_id
 table
Message-ID: <20201110015439.GO31601@dragon>
References: <20201103162435.13689-1-krzk@kernel.org>
 <20201103162435.13689-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201103162435.13689-4-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 03, 2020 at 05:24:31PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might be not relevant here).  This
> fixes compile warning (!CONFIG_OF && !CONFIG_MODULES):
> 
>     drivers/clk/imx/clk-imx8mp.c:751:34: warning:
>         ‘imx8mp_clk_of_match’ defined but not used [-Wunused-const-variable=]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied, thanks.
