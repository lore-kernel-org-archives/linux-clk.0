Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB934C001E0
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jul 2023 18:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjGZStN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbjGZStM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jul 2023 14:49:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4DC26BB
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 11:49:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B149B61C7B
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 18:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DE0C433CA;
        Wed, 26 Jul 2023 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690397350;
        bh=XdFk645Lqon2H3uVppM45pSJBgjEVLddchaTaKmfkmY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=um1IZLSV3HtBxhjlXgn5ZptnWzZhmL1bxDVJn51xTq0udKYimz7f+AnVL3Smh6Lx3
         U/V+UCw1IXlpN1D0P3kOdA4KJi81OdyySNLTG2h3hDZhfdrErwPDXq8B+niXa9c7x0
         X7z6lL69+eLJGWmaCc3eSJk3nYDiaBrF6mqkWqJotLdztt793qNRRae8bbYYEAY/BX
         1Omin12eXGGFrMXKQc1sFezY4ql3nIqYHp/dl8/wcd+qUnpMAd3SeFiuaPEfnqgnID
         1OFNe9ZMN0oDO/fLaIFL95GXJCQD8gPiEvp+BsfubRxVCMbgH8w4XzrzPL7Qfk8EDm
         99UkHpLtO+xsQ==
Message-ID: <3eb8745cce66ee68c02ac54eaf6a8bcd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jwmyotql1.fsf@starbuckisacylon.baylibre.com>
References: <1jwmyotql1.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: Amlogic clock fixes for v6.5
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Wed, 26 Jul 2023 11:49:06 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2023-07-25 00:06:02)
>=20
> Hi Stephen,
>=20
> Here is a fix for a problem introduced in the last cycle.
> Please pull.
>=20
> Cheers
> Jerome
>=20
>=20
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaa=
a5:
>=20
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-fixes-v6.5-1
>=20
> for you to fetch changes up to 6e2acbfe59b83043bc7ae1bb39fac4fc9dcd5a18:
>=20
>   clk: meson: change usleep_range() to udelay() for atomic context (2023-=
07-11 11:35:42 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
