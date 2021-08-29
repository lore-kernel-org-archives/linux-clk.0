Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24890C432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 05:10:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07A3160ED8
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 05:10:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbhH2FLY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 01:11:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:59564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhH2FLY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 01:11:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C2E160F25;
        Sun, 29 Aug 2021 05:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630213832;
        bh=QpejAMO1jkW8xk6vAuMTpBMIzTree9BkGIPgtorYslM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JKM7nD5ZqujIKq+ySTIeUK3wVZIBAvieH/gLERrbOTR303ulkAVKb3SjjncKsOU+R
         kTwWWDrA1bEfDmRUiCMYxveOLXdGa/fyTWBVW2ghujUtQgu/gCoFbn/aMb9jlMiq1X
         KGYLHjO/ov7fCuoFd8cyZDnCCqLRkAAHoFjtZ0wxs3KSZJCC3mE9w7xcfPdhTm9zGZ
         M+ibwNHTRA5+GxRhuvSGzBoV+LZlPygEhQGhCZVibBkWiBCGlypYqzPbPVaPdUSGV/
         WvIBJk0AZaT9oYZds99sUhFzMfTKP1Iu4okhd/iYXssn9JxkR3Ebn3W5SYAafH5W2l
         E6hw1C3mKK7Xw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210826070336.wr3gskwsgeuwii5d@toshiba.co.jp>
References: <20210826070336.wr3gskwsgeuwii5d@toshiba.co.jp>
Subject: Re: clk: visconti: Initial support Visconti SoC for v5.15
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        mturquette@baylibre.com
Date:   Sat, 28 Aug 2021 22:10:31 -0700
Message-ID: <163021383134.2676726.14183696921060275372@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nobuhiro Iwamatsu (2021-08-26 00:03:36)
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58=
d3:
>=20
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti=
.git
> tags/clk-visconti-5.15

I reviewed the patches on the list. Seems that nobody else did.
