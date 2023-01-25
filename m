Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33225C54E94
	for <linux-clk@archiver.kernel.org>; Wed, 25 Jan 2023 19:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235286AbjAYTeI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Jan 2023 14:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235053AbjAYTdp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 14:33:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0159A48A39
        for <linux-clk@vger.kernel.org>; Wed, 25 Jan 2023 11:33:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A48DAB81B93
        for <linux-clk@vger.kernel.org>; Wed, 25 Jan 2023 19:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC04C433D2;
        Wed, 25 Jan 2023 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674675220;
        bh=X6xcxwklH5847wqmO+svpHYnCrqumqg2yU1LZyq5JXU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mCPJ0xNt3iziZS/Ci8r24KswIRWnTinWxtyROjdE5wVwH42AA1v9XMcVK6GVpFgYX
         v1MZb1+/bJhjoZINUgU/hC0+QFGmgHf/VPDUzI7n+GmXBg/RkTQa2yJ5yjg2fkp3Wy
         kacpamolw1gddVljUxTgTKwgD1p0W0TFhY4JZUMnOWICWAhjYcFTu8RNsza51bxgRA
         eJsXP8IdiN4Yoj0PJ6u2BRKZxVjPkZP6WEatYWEkPwI5cPbuBmN23NCVgbODt7V9e4
         xJfTzz9e4G7Hpgtx52XKHIgCn21a4NOiyh5NiaaqeG1Pl2BvXZbWo2wuc5KgN6/Sz5
         nVX4TDQGRXBmg==
Message-ID: <e062fa9ac4726c39ccf97f2426a58b48.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jmt69nxup.fsf@starbuckisacylon.baylibre.com>
References: <1jmt69nxup.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: amlogic clock updates for v6.3
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        linux-amlogic <linux-amlogic-bounces@lists.infradead.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Wed, 25 Jan 2023 11:33:38 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2023-01-23 06:07:11)
>=20
> Hi Stephen,
>=20
> Here are the amlogic clock updates for v6.3.
> Please pull.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71=
c2:
>=20
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.3-1
>=20
> for you to fetch changes up to 716592fdb5e255a1b9dcb444822c9c1f9a1e248c:
>=20
>   clk: meson: clk-cpu-dyndiv: switch from .round_rate to .determine_rate =
(2023-01-13 15:14:12 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
