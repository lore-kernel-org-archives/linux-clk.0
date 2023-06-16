Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46928EB64D7
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jun 2023 18:35:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbjFPSfL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Jun 2023 14:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjFPSfK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Jun 2023 14:35:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB911FD5
        for <linux-clk@vger.kernel.org>; Fri, 16 Jun 2023 11:35:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7C95161B1C
        for <linux-clk@vger.kernel.org>; Fri, 16 Jun 2023 18:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5230C433C8;
        Fri, 16 Jun 2023 18:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686940508;
        bh=XhGznc+ckcK6geKVM5HRvsYol/5FbCOc9jOxs3bkwhA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OZh2I3buW2ZCQvkIIyEKYn+JlXwziA+h2XD1nemUkzKL7nikQvJrzBA1KBZGS0Qy0
         NlYuahgub5DZ3Dt64xX10gh2eFOG7zWinuAMABP2BlCCTfsSlGO9ZFFOyNMq56ZviZ
         l4P68yr4YvAthSVT5ZZ8vW1d9ymCS8ZNtN4TuE7FbS0y9vTXUf/6j4SpH10UbhXk4j
         kUEG3etGDdbbxumyijcq1vtpSR2QEVH5l+1F+F8446cDpBAjeoffXaHjyYybnPzMY6
         lT7T6eOfHUbY2cs6acVuJ7i6jzOUU+CqWJdmdrP4KbcJioGHuc2tipRxd/t3kJlZtq
         lEYJYaVuqgxIA==
Message-ID: <a96d2c1aad1e71918cef9f89ccab8ef4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j352s39qe.fsf@starbuckisacylon.baylibre.com>
References: <1j352s39qe.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: 2nd round of amlogic updates for v6.5
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 16 Jun 2023 11:35:06 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2023-06-15 10:34:31)
>=20
> Hi Stephen,
>=20
> Here is a 2nd round of updates for the amlogic clocks.
> It fixes a few problems with a1 SoC support that was part of the first
> merge request.
>=20
> Please pull.
>=20
> Thx
> Cheers
>=20
> The following changes since commit e13dd04a242cc8c064b9af8cde38b8e9a548cf=
81:
>=20
>   clk: meson: a1: Staticize rtc clk (2023-06-12 14:29:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.5-2
>=20
> for you to fetch changes up to 35944dc68e67ab0c105939b83d20a04bd16f4968:
>=20
>   MAINTAINERS: repair pattern in ARM/Amlogic Meson SoC CLOCK FRAMEWORK (2=
023-06-15 12:31:48 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
