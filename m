Return-Path: <SRS0=V3Jc=ZL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30845C432C0
	for <linux-clk@archiver.kernel.org>; Tue, 19 Nov 2019 22:21:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0240E22459
	for <linux-clk@archiver.kernel.org>; Tue, 19 Nov 2019 22:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574202117;
	bh=8c7GBttLBFzSgsO5bfyBSvrEuMyNGMQFpCsNhXx/HBw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=FhIlau77Hn+d+mL33hu25pDYQLiBg0Ahw9OicRquEXPpaCnoAdRycojhLQWn/wMN3
	 j82hY6RE+7yi8O5m3Ax3Ch8bdEhrGgp3hlE/WwjQ7OOPQUyc8/WVyJvhA5ToWHTBV/
	 eZ7sgCA67deLeCTsrOJrzGecejI7HZK8xXVOERhc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbfKSWV4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Nov 2019 17:21:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:40144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726297AbfKSWV4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 Nov 2019 17:21:56 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D45EE22449;
        Tue, 19 Nov 2019 22:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574202115;
        bh=8c7GBttLBFzSgsO5bfyBSvrEuMyNGMQFpCsNhXx/HBw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2ZL4f1eU2vD9Zajz0O7mJFkl7MELSMJAokhJNDStQzs6/IXYBlXafMfw/qDuLDzAJ
         tNLwSUmgeedpCOgR0lUSF6oIdrebAvKYTZl7XsrZMIXBGR7vlaDVN9XrT/quPYbtNf
         SunTJBc8dtnyYwXLOjzxq1ZgIut05zb3/HCNQjjY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191004094826.8320-1-linux@rasmusvillemoes.dk>
References: <20191004094826.8320-1-linux@rasmusvillemoes.dk>
Subject: Re: [PATCH] clk: mark clk_disable_unused() as __init
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 14:21:55 -0800
Message-Id: <20191119222155.D45EE22449@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rasmus Villemoes (2019-10-04 02:48:25)
> clk_disable_unused is only called once, as a late_initcall, so reclaim
> a bit of memory by marking it (and the functions and data it is the
> sole user of) as __init/__initdata. This moves ~1900 bytes from .text
> to .init.text for a imx_v6_v7_defconfig.
>=20
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---

Applied to clk-next

