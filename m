Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB51AC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 20:27:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 955676103C
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 20:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239500AbhJ0UaN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Oct 2021 16:30:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:36522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239236AbhJ0UaN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Oct 2021 16:30:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73E0260C40;
        Wed, 27 Oct 2021 20:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635366467;
        bh=ETJbht3ruVRXtbpajTpi6Z6h3wWwolO65oifEPJ0jNk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Nx9Q9F7jNG9cOc0qfZAO/E/WUXyG2U5bWdue0M0XILkhhK9WXDWnFrJYt48MDqD+K
         KNmSpuGEj/IqDwsff6p/kz57zOfpCT4HUFcbTfqqhDr0E1+c2M4WdQKr7aIE4CjW/+
         n0zwEHJWcQulh8iZWOCSlWIu7k1Yr+9bn61+uoFaKEnP2XcLwHUV+mEXGsmJRKn4ne
         d2GJuwmQrhLFp027wu/YzbmkZWspZe17YkxSWfxqGFfFsNlO5CqFb/CoYWc4fRoiQb
         OITQ++13mz4G2+RDPda9w2AWUhKDoJuT0ksKT6BBIe+rpovptZknKNm1XG5mSPhJCc
         T7TRUjz05+c1Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211027132616.1039814-1-heiko@sntech.de>
References: <20211027132616.1039814-1-heiko@sntech.de>
Subject: Re: [PATCH 0/2] clk: rockchip: cleanup errors in (module-)driver handling
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel@esmil.dk, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, heiko@sntech.de
To:     Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Date:   Wed, 27 Oct 2021 13:27:46 -0700
Message-ID: <163536646616.15791.10163287623335903483@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2021-10-27 06:26:14)
> Recent conversions or inclusions of rk3399 and rk3568 as platform-drivers
> and subsequently allowing them to be built as modules introduced some
> problems.
>=20
> These two patches try to correct them.

By removing modular support? Ok.
