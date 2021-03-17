Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1210BC4332E
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 01:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4DE264F3C
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 01:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhCQBje (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Mar 2021 21:39:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:60578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230157AbhCQBj2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Mar 2021 21:39:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA8C764F8A;
        Wed, 17 Mar 2021 01:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615945167;
        bh=H8WIgmrcKIzvOcAWqa/8G1sb+H+xkWR7ZsZ/+sCO5No=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PQnC5YwKwpGmaYJtT6YThRYrLJ+KRrUc9CLwIXf/2jGAohVV4NF4OjOJN33QVA0G8
         A7GzmhUKuH1Mwlvd5SasqOnrYZc7mSFvOMu53FvO5cOMZn97j+JgxvIoyAI4Pne1Ed
         5bF7vvV8bYBB4l1fR3qfzS0v2wHnrHF4hAzE/oumtZJ9l6ON8sDtFZiS+IqITjD42f
         x8x+2yYXAwQRi35eCxXoYfonKxBoi3X7VC7rHM3p7fawKHpDMU+NrYSzcEKldN0+sb
         tU7r8lrZ/zm6zjhmhlTDUwYdPq/qBJbtK460R4/RJwomnx1BXrHGG0qVt3jJX5IuYb
         FehzvkcjjigMQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210315085608.16010-5-zhangqing@rock-chips.com>
References: <20210315085608.16010-1-zhangqing@rock-chips.com> <20210315085608.16010-5-zhangqing@rock-chips.com>
Subject: Re: [PATCH v5 4/4] clk: rockchip: add clock controller for rk3568
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        cl@rock-chips.com, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, tony.xie@rock-chips.com,
        finley.xiao@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
To:     Elaine Zhang <zhangqing@rock-chips.com>, heiko@sntech.de,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Tue, 16 Mar 2021 18:39:26 -0700
Message-ID: <161594516665.1478170.8135763363334069374@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Elaine Zhang (2021-03-15 01:56:08)
> Add the clock tree definition for the new rk3568 SoC.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Reviewed-by: Kever Yang <kever.yang@rock-chips.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
