Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A065C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:52:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 475EA64E74
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:52:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhBKTvp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:51:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:35948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230412AbhBKTuO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:50:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 497FE64E44;
        Thu, 11 Feb 2021 19:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613072974;
        bh=KabaRJe6w2Ru2gLglXBHjD+RGx8wIm9U6GENzO0vl7A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NbkEFmgfLUSVZx0P00WqLh6Zn6B7t6OILROax+uAA4hVMiW2hVgQP+2A4UXYvoAOP
         7pYtF/xYFUO14U8TZN27GLspONDtEI8gHmzLy/w9u8rKGokaFQZDgD4t2YBa5C6m1B
         JdhjiDQ/KFIsUmT0+O3uekdqAbfObDrOitsn/Od/+HzaSo66Q/UEY7fd0AyF+Thvpx
         /oOVCejJH69B+K2l8Z9NlvI4TnUSan5LPMa+0ftQ8OLSTvIoKCHHce0cV7sby3eHcO
         lqV+HIEXcm8GgtE0t+UbHUwukHkbJOkbOfEpUptJsFAgcsgb7tSBcmo7KMYN5gi8s7
         4jDYy/vEbUsoQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120093040.1719407-6-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org> <20210120093040.1719407-6-lee.jones@linaro.org>
Subject: Re: [PATCH 05/20] clk: bcm: clk-iproc-pll: Demote kernel-doc abuse
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:49:32 -0800
Message-ID: <161307297284.1254594.3446661150770498910@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-01-20 01:30:25)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/bcm/clk-iproc-pll.c:712: warning: Function parameter or memb=
er 'pll' not described in 'iproc_pll_sw_cfg'
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
