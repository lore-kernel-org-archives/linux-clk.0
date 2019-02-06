Return-Path: <SRS0=eFQB=QN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE9CC282C2
	for <linux-clk@archiver.kernel.org>; Wed,  6 Feb 2019 19:05:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A2F52083B
	for <linux-clk@archiver.kernel.org>; Wed,  6 Feb 2019 19:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549479923;
	bh=m7KBaT19iUslXWD8IuHyFFBiuEOdD0k7a3zUi0DgJBI=;
	h=To:In-Reply-To:Subject:References:From:Date:List-ID:From;
	b=kq9FdJ12XMaNtONZwnxpWC5ELR58i2D8SRKMAW8iFPGZN0mJBIz6tcRfg5x4tFxBe
	 s53xnxEMKKo0GlUhz0/BUg24DcyvX021sqTUE1UoOW+SnvwwG/lBc0u51dWES2yHRm
	 eCgkXnQ/5rvdmtRrsD47M6e3MYe+qjXpak82lVnU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbfBFTFH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Feb 2019 14:05:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:50364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725959AbfBFTFG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Feb 2019 14:05:06 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3EB082075C;
        Wed,  6 Feb 2019 19:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549479906;
        bh=m7KBaT19iUslXWD8IuHyFFBiuEOdD0k7a3zUi0DgJBI=;
        h=To:In-Reply-To:Subject:References:From:Date:From;
        b=tPCSLZLDjnsXRQCO56S443kaMNmrhZRfAI/nnVAnRvuimHR+lzgY0J3AwGret3Ua2
         1vkGKO9SGCT2DiGLwt/XaXK6HIAfI9SQPEkDD9zYcbn0pt3QfBrBrFKeFffzvsNENp
         abG1KGsvGx39D6afGvolOm8fhYdxVdPqJBFNTXlA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     akshu.agrawal@amd.com, andrew.smirnov@gmail.com,
        b.zolnierkie@samsung.com, corbet@lwn.net, cw00.choi@samsung.com,
        djkurtz@chromium.org, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@armlinux.org.uk, linux@roeck-us.net,
        matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com,
        mturquette@baylibre.com, pavel@ucw.cz, pombredanne@nexb.com,
        rafael.j.wysocki@intel.com, sjhuang@iluvatar.ai, sre@kernel.org,
        vkoul@kernel.org
In-Reply-To: <eee936f2d49c17bf13f3fa355de5045e71f6cde3.1544177090.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: alot/0.8
Subject: Re: [PATCH v7 1/3] clkdev: add managed clkdev lookup registration
Message-ID: <154947990546.115909.11802583613858729722@swboyd.mtv.corp.google.com>
References: <cover.1544177090.git.matti.vaittinen@fi.rohmeurope.com> <eee936f2d49c17bf13f3fa355de5045e71f6cde3.1544177090.git.matti.vaittinen@fi.rohmeurope.com>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 06 Feb 2019 11:05:05 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Matti Vaittinen (2018-12-07 03:09:39)
> Clkdev registration lacks of managed registration functions and it
> seems few drivers do not drop clkdev lookups at exit. Add
> devm_clk_hw_register_clkdev and devm_clk_release_clkdev to ease lookup
> releasing at exit.
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---

Applied to clk-next

