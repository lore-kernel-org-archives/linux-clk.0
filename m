Return-Path: <SRS0=Rxbn=UL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B07C31E46
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 15:46:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8469C2173C
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560354379;
	bh=TIygE0O6LC4Ys2s3ExLOdVvORDBsWuNaYO31kRNy4aI=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=1ZOXwp/ho9HGH26QII5M9eF7MiVKaK9mZTwa6VHKQScrYdrE5/3cVfmtSe7aNWBTS
	 lCmbw7VF7OzOILCoKvDkL0ytctNYN0uVi0DBo60s5tu9kd3Y4UeVal3XGI0o3L+kvb
	 K84SUc3fQVMyJFGntlQd0+5h/Q7xngR1aZDxIV+o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437573AbfFLPqT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jun 2019 11:46:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:48226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437621AbfFLPqT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Jun 2019 11:46:19 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75034215EA;
        Wed, 12 Jun 2019 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560354378;
        bh=TIygE0O6LC4Ys2s3ExLOdVvORDBsWuNaYO31kRNy4aI=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=giDlRfYo8kFsbPi9YfCWwmNp5OujByMMzyQIEf70Cfv9ywvyY2EJ/QkTDdp/ujRdi
         Jl9tGdnDpFtZvu5sLysOoeAgTN8+NWyHnqS0mw77VVUx3uBPxRA3oU8AznYVR/z5PL
         MJpNFOuCqxfiNYUt2vRJDz2iS4sSDn2Nbd1R76Ro=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <68c0d022-569c-c529-047a-a0bfae17994d@free.fr>
References: <68c0d022-569c-c529-047a-a0bfae17994d@free.fr>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Feng Kan <fkan@apm.com>
Subject: Re: [PATCH v1] clk: xgene: Don't build COMMON_CLK_XGENE by default
User-Agent: alot/0.8.1
Date:   Wed, 12 Jun 2019 08:46:17 -0700
Message-Id: <20190612154618.75034215EA@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marc Gonzalez (2019-06-12 08:03:56)
> Building COMMON_CLK_XGENE is pointless, unless we're building for
> an XGENE system.
>=20
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---

Applied to clk-next

