Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C6CC2D0E2
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:56:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FB832388B
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600804591;
	bh=q6tNcCWJ6KKNtBVHb8CAdaDosWLH+l1iuGIjDMwYFVE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=oJwJLDA2vByJKwRHWU48S5PH8JT+AXoIORvYy3G+uF5R7WgMjRAZp3IL4dGTvrEZ4
	 pUcaHH6Z9U1oychrNJHmxGaeMv16BQtLN4GR4B89sggi1Vp+MjZmLGpk/l+/8v3C/J
	 pnFipkIdLb4P01aoElIaWqUPYBxRKKL3PaYaMB7c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgIVT4b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:56:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:47628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726576AbgIVT4b (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:56:31 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6BCA820888;
        Tue, 22 Sep 2020 19:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600804590;
        bh=q6tNcCWJ6KKNtBVHb8CAdaDosWLH+l1iuGIjDMwYFVE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XCziGGe6IR46B5iBOPzpfBpKr2zPiO3npHm+nFSj1NmkJAlk4uHmscRr9HSOcngl2
         LiktYFuxgLseqjlDOo1uI3lJnJKnvF5I0SmzgcLKkB2hDBzIArjb2KFMndJPG6sFfL
         yUGV6wyD/f0h4UNH0o4jsERI6UhchQvXzMquSe3o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200921082425.2590990-1-liushixin2@huawei.com>
References: <20200921082425.2590990-1-liushixin2@huawei.com>
Subject: Re: [PATCH -next] clk: mediatek: mt6797: simplify the return expression of mtk_infrasys_init
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Liu Shixin <liushixin2@huawei.com>
To:     Liu Shixin <liushixin2@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 22 Sep 2020 12:56:29 -0700
Message-ID: <160080458901.310579.5223613357760220356@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liu Shixin (2020-09-21 01:24:25)
> Simplify the return expression.
>=20
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---

Applied to clk-next
