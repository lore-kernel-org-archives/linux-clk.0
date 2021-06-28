Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228E0C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:35:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08E576144B
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbhF1BhZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 21:37:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:39170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231933AbhF1BhZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 21:37:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81AA96144B;
        Mon, 28 Jun 2021 01:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624844100;
        bh=+cKKsMMwmhLDjpHtJw5ie1boGZcj5kQGXXwkCWUBXAw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BSm5MJSmWHF8/cQB0FEFa3iTckNPuUD5vI52FZ8Sk0DwSDIeqn7moONS/ghVpiDSb
         74ChZXwGk7szCozh7SU0sQQ40+DVHUun/iGNXSRkKwnXnc4McXeYXK5jCrNd4KLJfz
         I5sT6ARZ5pqdqBZyVjmT8Wm2EaFYBGFYujyleRpnrpcOH+mKeFrXRzByZ3o36CpbOQ
         O49TSAp1KybiikNOLE4sWIoiJBuppujcSr1SmEc2a0OxKuDGM+y4Q3MLLtAtMHlXRE
         wXx1j6no2jEk+edwlvRZRKDRyO6CGHkKZcNH2yLLxvLykU+fzBjoxEPEfcUHPujRSc
         v9+ZUtI2P47UA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210617051814.12018-3-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com> <20210617051814.12018-3-gabriel.fernandez@foss.st.com>
Subject: Re: [RESEND PATCH v3 02/11] clk: stm32mp1: merge 'ck_hse_rtc' and 'ck_rtc' into one clock
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
Date:   Sun, 27 Jun 2021 18:34:59 -0700
Message-ID: <162484409943.3259633.13672186056150870486@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:05)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>=20
> 'ck_rtc' has multiple clocks as input (ck_hsi, ck_lsi, and ck_hse).
> A divider is available only on the specific rtc input for ck_hse.
> This Merge will facilitate to have a more coherent clock tree
> in no trusted / trusted world.
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
