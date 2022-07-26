Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1412CC00140
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jul 2022 17:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbiGZR4X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jul 2022 13:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236755AbiGZR4W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jul 2022 13:56:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD2AD5
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 10:56:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AE0C2B818F8
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 17:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C627C433D6;
        Tue, 26 Jul 2022 17:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658858179;
        bh=ph2uDxsSutc2DnlVa7eIwwd3K5Vf9gr9912RR4aKO5U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O2Pb4nJeDz4nyc0vY47kt/NXyO6BAEBHlwUkJi0ddIyHrP9raI17aK6K40JS/1+my
         T7Nt2l4/EA8yrT2hNMBdXM7ab4fZQ07VINQQsZTPeK6DvHPUbHGFizDf/krTwc/Agq
         zN7FFqtDhKBlVwXTiSVmQIo093bNkgYczyqxWDtAwSb3ROu9zqv50LJTRgEow7AfmN
         akyJ8pBqRhvecnGnKU+SMKrFEhe+G/ZzaafL7alTOBE4CO8/S9fg+hka+ZvCJxxvhI
         1yVPfowocl4MqP0Im7qxhU93FpXG5QMIoN6U/xQF5Q6hH8NERRHtvn+zbYuWCcc13+
         m5iiNb32mNQIQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YtnDy29glGFDhqU1@kista.localdomain>
References: <YtnDy29glGFDhqU1@kista.localdomain>
Subject: Re: [GIT PULL] Allwinner clock fixes for 5.19
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
To:     Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date:   Tue, 26 Jul 2022 10:56:17 -0700
User-Agent: alot/0.10
Message-Id: <20220726175619.4C627C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jernej Skrabec (2022-07-21 14:23:23)
> Hi!
>=20
> As it turns out, commit 38d321b61bda ("clk: sunxi-ng: h6-r: Add RTC gate
> clock"), queued for 5.19, introduced a bug. This bug is accidentally
> fixed by commit e1c51d31befc ("clk: sunxi-ng: Deduplicate ccu_clks
> arrays"), which is already queued for 5.20.
>=20
> Although this commit as a fix is much bigger than it needs to be, I
> still suggest that's fast tracked to 5.19. This will also avoid any
> merge conflicts during merging material for 5.20.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a=
56:
>=20
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-fixes-for-5.19-1
>=20
> for you to fetch changes up to 48e29e0f3be086a28a9384befa77d02a43be2f98:
>=20
>   clk: sunxi-ng: Deduplicate ccu_clks arrays (2022-07-21 23:11:28 +0200)
>=20
> ----------------------------------------------------------------
> Fix H6 RTC clock

Anymore details besides "Fix"? There's some more details in this pull
request but the tag tells me almost nothing. Does RTC fail? What's
actually broken?
