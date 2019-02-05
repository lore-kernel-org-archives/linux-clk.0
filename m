Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B80C282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0C762184D
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549404699;
	bh=ajCeWHoFkPQ4iTVsCuqkTwJG/F26x1ng3nzfVR4joLQ=;
	h=Subject:From:Cc:References:To:In-Reply-To:Date:List-ID:From;
	b=USlHvh9vcJJnOpbvj/VpFM6sA02sGK2M4Uw88lplN3Kp0K/JLirbGOCWfP/pKQa9Q
	 K6hMSQk2PyJF7I50Af3F0sjUhZbRtrYWmwK76JdJ2yX34+dGZGsBblqwf/QjkfETAh
	 XpbtZ4IjJGiQZe1aBqHDbsZqBqulLBOucLf/v6LA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbfBEWLi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 17:11:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:58102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726742AbfBEWLi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Feb 2019 17:11:38 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDE852184B;
        Tue,  5 Feb 2019 22:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549404698;
        bh=ajCeWHoFkPQ4iTVsCuqkTwJG/F26x1ng3nzfVR4joLQ=;
        h=Subject:From:Cc:References:To:In-Reply-To:Date:From;
        b=whbfavl7Vfc0sY7BZBpmeA/gC78RiQHwTjoNvAhK8zVXDPx4qqp9MOB4x8LUOeak2
         0uC823Hj2K9T+DWSF7grVeFUoRZUYVgHOySiLpiN7doLkKIUrv1A3Fo5PgQ1aACOBD
         9nozAMnzbYYWxJQ2qdZ0l2tAQ+CMhAjXPP3CUOAI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL] clk/samsung updates for 5.1
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154940469719.169292.17610587863832409172@swboyd.mtv.corp.google.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20190205111849epcas2p4346fb8152fcbbbe799f4bc44b3eb39f7@epcas2p4.samsung.com> <a6278eec-efec-7c70-42df-9adf1ef1c63b@samsung.com>
User-Agent: alot/0.8
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <a6278eec-efec-7c70-42df-9adf1ef1c63b@samsung.com>
Date:   Tue, 05 Feb 2019 14:11:37 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sylwester Nawrocki (2019-02-05 03:18:45)
>=20
> Hi Stephen, Mike,
>=20
> The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee50=
0c:
>=20
>   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/=
clk-v5.1-samsung

Thanks. Pulled into clk-next.
