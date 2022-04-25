Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EA4C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 23:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237677AbiDYXtp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 19:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiDYXto (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 19:49:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766631903C
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 16:46:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12D5C615CC
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 23:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9CEC385A7;
        Mon, 25 Apr 2022 23:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650930398;
        bh=7GscQ3MyZwyTyQHjp/KZtWhsGZd2mVtkGM5M46Cj838=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Q6Nu0zBtcYFXGFgRn2+JYbzfXoGsxfCDYvURWol3Rcs11yrwUvfmqfcXocWPFGjC4
         xI5a406CQl1SlGLTSpFeqmGu/WY9hHxPn4D4ly9CU3wNDOVTiv/AKsqMRmpkYSh65j
         wXVjYLSTQhi1LS7RLso4IiaUFZZtWE0C6uk6CMs/UOMmJjtYeaMcRJuQsYe156ZpCK
         oCk0J6jUmgxyqeGZA0Tk2TMYeHDMpunW4pCaNgQF6gFlru7KnXM+XhQeRHPI7eAE+7
         yAFwdzYyd5mVfy8BEtthOXdQoIE5L9489pO8ZA5y3Sti04KSAkQXaeAF9mTnpZPWcv
         zyKNmEYRzzkPQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220414221751.323525-6-linus.walleij@linaro.org>
References: <20220414221751.323525-1-linus.walleij@linaro.org> <20220414221751.323525-6-linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5 v3] clk: ux500: Implement the missing CLKOUT clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 25 Apr 2022 16:46:36 -0700
User-Agent: alot/0.10
Message-Id: <20220425234638.6D9CEC385A7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2022-04-14 15:17:51)
> This implements the two missing CLKOUT clocks for the ux500
> (well really U8500/DB8500) SoC.
>=20
> The clocks are initialized using a specific parent and
> divider and these are specified in the device tree, see
> the separate binding patch.
>=20
> The implementation is a bit different in that it will only
> create the clock in the clock framework if a user appears
> in the device tree, rather than it being registered upfront
> like most of the other clocks. This is because the clock
> needs parameters for source and divider from the consumer
> phandle for the clock to be set up properly when the clock
> is registered.
>=20
> There could be more than one user of a CLKOUT clock, but
> we have not seen this in practice. If this happens the
> framework prints and info and returns the previously
> registered clock.
>=20
> Using the clocks requires also muxing the CLKOUT1 or
> CLKOUT2 to the appropriate pad. In practice this is
> achived in a pinctrl handle in the DTS node for the device
> using the CLKOUT clock, so this muxing is done separately
> from the clock itself. Example:
>=20
>   haptic@49 {
>     compatible =3D "immersion,isa1200";
>     reg =3D <0x49>;
>     (...)
>     /* clkout1 from ACLK divided by 8 */
>     clocks =3D <&clkout_clk DB8500_CLKOUT_1 DB8500_CLKOUT_SRC_ACLK 8>;
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&isa1200_janice_default>;
>   };
>=20
>   isa1200_janice_default: isa1200_janice {
>     /* Bring out clkout1 on pin GPIO227 pin AH7 */
>     janice_mux {
>       function =3D "clkout";
>       groups =3D "clkout1_a_1";
>     };
>     janice_cfg1 {
>       pins =3D "GPIO227_AH7";
>       ste,config =3D <&out_lo>;
>     };
>   (...)
>=20
> This was tested successfully with the Immersion ISA1200
> haptic feedback unit on the Samsung Galaxy S Advance GT-I9070
> (Janice) mobile phone.
>=20
> As the CLKOUT clocks need some undefined fixed rate parent
> clocks that are currently missing from the PRCMU clock
> implementation, the three simplest are added in this patch:
> clk38m_to_clkgen, aclk and sysclk. The only parent not yet
> available in the implementation is clk009, which is a kind
> of special muxed and divided clock which isn't even
> implemented in the vendor clock driver.
>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
