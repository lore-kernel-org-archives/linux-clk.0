Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B52FEB64D9
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jul 2023 22:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbjGDWZx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jul 2023 18:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjGDWZw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jul 2023 18:25:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137AAE7B;
        Tue,  4 Jul 2023 15:25:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9765F61389;
        Tue,  4 Jul 2023 22:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF750C433C7;
        Tue,  4 Jul 2023 22:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688509551;
        bh=l+UWSNWnPBn9YwHrYZ0j4Lv7hwDX/3gV8Kn6aaki1HE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WMHxaLp1Csrv16oO4rGOZ+vPwaP2Zr9ieNInLhYuaMs6zfv+FnF2gL2AMG2a8mdSD
         Bv0zi8vQl52i5JCuuLsSpfalG5lgyixtcUCVgNyfFqXZ/eq2BFPCgwjfk9VYciSpcb
         Uq18eBCZpSOVftI1qnf2kjg/z7czmLGJfeQnN2GeZL3hxvFxHBmRwfJAZJZTo8RryO
         J+XIpwMTA6uAhDxOMWgemhgEV0A+OndbJ871VpwP9ZF5V5wYPyk5Jkg0NC1SzJQC77
         A4zg/PcJa/s6R1xNSSqLZLq8JD5V2Bh1Z7kGsQWwdP6S6dWAk8D3BntnTBp7Y6NAO+
         Ais196WrPJiWg==
Date:   Tue, 4 Jul 2023 23:25:45 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [RESEND PATCH v6 5/7] clk: starfive: jh7110-sys: Add PLL clocks
 source from DTS
Message-ID: <20230704-tribesman-grumbly-86db5a8c1905@spud>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <20230704064610.292603-6-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dF3s5FbwRnrv/rJT"
Content-Disposition: inline
In-Reply-To: <20230704064610.292603-6-xingyu.wu@starfivetech.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--dF3s5FbwRnrv/rJT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Xingyu,

On Tue, Jul 04, 2023 at 02:46:08PM +0800, Xingyu Wu wrote:
> Modify PLL clocks source to be got from DTS or
> the fixed factor clocks.

Again, would be good to mention here that the reason we are keeping the
fixed-factor clocks is for backwards compatibility with the existing DT.

Otherwise, this seems good to me, thanks.

--dF3s5FbwRnrv/rJT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKScaQAKCRB4tDGHoIJi
0hJkAPoCQb991q3ts0PJelvRVhrMb36/OMkra5qkdsjLVOB9IQD+JLRYIxcJoCqE
9oBLSnO1ugEnIbqZGcJ/S6UTfT48eAI=
=Dpi7
-----END PGP SIGNATURE-----

--dF3s5FbwRnrv/rJT--
