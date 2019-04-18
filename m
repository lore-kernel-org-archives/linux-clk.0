Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439FFC282DD
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:51:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A4AE21479
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555624317;
	bh=VAqFt+2Slug5K3L/Eo9QbummplIkeF6rHU/h3vWz1ug=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=vCrsnuXmE1pPQ2BjOnzOoyVEnrHkkEG/qMEl5tVutoalKTU0MKSX0UdJqK8U0ly7S
	 exrF8vtoJm1iMR2L4sPvg47sZU2QzQxKJLU8Lcg55T1+wi0B8vS3xmYg6u/qb8HzNj
	 UB3pLqyP2AttB2pMjdBEBOUM5YQefDwCFfLyroFY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfDRVv4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 17:51:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:52528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfDRVv4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Apr 2019 17:51:56 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F6D520693;
        Thu, 18 Apr 2019 21:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555624316;
        bh=VAqFt+2Slug5K3L/Eo9QbummplIkeF6rHU/h3vWz1ug=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=qAldq5r39DfPiO9w5qtoj2DSKnNUVFNXUFcT3nttX5PEdkv+ttYK8Je09lIUlX4rr
         G5dtG4mddSuqxnQaF+KuCdyqzXXj2OzV4ndTqx+umpNNKWVF8FtyjXU4nHK9jU9qoT
         vQCdhx3sdg1YAG1A/KcTjxGFvjd2VkU8bEs3lA14=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190418111211.10474-9-jonas.gorski@gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com> <20190418111211.10474-9-jonas.gorski@gmail.com>
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RFT V3 8/8] clk: core: replace clk_{readl,writel} with {readl,writel}
To:     Jonas Gorski <jonas.gorski@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Message-ID: <155562431544.15276.5634748612989968529@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 18 Apr 2019 14:51:55 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonas Gorski (2019-04-18 04:12:11)
> Now that clk_{readl,writel} is just an alias for {readl,writel}, we can
> switch all users of clk_* to use the accessors directly and remove the
> helpers.
>=20
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---

Applied to clk-next

