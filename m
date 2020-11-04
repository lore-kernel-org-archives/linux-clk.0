Return-Path: <SRS0=af6Y=EK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE00C388F7
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 09:00:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AF962224E
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 09:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgKDJA1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 04:00:27 -0500
Received: from foss.arm.com ([217.140.110.172]:33406 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbgKDJA1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 04:00:27 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43F08139F;
        Wed,  4 Nov 2020 01:00:26 -0800 (PST)
Received: from bogus (unknown [10.57.20.164])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4236B3F66E;
        Wed,  4 Nov 2020 01:00:23 -0800 (PST)
Date:   Wed, 4 Nov 2020 09:00:16 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Peng Fan <peng.fan@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 8/8] clk: scpi: mark scpi_clk_match as maybe unused
Message-ID: <20201104090016.4yknr3zrewuhwhnu@bogus>
References: <20201103162435.13689-1-krzk@kernel.org>
 <20201103162435.13689-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201103162435.13689-8-krzk@kernel.org>
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 03, 2020 at 05:24:35PM +0100, Krzysztof Kozlowski wrote:
> The scpi_clk_match (struct of_device_id) is referenced only with
> CONFIG_OF builds thus mark it as __maybe_unused:
>
>     drivers/clk/clk-scpi.c:132:34: warning:
>         ‘scpi_clk_match’ defined but not used [-Wunused-const-variable=]
>

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep
