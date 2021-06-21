Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12BFC4743C
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jun 2021 23:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8525A61289
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jun 2021 23:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbhFUXfn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jun 2021 19:35:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:37156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229940AbhFUXfn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 21 Jun 2021 19:35:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A68AB61107;
        Mon, 21 Jun 2021 23:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624318408;
        bh=EEHR9g6gDXfxGuzn/Rw2vPhl15mZ1IwnPb50E5ANzps=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=US1OjpibJS/s31+FaQLP2+8UBx8+Ia4VvUrYiKu3UXNPYSBOv7dlD8z6b7muSNlh8
         GuoJOskUyt48QtNaj5sosP1m+XLNTBMb0BgYpIzGdb/rHak/sWO3lrZgkuj+MdIs7v
         V65jmGaQD0taRb/6mD3GWPE/S8S4ZKMp8tDlS05lPDwOP9GaozSdBibTwV07YdEVS+
         6AmdpAbFqh143ez1wFIM6pxfXDHM1hnH8rijv9nMsboOD48aFkfzWTmNap/6XpG0NO
         kMMpqFu88iddCTjh4OpAdXnxFp89nmC74ZI/iYaJq0uE/qnLSC44/7G54qtB9eFsZ3
         f55sHPWp8dXTA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1623404713.git.geert+renesas@glider.be>
References: <cover.1623404713.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.14 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 21 Jun 2021 16:33:27 -0700
Message-ID: <162431840735.3552334.3672521214600062469@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2021-06-11 02:47:32)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 790c06cc5df263cdaff748670cc65958c81b09=
51:
>=20
>   clk: renesas: r8a77995: Add ZA2 clock (2021-05-27 15:27:28 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.14-tag2
>=20
> for you to fetch changes up to 17f0ff3d49ff1a9d4027f9c2bef4725ab41aa9a5:
>=20
>   clk: renesas: Add support for R9A07G044 SoC (2021-06-10 15:46:46 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
