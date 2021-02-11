Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBD1C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:58:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C93F64E15
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbhBKT6I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:58:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:39244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231451AbhBKT5a (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:57:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75F8B64E65;
        Thu, 11 Feb 2021 19:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073410;
        bh=f2KCIDg1cA6kyJNqiIcIcfoqmY7iHB8bPiipmbCWDYM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fR4YgIz2hikzERmTt34mSoAFlvOrUAgD3f6Wr8jRQSMMxgiO8IJJflQqH+6wkNMao
         gBXFKfH/J1uZlrfWZSRE9qBIU0AtBL3sTYJ+Yqozb6rt6SzVs+cReC+vGyzxVTSMy5
         UOoPXKos3zqZXxc6AlsR5s+yuioXv1f58mUZj2NEiN/KSGppikKgpXd5O+RYmnJTO3
         f3p0qUyA2t/yvzPHDHPYW5aNs7i8X9d9zAgbiAjJp0OX84XbW0/Rf738ye0r00G7+4
         JvKfKLHdkGMfm908fy23+FFX6lCc+yvrIXgsPrepHosRVVNLdDoo3ioyWWoQCNxLIp
         lDE94lSwMdC9w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-15-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-15-lee.jones@linaro.org>
Subject: Re: [PATCH 14/21] clk: clk-fixed-mmio: Demote obvious kernel-doc abuse
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Jan Kotas <jank@cadence.com>, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:56:49 -0800
Message-ID: <161307340929.1254594.14380650909266680969@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:33)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/clk-fixed-mmio.c:62: warning: Function parameter or member '=
pdev' not described in 'of_fixed_mmio_clk_probe'
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Jan Kotas <jank@cadence.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
