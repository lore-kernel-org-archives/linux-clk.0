Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3714C0015E
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jul 2023 19:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbjGMTqX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jul 2023 15:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbjGMTqX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2023 15:46:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435FA269D;
        Thu, 13 Jul 2023 12:46:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C697F61B44;
        Thu, 13 Jul 2023 19:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D17C433C7;
        Thu, 13 Jul 2023 19:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689277581;
        bh=AGrJTyF1kQCmjhSQd29qxN+hkwd04kIQUDVunqRAgNU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OUb+x1Htqgdv9RFiQ/Ndl3aK9jclOdtAP/pomFM90Jgj77KpThOU6Lxr/+QilisyN
         bXBtvp1S6DrDX/igCXgsyY4Bkw/qK3c9k/tHIZnwI891cYsEc+WRUyeG3ipoNGb59N
         IHrLNgqNooqTHZSwHxbVYbI6GO/wZg/rbx5xRWcTtMKLwy5FhT5zze6VTK5to3Nctl
         axXvEzuzBrR7S2aZikScrZ1hd9ijpJ+892FhgS5XyUO6islmNH179PU5qQXHPtM9mr
         oQTE8v0UESWmYR6qNSV+uaIh6xpTpENac8yHgmxWG6FDXJmG8O0zR+DzUSmMQlGrvk
         519OZ5ylSuvxQ==
Date:   Thu, 13 Jul 2023 20:46:16 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: hisilicon,cpuctrl: Merge
 "hisilicon,hix5hd2-clock" into parent binding
Message-ID: <20230713-encounter-earmuff-ca0edd40e57b@spud>
References: <20230707210700.869060-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="adCi25htn3vGAWbH"
Content-Disposition: inline
In-Reply-To: <20230707210700.869060-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--adCi25htn3vGAWbH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 07, 2023 at 03:07:00PM -0600, Rob Herring wrote:
> -Each clock is assigned an identifier and client nodes use this identifier
> -to specify the clock which they consume.

> -All these identifier could be found in <dt-bindings/clock/hix5hd2-clock.h>.

Might've been nice to preserve the reference to the header containing
the defines?

Either way, this seems to have sat for a bit so,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--adCi25htn3vGAWbH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLBUiAAKCRB4tDGHoIJi
0quRAQDmc+bJ5QjRN9aDgaZD7JitN5GsZ1G7TexzypuR9ELl/wD+In6o2DXNID7x
VIoDxySl+hzN+FrFvzXAHfutd9X6kAI=
=DQuz
-----END PGP SIGNATURE-----

--adCi25htn3vGAWbH--
