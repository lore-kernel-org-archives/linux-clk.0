Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA60C43219
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 15:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED7B12088F
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556207085;
	bh=QNcupRJ6Tg0s8vQjDD8YLIDlHfhe+0Us6oAyKQeLyqg=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=JgI8THV4j/hAPOwNvNiPvDqcAJv7ZbydJFnsU2wlpxD0ca3vS0bXHCJDTZGG/rIeQ
	 De7ELopb0iAYgx49vlSit+QoU0Xmq1REDU+DPTVVcG9ZIjWWDzf83n8TVrXQoWiNzF
	 8J4j0t14P5X9gBrbqMvRmRHlrSWave1IzL8FzkBs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbfDYPoo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 11:44:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:45706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727631AbfDYPoo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 11:44:44 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03C1A206C1;
        Thu, 25 Apr 2019 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556207084;
        bh=QNcupRJ6Tg0s8vQjDD8YLIDlHfhe+0Us6oAyKQeLyqg=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=o+cnCI/TCqH6E/wD+0/LPSo/b5Ia3FMsa7tFIno0XpnWsijPW7PuP+dGQ/kowUHT+
         d4FYsK9tHbTxvuqJPAXXEd/VNph5Sl2Aw8jB8RyHwy7Me4H8XDc+DkyGJNmNzt7F9w
         OMjDiThxzqdloQ9Ib2RQw64aBZo3fE/XoDsU6h+Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190422062314.1354-2-shawnguo@kernel.org>
References: <20190422062314.1354-1-shawnguo@kernel.org> <20190422062314.1354-2-shawnguo@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL 2/3] i.MX5 clock changes for 5.2
To:     Shawn Guo <shawnguo@kernel.org>
Message-ID: <155620708287.15276.8546009828760017421@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 08:44:42 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-04-21 23:23:13)
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa23=
1b:
>=20
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/c=
lk-imx5-5.2
>=20
> for you to fetch changes up to de348df5b389f7ddab388934e84f24d8a9f3c961:
>=20
>   clk: imx: rename clk-imx51-imx53.c to clk-imx5.c (2019-04-15 17:09:23 +=
0800)
>=20
> ----------------------------------------------------------------

Pulled into clk-next

