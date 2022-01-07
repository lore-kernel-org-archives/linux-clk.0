Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A17FC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jan 2022 00:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344049AbiAGAVj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jan 2022 19:21:39 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:54208 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344074AbiAGAVg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jan 2022 19:21:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5F4B861E16
        for <linux-clk@vger.kernel.org>; Fri,  7 Jan 2022 00:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6397C36AE0;
        Fri,  7 Jan 2022 00:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641514895;
        bh=rTyEa7BxzW7vXGzxnTzq6mIOCIByq0fmnlYF1ivc89g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WJHCCLp9K8Dvs8uGvdfmZi7BI5i8ebM1ssP6jiZ4Ll/ePiDFoUcjfRRPrw2+7OZXT
         XIDeYObPjJ1GBIvLKgSnYCNQyf67JC7Hddn8pjpdDf/bSi+RpuZbtjgl/zhlyI58vk
         xvG+HSpL7FZ79xZnfhc8Y3xM3OYc+AcLiW0WosDshGFA3yr2h9rynGrAIIFlD1OqpG
         z5rDmK0VMPQAMXAkpMLLYDwE937BMUZ9r7o1HKA62+bvDqtpsThVHW0JbSgMgN8nEw
         Vh4bZH9dp6Xhv6lKYg4238TaULc2rViXBR2AUciO8hRSIvZnZ6B9RN1FoV5/BVlknW
         HTF1x0iV54Lsg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a298286a42461e07c92e282224f469d84344feac.1641434305.git.zong.li@sifive.com>
References: <a298286a42461e07c92e282224f469d84344feac.1641434305.git.zong.li@sifive.com>
Subject: Re: [PATCH v3] clk: sifive: Fix W=1 kernel build warning
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Zong Li <zong.li@sifive.com>
To:     Zong Li <zong.li@sifive.com>, lee.jones@linaro.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        mturquette@baylibre.com, palmer@dabbelt.com,
        paul.walmsley@sifive.com
Date:   Thu, 06 Jan 2022 16:21:34 -0800
User-Agent: alot/0.9.1
Message-Id: <20220107002135.B6397C36AE0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Zong Li (2022-01-05 21:58:28)
> This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
> Declare static const variable 'prci_clk_fu540' where it's used").
> For fixing W=3D1 kernel build warning(s) about =E2=80=98prci_clk_fu540=E2=
=80=99 defined
> but not used [-Wunused-const-variable=3D], the problem is that the C file
> of fu540 and fu740 doesn't use these variables, but they includes the
> header files. We could refine the code by moving the definition of these
> variables into fu540 and fu740 implementation respectively instead of
> common core code, then we could still separate the SoCs-dependent data
> in their own implementation.
>=20
> Changed in v3:
>  - Rebase on v5.16-rc8
>  - Add fixes tag

Where?

>=20
> Changed in v2:
>  - Move definition of variable to C file from header

Please remove the changelog by putting it below the triple dash.

>=20
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/clk/sifive/fu540-prci.c  |  6 +++++-
>  drivers/clk/sifive/fu540-prci.h  |  6 +-----
