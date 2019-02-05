Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4A8C282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:08:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07CF02184B
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549404505;
	bh=KWVtyMjk3Dd76XzJLlZ0uMQvxFUuccAadcOGv0zt/MQ=;
	h=Subject:From:Cc:References:To:In-Reply-To:Date:List-ID:From;
	b=bH5cnbQyDAf0+pLHulnaB638zIG19v/uoHqGY/hMQCrZWprXyaNQbwNjRwDtwjmtN
	 3Ky5xcqtiA1wKCAwmXZ/WmUu8PxUcSH+EB0+iJLtsA/mHOrdPumUArbiXfvld1PGXw
	 aPV7O4dd1Y41zJpreSWw3r4NZHbwEq+1EMTkTXyM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbfBEWIY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 17:08:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:55896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbfBEWIY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Feb 2019 17:08:24 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C64FD217F9;
        Tue,  5 Feb 2019 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549404503;
        bh=KWVtyMjk3Dd76XzJLlZ0uMQvxFUuccAadcOGv0zt/MQ=;
        h=Subject:From:Cc:References:To:In-Reply-To:Date:From;
        b=YLmzbTmiwtbDWOrAyK4Ay7nYxZ+N0l1OFZoLbf43geLKnhXpcOBR6bLCvDZCACu3t
         6wVWXuZG+j15yv+FcVxd+Xvq/nUVag+V+SmcdMny2YOABY22prmAEF6dz88i1yoCRd
         J41kuXXHAohEVoFBelWcYrUlLimiyTUpI7gt1ybQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL] Rockchip clock updates for 5.1
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154940450309.169292.16565688865245958654@swboyd.mtv.corp.google.com>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <48408534.cOKhDiQbmB@phil>
User-Agent: alot/0.8
To:     Heiko Stuebner <heiko@sntech.de>,
        Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
In-Reply-To: <48408534.cOKhDiQbmB@phil>
Date:   Tue, 05 Feb 2019 14:08:23 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2019-02-01 03:17:47)
> Hi Mike, Stephen,
>=20
> looks I can re-use my introduction from 4.20 and 5.0 - no big changes
> again this time.
>=20
> A rate_parent flag and some fixup for the fractional part of a PLL
>=20
> So please pull.

Thanks. Pulled into clk-next. If you like I can pick patches directly
from list if you send out a reviewed-by tag on the patches. I'm happy
either way.

