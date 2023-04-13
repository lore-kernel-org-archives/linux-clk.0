Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F0AC77B61
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 19:10:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjDMTK1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 15:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjDMTK1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 15:10:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFBD7DB0
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 12:10:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD69A64014
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 19:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5A5C433EF;
        Thu, 13 Apr 2023 19:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681413025;
        bh=cYoIlHxt7fDZO4LpkZWVVp+TXUyyLwAHKqClcPZDx4A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RYfIfsyL3u5Hkyd80axpc9xgN6MPdp0zKBaK9mX6DGtxQaKOhbS0p6Q8rVqjUClzk
         PSAb0s1zxiymhuXu+/fph0B5taOdZLifxuOA+ixgXeTc76HodVdAkZDglPDARGN9pe
         haZHk2lgEB3bIFGApjFFYdu8s5sJwrugdw8F+JafuaFT51LWf+gXQKpZF1YEwlfUaA
         ZHanyuE/Wsmn5V2uOrb6FXBlx+8CRxlWbXmTaSXaXFfMkgXVxJU540aActm7ncZJgc
         EoND7zc/2IloJFhk0xWM4XA6eokUEdN7FSWxy+Rd71PPFaVyx8KySPdaPSIOEA9UFt
         DFBtGIBXai2Hw==
Message-ID: <7b16c4d703dc00efd6e1b4062b5fd6d7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <af85927b-0da3-3495-2ed4-64bda91cd239@gmail.com>
References: <af85927b-0da3-3495-2ed4-64bda91cd239@gmail.com>
Subject: Re: [PATCH] clk: mux: let clk_mux_val_to_index return U8_MAX in the error case
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 13 Apr 2023 12:10:23 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiner Kallweit (2023-04-11 23:19:04)
> Currently this function may return a negative errno, but almost no
> user checks for the error case. Only imx_clk_gpr_mux_get_parent()
> does, but mentions in a comment that they'd prefer a dummy value.
> Other users cast the negative errno to u8 instead, what may result
> in unwanted results.
> Let's deal with this by returning u8 and U8_MAX in the error case.
> Then clk_core_get_parent_by_index() can detect that the index is
> out of range.

Is this causing problems for you?
