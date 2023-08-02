Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B746BC001E0
	for <linux-clk@archiver.kernel.org>; Wed,  2 Aug 2023 15:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbjHBPlK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Aug 2023 11:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234078AbjHBPlI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Aug 2023 11:41:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1540CFE;
        Wed,  2 Aug 2023 08:41:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A139561A0D;
        Wed,  2 Aug 2023 15:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37E8C433C7;
        Wed,  2 Aug 2023 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690990867;
        bh=5iLGEaZl5S/LoWq5PFF3O1C6HRMprL1muQ2ieAfB1hc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KgYBWxFoFzbGZnDUn38jPv9P/jNuT3yMom4M/PEyvPJ9uoPe+Xh12wwyP9nHI2WYw
         awapgOCsuLJmSxCKKqfFwUk4OWZA4PNNkGuyeqzWXDRlGqdgDHeTocuHdtyEXhBlMi
         DLBBzznqCyx2zrcgyZlN1JoZeaKkux6mZcBJPXhxNF/DvBhsewIkJToFKabPvO8jyI
         5QE31GXH9X3jEgDPhhydqe10x6/qF6xXyXdoLgXXevBMgtWwuxjD7y9brf5Yqr9a9i
         PP4uqyCX10/TQQmBz6Vctwvd51vBEXQpq4O4oIQnhYb9dQLHYiuScky9SlCMObxta7
         oAMmki3jZn/LA==
Date:   Wed, 2 Aug 2023 16:41:02 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     devicetree@vger.kernel.org, git@amd.com, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        michal.simek@amd.com
Subject: Re: [PATCH v4] dt-bindings: clock: versal: Convert the
 xlnx,zynqmp-clk.txt to yaml
Message-ID: <20230802-purveyor-dandruff-fd1c9d58cad8@spud>
References: <20230802043557.26478-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w/BPwR6QwUgTJtBW"
Content-Disposition: inline
In-Reply-To: <20230802043557.26478-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--w/BPwR6QwUgTJtBW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 10:05:57AM +0530, Shubhrajyoti Datta wrote:
> Convert the xlnx,zynqmp-clk.txt to yaml.
> versal-clk.yaml already exists that's why ZynqMP is converted and
> merged.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--w/BPwR6QwUgTJtBW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMp5DgAKCRB4tDGHoIJi
0t1SAQDv8aY1IXDpTVS0mUWpvtHMG8HYop3GaviT0EHLUG7KJgD+Nerspan8o0m8
kz5tYgGJG0jWcXYW3Z1nFT+NYF8zFwc=
=foBk
-----END PGP SIGNATURE-----

--w/BPwR6QwUgTJtBW--
