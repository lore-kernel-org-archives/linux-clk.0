Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A905C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 00:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235253AbiKWA2n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 19:28:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234815AbiKWA2m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 19:28:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062D8C6555
        for <linux-clk@vger.kernel.org>; Tue, 22 Nov 2022 16:28:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9282F6195A
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 00:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08FDC433D6;
        Wed, 23 Nov 2022 00:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669163320;
        bh=fHuTNI5fRZJH09S88ONsLQwo9v8/uNLzcHD/i+NXjL8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=U4Dzi+aIWsiwmiyakk6kHZt/Fjoe/hRM3D1rj82aG/g5wJXdifYsw7lUdeIMacZ1A
         JSHAyxzWlz9navkf6qQQeoEHzvM44bdUyxfs3RsD06gdAoVyDGTUWFjQ5mV0Aef1iL
         PbCfxUWFRVYm9oTPcTMErBFJYE1KEkzsXFPOUKCQUy3u0KQwscVEVxM4yklO4IkKEY
         CiZJqAroOKU6vTftl/trlO/+qyUAzeQHi5DANOAWTWDztTVCU9L2rezdb53FZAZ98D
         wLz/IKBk9Zk3+rEjnSeraizVV5Ve3xZ98YLRbtUc0ii6TkPMMIVkkqo8KH21VhQoUd
         859I4NkW6bP9Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j1qqd1fxo.fsf@starbuckisacylon.baylibre.com>
References: <1j1qqd1fxo.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic clock updates for v6.2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-amlogic <linux-amlogic-bounces@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Tue, 22 Nov 2022 16:28:37 -0800
User-Agent: alot/0.10
Message-Id: <20221123002839.E08FDC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2022-11-08 09:59:18)
>=20
> Hi Stephen,
>=20
> Here are the amlogic clock updates for v6.2.
> There is just 2 PLL driver fixes.
>=20
> These are actually the same I sent for v6.1 but it seems something was
> off with the mail and it got lost.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80:
>=20
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.2-1
>=20
> for you to fetch changes up to d73406ed2dcfab7d25493ff3a62dd57f0d9c2bf2:
>=20
>   clk: meson: pll: add pcie lock retry workaround (2022-11-08 17:05:02 +0=
100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
