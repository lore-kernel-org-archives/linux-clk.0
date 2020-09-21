Return-Path: <SRS0=TK4h=C6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9F8C46466
	for <linux-clk@archiver.kernel.org>; Mon, 21 Sep 2020 20:53:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D660123A51
	for <linux-clk@archiver.kernel.org>; Mon, 21 Sep 2020 20:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600721635;
	bh=oVPiemudKAENmdJztZvZi1Nm9NdDx7SdlYswo3G3U1w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=G6BzxnCDs7CsStGo4fGF6MxiWtybZV47hO1I9wfhat0Bhs3RExosBJfgPIn1OHKqB
	 jdkskSnmAmCxRBGGR+udiKsqNLRem/sKUops5D3rZifBNPj2rZGtTp+YYm41rJzmz5
	 9FmtO1MJZ4e5Il++HgVOHIb9bCEPrrjYvNUhBeSM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727760AbgIUUxz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Sep 2020 16:53:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:60246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726727AbgIUUxz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 21 Sep 2020 16:53:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C066623A1D;
        Mon, 21 Sep 2020 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721634;
        bh=oVPiemudKAENmdJztZvZi1Nm9NdDx7SdlYswo3G3U1w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IPuYeoyMCSEqMF4qIinMwsHowWTaapqYrasDcXmfWtKxwsUZ0LX+0ya5dMJbRPmzW
         LHU92400fJhHhyHfsK3u7ze7leGoRzZgf/mULLowCov/61IMdTt9OTCrEvKrGqbStX
         gbWOkjgUzdjRECv5j9BC2VM/ReykD4Hr782akHWk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jd02ob7bf.fsf@starbuckisacylon.baylibre.com>
References: <1jd02ob7bf.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: updates for v5.10
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Mon, 21 Sep 2020 13:53:53 -0700
Message-ID: <160072163362.4188128.18302366911770748384@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-09-14 10:24:04)
> Hi Stephen,
>=20
> Here are the Amlogic clock changes for v5.10
> Please pull.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bb=
f5:
>=20
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.10-1
>=20
> for you to fetch changes up to 7b5c5720a3689c2c16968ee276b7c47edb64ce0f:
>=20
>   clk: meson: make shipped controller configurable (2020-09-10 11:47:33 +=
0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
