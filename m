Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA44C11F67
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 20:29:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0613E61350
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 20:29:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbhF2UcX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 16:32:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:46226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234073AbhF2UcW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jun 2021 16:32:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EF9E6112D;
        Tue, 29 Jun 2021 20:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624998594;
        bh=D1rp/lGnkLgAHhHFva4aywCJx1yghtTcJ6Lp6xqWW5M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KSbDla3TMNAgxfWkXUEbn/ZQ1zKf7vLdeZBMdzmZ3rQxYeWWP09j57E2Omx6utCsb
         Ht5r0QVHY1sq55byXpwJPupguba06hBecLAEDHlq2r3T7Cp6EgX2D5Bc29ObD51kvN
         wrF3ESZy1RWvfO6rf4SLsgaIif4Bu/viSVE9yIgV0YKPCdHWoBj4z5Dp1nmXdZQZOt
         4mooRQT/klm+QNORYaRpGJLmBHgf+jJEhEsnNyy0M7PjYHL2LyQuChMbCnCU8AWWUL
         x0RozhKLP7QSGUe+qq3g9b12gN/PThVrLZUf5qTJz3bpXYW8cI/fW0ljqyKVELUjzq
         74SYeRYnL39kA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210629154740.3091884-1-sean.anderson@seco.com>
References: <20210629154740.3091884-1-sean.anderson@seco.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: vc5: Add properties for configuring the SD/OE pin
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Sean Anderson <sean.anderson@seco.com>,
        linux-clk@vger.kernel.org
Date:   Tue, 29 Jun 2021 13:29:53 -0700
Message-ID: <162499859339.3331010.531653044301227066@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sean Anderson (2021-06-29 08:47:39)
> These properties allow configuring the SD/OE pin as described in the
> datasheet.
>=20
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

I dropped v2 from clk-next and this will be punted to the next release.
