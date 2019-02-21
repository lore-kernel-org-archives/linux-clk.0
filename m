Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853A2C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:36:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E3782083B
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550781406;
	bh=UDXgWOt3EyyNrFSp7bznujcCcbGhkS8IIR7+H+YW4mQ=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=gUBT9kVPb/0OaEWDhbq18eiBE95hiAcdQwNWz5I1ha4VMsxh0TRjhxYtCmmt20TUv
	 yalQRceeWxwig2DqEzBu0nAFiw12h/8qmdFeNMPxiEJHbRI+P/oXTpKg3IirdVUmDf
	 8Wx4mAuBp5k0SR1LTFLN7Gi5Hqcjxp+UocHr3TFA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbfBUUgq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 15:36:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:40838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfBUUgp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 15:36:45 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2D7A20823;
        Thu, 21 Feb 2019 20:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550781405;
        bh=UDXgWOt3EyyNrFSp7bznujcCcbGhkS8IIR7+H+YW4mQ=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=nLpn343pJOJ0J6VECJ3/NttPsBzAPne3tGsUxQ5RzCzH5fyCaAc81+65Yj2ZtVOcJ
         5hQwEA9PTJUoD6EfgXSX+pbTpDwSwztKcitnQFc+bWwztq1OLl7kNQ7jxfsi4K1jqh
         z5D0qh1yAUSvBLUiJM5kakRddONc6R9RebD81onc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: imx8mq: Add support for the CLKO1 clock
Message-ID: <155078140414.77512.3157214123340597508@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190131002056.12024-1-festevam@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190131002056.12024-1-festevam@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Abel Vesa <abel.vesa@nxp.com>, Bai Ping <ping.bai@nxp.com>,
        Carlo Caione <ccaione@baylibre.com>,
        Lucas Stach <l.stach@pengutronix.de>
Date:   Thu, 21 Feb 2019 12:36:44 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabio Estevam (2019-01-30 16:20:56)
> Add the entry for the CLKO1 clock.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Applied to clk-next but I had to fix the whole DT binding number because
I don't know what this patch is based on. In fact, please get everyone
involved at NXP and whoever else is working on i.MX clk drivers to
coordinate somehow. I just spent 20 minutes working through the set of
imx patches in my inbox and I see approximately 6 different authors all
sending out a few clks at a time for the same drivers with zero
information about what the patches are based on or what order they're
supposed to be applied in.

If someone wants to collect all the patches and indicate on the list
they've picked them up and will be sending them as a pull request that's
fine. Otherwise, I recommend working together to post a coherent patch
series that adds the things that everyone wants or working from a stable
baseline like an rc tag and letting me figure out how to do the merging.
Either way, it looks like if I ever get a patch for imx clk drivers that
doesn't have a cover letter or is just adding a few clks here and there
I'll have to assume it's the same story as always and just toss them
into a clk-imx branch without a topic.

