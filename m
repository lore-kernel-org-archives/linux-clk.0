Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE542C2D0E2
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:59:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E6AC238D7
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600804757;
	bh=Ei0pV9fycpRVirUGHcQdSDNkEbTY2lV+ZD6vJAyq4d0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=NffkXAl/+WTBcopo6pZ7K6TwVyRzcI+kek4GJb1eZCouqIuQnlG5JoQxpvrmT9V6D
	 LySzMRTb2WMPzHL0LsVK6yh2EqWQK820dTXvpOsxVnGQnxG1VTKYaN+vqwlf4t+K1M
	 M0sIYaQyrbdWLc+KyBldIWkU4JTakrHTNhyVYXHY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgIVT7Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:59:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgIVT7Q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:59:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15053221E8;
        Tue, 22 Sep 2020 19:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600804756;
        bh=Ei0pV9fycpRVirUGHcQdSDNkEbTY2lV+ZD6vJAyq4d0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MsbF6NXpEmwt+rLSwtzoq3TVEK3jUspC7+NuzO7gv8PvAyaTKKmXG38Ut/E+F0s01
         XlRqXpSbWx/gBJF70fFxzVyqj/PL8s1ucRSMy4Zjdup7qFiInij8pjs4Oh6pGb7G/9
         hGfvfQJqPPHdqc3j5MS4MfWNEve+fR5bLFtlSUkM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200907085740.1083-2-t-kristo@ti.com>
References: <20200907085740.1083-1-t-kristo@ti.com> <20200907085740.1083-2-t-kristo@ti.com>
Subject: Re: [PATCH 1/3] clk: keystone: sci-clk: fix parsing assigned-clock data during probe
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, ssantosh@kernel.org
Date:   Tue, 22 Sep 2020 12:59:14 -0700
Message-ID: <160080475480.310579.6914069689446777854@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2020-09-07 01:57:38)
> The DT clock probe loop incorrectly terminates after processing "clocks"
> only, fix this by re-starting the loop when all entries for current
> DT property have been parsed.
>=20
> Fixes: 8e48b33f9def ("clk: keystone: sci-clk: probe clocks from DT instea=
d of firmware")
> Reported-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
