Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E440AC282C5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:15:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA7A2217D7
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548360928;
	bh=qAgIuiiFMMSlBJuj6KD5lRXAnixbbCorDAWRwbBcbiY=;
	h=Subject:References:Cc:From:In-Reply-To:To:Date:List-ID:From;
	b=OzE69F78bcPJJRHXkaitHli3n/U23uXpWEdf2dioxpqbHqI/0JJN+S4DS/6pnqNAS
	 5Bu7l0qkiZsRLrGLaZb94s4T3FPkDr61Fc/ER2ORBqvD49F/6UXXN3DGMnJu50uz1L
	 0bAMVhc/zi8r6aa0u1lBx8zjy7pzjko0EJ+IzJBM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbfAXUP1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 15:15:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:49618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730092AbfAXTYY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Jan 2019 14:24:24 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F33521901;
        Thu, 24 Jan 2019 19:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548357863;
        bh=qAgIuiiFMMSlBJuj6KD5lRXAnixbbCorDAWRwbBcbiY=;
        h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
        b=Xwrne2qwoFS7v0HNLgjXWpp6a41BqviHXbf2z+P3qXRq89QVnqS1UmudTHQUtOd3R
         1BDWEwXB5wwMQyJOoWutiDmW2o2Hn9tYgGu4/SRfBXP6lbClIS7gAOR/DiqzaTxcyN
         FABwW8dhU12QrAYaEbdo71MCbbsuSBcv8psKG+jc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] clk: ti: Fix error handling in ti_clk_parse_divider_data()
References: <20190115194625.GA1074@kadam>
User-Agent: alot/0.8
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190115194625.GA1074@kadam>
Message-ID: <154835786296.136743.12154336975596919287@swboyd.mtv.corp.google.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Tero Kristo <t-kristo@ti.com>
Date:   Thu, 24 Jan 2019 11:24:22 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2019-01-15 11:46:25)
> The ti_clk_parse_divider_data() function is only called from
> _get_div_table_from_setup().  That function doesn't look at the return
> value but instead looks at the "*table" pointer.  In this case, if the
> kcalloc() fails then *table is NULL (which means success).  It should
> instead be an error pointer.
>=20
> The ti_clk_parse_divider_data() function has two callers.  One checks
> for errors and the other doesn't.  I have fixed it so now both handle
> errors.
>=20
> Fixes: 4f6be5655dc9 ("clk: ti: divider: add driver internal API for parsi=
ng divider data")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-fixes

I'm going to add Tero's ack to this because it isn't really that
different.

