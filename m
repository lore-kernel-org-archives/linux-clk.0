Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6003C77B7C
	for <linux-clk@archiver.kernel.org>; Wed, 24 May 2023 19:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjEXTFi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 May 2023 15:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjEXTFZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 May 2023 15:05:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C72119;
        Wed, 24 May 2023 12:05:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0877563E69;
        Wed, 24 May 2023 19:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FC2C433EF;
        Wed, 24 May 2023 19:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684955123;
        bh=7IRpNDdHhUEZCbE8G7RygmiCr0Ti7Qh7NLcdgH/35ec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AeF+V75+9HxnSrKOxOzDMKO19pROvZCjPhYZSi1U0j8ulJ4hpTnz0bnlz7Cl6IBWF
         oKbcDzxhhyPrvbr+ilousBeY4OGw03EqiI8z4EaK7S3GVPhQQSc/zPgQzCMqF+cG+S
         tINkIPrAg/KnNW2+MUac9GMLTR2hzql4EqcziaHfiBcz5ewXEm+65HmMiPzCJJhAL3
         GZcr1KmEahRFoXFEMCFusxHBQiVqXfNocCuA/bwIVNpfLTgX2x4Q1YMsH3CBSrnkl4
         bRoOre+ZqTRKKtASttK1ibGPkiGmBIYaEL51mE/lv/1Ezfjnnqm/dqJo6cb+FsMmQO
         7BN6kuzbaOkMw==
Date:   Wed, 24 May 2023 20:05:17 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Jagadeesh Kona <quic_jkona@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
Subject: Re: [PATCH V2 2/4] dt-bindings: clock: qcom: Add SM8550 video clock
 controller
Message-ID: <20230524-cape-unlovely-db4e73216095@spud>
References: <20230524145203.13153-1-quic_jkona@quicinc.com>
 <20230524145203.13153-3-quic_jkona@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a2P0yj4aEzAov0Ta"
Content-Disposition: inline
In-Reply-To: <20230524145203.13153-3-quic_jkona@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--a2P0yj4aEzAov0Ta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 08:22:01PM +0530, Jagadeesh Kona wrote:
> Add compatible string for SM8550 video clock controller.
>=20
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--a2P0yj4aEzAov0Ta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG5f7QAKCRB4tDGHoIJi
0qwyAP9Ct21nILVDvZMTCUux5YluLEO+yncGzHhoXG/QOhY57wD9FO9ErDcXGMRP
C7P8HUW/CeSJbLwRzkD6ZeRxY1BCiwo=
=yrwX
-----END PGP SIGNATURE-----

--a2P0yj4aEzAov0Ta--
