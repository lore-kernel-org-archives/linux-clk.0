Return-Path: <SRS0=u/0O=7J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E4DC433E0
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 06:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4CE5208B8
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 06:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590561365;
	bh=SW76oimJYBSq1jfvOmB7+fzPc+VS1jxwlYYMtvl+iWU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=LOXFrjjNhe4d99AoycU1hkdYpyekiTXO9qtp+gceQ2hrK9V5STjPsnwMhpwEbRXLs
	 /cWzzLi/7mEG2jyRqSG7fYcJ4DhsHJnDZdJpFlnrsjvskq9T7JF+gj6bAyCoAkyjfu
	 ZcOK7uQ0UiKJfj11lBhU/zwmwv9Xgebhp3xRHM4w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgE0GgF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 May 2020 02:36:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:57442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728761AbgE0GgF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 May 2020 02:36:05 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E860B207E8;
        Wed, 27 May 2020 06:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590561365;
        bh=SW76oimJYBSq1jfvOmB7+fzPc+VS1jxwlYYMtvl+iWU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FZ7h3hvE5tRccZG6mQ1UUm85PO2lQCDNk+TIkuog3bzNkqB77/mUOFzyAUzk2x3IF
         8MvSrhvefyrQB7FxBl9ahyoIudcPdwg0Dip2smDd5VRltpYCDRT3iK5DHz3GBJt8ce
         a+A38TU6ztsVmTNYZXNwcIkC+h3x/yiTptGvRIKY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e563eea358181446dc42c99e842c33f7ce911936.1589460539.git.robin.murphy@arm.com>
References: <e563eea358181446dc42c99e842c33f7ce911936.1589460539.git.robin.murphy@arm.com>
Subject: Re: [PATCH] Revert "clk: rockchip: fix wrong mmc sample phase shift for rk3328"
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
To:     Robin Murphy <robin.murphy@arm.com>, heiko@sntech.de,
        mturquette@baylibre.com
Date:   Tue, 26 May 2020 23:36:04 -0700
Message-ID: <159056136421.88029.13822814553469355422@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robin Murphy (2020-05-14 05:58:14)
> This reverts commit 82f4b67f018c88a7cc9337f0067ed3d6ec352648.
>=20
> According to a subsequent revert in the vendor kernel, the original
> change was based on unclear documentation and was in fact incorrect.
>=20
> Emprically, my board's SD card at 50MHz and eMMC at 200MHZ seem to get
> lucky with a phase where it had no impact, but limiting the eMMC clock
> to 150MHz to match the nominal limit for the I/O pins made it virtually
> unusable, constantly throwing errors and retuning. With this revert, it
> starts behaving perfectly at 150MHz too.
>=20
> Fixes: 82f4b67f018c ("clk: rockchip: fix wrong mmc sample phase shift for=
 rk3328")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---

Heiko?
