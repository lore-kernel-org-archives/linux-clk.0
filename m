Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C39CC2D0A3
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:07:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2507120BED
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604538427;
	bh=pRw5IAI0eHSPbVwN9j3egini8FS3OGDqJ/NcqGqc0P8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=muhgx0TZnEeBAmst1rJc95HXLp06V3GjflNbU1CVrYwOh/tac1VtqqLxlNEYaxq4s
	 mPUsOJJR1EKMHHgC4x92phQZJIqcY54Np3YSn9f5zMrDXiIOBrZ2Q0Pa7WaGypbY5L
	 xb8t3jhS5dZBX6uUz5doZp7GXB+uzN5yJDHtHVSI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388125AbgKEBHG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 20:07:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:55956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388118AbgKEBHE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 20:07:04 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4AE7820867;
        Thu,  5 Nov 2020 01:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604538424;
        bh=pRw5IAI0eHSPbVwN9j3egini8FS3OGDqJ/NcqGqc0P8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=wgVeIxSNFqKq4ZddKnJ6j71wZL+L9s7sdjd5uECrFM1nmtm+LpyUFrko8aX/tiqyi
         /rC9LjSa+JvfLwkh5pwTzX4UOJp3qhxhQY0gyXIcBeH+ewnAe3Dr+FAKmshZn/FP5A
         1gYs/ATYiyytCtxQ/Cj3+7G5XPFzg+L8gCC+k5U4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1604402306-5348-9-git-send-email-abel.vesa@nxp.com>
References: <1604402306-5348-1-git-send-email-abel.vesa@nxp.com> <1604402306-5348-9-git-send-email-abel.vesa@nxp.com>
Subject: Re: [PATCH v5 08/14] clk: imx8mp: Add audio shared gate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
To:     Abel Vesa <abel.vesa@nxp.com>, Adam Ford <aford173@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marek Vasut <marek.vasut@gmail.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Wed, 04 Nov 2020 17:07:02 -0800
Message-ID: <160453842284.3965362.2795925661166641366@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2020-11-03 03:18:20)
> According to the RM, the CCGR101 is shared for the following root clocks:
> - AUDIO_AHB_CLK_ROOT
> - AUDIO_AXI_CLK_ROOT
> - SAI2_CLK_ROOT
> - SAI3_CLK_ROOT
> - SAI5_CLK_ROOT
> - SAI6_CLK_ROOT
> - SAI7_CLK_ROOT
> - PDM_CLK_ROOT
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
