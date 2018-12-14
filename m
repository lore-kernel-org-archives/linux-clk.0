Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5CAC67839
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 06:15:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EE5820866
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 06:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544768125;
	bh=BCQ0LbNWC79KT9SlAAcLyRjVLVQkhRzjZKVng6YMYBw=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=QJiebsmNsO2OO/Owka6TVKWc80nUILM2B9vLTC7Ae4VI47UkAxh7DuY5lqgPkhXcG
	 s93+Ed8O1UD/MdZSo8SrevGMuqCSWzNIy1QHiu8LTadX8nruTAs1j6pktC1giq5d5z
	 xjN+yACYtKCuZ48VMvwSOjt6osEUPtM9cAyqpifw=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE5820866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbeLNGPY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 01:15:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:55804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbeLNGPY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Dec 2018 01:15:24 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6C7720811;
        Fri, 14 Dec 2018 06:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544768124;
        bh=BCQ0LbNWC79KT9SlAAcLyRjVLVQkhRzjZKVng6YMYBw=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=loAKaW3bDQuCllvjtWwhbpwWsX35TLcBYsLtwc4ky13DKTafpypZJ7trxZHUoc2+n
         nDwiNImYWl9y7gygK+NuYZKXjLSiwbvdgqps9AbLJp4pk9h5cfxa1ghVmIfWjgPXT7
         BuE1HLb3jhN+Tdx3d9RxjNPBXJg/OobNNMzMYjrU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <154476762849.19322.6761040252503231833@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH V12 0/5] clk: imx: add imx8qxp clock support
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com> <20181214020533.GC13243@dragon> <AM0PR04MB42114ACB1A55BB42D2C5523280A10@AM0PR04MB4211.eurprd04.prod.outlook.com> <20181214031931.GD13243@dragon> <AM0PR04MB4211D692CBED348EF8C109A180A10@AM0PR04MB4211.eurprd04.prod.outlook.com> <20181214035606.GE13243@dragon> <AM0PR04MB4211CEFB586B7878BBB58FEB80A10@AM0PR04MB4211.eurprd04.prod.outlook.com> <20181214053033.GF13243@dragon> <154476762849.19322.6761040252503231833@swboyd.mtv.corp.google.com>
Message-ID: <154476812306.19322.4832664425826114886@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 13 Dec 2018 22:15:23 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2018-12-13 22:07:08)
> Quoting Shawn Guo (2018-12-13 21:30:35)
> >=20
> > In case Stephen is fine by pulling dependency from my tree, it's all on
> > branch below, which has been pulled/queued by arm-soc folks for 4.21
> > merge window.
> >=20
> >  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/d=
rivers
> >=20
>=20
> I can pull just the first patch from this branch and then everything
> will compile? That should be OK.
>=20

Hm.. turns out I need to pull up to

0a914a4948d4 firmware: imx: add pm svc headfile

but then it all compiles fine. Ok I can do that.

