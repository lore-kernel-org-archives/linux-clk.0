Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6B7C65BAE
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 02:17:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A9F820879
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 02:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544753846;
	bh=D2FMTrDoBq33XMTC5E4WlE8VPn0hdiNp2AErRA8Mz5g=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=J+zrZWGvJA+4Y2fVuvRtNEYX42EuqzGiiExMHBSK0FRsF+p2giTxg24wEPPtr68zJ
	 xWfz667ctVq27YzKfdsaDjNPtEbyG77v+rqU5x5W1dDlHwRPYYYSpjMUVTs2lfgaHs
	 JXaP0q7GyIQIJODfMscPp80zNb1/qZov6bDQ8zuU=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A9F820879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728612AbeLNCR0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 21:17:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:43328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728423AbeLNCR0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 21:17:26 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9560F2080F;
        Fri, 14 Dec 2018 02:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544753845;
        bh=D2FMTrDoBq33XMTC5E4WlE8VPn0hdiNp2AErRA8Mz5g=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=K61BJvApm3Gz4mrxl2B1KX12Mls6P8s2xMUux7K46KMA536CpWLOGYTBnxXHUyWZP
         E/A3uY4ml/9Vyv+u8lj+6PsaDLoGYLgZaM6hxFWRj7tjwrcEmKlXtBntg1DW8hSrVR
         LS7DaalrnKocjE3PqqveX/OIzQ36hpZocWARjiKg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AM0PR04MB4211D584BCE4B6D06D57637280A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
Subject: RE: [PATCH V11 2/7] clk: imx: add scu clock common part
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com> <1544662938-5020-3-git-send-email-aisheng.dong@nxp.com> <154468728640.19322.12955855783518519739@swboyd.mtv.corp.google.com> <AM0PR04MB42118C3E7F49A0437453BA5880A00@AM0PR04MB4211.eurprd04.prod.outlook.com> <154475103791.19322.8783777114832958727@swboyd.mtv.corp.google.com> <AM0PR04MB4211D584BCE4B6D06D57637280A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <154475384479.19322.759264653632754113@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Date:   Thu, 13 Dec 2018 18:17:24 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-13 17:44:55)
> > >
> > > How would you suggest for this situation?
> > >
> >=20
> > I suggest the defines just go into the clk driver. Is that a workable s=
olution or
> > does something not work?
>=20
> Are you suggesting me to doing it now?
> As the patch is already in Shawn's tree, but I think I can do it and clea=
n up
> the file in Shawn's tree later.
>=20
> However, only moving the clk related defines into clk driver is not enoug=
h.
> The driver compiling still depends on the resource ID file which is shared
> by power domain driver and clk driver (and possible many others).
> So we still have dependency issues.
>=20

Do the resources need to be defined in one place either? Or can they be
spread to all the drivers that use them?

