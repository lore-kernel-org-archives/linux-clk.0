Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2317FC25B67
	for <linux-clk@archiver.kernel.org>; Mon, 23 Oct 2023 23:59:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjJWX7X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 19:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjJWX7X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 19:59:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7482BE5
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 16:59:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5E0C433C8;
        Mon, 23 Oct 2023 23:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698105561;
        bh=vcW9N3bg1pcdPgOOj7c+HRMYqqNXhrFHhuxSF9qN+RU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VA8LEHbdXH8kQV+5X9USktifDZm9F8N6l+grkWQ5k/Ax62eah0jH4FjNGpCBSn7e8
         nQ6Ux8VDj3NUNROH2fDxlxhKqWX5Df7Y9MP9mSVMFGvuy4TlJA1uEbLvNJp/H1tTj6
         p1v4rzi+R3Zlj1/KeUaAmW6uUsrY4DtKlgF/sk8wVDI4NXyPNlJ5brTlShwUGp/O63
         HAy7s1E5GcwzNw1HUhZn08Sx9QoGhdMs2dibsgDpLcPDesdCIN8RwWy0xKWSnRR4zh
         KQJgMn6R+UQ8dfVhc7cqgx/TQu3jO38koh1oZ9Ikdenci3FjheuuzK7THF1MPvgJqk
         dpJ+I8A0CrSkA==
Message-ID: <4c5cddee041d73dfef1256858171eef4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jwmvdo1k3.fsf@starbuckisacylon.baylibre.com>
References: <1jwmvdo1k3.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: 2nd amlogic clock updates for v6.7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Mon, 23 Oct 2023 16:59:18 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2023-10-23 07:23:10)
>=20
> Hi Stephen,
>=20
> Here is a fix for the amlogic clock merged in clk-next
> It fixes a missing dependency for the s4 clock controllers
>=20
> Regards
> Jerome
>=20
> The following changes since commit 57b55c76aaf1ba50ecc6dcee5cd6843dc4d852=
39:
>=20
>   clk: meson: S4: add support for Amlogic S4 SoC peripheral clock control=
ler (2023-09-27 11:01:03 +0200)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.7-2
>=20
> for you to fetch changes up to 98408df6ad1fa14ad352f8d28d68eacdc94ca382:
>=20
>   clk: meson: S4: select CONFIG_COMMON_CLK_MESON_CLKC_UTILS (2023-10-23 1=
4:54:35 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
