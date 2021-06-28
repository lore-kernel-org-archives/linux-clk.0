Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91D8C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:34:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E3CA61A1D
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhF1BhU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 21:37:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:39052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231735AbhF1BhT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 21:37:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE5A86144B;
        Mon, 28 Jun 2021 01:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624844095;
        bh=3yR5nD/gPU/VLZNU7b+VN3/NS1CVXEfXWBL+i1IW7WI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hs8gBLrYjsCcQBIfHoBq+tLPXI3K/IbiiUiZycNnwSKdGsOrpsd/E0bZchfOPeX4b
         /7ViLD4zyY9zVUvx6vv95iWQGY/02PJqSJnWYYFpgxJcFP+06iF/visf15W2TCzibd
         r5ogAgOwEpTZlmgbBRUjzs2u9Kk+hh2skJnEbOIragZH6wpzxHSiOOGGsDLbJQ5RGA
         j/6MpAMWs0i/i22pXYP16vFJJ8nHW1MVmw6NyBqEjYtnVeorrGIpH7YRHgNgYDmlza
         Sdo9RkgHmRHOpgrD5o13m2peWwD7WgGLjwafDrJbr+hZ4J2knsAQdX4WC+9EramcHq
         OKGaFLn8z5gSA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210617051814.12018-2-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com> <20210617051814.12018-2-gabriel.fernandez@foss.st.com>
Subject: Re: [RESEND PATCH v3 01/11] clk: stm32mp1: merge 'clk-hsi-div' and 'ck_hsi' into one clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, marex@denx.de
Date:   Sun, 27 Jun 2021 18:34:53 -0700
Message-ID: <162484409358.3259633.13950277429027098956@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:04)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>=20
> This patch is to prepare STM32MP1 clocks in trusted mode.
> This Merge will facilitate to have a more coherent clock tree
> in no trusted / trusted world.
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
