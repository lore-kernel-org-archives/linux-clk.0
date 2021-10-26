Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9029DC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 26 Oct 2021 19:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 609C160C4A
	for <linux-clk@archiver.kernel.org>; Tue, 26 Oct 2021 19:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237162AbhJZTth (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Oct 2021 15:49:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:55716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237048AbhJZTth (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Oct 2021 15:49:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 354A060E05;
        Tue, 26 Oct 2021 19:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635277633;
        bh=s9JwoJB+89wiNPp7epyOTYCtetr5xaa/iZIr/NZYSvw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QUP/Uu8jL5eesQpVr33GRTQqS2HZtr4d0gSSduXC9UCGM9LqwBr9bpikB1GKt48M8
         g1xV5qBVQsFagpTLGwdALJbAyX+pmVvPGzT5ZETC8V3BqpVhleD9MtcVB8KS0ah4VS
         FrFKYm+ypLvlxmEhr3EBixKfie7lk+3mKqUzpotwzhG82tOMjzR/rdaJ9+O/XP2mjS
         3ks+V4oPb2qQff+1iFty/eLdDTHgebxNa1CG/uI0lRsaTI750hFCJ9TblKlO4vlAga
         1rlE5ImJrbybQjeXzI4NS4C+5woi/93meWgctEFUFwQ2/nhkdpm6VS60rCxMHtCuNB
         OuHfoSVV2cBhg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jtuhetv1s.fsf@starbuckisacylon.baylibre.com>
References: <1jtuhetv1s.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v5.16
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Tue, 26 Oct 2021 12:47:11 -0700
Message-ID: <163527763187.15791.2918685677021849338@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2021-10-18 04:44:22)
>=20
> Hi Stephen,
>=20
> Here are the updates of the amlogic clocks for v5.16. Nothing out the
> ordinary. Please pull.
>=20
> Thx.
> Cheers
>=20
> Jerome
>=20
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd=
8f:
>=20
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.16-1
>=20
> for you to fetch changes up to 7bcf9ef6b9c50e87bcb1dee5ced50ccfa2b21470:
>=20
>   clk: meson: meson8b: Make the video clock trees mutable (2021-09-23 11:=
46:38 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
