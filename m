Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C586C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 11 Oct 2022 01:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiJKBP2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 21:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiJKBP1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 21:15:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32DA14F699
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 18:15:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9FE2E6101F
        for <linux-clk@vger.kernel.org>; Tue, 11 Oct 2022 01:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C9CC433C1;
        Tue, 11 Oct 2022 01:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665450925;
        bh=pgmX8dBy+GscbDpU1QFYafBwFlYiB7yFAF0wdBPrCAg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Sr0zcLNy2vx+sTMDiZ2vlQrQgI0IPPsBhCEsds1No7ibssupkOp5yrHeeJG0HsJW1
         zPxdBO4cCqkEJS6X5yiEipFiUWV7OYXt2dqs2KAJFFMw9VGymcGSmZcBPRZOk9W+cX
         JPfI9F54FIYw5qJi1ehT2dH/YS3texXhkxKaWcMRADzwwEEnVK/ogiE+/Y4OKJ2qDB
         AIcx0FODo7iBlcW8P3t5/y85/FQ0H0KzHsvwg8BJsb6PJ3UL63OBy55tcsgfLTfyAx
         kxG9kM5FsthgNBKe4Q7ezmlwPvi8f0e/coaUL5IFvCMWzaUQq8smMIHr0UpMOOO2iN
         960YfUAilGOqg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221010145256.7zikxmkhjgor6esx@houat>
References: <20220816112530.1837489-1-maxime@cerno.tech> <CGME20220816112640eucas1p271d97cbe81481a8083fa6540c26fb324@eucas1p2.samsung.com> <20220816112530.1837489-14-maxime@cerno.tech> <0acc7217-762c-7c0d-45a0-55c384824ce4@samsung.com> <20221004205952.C7287C433C1@smtp.kernel.org> <20221010095608.ak6pnxslmvzhayce@houat> <20221010145256.7zikxmkhjgor6esx@houat>
Subject: Re: [PATCH v9 13/25] clk: Set req_rate on reparenting
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Mon, 10 Oct 2022 18:15:23 -0700
User-Agent: alot/0.10
Message-Id: <20221011011525.01C9CC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-10-10 07:52:56)
> > > I see a problem. __clk_recalc_rates() uses 'core->rate' as "old rate"
> > > but we'll have already destroyed that by calling
> > > clk_core_update_orphan_child_rates() and assigning 'core->rate' to the
> > > recalc_rate. Are clk notifiers being used? If so, it will probably be
> > > confused because the notifier will see the same rate as what was set
> > > instead of the old rate. cpufreq is probably the biggest user of clk
> > > notifiers.
> >=20
> > That's a very good point... Which raises another one. Would it be ok to
> > notify users on a reparenting? It would make sense to me, since the rate
> > could be affected, but it's not been done so far so I'm not sure what
> > the implications might be
>=20
> Turns out it's already done, and the rates were indeed off like you
> pointed out.

Yes reparenting does notifiers.

>=20
> > > We should add a test for that so when a clk is reparented the old rate
> > > is still what we expected it to be when the notifier is called.
> >=20
> > I can do it, but I'm not sure what you want to test exactly. Let's
> > assume we have a mux with a given rate, we change the parent of that
> > mux, the rate is likely to be changed as well and we should put in the
> > notifier that the old_rate is the first parent's, and the new rate the
> > one of the new parent?
>=20
> I implemented this, and this catches the issue you pointed out, so it
> looks like a decent test :)

Awesome!

>=20
> > > Also, clk_core_update_orphan_child_rates() is poorly named. It doesn't
> > > care at all that the clk is an orphan. It seems like another
> > > __clk_recalc_rates() without the notifier. I have no idea why we need
> > > another recalc rates.
> >=20
> > You're right, the only difference between the two (aside from the
> > notifiers) is that req_rate is also updated in
> > clk_core_update_orphan_child_rates().
> >=20
> > > Possibly setting the req_rate in __clk_recalc_rates() is sufficient.
> > > Or maybe we should bail out if the clk doesn't have the orphan bit
> > > set.
> >=20
> > Either way makes sense to me, the latter is probably less intrusive, but
> > the former allows to consolidate __clk_recalc_rates() and
> > clk_core_update_orphan_child_rates(). Which one would you prefer?
>=20
> I ended up removing clk_core_update_orphan_child_rates() entirely,
> adding the test, and submitting it here:
> https://lore.kernel.org/linux-clk/20221010-rpi-clk-fixes-again-v1-0-d87ba=
82ac404@cerno.tech/
>=20

Cool, thanks. Let me go stack that on top. I'd prefer to send that
branch to Linus in the next couple days.
