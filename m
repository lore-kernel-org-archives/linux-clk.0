Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B67BC433DF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 00:44:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0245121D40
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 00:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602636286;
	bh=55dqlWRLnLGRi6X903ahBwmzS2gocnrTqB9hbmLyb8s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=2EXwPr7OoACrwijXSXJpOX73EPQ98GiD0QHyDgut27ncKAUJEYbTSmWPe8w8FpRXX
	 3C/trmAg+YWp8nNQ9fCZTncZk56NQpwMQxwGpvcD2BgN84LuRyTHMAHptEjRI+s442
	 DG8t3AhbQw0kYciZ7jFgjPgBawiRYog7bcI26zKo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730617AbgJNAom (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 20:44:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:56034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727837AbgJNAol (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 20:44:41 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C4CD208B3;
        Wed, 14 Oct 2020 00:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602636281;
        bh=55dqlWRLnLGRi6X903ahBwmzS2gocnrTqB9hbmLyb8s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RG61ZDaD41n55BRGjU9an5KXBHR8uClOvXcOFWSb99yl16mXpuvAJRR3kFdvjDeah
         0xWsA1+WgaAj15gdQeMiKvQ+ExeroYz3YVzCO1SLTK6/AsZVSLaQasNtocl09w87iM
         qVtYkkifDKRCTEGoyZjjH5j1ZIHGlO65Q0hL+F0E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1601233948-11629-10-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr> <1601233948-11629-10-git-send-email-Julia.Lawall@inria.fr>
Subject: Re: [PATCH 09/18] clk: mvebu: ap80x-cpu: use semicolons rather than commas to separate statements
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Valdis =?utf-8?q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Julia Lawall <Julia.Lawall@inria.fr>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 13 Oct 2020 17:44:40 -0700
Message-ID: <160263628032.310579.6410850336431173861@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Julia Lawall (2020-09-27 12:12:19)
> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
>=20
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>=20
> ---

Applied to clk-next
