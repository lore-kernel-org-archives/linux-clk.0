Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF9DC32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 22:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234430AbiI1WzV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 18:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234558AbiI1WzR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 18:55:17 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BED9659DF
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 15:55:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id CF209CE1FC0
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 22:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C64AC433D7;
        Wed, 28 Sep 2022 22:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664405713;
        bh=hNYiDuQ5AdCYgoHAK6s4t8feEynKECm3atjOtYgNm3Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gOlFqswNE+6ZxzbYeXOA/QgnkSGez8AHXe+sXpkuhng0XBOoDXUl2Sa4DDoDQcuDn
         js6jrMJW1z2il/2TbF20E0q7Q8leKZNbs0euzav+DsoK9mfklHWSvBgghKL2BmuM/+
         BmSWPp5Xa4oP+gZsP26b9uu3lvk4SnNF7nXf5BK9CfvtxMKarQFafJzCOLJOmlo/XD
         s/+Xh/M94mT+ZRV6rKcAH1KPEOKAj76FVt9Bz1gftjAv1Uo5oSWErknkyUXnbRptcr
         KVCIANE40v74NK+N+Q6FC24xDBUoPwDz+CrgHrZcoVddi3b3cweZzWSWxmiP3wsJRb
         cdI0BHJ3Tuk8Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6719652.G0QQBjFxQf@phil>
References: <6719652.G0QQBjFxQf@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.1 #1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Wed, 28 Sep 2022 15:55:11 -0700
User-Agent: alot/0.10
Message-Id: <20220928225513.3C64AC433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2022-09-24 04:17:18)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with some Rockchip stuff.
>=20
> Mainly the support for the clock-controller for the rv1126,
> another yaml conversion and relicensing the bindings to
> gpl2+MIT following DT guidelines.
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc5=
55:
>=20
>   Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.1-rockchip-clock1
>=20
> for you to fetch changes up to fffa0fa4d029c10406d417dd33f630bee4b12c02:
>=20
>   dt-bindings: clock: rockchip: change SPDX-License-Identifier (2022-09-2=
3 20:48:01 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
