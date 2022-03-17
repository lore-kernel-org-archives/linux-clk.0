Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B6CC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 17 Mar 2022 19:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234026AbiCQTXU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Mar 2022 15:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238108AbiCQTXP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Mar 2022 15:23:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D52C217C4B;
        Thu, 17 Mar 2022 12:21:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4C17FB81FA4;
        Thu, 17 Mar 2022 19:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04190C340E9;
        Thu, 17 Mar 2022 19:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647544916;
        bh=qx6jx9YM+UsjiKdjOLV8P9ZHkAxi3jf4cdgY8sQswSo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RFk3IvHs/N1/uxEzEeUa/Lpu4Xk8ykcr+jQjHNstShonsukVNh6JlYD+8mzRSLWxR
         uOUOodWb53EOsJ8LACfnezK2h0YDgxO9dLMW1mV1INHchiUhQP6wVt7MR1dm1RXioM
         NC2cIyKU1OAtsiHRqVUnwzqNZ2Qk8eWdnzkZB4vpIXYoFTBYqt3eOYDG0NoKm/3aOx
         7Scgid+iB6pwOFcOSxz2oAlfTuCIs7usJxNqob9bRPd8IZjmKyI2eE2wKZTk1K07mZ
         fkEhUxcGLiy2lF6wHalvlIXyZqzHmQA4oKAcKB9fFI7AP/N+lB0UgO6HcJnUQJakFw
         RiR/B+NkMsGCw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220316083533.GA30941@kili>
References: <20220316083533.GA30941@kili>
Subject: Re: [PATCH] clk: visconti: prevent array overflow in visconti_clk_register_gates()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Date:   Thu, 17 Mar 2022 12:21:54 -0700
User-Agent: alot/0.10
Message-Id: <20220317192156.04190C340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2022-03-16 01:35:33)
> This code was using -1 to represent that there was no reset function.
> Unfortunately, the -1 was stored in u8 so the if (clks[i].rs_id >=3D 0)
> condition was always true.  This lead to an out of bounds access in
> visconti_clk_register_gates().
>=20
> Fixes: b4cbe606dc36 ("clk: visconti: Add support common clock driver and =
reset driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-next
