Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DE4C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 20:32:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E323F61165
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 20:32:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbhDHUcg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 16:32:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:51952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232091AbhDHUcg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Apr 2021 16:32:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF08B61107;
        Thu,  8 Apr 2021 20:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617913945;
        bh=r/TliBj87OK5d0dvwRvK54NmXGBgkuP3VxVDsB2j2hk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sg3WRQQNRPflMxOGauF0vRTsMko9CgHv9E51u6krunKojXXajdofsefHsQXXy9VQj
         sTTXxFqxpOuuGOELj2BGvPsXSgPfTukrNpaM91zye7kY52poFq+TZgr4kgMjBMFGCG
         zDic8qqWtSdjqWvaZV6pgyv8jVvJLNEBxwAoK1bX2Spv5lJHvz67LD3OKwVGKq1Qxr
         9Qd27k79Q0YQT+hZDSiivCP14sSthkIX3OoVGaq86gd6089kRah70L/Zx2jorqUxMx
         rLViG5gqKbB2kejFJjFD7D1peWyOC1Gq4MQjtDSSpHO1xEYWPSCbcs90HUbKthzovc
         j5Cg3SoCc5PMQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210408185731.135511-1-marex@denx.de>
References: <20210408185731.135511-1-marex@denx.de>
Subject: Re: [PATCH 0/7] ARM: dts: stm32: clk: Switch ETHRX clock parent from ETHCK_K to MCO2 on DHCOM SoM
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To:     Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Date:   Thu, 08 Apr 2021 13:32:23 -0700
Message-ID: <161791394374.3790633.266453595355045932@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2021-04-08 11:57:24)
> The implementation of ETH_RX_CLK/ETH_REF_CLK handling on STM32MP1 current=
ly
> does not permit selecting the RX clock input from SoC pad, the RX clock a=
re
> hard-wired to eth_clk_fb. This cover letter describes multiple unsuccessf=
ul
> attempts at solving this problem and a proposed partial solution.

Please use <sboyd@kernel.org> for clk patches, or run get_maintainer.pl
