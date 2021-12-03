Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9B1C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  3 Dec 2021 01:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376964AbhLCBb2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Dec 2021 20:31:28 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:43300 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356794AbhLCBb1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Dec 2021 20:31:27 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 93F4E62919;
        Fri,  3 Dec 2021 01:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A52C00446;
        Fri,  3 Dec 2021 01:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638494884;
        bh=PO7clej4qp5ysMtZCHC8HSN2aA5UtZH8rndIf1YhNuo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SVgPi2t0oA1sowswAA4NQZcUhj0kAlkIKPefPkw2/gXcc/rPIUc0M86Sak5qB2O2s
         emyAO+pXcF0VtmcWRVnEqXk2c3j88mjnvWvjrDqMtC7MStS7Jt1cbNjY1GLhdZObN1
         RvcaubwnNLmSv5Er+v3yOaLb3XTEX32T/wX2648J0zGJoPCUC46yHZoYEqYJRnevaR
         Qkdk0ncMcXfdSsKAtA5qmy4GKwt1YnQW1Bya13H7dcAwdA+R2C4ZGrLsfm928KE8/f
         +IznhU6jMX2BlZGQG0fZ0I5Isj7JkfsDva//9eS1GmB5SSQGgo4LA7gYF+XkOZp4Vw
         a+G0S0hnotWcA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211120062719.21395-1-rdunlap@infradead.org>
References: <20211120062719.21395-1-rdunlap@infradead.org>
Subject: Re: [PATCH] clk: Gemini: fix struct name in kernel-doc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date:   Thu, 02 Dec 2021 17:28:02 -0800
User-Agent: alot/0.9.1
Message-Id: <20211203012803.E6A52C00446@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Randy Dunlap (2021-11-19 22:27:19)
> Fix a typo in the struct name in the kernel-doc notation so that
> kernel-doc won't complain about it.
>=20
> Fixes this warning:
>=20
> drivers/clk/clk-gemini.c:64: warning: expecting prototype for struct gemi=
ni_data_data. Prototype was for struct gemini_gate_data instead
>=20
> Fixes: 846423f96721 ("clk: Add Gemini SoC clock controller")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: linux-clk@vger.kernel.org
> ---

Applied to clk-next
