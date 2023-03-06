Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97510C61DA4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 22:18:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjCFWSY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 17:18:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCFWSX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 17:18:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022E722DCA;
        Mon,  6 Mar 2023 14:18:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8E01360F56;
        Mon,  6 Mar 2023 22:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19BAC433EF;
        Mon,  6 Mar 2023 22:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678141098;
        bh=PN5AY2wyPYtqlH5b3nTaGDv10G2DnDTm+a4N1JUGcWE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SzES44sDkqfzNNkoYN9DLCujcq6LEGWBJk4u7rRlR2GWkkuwZwY9b0RtjhdhE12ia
         nZyBRHL/2pIiuqpHUiPBZLxkXOZ9cF/64bH78nqI+4/k4VuDisiqID1a49s+jzjLvz
         3XUfet5uZ6nh/tc0qybWlV1Pwh2foy8UCuxOOR1ABOcbvDoLzAtR+fzIC5e2cScM4n
         IZ3ksCI1vBW/rfZANvQ9jX3wLhImxfMWhTIlyrUJepVfm4yy0KJhE5APpWaPu5BFhO
         a6sRV5Qk80/vVWnSm27eyc4xUSReLaZqbmBo0H30RPSeK3U1378tpRnPBToSDJFVOe
         fsY7aWNiWe4pA==
Message-ID: <4fc238f83c507735bac362e4dea9a0ef.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230302005834.13171-3-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-3-jk@codeconstruct.com.au>
Subject: Re: [PATCH v5 2/6] dt-bindings: clock: ast2600: Add top-level I3C clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
To:     Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date:   Mon, 06 Mar 2023 14:18:15 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jeremy Kerr (2023-03-01 16:58:30)
> The ast2600 hardware has a top-level clock for all i3c controller
> peripherals (then gated to each individual controller), so add a
> top-level i3c clock line to control this.
>=20
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
>=20
> ---

Applied to clk-next
