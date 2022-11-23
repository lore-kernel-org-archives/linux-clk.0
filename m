Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05C3C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 00:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233239AbiKWAyu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 19:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbiKWAyt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 19:54:49 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BDDC68BA
        for <linux-clk@vger.kernel.org>; Tue, 22 Nov 2022 16:54:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4253FB81CBD
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 00:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC912C433C1;
        Wed, 23 Nov 2022 00:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669164885;
        bh=H42ZrAGgQp/aCjsbJiVaMdE+eoEzsGgFCxgylcY/DCY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kt8NmAcS2dXi/9s6Llk3GZaxVjNCX9Y7kyrZq0+CSo77l8Axkc/Lop2MuMjpaawkW
         5ZSigxDeCM7+NZAbBz9yAUxLNocJr83RLr0/TYDNKScSSnB77lM7j0ryc5hEb6ISvf
         GXv0YmoZtIIrOZZa7HlHGj1suNPtpiCcKOZ+D3pxxpSrLRt2bEdyHzL1C+s5Fin0Do
         PiI2jU8gdk5ZnstKUCrBaa75Hj4GwNFp2e/QnesIZ6fgk4bgWiqbY41YsCNOthL+G2
         LDEvdS9+uXasAagL07m1wpbQrgyicZpZwfMfDNwvy0I8HhEt1FOKPLeihrnvr0i5bG
         nfpZPIox9A9JA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y3ftFp9FoTmGCi9+@jernej-laptop>
References: <Y3ftFp9FoTmGCi9+@jernej-laptop>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.2, try 2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
To:     Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date:   Tue, 22 Nov 2022 16:54:43 -0800
User-Agent: alot/0.10
Message-Id: <20221123005445.CC912C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jernej Skrabec (2022-11-18 12:37:42)
> Hi!
>=20
> Please pull following clock changes for 6.2.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80:
>=20
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.2-1
>=20
> for you to fetch changes up to f64603c9729af406167cb9beb66687b1abc4196e:
>=20
>   clk: sunxi-ng: f1c100s: Add IR mod clock (2022-11-16 19:49:18 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
