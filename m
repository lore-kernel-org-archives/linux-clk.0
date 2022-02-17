Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331DCC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 17 Feb 2022 22:23:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343727AbiBQWXs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 17:23:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245348AbiBQWXr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 17:23:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AC528E20;
        Thu, 17 Feb 2022 14:23:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C66D9B82486;
        Thu, 17 Feb 2022 22:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7B3C340E8;
        Thu, 17 Feb 2022 22:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645136608;
        bh=TUZMJDaNFLISGttZkDyJsEKzOBEaiEn8hTGWzb79eRc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VQ/gRjnxADZT7CtXPeH3YxF406049C7RCNhgcpiliZzFaOwCusPGnO9TiwcQkCLG0
         zcVoSccWJ614plFJaYnp6E2H9X8rsccAw6vjYVlE6LyG/IhOFm9NJMN0u5/6g4n3Pg
         qg8rf0SkORh6iGvPXL3rT/ozmMGVSXGA6voTzcFcU/gMoOtHku9H9hDVOfu5CgFMPo
         0bjZuO8La29Qqr21K9yoBJCxrC9j83EsfbH0GJJv9y4ztbKnjDSvYpO15KtgbpKiLx
         wacx0ieKaLYPJ2gTGlHfk04lTNNu450czxa4rReA5BOIjo34PWe93Mf7NXa6SA5xic
         Cay/8mL8dWD5g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220215084412.8090-2-marex@denx.de>
References: <20220215084412.8090-1-marex@denx.de> <20220215084412.8090-2-marex@denx.de>
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Thu, 17 Feb 2022 14:23:26 -0800
User-Agent: alot/0.10
Message-Id: <20220217222328.7F7B3C340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-02-15 00:44:11)
> Some platforms require clock to be always running, e.g. because those clo=
ck
> supply devices which are not otherwise attached to the system. One example
> is a system where the SoC serves as a crystal oscillator replacement for a
> programmable logic device. The critical-clock property of a clock control=
ler
> allows listing clock which must never be turned off.
>=20
> The implementation here is similar to "protected-clock", except protected
> clock property is currently driver specific. This patch attempts to make
> a generic implementation of "critical-clock" instead.
>=20
> Unlike "assigned-clocks", the "critical-clock" must be parsed much earlier
> in __clk_register() to assign CLK_IS_CRITICAL flag to clk_init_data .flags
> field. The parsing code obviously need to be cleaned up and factor out in=
to
> separate function.
>=20
> The new match_clkspec() callback is used to determine whether struct clk_=
hw
> that is currently being registered matches the clock specifier in the DT
> "critical-clock" property, and if so, then the CLK_IS_CRITICAL is added to
> these newly registered clock. This callback is currently driver specific,
> although I suspect a common and/or generic version of the callback could
> be added. Also, this new callback could possibly be used to replace (*get)
> argument of of_clk_add_hw_provider() later on too.

I don't see any mention of of_clk_detect_critical() here. We don't want
to enshrine the critical clk flag in DT. There was a bunch of discussion
about this on the mailing list years ago and the end result was this
instantly deprecated function to set the flag based on a DT property.
That thread isn't mentioned here either.

I see that there isn't any more 'clock-critical' in the kernel's dts so
I wonder if we would be able to get rid of that function or at least
hollow it out and see if anyone complains. Either way, what is the
actual problem trying to be solved? If the crystal oscillator isn't used
anywhere in the kernel why are we registering it with the clk framework?
