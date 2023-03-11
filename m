Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0B7C6FD1C
	for <linux-clk@archiver.kernel.org>; Sat, 11 Mar 2023 12:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjCKM4Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 11 Mar 2023 07:56:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbjCKM4X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 11 Mar 2023 07:56:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2583101F28;
        Sat, 11 Mar 2023 04:56:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9533AB82548;
        Sat, 11 Mar 2023 12:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC37EC433EF;
        Sat, 11 Mar 2023 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678539378;
        bh=lvN0yuIvnifEoNBiQqRY/KIoJE7i2VIK9/VhGQSkFRc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OsTZJ3USu67MOp9ICl94yHSAvIxGgE20hndsrYUxAYHhR5XOMCsSx7e+wUFAaORGx
         WcQHxz0H/JvdKxrEuYNefRNHFJEFEfXI7q/0jVGF3NAOAOD2FDOsWWNwPBQ4xZpp2j
         b/mgBnzzTq8+tPA86WxmnFggbTsyButvdF0TY5YX6lbNnVBart+/RVXZNBIPD8uGim
         pQCNxzNx/O05d4BYAWLa2BqTNRYKTrN5eIzAezAgXLJOg6BR/r/Q8qQQG36P6zjZEl
         6d+S7hSAsNr27yFSDF43t52g3oHAgMKxqn0YehRmdhZI8VrW/UkBXd14Fj3Of4dr1e
         bRr6Vg7ccbTQw==
Date:   Sat, 11 Mar 2023 12:56:12 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Dooks <ben.dooks@sifive.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/21] clk: starfive: Replace SOC_STARFIVE with
 ARCH_STARFIVE
Message-ID: <44332121-08d2-4c6b-82d9-e2705d1639eb@spud>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b0T18N537+LiQ2PN"
Content-Disposition: inline
In-Reply-To: <20230311090733.56918-2-hal.feng@starfivetech.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--b0T18N537+LiQ2PN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--b0T18N537+LiQ2PN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAx6bAAKCRB4tDGHoIJi
0ukVAP9uHTogOnJzTa+CWWg06aCmxrDMMuIyPN7fXOdTwfC5vgD/UUaT54JZyhLs
g65LOiTQi6ajUQ+iynSHbwQPBLMBdQA=
=wSCk
-----END PGP SIGNATURE-----

--b0T18N537+LiQ2PN--
