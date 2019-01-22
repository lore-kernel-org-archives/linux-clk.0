Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE53FC282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:05:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B724820870
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548183947;
	bh=/f/91RgRdFyHmVvQrmC4OVG+JQl431OvDL4yE2AjYk4=;
	h=To:In-Reply-To:References:Subject:From:Cc:Date:List-ID:From;
	b=TL3RaZF0JCL48LrsgYemPxoZafeZp+UhwLNGprea/z1Apt4QVVlDiAFOBusNWZoKY
	 VJ1O5WEXzDTtLnOzOLWtNjbTGWhdN7xLmvqYl9C1XZC3ZVj1BkJpIf5rFBAcq2MfFJ
	 xfQs4URQbvRh3f7+85GmEMw1d5ZAn63sk0eSfh2s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbfAVTFr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 14:05:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:43482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbfAVTFr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Jan 2019 14:05:47 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A73A720856;
        Tue, 22 Jan 2019 19:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548183946;
        bh=/f/91RgRdFyHmVvQrmC4OVG+JQl431OvDL4yE2AjYk4=;
        h=To:In-Reply-To:References:Subject:From:Cc:Date:From;
        b=lqpn/t0uLInB9QewemGF3LE5RXD1BtxGuM8o3F4D9jpGDLPdI0g8CW0s0Q1syTQFM
         7b8Sz0n+t0og8eMiEkpriIqiY2ydWVT8bGCS4WipaMz3N/F5faDp3AmYp9Hv4Tqatl
         +bXCKqv+PCUYnJqJ8RRW05K76FL9HAZ7TNNxdRQc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
In-Reply-To: <1547207400-28307-2-git-send-email-aisheng.dong@nxp.com>
User-Agent: alot/0.8
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com> <1547207400-28307-2-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH RESEND v1 1/4] dt-bindings: fsl: scu: add fallback compatible string for clock
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154818394585.20280.8854282252890827430@swboyd.mtv.corp.google.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Date:   Tue, 22 Jan 2019 11:05:45 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2019-01-11 03:55:56)
> SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> Let's add a "fsl,scu-clk" fallback compatible string to allow other
> SoCs to reuse the common part.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

