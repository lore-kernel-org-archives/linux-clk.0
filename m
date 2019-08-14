Return-Path: <SRS0=2ArH=WK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF53C32753
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 16:47:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23E33208C2
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565801240;
	bh=hrLkt9nUrAtiNUI0NPypePWmV6ZE8myEedzY2T161BU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=zV0YNWbUUVrzmIdGy2ja+EzlAkW0kcWmzsgWA4V5exnvmRplGZzxyXA6biGUO23TU
	 8HvB6F7fWgA9Bg8xMdJ0zehnX1oBgyUp2+6ON5canjukrhUjLD8iru8HhN0Vv/BCyi
	 M+aqelvrhKzRkWSsGizHKJnsaSSmTDAvY4o1MpsM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfHNQrT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Aug 2019 12:47:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:46260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726585AbfHNQrT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Aug 2019 12:47:19 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3123220665;
        Wed, 14 Aug 2019 16:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565801239;
        bh=hrLkt9nUrAtiNUI0NPypePWmV6ZE8myEedzY2T161BU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sS1u4khwMRaP6+SV9Xcf7z21SCJ5myrPvWtsvjbuL8h4meSvhVi2Zv62oD8T1Na7c
         ipKmR82AFRBTT5Wi5ZucDBJFx+BBOm42ZPQgFTPN3gTJvJ/FVcblWlVmRaGF+SyGcG
         n68F9hVMU8ZukSo1RK4yTi8/dbWZjIlGe98lknE0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jr25qivi8.fsf@starbuckisacylon.baylibre.com>
References: <1jr25qivi8.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: updates for 5.4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 09:47:18 -0700
Message-Id: <20190814164719.3123220665@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2019-08-12 02:27:27)
>=20
> Dear clock maintainers,
>=20
> Below is a request to pull Amlogic clock updates for v5.4.
>=20
> The main changes in this PR are the migration to the new parent
> description method and DVFS support on g12, based on notifiers.
>=20
> Kevin requested a tag to test DVFS so sending the PR now so he can use
> it well. We may send additional changes later on.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca=
4b:
>=20
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-1
>=20
> for you to fetch changes up to 1d97657a4794ab23b47bd9921978ddd82569fcf4:
>=20
>   Merge branch 'v5.4/dt' into v5.4/drivers (2019-08-09 12:12:58 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

