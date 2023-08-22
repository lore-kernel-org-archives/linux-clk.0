Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAF5EE4993
	for <linux-clk@archiver.kernel.org>; Tue, 22 Aug 2023 17:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjHVR6Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 13:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjHVR6Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 13:58:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A677CE9
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 10:58:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B4728614EE
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 17:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A2BC433C8;
        Tue, 22 Aug 2023 17:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692727100;
        bh=RfvfmqFjsfgrytUD5NsxzQg5ctyL8XwSos9DQJXcNiA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aa47fMliESM0A8yWtb++pnJMQ/APgyF3FDCI80Wug+SbhJZzeKcrl5ADUTgjoOCU2
         da7G+5E3EQ/cvDGAUsD041+sZgdCu5cd3i7kbFMHs9pDT1t5XJFQTBLdzEQBGS0zin
         B3UpZC4hXdoTqeLU/edZZkDaF814Wn19vjyX7T9MKeRTLG1Qu24n9VM9c/huS03Sk1
         tm7LAwfJ7hqIFtRbq9fPXdIIE8vGqFArkLApf7ImsKhk52T84cR/T84cFFIM9kECe4
         5us4OyNoBIhlKZBxgvfe8RKPXg0aydSWzFGeKOM3sSARzyQgEw3Ulah4T9aRt39l59
         WBpvWn5GuK+zg==
Message-ID: <e87da743beec8466d4fe6416ded5b19d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8651570.alqRGMn8q6@phil>
References: <8651570.alqRGMn8q6@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.6 #1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Tue, 22 Aug 2023 10:58:17 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2023-08-16 15:05:52)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with some small Rockchip stuff.
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaa=
a5:
>=20
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.6-rockchip-clk1
>=20
> for you to fetch changes up to 5c7a71fd82350c2f5828a66a1f2f38306d61cbc7:
>=20
>   clk: rockchip: rv1126: Add PD_VO clock tree (2023-08-10 23:14:06 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
