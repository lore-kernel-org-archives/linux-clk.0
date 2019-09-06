Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9E3C43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 16:56:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1E4720842
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567789007;
	bh=XLiSshmmIvhKSn19Y5Ycy0IjYyEkcV7i/Om32f9YTCs=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=Ayg8BaMMH418KJ7I/SYAYvPHJvzvDuBfcC93y9yUGbs9pWXtiBbipNpym2Efkj+xJ
	 R0ZDuCtTOpxr2ddCqVyrl7pGn1EanI3CFgOMRgF3isCsGhlVU7tDc8i02Q9f2Q8eu/
	 GZYm89P0fGaNWUwmJZsBjfkFOEcasOF+nCgWP6q4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbfIFQ4q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 12:56:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:56896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727521AbfIFQ4q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 12:56:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9253120838;
        Fri,  6 Sep 2019 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567789005;
        bh=XLiSshmmIvhKSn19Y5Ycy0IjYyEkcV7i/Om32f9YTCs=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=zab+L7xreeoQiYiiP1PW139DUm9DwlukkoY/+5QLWhdMORo5KV9IbxytCew+5sS1y
         3J39cU8ilrpAsoG7vxXWjbWlRIKvwErYmsgk2RO+QlbRv5/x4OZrBSMNDOG6fKPaGA
         4KFkzBj2W8KmU/BpNetXaq2JRhioVGdDhaeKolB0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566299605-15641-2-git-send-email-aisheng.dong@nxp.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com> <1566299605-15641-2-git-send-email-aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH V4 01/11] dt-bindings: firmware: imx-scu: new binding to parse clocks from device tree
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 09:56:44 -0700
Message-Id: <20190906165645.9253120838@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2019-08-20 04:13:15)
> There's a few limitations on the original one cell clock binding
> (#clock-cells =3D <1>) that we have to define some SW clock IDs for device
> tree to reference. This may cause troubles if we want to use common
> clock IDs for multi platforms support when the clock of those platforms
> are mostly the same.
> e.g. Current clock IDs name are defined with SS prefix.
>=20
> However the device may reside in different SS across CPUs, that means the
> SS prefix may not valid anymore for a new SoC. Furthermore, the device
> availability of those clocks may also vary a bit.
>=20
> For such situation, we want to eliminate the using of SW Clock IDs and
> change to use a more close to HW one instead.
> For SCU clocks usage, only two params required: Resource id + Clock Type.
> Both parameters are platform independent. So we could use two cells bindi=
ng
> to pass those parameters,
>=20
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

