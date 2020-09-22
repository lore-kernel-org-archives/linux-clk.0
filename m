Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC7BC4363D
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:26:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE1A7238D6
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600802807;
	bh=nO/gbZ0uRCDfYVMNqf3FQWW5I6UcN5Cp/FPdB3/1+BM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Z60hl43e/CzxzgE9FxfQyIjc97GBjij7JirZwXWsy5XfbsOMyI1/yiN5Q0LWwH+9m
	 jliOfdkz2c5dH7R8JwXx/2k6Jg/OrkO9G9Cck8gZuRxFlAVBXmmidCW845zbzF9Urj
	 nsq9EU7pRzKQKUiZ5zv6pSzhTauR1Svz17/CinkI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIVT0r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:26:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:37480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIVT0r (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:26:47 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED12023787;
        Tue, 22 Sep 2020 19:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600802807;
        bh=nO/gbZ0uRCDfYVMNqf3FQWW5I6UcN5Cp/FPdB3/1+BM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fdhoQCFBxyBE3tJWbAouRgDD2evEGFfKyWmccAAtsjrjiSP6MrBg4c4Wz5nGEvV28
         PcSle7dD0kA0CQqqEOZ69+tmRvQX3cYwn14VlWztkcfw0r616q/zHYo85qQdc7YEW8
         XBm1GB5z/Dt2n2dopBg7P0RblpEBPkucUP2dz+9U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200922124046.10496-1-m.szyprowski@samsung.com>
References: <CGME20200922124053eucas1p200d7381abf1d14e932f41ebc0f458c64@eucas1p2.samsung.com> <20200922124046.10496-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos4: mark 'chipid' clock as CLK_IGNORE_UNUSED
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date:   Tue, 22 Sep 2020 12:26:45 -0700
Message-ID: <160080280577.310579.7248699611327651647@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Szyprowski (2020-09-22 05:40:46)
> The ChipID IO region has it's own clock, which is being disabled while
> scanning for unused clocks. It turned out that some CPU hotplug, CPU idle
> or even SOC firmware code depends on the reads from that area. Fix the
> mysterious hang caused by entering deep CPU idle state by ignoring the
> 'chipid' clock during unused clocks scan, as there are no direct clients
> for it which will keep it enabled.
>=20
> Fixes: e062b571777f ("clk: exynos4: register clocks using common clock fr=
amework")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Applied to clk-fixes
