Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2100CC10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 17:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB75D2173C
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 17:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555004358;
	bh=XcRmq+gSir4WcNRXEyCepk9zM4fmLPc36Yk7tnHx90I=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=OZIRkW8TGeeLS4rv6KW+djmLPOM73uaM8mJJiPOCV1kxGdYa0EV/0oy4qkf+Uek9W
	 PMf/N/VaNOyIylrBNnWm/Q7W7utWJdhDzoYDNdH5kt7a5G3Th4KNJnr84FVzlpMGP6
	 8Yj8BJCJh0kqFNq1IkdUgbLFGkec8l1MoGyXFWAM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfDKRjS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 13:39:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:48452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbfDKRjS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 13:39:18 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D65A12084D;
        Thu, 11 Apr 2019 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555004358;
        bh=XcRmq+gSir4WcNRXEyCepk9zM4fmLPc36Yk7tnHx90I=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=qz+L4BbQYeCAlOjlJcQnRrtm3LKjMqHrsgO+8Il1GvKayJuXwBATf6uTikJSxTMt1
         BFDJif8PxHFB77+evPBvy0DeLRg3gPv7d/qd9ZgPba8klMedBBC0YG7cnCwMYz8WSd
         MKGc2mI+JgtYT+e8zJluB8gBzu0we9ruyFk98h9U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190403092948.26186-1-shawnguo@kernel.org>
References: <20190403092948.26186-1-shawnguo@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: imx: rename clk-imx51-imx53.c to clk-imx5.c
Cc:     linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>
To:     Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org
Message-ID: <155500435713.20095.15013013854561492827@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 10:39:17 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-04-03 02:29:48)
> As the driver is handling all i.MX5 series SoCs inlcuding i.MX50, rather
> than just i.MX51 and i.MX53, let's rename it to clk-imx5.c.
>=20
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

