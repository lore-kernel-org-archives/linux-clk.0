Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC26C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B44D2083E
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550781874;
	bh=xeKs0g9WAEXwnWqP3m8PneYHNcgwFpBY31m5h7o3YBI=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=hRgN9RfHWa0d+avgru/lOtPgPc56lFS2NSOUf3lDGhXFzxd8qntbUPgRDOfKTSy8X
	 uc9aea+fdddO1sAMxsaNT3YCVh0zqHxlTc38Z40MAqUzj5EWaImaYeH5v4vUu+hbZ9
	 m7EN5abBF4UfrYScGwEUGa8JTrvQ1mGw1t7R96WM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfBUUoe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 15:44:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:45580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfBUUoe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 15:44:34 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9EDF1206C0;
        Thu, 21 Feb 2019 20:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550781873;
        bh=xeKs0g9WAEXwnWqP3m8PneYHNcgwFpBY31m5h7o3YBI=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=uj8K67xmU8ly7LgWUb5+26G3wgVU/tw+mx0EOqisydGrNr7e4gVo7ndahw4HFxFJE
         kwx5tDRCVWiCxYBtjPtM5lI3wHwhIwWT4k0fNltYLxdi4H+62DEhQ5sIfkHdla0AL4
         J4FoyFzZjKC0HZ1Kw2SwIPpxtKYty+gtvVetTofQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] clk: imx: Add clock driver support for imx8mm
Message-ID: <155078187297.77512.16678843249622820580@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1548149769-32267-1-git-send-email-ping.bai@nxp.com> <1548149769-32267-3-git-send-email-ping.bai@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1548149769-32267-3-git-send-email-ping.bai@nxp.com>
To:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>
Cc:     Fabio Estevam <fabio.estevam@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Thu, 21 Feb 2019 12:44:32 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jacky Bai (2019-01-22 01:31:51)
> From: Bai Ping <ping.bai@nxp.com>
>=20
> Add clock driver support for i.MX8MM SOC.
>=20
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---

Applied to clk-next

