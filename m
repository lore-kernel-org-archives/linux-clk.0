Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64502C6FA86
	for <linux-clk@archiver.kernel.org>; Sat, 17 Sep 2022 08:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbiIQIbm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Sep 2022 04:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiIQIbl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Sep 2022 04:31:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C7F40E28
        for <linux-clk@vger.kernel.org>; Sat, 17 Sep 2022 01:31:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E113B80AFE
        for <linux-clk@vger.kernel.org>; Sat, 17 Sep 2022 08:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB5CC433C1;
        Sat, 17 Sep 2022 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663403497;
        bh=ZbqEAsuZi8sGd4fPpHgkh2fYeHY28QZcC55dcrtx/4w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BPwbaMi8JP/Ll5ib+XVmgA23Hfne7M2PEJ258j+FfHnwZO47mj1H9Ph7s1huCb1XQ
         hJfvY8coUfrNgMWyYMvaGmB7VByXy6Iqm33NMEh0onINW/l/dpKvF3NAScH73TTRRp
         JgF+VI4bbEBpwU+9Dx5bX0RJyCUUDs3C98wGAivOG+OgikmvLyPA+emXU+DGqnMCaL
         ySkoCy0c+Fh3AZbnpnmRVIA19Ng8iSjiZcCGIsTCcPq4KnaDD+mqo4BY9foRP5utdY
         jesr5aiStyMhRrIkO7H6Xe+qaKyWKkIH07Uh3LqVBr/szpUriHjPKvhcsBSCMU3D9X
         eUynloqvk68KQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220902145305.znvsrcrcjrpr343c@houat>
References: <20220816112530.1837489-1-maxime@cerno.tech> <20220902145305.znvsrcrcjrpr343c@houat>
Subject: Re: [PATCH v9 00/25] clk: More clock rate fixes and tests
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Sat, 17 Sep 2022 01:31:35 -0700
User-Agent: alot/0.10
Message-Id: <20220917083137.DBB5CC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-09-02 07:53:05)
>=20
> I believe this series fixes a number of real bugs in the CCF, in
> addition to extending quite a lot the unit test coverage of the
> framework. But if you just don't care, please just say so. I really
> don't want to waste any more time rebasing and sending that series, and
> pinging you on a regular basis if it's not going anywhere.
>=20

I've merged the patch series to clk-next. If things go sideways in the
next week we can figure out what to do. Thanks for sticking with it!
