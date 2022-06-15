Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198A7CCA473
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jun 2022 20:34:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346265AbiFOUd7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 16:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347017AbiFOUdc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 16:33:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB432AE22;
        Wed, 15 Jun 2022 13:33:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BAC41615FA;
        Wed, 15 Jun 2022 20:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4C3C3411A;
        Wed, 15 Jun 2022 20:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655325211;
        bh=dZSh/1EPxFzyVUoIKdcYesKaX0mdqi8N1p0fMT7k7hI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UNkgnuxGm+fwXNgLv/MQ2bTSd+HJ+1VURAL1vwRCKqqJs8qibd5WTFEtYsZMrlZd5
         oZ/bw08aZ0tqFJJUQUFVotdtFlLFmeGkICY4KKW2RFARHPoQVftWBjeNIMgBmqZr6l
         3nkFPsuHAQv0V+VMMsdlJu2euzlxMFjcmFmlhma1QETimNSLofqoIPCVssMyNXIEF8
         6kNy6uaeE2hZr/QjpA40vTzz0gzx50DcqF+nv9WSAWtKFcxYuomDorAoxZjwlInLjC
         FY/JVkEZ7CpFKYNcues//I0OrXVSE0YsSxvEq/Ox+5GamCdqqoEf6vzNaigHi60N0R
         VyNErqTrNB03Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220517235919.200375-2-marex@denx.de>
References: <20220517235919.200375-1-marex@denx.de> <20220517235919.200375-2-marex@denx.de>
Subject: Re: [PATCH v3 2/2] clk: Introduce 'critical-clocks' property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Wed, 15 Jun 2022 13:33:29 -0700
User-Agent: alot/0.10
Message-Id: <20220615203331.1E4C3C3411A@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-05-17 16:59:19)
> Some platforms require select clock to be always running, e.g. because
> those clock supply vital devices which are not otherwise attached to
> the system and thus do not have a matching DT node and clock consumer.
>=20
> An example is a system where the SoC serves as a crystal oscillator
> replacement for a programmable logic device. The "critical-clocks"
> property of a clock controller allows listing clock which must never
> be turned off.
>=20
> Clock listed in the "critical-clocks" property may have other consumers
> in DT, listing the clock in "critical-clocks" only assures those clock
> are never turned off, and none of these optional additional consumers
> can turn the clock off either. This is achieved by adding CLK_IS_CRITICAL
> flag to these critical clock.
>=20
> This flag has thus far been added to select clock by hard-coding it in
> various clock drivers, this patch provides generic DT interface to add
> the flag to arbitrary clock that may be critical.
>=20
> The implementation is modeled after "protected-clocks", except the protec=
ted
> clock property is currently driver specific. This patch attempts to provi=
de
> a generic implementation of "critical-clocks" instead.
>=20
> Unlike "assigned-clocks", the "critical-clocks" must be parsed much earli=
er
> in __clk_register() to assign CLK_IS_CRITICAL flag to clk_init_data .flags
> field.

Why? Instead of using the CLK_IS_CRITICAL flag to enable at registration
time for this, why can't we parse the property when a clk provider is
registered and enable those clks manually and then set the
CLK_IS_CRITICAL flag? Ideally we don't implement another clk_op for
this.

>=20
> The new match_clkspec() callback is used to determine whether struct clk_=
hw
> that is currently being registered matches the clock specifier in the DT
> "critical-clocks" property, and if so, then the CLK_IS_CRITICAL is added =
to
> these newly registered clock. This callback can only be driver specific.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
