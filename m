Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C06C10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:51:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A24321479
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555624293;
	bh=RdOZitzLTqqL0tJdZGDzjnECoQsdymfk4S6v7K8r0QY=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=aO1gIGw1GQ2OnQ++WUlBUC26UCWleRSXIaw+2jl22cPP0ffQQES21t+L9r2bkc45w
	 dAMHbvqBfC/czXZQDPYHUGEFeigneQ0X3uyWSLUoZXjj4G2+cMoaGdfzy728PjmZnU
	 15zqQQdibGd8Ct2Sv+4LFMdxLj6rJ2dipHhXw/8U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfDRVvc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 17:51:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726076AbfDRVvc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Apr 2019 17:51:32 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 47B1C2087F;
        Thu, 18 Apr 2019 21:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555624292;
        bh=RdOZitzLTqqL0tJdZGDzjnECoQsdymfk4S6v7K8r0QY=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=KL6HrGpABTT9Ks1gt2M3/Alr447pmtgQMDNIdb3aDFWRG+WRfp3XdNnZir/K8IR/l
         GFG0ozD6F4wpnWwkFWKsAhD5ZMtyVQCxd1dZO0vr33DweuqaJvxDVadS+AI3D3gQkE
         UITlWvU3l/b623Q/cLWivXHaOXmDqQkC+wafXEtM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190418111211.10474-5-jonas.gorski@gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com> <20190418111211.10474-5-jonas.gorski@gmail.com>
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
Subject: Re: [PATCH RFT V3 4/8] clk: multiplier: add explicit big endian support
To:     Jonas Gorski <jonas.gorski@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Message-ID: <155562429161.15276.10802620738708355753@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 18 Apr 2019 14:51:31 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonas Gorski (2019-04-18 04:12:07)
> Add a clock specific flag to switch register accesses to big endian, to
> allow runtime configuration of big endian multiplier clocks.
>=20
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---

Applied to clk-next

