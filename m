Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F21C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95A8820836
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550781866;
	bh=icF+4Bi0bgG0S/NSOjk1Gtf80VVq+70VRxEtkZlg8CE=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=wF4ZYiJcQ0a3UHqCu2VuPAil0bYE0hrlTRhKiveD/a0CvfNfr4SPcAPFUCplT1rwQ
	 oLsiMkGftcCqVebywrplXuqdCBVKFqtlL+n2omxgI+JQZCY+BzYhHhkH6oT12Xhu6m
	 iCxjZe4nsSgiyEoh3XCdmAouKpYZu46T3Ev9bJr0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfBUUo0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 15:44:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:45442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfBUUo0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 15:44:26 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96A92206C0;
        Thu, 21 Feb 2019 20:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550781865;
        bh=icF+4Bi0bgG0S/NSOjk1Gtf80VVq+70VRxEtkZlg8CE=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=edX3cQZCJLGiOOL9RbajOT2i8Mqm8XBhMskWJKhJ7swKrLPO9JcK2GZlPwXtbXkVP
         5oJrY0YJoLCt5gfsAsA1y07+oDtFU3kscXVEMvjt1byo2yErGIMwQt7FP6YFQGofsB
         x8Mie9mL+hrzWeAcRh4qkrcjTW+IA760kUgdOGSQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] clk: imx: Add PLLs driver for imx8mm soc
Message-ID: <155078186491.77512.17676637225196093830@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1548149769-32267-1-git-send-email-ping.bai@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1548149769-32267-1-git-send-email-ping.bai@nxp.com>
To:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>
Cc:     Fabio Estevam <fabio.estevam@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Thu, 21 Feb 2019 12:44:24 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jacky Bai (2019-01-22 01:31:41)
> From: Bai Ping <ping.bai@nxp.com>
>=20
> New PLLs are introduced on i.MX8M Mini SOC.
> PLL1416X is Integer PLL, PLL1443X is a Frac PLL.
>=20
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---

Applied to clk-next

