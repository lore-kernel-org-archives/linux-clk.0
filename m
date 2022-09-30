Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4E7C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 22:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbiI3WPs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 18:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbiI3WPq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 18:15:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9857FE8A2
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 15:15:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74D786242A
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 22:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD830C433D6;
        Fri, 30 Sep 2022 22:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664576144;
        bh=u49ZUMs01usNU6WjO7vW+kju/jXQDV6WL3dUgEXd3yk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SPV24kxTovLUjZzDGCW3UZnb4GopFPXoMOLJaod0ANxhgvIpkweiuvIJWGLfI2NBO
         x0yHTHvOSue/j6TetWxjQ4l6fOVrrUpAvyLAJssDhub6SygdKDMYvdS9qm/G2/l8gK
         gKTjy/V82B6OlvWpQFnIKXv1WK3Q5vZBuOiNPI6R3F26/aztk5RPVWUH1Qa11bIE4m
         NBk34O36Oec3Kc79ji3jF8bIGgSXkkXlfVlTWRubTY/2HmL4pxvLtVpTcshi+JHKNE
         I38xrEyImc/E+kEX7apiSuqv6x/yCd+P88PYguMjF3OB7pJ5Z8jvlgg82BiDYRWpnl
         i74joIEw6aXpA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220719094637.844946-2-lars@metafoo.de>
References: <20220719094637.844946-1-lars@metafoo.de> <20220719094637.844946-2-lars@metafoo.de>
Subject: Re: [PATCH 2/2] clk: vc5: Use regmap_{set,clear}_bits() where appropriate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 30 Sep 2022 15:15:43 -0700
User-Agent: alot/0.10
Message-Id: <20220930221544.CD830C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2022-07-19 02:46:37)
> regmap_set_bits() and regmap_clear_bits() are variations of
> regmap_update_bits() that can be used if all bits of the mask have to be
> set to either 1 or 0 respectively.
>=20
> Update the versaclk driver to use regmap_set_bits() and regmap_clear_bits=
()
> where appropriate. This results in slightly more compact code and also
> makes the intention of the code clearer which can help with review.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
