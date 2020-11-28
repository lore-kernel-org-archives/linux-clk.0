Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5E2C3E8C5
	for <linux-clk@archiver.kernel.org>; Sat, 28 Nov 2020 02:21:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4187207CD
	for <linux-clk@archiver.kernel.org>; Sat, 28 Nov 2020 02:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyGi6E7S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731113AbgK1B5Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Nov 2020 20:57:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:36018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728558AbgK1B4o (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Nov 2020 20:56:44 -0500
Received: from kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com (unknown [163.114.132.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4095D205CA;
        Sat, 28 Nov 2020 01:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606528603;
        bh=/AovefSgiuRd31XQmOS9AF0RmkmpI91VIqcfw8fNgrs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eyGi6E7SuDO9386oUKVGSEG0ez4gj4XwGK1MXMIIBR10TbpbwZW/QZxXYjTWrSnVv
         InuCJ+n6w8PcTBzD19rySO9XHash+x59TTm3R/lPFnr14vItgN3okP/vw//a+w2B6P
         yTvYXOIB9+KeTZcFtW6bq59ill7Ot+GqJY0bXQvI=
Date:   Fri, 27 Nov 2020 17:56:42 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Daniel Axtens <dja@axtens.net>, Joel Stanley <joel@jms.id.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yisen Zhuang <yisen.zhuang@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        "David S. Miller" <davem@davemloft.net>,
        <linux-renesas-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH] powerpc: fix the allyesconfig build
Message-ID: <20201127175642.45502b20@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <20201128122819.32187696@canb.auug.org.au>
References: <20201128122819.32187696@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 28 Nov 2020 12:28:19 +1100 Stephen Rothwell wrote:
> There are 2 drivers that have arrays of packed structures that contain
> pointers that end up at unaligned offsets.  These produce warnings in
> the PowerPC allyesconfig build like this:
>=20
> WARNING: 148 bad relocations
> c00000000e56510b R_PPC64_UADDR64   .rodata+0x0000000001c72378
> c00000000e565126 R_PPC64_UADDR64   .rodata+0x0000000001c723c0
>=20
> They are not drivers that are used on PowerPC (I assume), so mark them
> to not be built on PPC64 when CONFIG_RELOCATABLE is enabled.

=F0=9F=98=B3=F0=9F=98=B3

What's the offending structure in hisilicon? I'd rather have a look
packing structs with pointers in 'em sounds questionable.

I only see these two:

$ git grep packed drivers/net/ethernet/hisilicon/
drivers/net/ethernet/hisilicon/hns/hnae.h:struct __packed hnae_desc {
drivers/net/ethernet/hisilicon/hns3/hns3_enet.h:struct __packed hns3_desc {
