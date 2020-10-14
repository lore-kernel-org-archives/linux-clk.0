Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A74CC433DF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 03:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BF6721D81
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 03:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602644521;
	bh=Ofd+aGE1NVD/YhbGmQ3EePx3dlv3GLwuTc4d5Hn0XPA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=LtnrYaF/Qr4ywCMIcdUKjXLgTH/JpeZafdHwBKauaR+00DepVMMGYCX9n89i1R1Jo
	 37gGrswk3DfD3BNdKvRh1Jm7eOj38ruQYPaCl8miKgRReqFke+z4lVl2jvEFiqdZyj
	 eKRzx7aPtEOzwRHOz48UPMXFyHLKhiR80KHD3aSI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgJNDCA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 23:02:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:42940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgJNDCA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 23:02:00 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F014321775;
        Wed, 14 Oct 2020 03:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602644520;
        bh=Ofd+aGE1NVD/YhbGmQ3EePx3dlv3GLwuTc4d5Hn0XPA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kuScnuYBsO0weMDkgEgsvEqSaIBYINfjnUyY2f3Idi1BXHVHqNefB8+snlwRwEA1Z
         JXvxjOTIT7MsvYnaysQ74vdiGIJQdWBaCWBjkOyzpgJQ+0T8jn2FCWF21NldBkliZR
         k/bGcHZJZ9QuTH7Cpl198CgMFk8y6l0Qo/0DUphQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200809231202.15811-1-navid.emamdoost@gmail.com>
References: <20200809231202.15811-1-navid.emamdoost@gmail.com>
Subject: Re: [PATCH] clk: bcm2835: add missing release if devm_clk_hw_register fails
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     emamd001@umn.edu
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Ray Jui <rjui@broadcom.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <wahrenst@gmx.net>,
        YueHaibing <yuehaibing@huawei.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Date:   Tue, 13 Oct 2020 20:01:58 -0700
Message-ID: <160264451882.310579.17812805617556961510@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Navid Emamdoost (2020-08-09 16:11:58)
> In the implementation of bcm2835_register_pll(), the allocated pll is
> leaked if devm_clk_hw_register() fails to register hw. Release pll if
> devm_clk_hw_register() fails.
>=20
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---

Applied to clk-next
