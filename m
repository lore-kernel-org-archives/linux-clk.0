Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9C7C47083
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 06:40:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2D686139A
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 06:40:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbhFBGl6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 02:41:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:33404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231348AbhFBGl6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Jun 2021 02:41:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C59261376;
        Wed,  2 Jun 2021 06:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622616015;
        bh=THlcYQ10VKSYG5Xv5F8H1EJpR36FH5uMYr88jsClAcg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hvu7itcOMD12Btn11AxxlfcYayJcZShNJP+Csz7hbhfb4yBepxOHKrGpeBit4o5YJ
         MMIz1FDKfwUeWP6sAggEEmQwdSCdVKpCeunD8KwqYqQ1sFkTowvw7UpI5EwUFKJUBD
         9QFcY8oeKK9d61b7BId9+Xd5RVefCc95093aLM+wF/kmfBqt5cwdVuUJZhirN4X/fn
         mtKKT5dQ4kkZyyFxZ0b1vf5BxweyyAATn3UUTmn5v3agD6ZWqcxYTTbmqQwMbOGBM1
         HrZrzlN5w+xV60yrCSHng9aUkMTqMWMJwUyweuO3qwta8x/yFrZ2asAlX5baHJQXLx
         2rXuhyfUMGB4g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210601114154.3163327-1-yangyingliang@huawei.com>
References: <20210601114154.3163327-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] clk: analogbits: fix doc warning in wrpll-cln28hpc.c
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     paul.walmsley@sifive.com, mturquette@baylibre.com
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Tue, 01 Jun 2021 23:40:14 -0700
Message-ID: <162261601448.4130789.18272149822674703279@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yang Yingliang (2021-06-01 04:41:54)
> Fix the following make W=3D1 warning:
>=20
>   drivers/clk/analogbits/wrpll-cln28hpc.c:227: warning: expecting prototy=
pe for wrpll_configure(). Prototype was for wrpll_configure_for_rate() inst=
ead
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Applied to clk-next
