Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B159C43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 22:44:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 270492184D
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553899487;
	bh=BYv/zL2J7g4n3oAFeloCkQo1HtprwDhDhvxPLIAa02E=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=EJcxaevz15+vNQUKUdpmqGgCTrKAC6NWTS8Xp4K2EOI7LyrdC4ZvzktQlahuQcgRr
	 01k4cUjUxih6PDarq54Ov2fDKzl3CY/ZYmHmkm/9VxEFkvW9WJ6nX+Z4wG6eGBbeGV
	 nKwtPEok7gOJCAKkFXqKnLiazS1bXLWQK2gLC4WY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730500AbfC2Woq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 18:44:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:53918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730476AbfC2Woq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Mar 2019 18:44:46 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21F8E217F5;
        Fri, 29 Mar 2019 22:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1553899486;
        bh=BYv/zL2J7g4n3oAFeloCkQo1HtprwDhDhvxPLIAa02E=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=CYiLZffA80afx371M7mZxL8chGutlkobzIoBaRMj83ahbDdInMooQ5cZ3bSlbnpIc
         Wgh8spvwmlohbmIp6H0hJ60hr9lKxaNWw9rIO9kVi2VAFjwrB2OnQLZwfPBd1GcDhn
         3xdATUtfN+H7x/Njus8qFHateNG9BGkwxxHENW+g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d47276b2-73fe-3046-84d1-84d7a08b248b@baylibre.com>
References: <d47276b2-73fe-3046-84d1-84d7a08b248b@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.1, second round
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <155389948536.20095.9385568409537349896@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 29 Mar 2019 15:44:45 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Neil Armstrong (2019-03-29 02:14:07)
> Dear clock maintainers,
>=20
> Below is a second request to pull amlogic clock fixes for v5.1
> These changes fixes meson8b booting where a wrong PLL frequency is select=
ed
> when updated by cpufreq, and removes an annoying warning and invalid retu=
rn on
> an unconfigured vid-pll-div recalc_rate.

Thanks. Pulled into clk-fixes.

