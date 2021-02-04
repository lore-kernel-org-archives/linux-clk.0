Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9CCC433DB
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 19:36:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E402B64F6C
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 19:36:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238367AbhBDTgZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 14:36:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:57014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236844AbhBDTgQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 14:36:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 902F164D9D;
        Thu,  4 Feb 2021 19:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612467335;
        bh=rpTGlNPN4SaEsNLDUz8Nh/DcPMib+Bvl0GPBdRiE9SE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MMrL+ZkLwz86W7B/zenctQKUHXcyVf6v1Ln35yCIwtZUloN4plBBGqtU+kslLT1O3
         63d2KqBRtJdqWkcgoOVd6FxWAnWWfMvOPJwWizhTsl8tKh/NSFsNM6kk5wXkcALni8
         tPHtIymtNjcOMGW+ztFQM0yb20482JoFfsZbIbwuvWj+mu+N+u4DX2rp7qSZQGHpCG
         6qaWA5ELO8+bm03POZeqlJbywTsdBaaGaud/THy94Mokp3RodM4JM2uA4csP78ggDi
         rOybXNEUQTAy4JZ3juVnO+y+aDebBAkOV5jwckvw/LWb+6IYV3JqW6YkT7uAIw6FrU
         XiCIwtRcxdIIg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jy2gh17f7.fsf@starbuckisacylon.baylibre.com>
References: <1jy2gh17f7.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v5.12
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Thu, 04 Feb 2021 11:35:34 -0800
Message-ID: <161246733428.76967.1992229901867655564@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2021-01-25 05:18:36)
>=20
> Hi Stephen,
>=20
> Here are the updates of the amlogic clocks for v5.12. Nothing out the
> ordinary. Please pull.
>=20
> Thx.
> Cheers
>=20
> Jerome
>=20
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e=
5e:
>=20
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.12-1
>=20
> for you to fetch changes up to af57824425389adab637a2ae872ac488f50b5832:
>=20
>   clk: meson: axg: Remove MIPI enable clock gate (2021-01-04 12:03:02 +01=
00)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
