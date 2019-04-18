Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B811BC10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:51:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A433217D7
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555624304;
	bh=dv6TttK7emyKgHHYYN4atA3HavUFgbpA2fMwYMnDDyI=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=jIe1icKgq/N/8tZTLy/tPsLMaFJTyeZTf41pB50LhbtyTFxOOFB9bbHlZop6MH4Fd
	 0QcgYTLKKTFI2OOad88wgbUpAdTAcIownMMrqltHPqSStf6HNH0lYxlVKUTWCG/iFx
	 pn2x75x+ODPp56VztFw89PXzjSPS8mK4E3dAj14A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfDRVvo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 17:51:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:52362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfDRVvn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Apr 2019 17:51:43 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AB5F20693;
        Thu, 18 Apr 2019 21:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555624303;
        bh=dv6TttK7emyKgHHYYN4atA3HavUFgbpA2fMwYMnDDyI=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=Pf8P6lAQGg3cGeSugtbM+upUXXiuQUNS/2di8Fh5Q51AFWSBrLHIi71z5nr7Kaz4x
         JGgpG9POOvMI8NPkp7p1hvEqAkkRIeHE4RCGvovmYjvXE5NqV4k/7ieZRiJL+nI0SI
         0kyhRF5Os65ZDyCDHzCqHiNaZ6SOg6tU+zSzox+U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190418111211.10474-7-jonas.gorski@gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com> <20190418111211.10474-7-jonas.gorski@gmail.com>
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
Subject: Re: [PATCH RFT V3 6/8] powerpc/512x: mark clocks as big endian
To:     Jonas Gorski <jonas.gorski@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Message-ID: <155562430247.15276.14512192657306459454@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 18 Apr 2019 14:51:42 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonas Gorski (2019-04-18 04:12:09)
> These clocks' registers are accessed as big endian, so mark them as
> such.
>=20
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---

Applied to clk-next

