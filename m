Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0251CC433EF
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jan 2022 00:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiAHApQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jan 2022 19:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbiAHApP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jan 2022 19:45:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F0DC061574
        for <linux-clk@vger.kernel.org>; Fri,  7 Jan 2022 16:45:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 75A6C6204B
        for <linux-clk@vger.kernel.org>; Sat,  8 Jan 2022 00:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C331AC36AE9;
        Sat,  8 Jan 2022 00:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641602714;
        bh=dUWN3mVrxOEErbJ6o4JMx/VEB9lx/aE7w+sbf0AOXtQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hmn0TWaH7ZvGwpnXaB2vwQ+3Tf+V69zsButjd64DIO7LTsT+HHIHbAtRZOcDFbIP7
         Sf5UyYonN5WRDGpnMd5p+kgKy4J9qbivxrqiROBU7UpH9nbuEXNHn8n/m7DI9fOszO
         aF5oM9wF01STq88gVbksW4/o73YFEMH+78fMuXDX7VCA+QCY+0orUFrOkoGdhNa3WV
         /brbmmZNY6hiN8LPlydKQwIXKWyPNU3Gd4s/iMJ1tFo+nhaU6so2CpXbSjq/oQS3+Q
         rkOTk4VVX6wkXRsX5u806tSTx+JimgRj/+cn3bAgfDnek5Tycxz0KR2NcXioxT20GQ
         fjEesRdRTyKiA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220107090715.2601-1-zong.li@sifive.com>
References: <20220107090715.2601-1-zong.li@sifive.com>
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Zong Li <zong.li@sifive.com>
To:     Zong Li <zong.li@sifive.com>, lee.jones@linaro.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        mturquette@baylibre.com, palmer@dabbelt.com,
        paul.walmsley@sifive.com
Date:   Fri, 07 Jan 2022 16:45:13 -0800
User-Agent: alot/0.9.1
Message-Id: <20220108004514.C331AC36AE9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Zong Li (2022-01-07 01:07:15)
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
> Fixes: 487dc7bb6a0c ("clk: sifive: fu540-prci: Declare static
> const variable 'prci_clk_fu540' where it's used")

The fixes tag should be on one line, not split across two.

> Signed-off-by: Zong Li <zong.li@sifive.com>
>
