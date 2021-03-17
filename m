Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D583C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 01:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC0E464F92
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 01:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbhCQBjd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Mar 2021 21:39:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:60466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229994AbhCQBjN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Mar 2021 21:39:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 797FA64F8F;
        Wed, 17 Mar 2021 01:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615945153;
        bh=lbu695orGj63ivKv6YsWl2FwPs6zzrQavcWls7QgRY0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cjA4WeDAeRkpWoE9BnBz87NOIaEkGJAbbE8cYShWllUetS8s7IizoNZFcHpsCbGM2
         GNPmBLGgj1BGlWY3n2ztCEp/880RFWAee4oShJXWA4LkeCfu4+PjxyW2v+zcFA2IrA
         aJ0YsKTS9HGfFCqnYokcbYESXpxd8PUfAu/h3geK6TIJf4XJvZ72cWMZygFuh3FAuf
         Sp094Nhtj7KnUuKBNhGbfjwxptOnboqcQY09jhZccDqDQw90wqWexPLirjkt/ly/9w
         7Sdb4AYkTHTTYJxUTCUmQmHweW7IiydkeNEAGc3EYmzPb9VaU/Wms3U+rfpD7ozppd
         eIHDuC9b81LtA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210315085608.16010-3-zhangqing@rock-chips.com>
References: <20210315085608.16010-1-zhangqing@rock-chips.com> <20210315085608.16010-3-zhangqing@rock-chips.com>
Subject: Re: [PATCH v5 2/4] clk: rockchip: add dt-binding header for rk3568
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        cl@rock-chips.com, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, tony.xie@rock-chips.com,
        finley.xiao@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
To:     Elaine Zhang <zhangqing@rock-chips.com>, heiko@sntech.de,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Tue, 16 Mar 2021 18:39:12 -0700
Message-ID: <161594515228.1478170.677486264440845481@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Elaine Zhang (2021-03-15 01:56:06)
> Add the dt-bindings header for the rk3568, that gets shared between
> the clock controller and the clock references in the dts.
> Add softreset ID for rk3568.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Reviewed-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
