Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC60C4646B
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 00:47:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8214206DD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 00:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561423663;
	bh=nXbVttwPSdyo0MJiTGhWsGVRpNRpHSHCugsaouhmoEM=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=KJZ0K+lTnbKGq8gs/k6oCBIEd95mpLzzRefk2vobO481dvWv0hCIPbpkB+/GremRo
	 QarCCTcFyCP7EbkCZDss5lBxQQaFjF/K7UOsajVP0z/sQdJoj1cuyUe2LA0iflDHqy
	 WuHwSJ7SymFthXNvGHAz+83WfabTPG+nUb6zRp54=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbfFYArn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jun 2019 20:47:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:56260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727648AbfFYArn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Jun 2019 20:47:43 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74CB9205F4;
        Tue, 25 Jun 2019 00:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561423662;
        bh=nXbVttwPSdyo0MJiTGhWsGVRpNRpHSHCugsaouhmoEM=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=HHuqYrFYafJN4/0eKxhqNsbydN9YFFwbIVbSf3w/tayv1bG5juuB0nykTCkOnEoP0
         Cimxk28rvHw5hOGAXPmVz24LGt20avX//WZYjefzCL6DP2pSi2oOGQwHH9S9v3xOox
         nc4bHnJ4vuHpyPmYN0UeNW/by+0Ry0hxSdZqqzwE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <39ccc93ddd8bc64af85541086190e563fa13f038.camel@baylibre.com>
References: <39ccc93ddd8bc64af85541086190e563fa13f038.camel@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: update for v5.3
Cc:     Kevin Hilman <khilman@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 24 Jun 2019 17:47:41 -0700
Message-Id: <20190625004742.74CB9205F4@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2019-06-11 05:38:17)
> Dear clock maintainers,
>=20
> Below is a request to pull Amlogic clock update for v5.3 based on the fix=
es
> we just send. This update add the init() callback to the mpll clock driver
> as discussed in the previous cycle. As promised, the rework to register/d=
eregister
> will follow.
>=20
> Apart from this, we've got a fairly regular update, adding a bunch of new
> clocks to several SoC families. It also adds support for g12b derived fro=
m the
> g12a, which explains the significant line count in the g12a file.
>=20
> The following changes since commit 3ff46efbcd90d3d469de8eddaf03d12293aaa5=
0c:
>=20
>   clk: meson: meson8b: fix a typo in the VPU parent names array variable =
(2019-05-20 12:11:08 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.3-1
>=20
> for you to fetch changes up to eda91833f099277998814105c77b5b12cbfab6db:
>=20
>   clk: meson: g12a: mark fclk_div3 as critical (2019-06-11 11:28:44 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

