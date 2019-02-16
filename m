Return-Path: <SRS0=MMCI=QX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3980C43381
	for <linux-clk@archiver.kernel.org>; Sat, 16 Feb 2019 00:01:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B116F222DF
	for <linux-clk@archiver.kernel.org>; Sat, 16 Feb 2019 00:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550275267;
	bh=IkITJA3qYhkHjsUactjLI8hvtJNr7oOBsNMoNQkN0HY=;
	h=To:In-Reply-To:Subject:References:Cc:From:Date:List-ID:From;
	b=V5XA7rGK5WHRqar4TfCnqUBC5gJvIuCKeSWQBBIhVlOnwSGbcjuNr4fgZzDZqDp5s
	 Phmw4S2Rzwj3i8acf1Hn6g3TSHqyX3tT6ZMfZZPNTC10KgkPcDS/pgX0z9V2Sj7PW2
	 RZz2JWB5D5sq5Z/NdpIry/6mj8boK8q3y9AbNv9w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389791AbfBPABH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Feb 2019 19:01:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:59844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387546AbfBPABH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 15 Feb 2019 19:01:07 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1727222E1;
        Sat, 16 Feb 2019 00:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550275266;
        bh=IkITJA3qYhkHjsUactjLI8hvtJNr7oOBsNMoNQkN0HY=;
        h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
        b=rKAdlTVMqqgjP9Tmkpch/jUV9XcCu2G9QVVebuA720n5A0Dtdt4a1Rokr2UxmDROY
         qbudKYqiJG+3GDsJlush9cQAXoqOtU35uxONCxBdx5n+w6KFA55xQKQpIw7H/Z/jh4
         rNqSeUP0KbOnpUlpw6rxrV9NDDWCo9pfPsSlliuo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com
In-Reply-To: <1c894e44-de4b-aef8-d3a3-f371bf2d2f68@baylibre.com>
User-Agent: alot/0.8
Subject: Re: [GIT PULL] clk: meson: updates for v5.1
Message-ID: <155027526588.115909.7947025741302263249@swboyd.mtv.corp.google.com>
References: <1c894e44-de4b-aef8-d3a3-f371bf2d2f68@baylibre.com>
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Fri, 15 Feb 2019 16:01:05 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Neil Armstrong (2019-02-07 05:23:49)
> Dear clock maintainers,
>=20
> Below is a request to pull updates for Amlogic clocks.
>=20
> It covers essentially refactoring AXG and GXBB drivers to easily add
> support for 32k AO clock support and G12A clock controller.
> It also fixes Mali GPU clocks for Meson8 SoCs.
>=20

Thanks. Pulled into clk-next.
