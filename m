Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0F3C47256
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 05:11:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C44522075A
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 05:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588655513;
	bh=7beKXtqfcevOBrmt8PXopFbz7a9kMyc8NTMd2vb28JQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=1+VPtkhN8a/f2vzA5d0ViT/yx5lJnsZAJ7WOt8IwaJLrIAp6tAn4oUhjEdiijkm/M
	 xJfsPSYrK+smZVFHU1bacOOUpgA0PAN/9iHEVFMTsw4AHEHsuf/RMHFh7Gjyw3jkJH
	 2ouVmcri03UtHPENzeumgZor3bdP3LU3dtiZIQrc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgEEFLx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 01:11:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:34466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgEEFLx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 01:11:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7628206E6;
        Tue,  5 May 2020 05:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588655513;
        bh=7beKXtqfcevOBrmt8PXopFbz7a9kMyc8NTMd2vb28JQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=B6W0O4loejbjeKSNJsIGAaZBhWccW/WcYhb9InlZDn22Vd5SLHfOIQka7W2QMMj+W
         5SeHkRVr+B2Y/D6xg6SXR51h4ixIm9bOVZdsrZU1Nnacdmucs2hTtp6FGPUT5aj+Sl
         1pKApoUjU9U/8qMjbRYhiyjk4qvNXTIckbmgfnPM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584279836-29825-9-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com> <1584279836-29825-9-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V6 08/12] clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 04 May 2020 22:11:52 -0700
Message-ID: <158865551207.11125.13566322645527803121@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-03-15 06:43:52)
> One LPCG controller supports up to 8 clock outputs while each of them
> is fixed to 4 bits.  It supports only gating function with fixed bits.
> So we can use the clk-indices to fetch the corresponding clock idx from
> device tree. With this way, we can write a generic LPCG clock drivers.
>=20
> This patch add that support to parse clocks from device tree.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
