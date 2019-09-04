Return-Path: <SRS0=96bN=W7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E8DC3A5A8
	for <linux-clk@archiver.kernel.org>; Wed,  4 Sep 2019 18:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E2672087E
	for <linux-clk@archiver.kernel.org>; Wed,  4 Sep 2019 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567621240;
	bh=vdMbmVjjTO6mMyIIYYm7YH1Q1zAWUyaaFnHjlanMDJ8=;
	h=In-Reply-To:References:Cc:Subject:To:From:Date:List-ID:From;
	b=hGb2bqGkwfHAV59RiwHQL1EEJtmGPj1dU4KegUBaVTvVnDHjnuc2suFPOWfAfJRy8
	 iueLiI5DV22jmKNCbC3wrOKLXUJyP/z0n5JeH5G3dv0OfjjQyXofujiU0ayk7G0b5m
	 p9Z5t1ULerTI9bm+WGxNbxExnJcpa8KRP8MuTSpI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388951AbfIDSUj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Sep 2019 14:20:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:36038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732951AbfIDSUh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Sep 2019 14:20:37 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DDD5D2087E;
        Wed,  4 Sep 2019 18:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567621237;
        bh=vdMbmVjjTO6mMyIIYYm7YH1Q1zAWUyaaFnHjlanMDJ8=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=qkzrWn9hRTtyWTZadh8wDxLaq37la4V47TiJR0wJim2AeD0jdvxzto1BNauOYHD8L
         vSt2P5r9xp+kzTcP3F4edaOHXIQV40nm0uqSrPcxTfr7RmXLWo+ZSnEPxP+zEp1vbm
         0ExThl3JL0gZgfjThESg82bqpbQUL2FQfL71tk8M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <237561e9-4ca2-44d3-9f43-e5cee1c5fd4c.lettre@localhost>
References: <237561e9-4ca2-44d3-9f43-e5cee1c5fd4c.lettre@localhost>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 5.4
To:     Maxime Ripard <mripard@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 04 Sep 2019 11:20:35 -0700
Message-Id: <20190904182036.DDD5D2087E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-08-23 07:29:25)
> Hi,
>=20
> Please pull the following changes for the next release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca=
4b:
>=20
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-for-5.4-1
>=20
> for you to fetch changes up to 65818ad0815f3a2ba6a41327cce8b600ee04be32:
>=20
>   clk: sunxi-ng: h6: Allow I2S to change parent rate (2019-08-21 17:20:31=
 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

