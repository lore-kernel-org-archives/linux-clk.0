Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D28C64EC4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 22:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjCFWTH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 17:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjCFWTG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 17:19:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4839C2200D;
        Mon,  6 Mar 2023 14:19:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D80A060F56;
        Mon,  6 Mar 2023 22:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1FCC4339B;
        Mon,  6 Mar 2023 22:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678141144;
        bh=Udd1plpCDIyKEQO5mTltvEild/07bj6KCkIIKJWuIlw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ik4Xhk5VwcBXWg0KQDLQ8iA7lw1glj9W5wCj/WEXky0izIJx1YKeubJLmdMDJMMyM
         /P7vR4+n99Ib4Nc8+Znr1YNElncBBnksUwJUHe+8ouppDavKwfReNTalXwRrYi+HQF
         F8ypQlSAV/WGlwYWESbjxDe5dN198cicjdYUCRFIUaIDCSmYx6ZfJy00LDJ0XN6Ubj
         /SPWKtOjfYZIMrLqFkpe9rZkRbTkAc5NQ2thZFdJSPQfr7WFvXd+BpkjDs1h7WUHpu
         Keg8Z6YXO56oLzJits2oNrP8D8j6PzWu+5xxi2r08MDyTcmDu5ZavJsEqEq+XyiAWP
         gGQ0EGcSxruVA==
Message-ID: <766e71a3f2f18af38377b50f6344e4e7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230302005834.13171-7-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-7-jk@codeconstruct.com.au>
Subject: Re: [PATCH v5 6/6] dt-bindings: clock: ast2600: Expand comment on reset definitions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
To:     Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date:   Mon, 06 Mar 2023 14:19:02 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jeremy Kerr (2023-03-01 16:58:34)
> The current "not part of a gate" is a little ambiguous. Expand this a
> little to clarify the reference to the paired clock + reset control.
>=20
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---

Applied to clk-next
