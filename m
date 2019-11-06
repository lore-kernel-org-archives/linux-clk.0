Return-Path: <SRS0=SbWe=Y6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDC9C5DF65
	for <linux-clk@archiver.kernel.org>; Wed,  6 Nov 2019 20:46:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E32942187F
	for <linux-clk@archiver.kernel.org>; Wed,  6 Nov 2019 20:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573073161;
	bh=8EobBLdg79BFoLW8z+BryoGeSM6L13OfS+/VN6yROKM=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:List-ID:From;
	b=Z4Y9CGKwZwz1rPtU3wQ3lCJw6gF7tgfDieX4h135x+bHkfNav/m6wFhplRxAU3ESo
	 us4FBOKlZmlvv8PaRzSeOiEpUQ86qFxiJFBXW7GXy91YugB3KK48ED3nYmzDi2MPxG
	 4oZxXFEjeaFQkTBcveMDkc8/ySFfunkdJn8rQHDQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbfKFUqA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Nov 2019 15:46:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:33426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727376AbfKFUqA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Nov 2019 15:46:00 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B14A120869;
        Wed,  6 Nov 2019 20:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573073159;
        bh=8EobBLdg79BFoLW8z+BryoGeSM6L13OfS+/VN6yROKM=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=oY84uH53kicG5g/Aec/DaE31sE1u7PRypCK2hfInsLsk49g4rcGFVwm/mTzTp2qxR
         W3w0jwu/xCvpsDorwK83rau4PwqFn9J0ISe4eXPbJzCIX1E21PuCc45j0Guls4slmO
         gSRCBY4GHRSQfb5/m0Mp+4JkYIf4UAAd8aOMr170=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191018101212.26432-1-geert+renesas@glider.be>
References: <20191018101212.26432-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.5
From:   Stephen Boyd <sboyd@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 12:45:58 -0800
Message-Id: <20191106204559.B14A120869@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2019-10-18 03:12:12)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c=
5c:
>=20
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.5-tag1
>=20
> for you to fetch changes up to 56278c8fcb71874d591907d654272d511ce3597c:
>=20
>   clk: renesas: r8a774b1: Add TMU clock (2019-10-07 14:29:53 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Picked this description from here too.


