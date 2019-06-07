Return-Path: <SRS0=Ii/d=UG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D409C2BCA1
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 21:03:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D11CC2146E
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 21:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559941437;
	bh=21wXy+paGdhzNs+0ji+DAcFq4DUlfWJQDeLQGjUVyAA=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=qD0uEiZD53kmk33R1SLbrtbYFwjm+iXdH41VjD0lZh0HjVmigPkxAQalfYUrKQxyW
	 NDU0OGVMdUmUhP7fYuLQP9IdiaMaQdHRAnWDjGphSI7GQ3xauls2nLZEPDqZw89jbc
	 j9HAza3uOSyRCiMfHuHVdKkchPL08MpgTR/wN0sU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730737AbfFGVD5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jun 2019 17:03:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:38462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730242AbfFGVD4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Jun 2019 17:03:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 281B6212F5;
        Fri,  7 Jun 2019 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559941436;
        bh=21wXy+paGdhzNs+0ji+DAcFq4DUlfWJQDeLQGjUVyAA=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=hcwyDnTya9luorwW95GfDI95tDJTA/1j7gg+wb1fXCJpcNDOMLdkN1MkwNJ1hvngw
         UgEachVpLT4tCa0e5cEubIu8GfccsrreSkC5xOimRlZxVQvH5uhMjIRBZNslT4isdS
         2z0PkE+C6/8TCtRePwkTAnC/SL2yyEBzdemTax1g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190502212502.24330-4-paul@crapouillou.net>
References: <20190502212502.24330-1-paul@crapouillou.net> <20190502212502.24330-4-paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 4/5] clk: ingenic/jz4725b: Fix incorrect dividers for main clocks
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 14:03:55 -0700
Message-Id: <20190607210356.281B6212F5@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Cercueil (2019-05-02 14:25:01)
> The main clocks (cclk, hclk, pclk, mclk, ipu) were using
> incorrect dividers, and thus reported an incorrect rate.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next

