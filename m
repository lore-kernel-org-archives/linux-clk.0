Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E24C433DB
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 01:40:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFC3164F92
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 01:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhCQBjd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Mar 2021 21:39:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:60414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229624AbhCQBjG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Mar 2021 21:39:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50CA364F3C;
        Wed, 17 Mar 2021 01:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615945146;
        bh=qGnc9fuxsfjUHSlaUCeiyxDxXEohk8ay31RvtAPRkDE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BqUhghEP2W5tHnWYYQg5SbChqqx5dyGv498DX9lWX8BHg8Zzoa2d4PY0n6qfztG5o
         QpXB9KzVv4zfQ8xWT3PyKoSCvTbfgeaDjm4GcBAvEQ1EUyHr/IWRQN+KEem/QFdggm
         IVlH84OwRUBQa0Pizb0sl3IJXe3Ygfh7DCVIiGPTyBH4HC4bRj64OlC8jcDw5ltriz
         9Klv5aaSVydz6aBEnMr26G1/RYnxEp6BeUnuGMV02XpX5VnOLsS/nVanXPYQRLLYGw
         bvQD9XkRwSVMF+BuaWAtLVJ4U9S3oYs9ByoISEGHR6V+IeDSiclY8w1eQYI/zK7S7h
         rc3GkWx5QFNhg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210315085608.16010-2-zhangqing@rock-chips.com>
References: <20210315085608.16010-1-zhangqing@rock-chips.com> <20210315085608.16010-2-zhangqing@rock-chips.com>
Subject: Re: [PATCH v5 1/4] dt-binding: clock: Document rockchip,rk3568-cru bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        cl@rock-chips.com, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, tony.xie@rock-chips.com,
        finley.xiao@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
To:     Elaine Zhang <zhangqing@rock-chips.com>, heiko@sntech.de,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Tue, 16 Mar 2021 18:39:05 -0700
Message-ID: <161594514504.1478170.12364418555385947548@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Elaine Zhang (2021-03-15 01:56:05)
> Document the device tree bindings of the rockchip Rk3568 SoC
> clock driver in Documentation/devicetree/bindings/clock/rockchip,rk3568-c=
ru.yaml.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Reviewed-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
