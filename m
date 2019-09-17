Return-Path: <SRS0=xl4E=XM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07D0C4CECD
	for <linux-clk@archiver.kernel.org>; Tue, 17 Sep 2019 17:16:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93536214AF
	for <linux-clk@archiver.kernel.org>; Tue, 17 Sep 2019 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568740581;
	bh=uE6AhVL8j4eooIG3BQ78BPcHdd5dDv9JTL43ic8ez5A=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=yJrdIufIb97B0iT+K8b9la4pgxOfI/e/PYdhTB+mjzhdSewCYVxdXV2kZG4haal9R
	 oCrS1Ekcts9U5/7DokuE/2zdv/0u+H4u11117FFhvK6aU4Ya4BJq3NJwSvNQaPmi5z
	 uStaNfXxzt55oy94GnF1eU4Ut02Aejlyi82tKdiE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfIQRQV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Sep 2019 13:16:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:33098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbfIQRQV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Sep 2019 13:16:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97D6A2053B;
        Tue, 17 Sep 2019 17:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568740580;
        bh=uE6AhVL8j4eooIG3BQ78BPcHdd5dDv9JTL43ic8ez5A=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=bNRpfMY5GjzSIJzjhNmwcn69bxWnggybYyMRibIkdsyDlaYoULXbShAdIiUW5GMa5
         gzCZC73UAdWvbatXIl1smkJaJpKChFrH3pZDucsaxxXwMbMJXd7bYMtLHe+mYvL7AQ
         itMRj/LP1CMz6cSqg8yA9rimkfQxH1HQVhFBvsWQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566145424-3186-5-git-send-email-wahrenst@gmx.net>
References: <1566145424-3186-1-git-send-email-wahrenst@gmx.net> <1566145424-3186-5-git-send-email-wahrenst@gmx.net>
Cc:     linux-clk@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <wahrenst@gmx.net>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 4/4] clk: bcm2835: Mark PLLD_PER as CRITICAL
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 10:16:19 -0700
Message-Id: <20190917171620.97D6A2053B@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stefan Wahren (2019-08-18 09:23:44)
> The VPU firmware assume that the PLLD_PER isn't modified by the ARM core.
> Otherwise this could cause firmware lookups. So mark the clock as critical
> to avoid this.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> ---

Applied to clk-next

