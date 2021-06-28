Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FCFC48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E48F661A0F
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbhF1Bid (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 21:38:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:39896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231819AbhF1Bib (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 21:38:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 092DF6144B;
        Mon, 28 Jun 2021 01:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624844167;
        bh=GK6DyH3hn+24TS37u/9qHV8EgG5KUbj3jhDKMHPc8HQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Dmq92Qd4OxVbtx18UafyjlMmEyHuJI7tBroSEu5iX6zy1YeVFdpr32d9VcEyeW+oI
         ksCYN0cI7GYd31e05QqDab4UtzILPGamptXOa3R0xnKU9L8e/epK0R5OKmsh0W7JtE
         CZMWEILInTp+Ktsh8wx8vp0UbM35ij44KwY+WowzyLj3y+iUTwx2VrJrkvxoY4brvB
         hwxDf/3d7nIgNO/BKx95ZBOGgHcqR2FFJgbcUNOBX1Sl7iB4USpXCyVveJRRn0tAug
         q8YQ8HStzG354gJlJeXigBzFsgNwE3m4zx7SI5DtfXatZQnZyCykPubFDpKGZDjnen
         eCzPUbdS/lDlQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210617051814.12018-10-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com> <20210617051814.12018-10-gabriel.fernandez@foss.st.com>
Subject: Re: [RESEND PATCH v3 09/11] dt-bindings: reset: add MCU HOLD BOOT ID for SCMI reset domains on stm32mp15
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, marex@denx.de
Date:   Sun, 27 Jun 2021 18:36:05 -0700
Message-ID: <162484416592.3259633.4238481639719859797@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:12)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>=20
> Add ID to SCMI0 to exposes reset controller for the MCU HOLD BOOT resourc=
e.
>=20
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
