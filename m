Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1397C433C1
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 02:18:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DE97619B9
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 02:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbhCaCRl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Mar 2021 22:17:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:54532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233258AbhCaCRl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 30 Mar 2021 22:17:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC12F617C9;
        Wed, 31 Mar 2021 02:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617157060;
        bh=zkICwrrTeBiiLJ9V0FzAwANVNmAM7UQ4w7wCc5b4x/o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qCr432Um8dBOw+48bQSTDx2e90LrdqooiQyo34yEl6DfxvjvXg4IuKo0NhlUNvStI
         fx5D/f1mh9E+aTFmSjxLp6FJMQ+Nuo3aKMdTZZKd+9Yizb0bNeLAefTUMLf2PKbcUP
         N6BphAPpfUMYlUzonG3LkOcMAT38NTOXuwhdyWs6UryWQabAcDJsWwU3mbjQFIlhp4
         Dwt8Ji1MUMCTi3qaP4jMBj/cjH39gzUDMfxU47McXwUB9C9kYLr6/CTBWXgj89b4VF
         BTI6v4HYHnM6SP67NbgMlaNJzPcljzZqNqu7zyCvTMHjAxWBAJpeOUCdCHm24iKIhw
         hR+EgDgrRAsLw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1615796268-9011-2-git-send-email-hongxing.zhu@nxp.com>
References: <1615796268-9011-1-git-send-email-hongxing.zhu@nxp.com> <1615796268-9011-2-git-send-email-hongxing.zhu@nxp.com>
Subject: Re: [PATCH] clk: imx8mq: Correct the pcie1 sels
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Richard Zhu <hongxing.zhu@nxp.com>
To:     Richard Zhu <hongxing.zhu@nxp.com>, abel.vesa@nxp.com,
        ping.bai@nxp.com, shawnguo@kernel.org
Date:   Tue, 30 Mar 2021 19:17:39 -0700
Message-ID: <161715705952.2260335.14485382500737180840@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Richard Zhu (2021-03-15 01:17:48)
> - The sys2_pll_50m should be one of the clock sels of PCIE_AUX clock.
> Change the sys2_pll_500m to sys2_pll_50m.
> - Correct one mis-spell of the imx8mq_pcie1_ctrl_sels definition, from
> "sys2_pll_250m" to "sys2_pll_333m".
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---

Any Fixes tag?
