Return-Path: <SRS0=Lb92=5B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC5AC0044D
	for <linux-clk@archiver.kernel.org>; Mon, 16 Mar 2020 18:25:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12F48206C0
	for <linux-clk@archiver.kernel.org>; Mon, 16 Mar 2020 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584383123;
	bh=nRWJJtsRADloIZb8qCPh88PFbZufGoEJuHXemsNN3CI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=pjqkri6wSRgZ8VyOi8+Ku7r+tN9sQJCUmUgrmrNSkGRdM8ZZ8GP+bNNykUgrfdexI
	 4nF5J2cqG1xTeKk5Rtez1CRysXdIV+9tyIcqP/hpcQphx1cceLQLuXpoHngbFfTghc
	 sZbjHJPUJ5IXMq02DVk8y8Ma4NV6VlFAfZxO+ZQo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732242AbgCPSZW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Mar 2020 14:25:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731967AbgCPSZW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 16 Mar 2020 14:25:22 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F90A20409;
        Mon, 16 Mar 2020 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584383122;
        bh=nRWJJtsRADloIZb8qCPh88PFbZufGoEJuHXemsNN3CI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fcc6D+Ro5afzwHWZUyEIDj+ITZviR7p+k23seLWvcYd6R4EjebFo0BOPcg8fud/gx
         C7An/N1SdTnIJboeLlxKcKX+cVk7fM4Y0fHB+76waEuAZYIxFvIvzW2Ua1nAQ+tfkf
         igjtnfdD35UJeODDG2xeiMHrnEuOa0DW8Zz1eQBM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200313040437.GA8483@wens.csie.org>
References: <20200313040437.GA8483@wens.csie.org>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 5.7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
To:     Chen-Yu Tsai <wens@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 16 Mar 2020 11:25:21 -0700
Message-ID: <158438312122.88485.16295653061101614698@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chen-Yu Tsai (2020-03-12 21:04:37)
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862=
b9:
>=20
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-5.7
>=20
> for you to fetch changes up to b998b75f8603c37c8a43a3d849cd2c4929adf402:
>=20
>   clk: sunxi-ng: sun8i-de2: Sort structures (2020-02-12 19:01:16 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
