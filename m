Return-Path: <SRS0=CruU=4A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893F7C352A4
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 20:57:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 603E92467B
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 20:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581541021;
	bh=2wFD+x6ybYgcwqk/6r6uxbTBkPKyn5FoG5BNagv1Q54=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ntNpTCZeEvKwYLqIpIAp1xpUQVNedRgNzrcq578AinYGdzk13mLkCeLZkkMpTkOIz
	 BnsJdorQ5LD4oRgEE7PvA45a6EIz1Npha6Iwxmv9RN/Hff0qvet9QSh+umjwC9jJ0k
	 9nLAFcX5NFB3b8lSwqHTymUuMrqdFEsJirZYlDEE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbgBLU5B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Feb 2020 15:57:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:39050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728098AbgBLU5A (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Feb 2020 15:57:00 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4AA09206D7;
        Wed, 12 Feb 2020 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581541020;
        bh=2wFD+x6ybYgcwqk/6r6uxbTBkPKyn5FoG5BNagv1Q54=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=r+OmHOQXBCk7w4qTOq2XlwubZ6xd4R239KrHWQW/UC9yVZvxUaYNVgNTOtCY4Fr6n
         5YiEbkp5G4uMc5uiLhr7JwAL5RcexLzYiPKpNZcNN6yltK1p/xd3OawILA3bBV1la+
         rUvvCPkJUfPAEOvScoML7VkDZ0448KmxfRn7Qljg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581508657-12107-3-git-send-email-Anson.Huang@nxp.com>
References: <1581508657-12107-1-git-send-email-Anson.Huang@nxp.com> <1581508657-12107-3-git-send-email-Anson.Huang@nxp.com>
Subject: Re: [PATCH 3/5] clk: imx8mm: Add missing of_node_put()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linux-imx@nxp.com
To:     Anson Huang <Anson.Huang@nxp.com>, abel.vesa@nxp.com,
        allison@lohutok.net, festevam@gmail.com,
        gregkh@linuxfoundation.org, kernel@pengutronix.de,
        leonard.crestez@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, peng.fan@nxp.com, ping.bai@nxp.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org, tglx@linutronix.de
Date:   Wed, 12 Feb 2020 12:56:59 -0800
Message-ID: <158154101956.184098.5314031409694471928@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Anson Huang (2020-02-12 03:57:35)
> After finishing using device node got from of_find_compatible_node(),
> of_node_put() needs to be called.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
