Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D406C49ED6
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 09:59:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 758E32196E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568023194;
	bh=z18YdR9DjkfQCJRQMn6vKm/qgjme1hf1hZOqxE61B1E=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=1pb+I17RH0nKeymA7rsW4Z1v9uC9O8iy6lg7W/trsuoJXAdBIXJRR+SUGa77xc4Fe
	 K9qnLRnn6aE3zCuULycmaGExOuCOTrSJKgeU0bxlqdisZyz+8FHfzSqOH/KusFRZEk
	 ICl4ItdgjzWhOYGt4Mj1mbktezSL04oAMmCbn67Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729326AbfIIJ7y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 05:59:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:39358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728770AbfIIJ7y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Sep 2019 05:59:54 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 599382086D;
        Mon,  9 Sep 2019 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568023193;
        bh=z18YdR9DjkfQCJRQMn6vKm/qgjme1hf1hZOqxE61B1E=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=doK3Rt+H3uLF1v+xCBrlyNi+vWF+rCBWTAYS3gvWYpv5mrCpkIQwGywSvh73XLqGt
         dZUC4qzxevTsJOUIjD13yt6+ud8nYHavXD8xR95IJdPyLXoeGTl+5Q3e5uHmaokrkW
         +/TKAQ5ZjJs9t5GLR8b67yVZwKVX24k7BtEcVNeU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190826234729.145593-1-sboyd@kernel.org>
References: <20190826234729.145593-1-sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: Drop !clk checks in debugfs dumping
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 02:59:52 -0700
Message-Id: <20190909095953.599382086D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2019-08-26 16:47:29)
> These recursive functions have checks for !clk being passed in, but the
> callers are always looping through lists and therefore the pointers
> can't be NULL. Drop the checks to simplify the code.
>=20
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

