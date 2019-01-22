Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEB8C282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B751A20870
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548183963;
	bh=xzvDuHF6jb4hWQdIAuWiIOIWXuVQJTrf8uYGoH/XYNg=;
	h=To:In-Reply-To:References:Subject:From:Cc:Date:List-ID:From;
	b=PKVLItuTU/WK8PdIS41ldeC/KisJ3A6H5WvUORuR6Mb7c4tGpnBKl5e4rJV2h6rJW
	 w5H67YeQtfLfsnraRjbPtZRyOKfOew7E3gCx3PcXZqLWJd9kFs9eshtWJaf22EUfkq
	 ufmEpEgjk0PPe4zWb4DbeswO9oAMpfGQXkXrJnVI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfAVTGD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 14:06:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:43840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbfAVTGD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Jan 2019 14:06:03 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2BA420856;
        Tue, 22 Jan 2019 19:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548183962;
        bh=xzvDuHF6jb4hWQdIAuWiIOIWXuVQJTrf8uYGoH/XYNg=;
        h=To:In-Reply-To:References:Subject:From:Cc:Date:From;
        b=u7N5Fcj11NX+TDACrCrU3Aq+aLOJ2Pk7LsRAHilDmC3EFfx0Fvbs7LXgvBflYa/78
         WsYdXO0oF0ejPZ8V/OuJuSL2Lmpxi4ouVr/HJ7jDhEi7XcbytluDScX5MBSDRO8tbR
         2BRVw0IcesnTXkjN6lJJM/oWlYvXUBu6zyXdxMd4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
In-Reply-To: <1547207400-28307-3-git-send-email-aisheng.dong@nxp.com>
User-Agent: alot/0.8
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com> <1547207400-28307-3-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH RESEND v1 2/4] dt-bindings: fsl: scu: add imx8qm scu clock support
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154818396202.20280.13663727135774413069@swboyd.mtv.corp.google.com>
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
Date:   Tue, 22 Jan 2019 11:06:02 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2019-01-11 03:56:00)
> Add imx8qm scu clock support
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

