Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D2AC64EC4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 22:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjCFWSc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 17:18:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbjCFWSc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 17:18:32 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379A12200D;
        Mon,  6 Mar 2023 14:18:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8C369CE17B3;
        Mon,  6 Mar 2023 22:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31F8C4339B;
        Mon,  6 Mar 2023 22:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678141108;
        bh=L4mv6MrZOY5f6HNm/5OVbuyJRl13tukz+ou2OJNeU3Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Mhwcq1FS0aOZBZcXkfWxMRVwNWfeKzQSqGfTkx0zR2AjAnO5N6UUXm6039IKx7aVM
         MNJiULEqTwtoGP3lCnxU5qxmMHItSE5bo9Gx+h8QiQmr+SbVbaX8kVQrCbZStpesQ7
         C+cEB+Sd1afog6KLpgdNtqaNEvUcNQ4tuCw3zR2TCchC2g29cqCu2zMJ1yqiMScFHV
         spcn8SXh8iUaXC0lggqF8etv9Bo3cclfua3GruhbLQlzQqyEa1BQ0Jba20zvcmT6Rh
         4MXvk2VEkGEP1/3G2ahU9DZaIVp2wiazmlVmNx5A6M+CEXAPf/BZW9MPxU1IL3TXDp
         73wUxe2srN0Aw==
Message-ID: <3a8f668c9b1517ac00bafebda8f2b58f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230302005834.13171-4-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-4-jk@codeconstruct.com.au>
Subject: Re: [PATCH v5 3/6] clk: ast2600: Add full configs for I3C clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
To:     Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date:   Mon, 06 Mar 2023 14:18:25 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jeremy Kerr (2023-03-01 16:58:31)
> The current ast2600 I3C clock definitions are top-level (rather than
> based on their actual hw sources: either HCLK or APLL), and include a
> couple of definitions for (non-existent) i3c6 and i3c7.
>=20
> Re-parent the individual I3C controller clocks to the main i3c clock,
> explicitly sourced from the APLL rather than whatever G6_CLK_SELECTION5
> was last set to.
>=20
> While we're at it, remove the definitions for the i3c6 and i3c7 clock
> lines; this hardware isn't present.
>=20
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
>=20
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
>=20
> ---

Applied to clk-next
