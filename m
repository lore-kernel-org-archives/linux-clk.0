Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7C2C282DD
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 18:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E168214AE
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 18:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556042547;
	bh=paa9W1fNpez+YS4XkjuYtKNzmX90CDrx3cz/r5ctvlQ=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=dI+yBM/hzvrOLGgtAIAKHZgNsQIsEac0ppw1uA/M3COp/rwm/JIOxEpzB3CZEkkMe
	 0e2fL5kmE6rdT0V8RnRt6yXIBx8SowzNg5wwTNePuAWzB0QVZBCONlBLVJnvEtEaDf
	 2SzIhPNwXyU5yzzdmuWY5CsIaNqB140GsUOmgsPE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbfDWSC1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Apr 2019 14:02:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:41596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727737AbfDWSC0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Apr 2019 14:02:26 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D37120685;
        Tue, 23 Apr 2019 18:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556042546;
        bh=paa9W1fNpez+YS4XkjuYtKNzmX90CDrx3cz/r5ctvlQ=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=AFHPsviFZawVDkFU4eUGFtC3D9Uv/EkXo02SxT9sdk7D4ItWB7S/ibEgY5RG1bOQm
         /Q/j3Pxvx2Cm1q6UpoSeFtWKeLoEakDpNXKLJd632Leliw5CGcWtmtbJPMm5SCPybt
         GoRVa8s4IcB4QS0J04YOxoA3I0FR+w/3ZMD9/FJ4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdXpBHBPqEBHqphYbOVhgZyOFLSUPgB__5P-FFOehgWfbQ@mail.gmail.com>
References: <20190404113722.20634-1-geert+renesas@glider.be> <155500418814.20095.8564288702076959777@swboyd.mtv.corp.google.com> <CAMuHMdXpBHBPqEBHqphYbOVhgZyOFLSUPgB__5P-FFOehgWfbQ@mail.gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [git pull] clk: renesas: Updates for v5.2
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <155604254524.15276.8321672595881237309@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 23 Apr 2019 11:02:25 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2019-04-23 00:46:50)
> On Thu, Apr 11, 2019 at 7:36 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Geert Uytterhoeven (2019-04-04 04:37:22)
> >
> > ----8<----
> > From: Stephen Boyd <sboyd@kernel.org>
> > Subject: [PATCH] clk: renesas: rcar-gen3: Remove unused variable
> >
> > This variable is no longer used and the compiler rightly complains that
> > it should be removed. Drop it to silence the following:
> >
> > drivers/clk/renesas/rcar-gen3-cpg.c: In function 'cpg_sd_clk_register':
> > drivers/clk/renesas/rcar-gen3-cpg.c:386:15: warning: unused variable 'i=
' [-Wunused-variable]
> >   unsigned int i;
> >
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Fixes: b953eaaeb58e ("clk: renesas: rcar-gen3: Fix cpg_sd_clock_round_r=
ate() return value")
> > Signed-off-by: Stephen Boyd <sboyd@kernel.org>
>=20
> Thanks pulling, and for fixing this silly oversight.
>=20
> /me wants his gcc-4.1 back...

Reminds me that I should roll llvm/clang into my testing flow. Is it
working yet? Last time I tried it wasn't working.

