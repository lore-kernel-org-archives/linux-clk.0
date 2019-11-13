Return-Path: <SRS0=K/Jc=ZF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E73EC432C3
	for <linux-clk@archiver.kernel.org>; Wed, 13 Nov 2019 19:18:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 819A720679
	for <linux-clk@archiver.kernel.org>; Wed, 13 Nov 2019 19:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573672704;
	bh=x5oKcg3HSeuyXJJKrQPbij2hWdoRQE5vfY2awGbtJbA=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=Ut2DwPDvZxIRtQFtOqoqVvK+5GKE2aGGKTHV/d3Hj524ilA59Drd3AEEk5m/at/P7
	 FwsDnjDBoE4UXtkZ2khmusua002Lx4Z9BvT86XQH0BKojggJV6W4UkIRjd03sKNp3X
	 z+T0+0gAvsetdf7OBKiHtHjoaKwJjZwPJR6uVNxc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfKMTSX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Nov 2019 14:18:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:40706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbfKMTSX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Nov 2019 14:18:23 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F88E20679;
        Wed, 13 Nov 2019 19:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573672703;
        bh=x5oKcg3HSeuyXJJKrQPbij2hWdoRQE5vfY2awGbtJbA=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=e7bLC1H3VBhRoATvYun0TLSLqKDsySMv1uqHhfEYwvfMA8tWO875VZER6fF3QnW8m
         GVYbcJfrutwVynv7Jh0pYs6FJD40IeG/ON9Qovmn58RYRG0bvLYakEKMLhCTg56WAm
         mEsyG9T/B16Fb4u/pzjUsy6GWTIIAf/pGMwEb0TA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191111144507.4027979-1-thierry.reding@gmail.com>
References: <20191111144507.4027979-1-thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL v2 1/2] clk: Changes for v5.5-rc1
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Wed, 13 Nov 2019 11:18:22 -0800
Message-Id: <20191113191823.7F88E20679@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2019-11-11 06:45:06)
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
a-for-5.5-clk-core-v2
>=20
> for you to fetch changes up to d9b86cc48283112f06738d45031b88bd3f9ecb92:
>=20
>   clk: Add API to get index of the clock parent (2019-11-11 13:59:35 +010=
0)
>=20
> This is an updated pull request that contains the revised version of the
> new API as discussed with Stephen in this thread:
>=20
>     https://lore.kernel.org/linux-clk/1565984527-5272-8-git-send-email-sk=
omatineni@nvidia.com/
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

