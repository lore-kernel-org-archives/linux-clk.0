Return-Path: <SRS0=lEqg=QF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3769C169C4
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 18:13:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69E5321873
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 18:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548785592;
	bh=0qLM2OZxUd82IviRpfQDw00E/Clp0i/bMWEGlb9RTq4=;
	h=Subject:References:Cc:From:In-Reply-To:To:Date:List-ID:From;
	b=ifs6G8d76FedQDGRTQKEpAuSkfc109aQINqDfCOslp4JOrP9Mu1ZmOj4wMSYRnzqV
	 1HYvcQtXJ97HOR/p4wRAkiAj1zKqbyjRE4hljo4xQVBImtt6HGEIaZ6oH/XPakSuVf
	 gGjvEX/IPgEmqrb0JaVl1pnBRR0iPutubEL6jrYk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfA2SNM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jan 2019 13:13:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:49090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727492AbfA2SNL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jan 2019 13:13:11 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3761F20857;
        Tue, 29 Jan 2019 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548785591;
        bh=0qLM2OZxUd82IviRpfQDw00E/Clp0i/bMWEGlb9RTq4=;
        h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
        b=tLa8IM58T0QExdlUuuYp5wBw2njuo1Ku2ZMry/4VaeZrIE1Z72kMN+LB42CC3/pMb
         hoDTJXGuM9uoiZ3v4dCJbfBUiGDXulPhpJ3QMprO2MlL1hIbGaeFSKCCm00n9MvNlZ
         tNaZjzkG1s/3BIY5HdSbv8dCUeaovMuxeZ26cDuE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: ingenic: jz4740: Fix gating of UDC clock
References: <20190125153436.13517-1-paul@crapouillou.net> <154844250661.136743.15303302299846585853@swboyd.mtv.corp.google.com> <1548444298.1804.2@crapouillou.net>
User-Agent: alot/0.8
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1548444298.1804.2@crapouillou.net>
Message-ID: <154878559039.136743.10189442694979275708@swboyd.mtv.corp.google.com>
To:     Paul Cercueil <paul@crapouillou.net>
Date:   Tue, 29 Jan 2019 10:13:10 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Cercueil (2019-01-25 11:24:58)
> Hi,
>=20
>=20
> On Fri, Jan 25, 2019 at 3:55 PM, Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Paul Cercueil (2019-01-25 07:34:36)
> >>  The UDC clock is gated when the bit is cleared, not when it is set.
> >>=20
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net=20
> >> <mailto:paul@crapouillou.net>>
> >>  Tested-by: Artur Rojek <contact@artur-rojek.eu=20
> >> <mailto:contact@artur-rojek.eu>>
> >>  ---
> >=20
> > Any Fixes tag for this?
> >=20
>=20
> Fixes: 2b555a4b9cae
>=20
> Should I resend?
>=20

No need to resend. Is this fixing something that's broken in the v5.0-rc
series? I'm trying to understand if this is a critical fix or a
non-critical fix that can bake until the next release cycle.

