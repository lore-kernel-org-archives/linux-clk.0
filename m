Return-Path: <SRS0=K/Jc=ZF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7A1C432C3
	for <linux-clk@archiver.kernel.org>; Wed, 13 Nov 2019 19:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55272206D5
	for <linux-clk@archiver.kernel.org>; Wed, 13 Nov 2019 19:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573673226;
	bh=C4rfWkGmDlLYYaPlspY/NhzGN09nmHz/O5FsBlxSf8I=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=IUvpiJnmcY2aqV/wQwG+NljptogvuxQ2LfoXMKKIe3Vqmp1LWypiHqTdnh6BjYAcW
	 DcA7g8G2Hh+uMT1TlwCncTpjSmbra3yEQyrMobresoDqVnlyuOG79PVkWohhMcW93G
	 80syC+r3TZy6Vq1NE/zGCtwUHrfpGNWZ2NklF2/M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfKMT1F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Nov 2019 14:27:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:41790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbfKMT1F (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Nov 2019 14:27:05 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4BB34206D5;
        Wed, 13 Nov 2019 19:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573673225;
        bh=C4rfWkGmDlLYYaPlspY/NhzGN09nmHz/O5FsBlxSf8I=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=oUIJktaiMycdY7jJ3wq1Ur1rtxMXAb1jvb58HAHBcvxz4pQgJOAsLHOQXcWGKc/uH
         jczOJw7VA7EaTL59Y63tAdjeqqMKwJL9Yp6p4FkAFtKVeTahZMlGqK2o9YTsDdHnlZ
         sdrDjWQHzs35X/KHAab478Bmzfth9osq0ZGig67g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191111144507.4027979-2-thierry.reding@gmail.com>
References: <20191111144507.4027979-1-thierry.reding@gmail.com> <20191111144507.4027979-2-thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL v2 2/2] clk: tegra: Changes for v5.5-rc1
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>
User-Agent: alot/0.8.1
Date:   Wed, 13 Nov 2019 11:27:03 -0800
Message-Id: <20191113192705.4BB34206D5@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2019-11-11 06:45:07)
> Hi Michael, Stephen,
>=20
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c=
5c:
>=20
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-5.5-clk-v2
>=20
> for you to fetch changes up to 07b293c5b01483f3c65372e72e62a2ee559ce1cf:
>=20
>   clk: tegra: Fix build error without CONFIG_PM_SLEEP (2019-11-11 14:53:0=
5 +0100)
>=20
> This updated pull request contains changes needed for the updated API to
> retrieve a clock's parent's index as well as additional Acked-bys from
> Stephen.
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next. I noticed this error from static checker.

drivers/clk/tegra/clk.c:241 tegra_clk_init() error: double free of 'periph_=
clk_enb_refcnt'

And maybe that function can use struct_size() too instead of kcalloc
with a multiply?

