Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF69C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jan 2022 23:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245481AbiAEXkW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jan 2022 18:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245487AbiAEXkT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jan 2022 18:40:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32015C061245
        for <linux-clk@vger.kernel.org>; Wed,  5 Jan 2022 15:40:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C18BE618D2
        for <linux-clk@vger.kernel.org>; Wed,  5 Jan 2022 23:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232FDC36AE9;
        Wed,  5 Jan 2022 23:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641426017;
        bh=UoVI/yWn0FlUyKbpzE4hbt8RxtXVsyuT/Pie/cLHb30=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qQ8uQf2Dmy+1IMjo2n/iU5q6YPcQAedBFDWCZz0XVGDaPyIggYoXYxwjcz6tUerJf
         DRen1KlpIGspaPt2Zc8B6pCqdca/e0EUhw2evpuJ1Eal6PaMPd1vJnAeEB/PNo35i3
         UBvCWN33iOWOpPX+siy2BkLuNYROcSinwEUfQjYWb1NOo4+gGkerCM3jAv5EztBTvk
         8Hu2S3jWTNe8nqKzzmACk7XR7ZSqPYxyOpYU0zx+mrmmJHYLVOqFDKdKEzIkVWqqyO
         noMGaqtLpibblu8AAEyVpxXGWe2rOcx1HJ4tA+3SPqOoI+7n8+7PR18gIUOyHha3fx
         oBI4IZ/Tw+x1Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7823666b57c105aee8323e6896f83f3ed249d9ee.1638957553.git.zong.li@sifive.com>
References: <7823666b57c105aee8323e6896f83f3ed249d9ee.1638957553.git.zong.li@sifive.com>
Subject: Re: [PATCH v2 1/1] clk: sifive: Fix W=1 kernel build warning
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Zong Li <zong.li@sifive.com>
To:     Zong Li <zong.li@sifive.com>, lee.jones@linaro.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        mturquette@baylibre.com, palmer@dabbelt.com,
        paul.walmsley@sifive.com
Date:   Wed, 05 Jan 2022 15:40:15 -0800
User-Agent: alot/0.9.1
Message-Id: <20220105234017.232FDC36AE9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Zong Li (2021-12-08 02:06:18)
> This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
> Declare static const variable 'prci_clk_fu540' where it's used").
> For fixing W=3D1 kernel build warning(s) about =E2=80=98prci_clk_fu540=E2=
=80=99 defined
> but not used [-Wunused-const-variable=3D], the problem is that the C file
> of fu540 and fu740 doesn't use these variables, but they includes the
> header files. We could refine the code by moving the definition of these
> variable into fu540 and fu740 implementation respectively, instead of
> common core code, then we could still separate the SoCs-dependent data
> in their own implementation.
>=20
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---

Any Fixes tag?
