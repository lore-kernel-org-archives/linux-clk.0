Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A823C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 675AF61A1D
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbhF1BiU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 21:38:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:39722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1BiU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 21:38:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FC1C61A0F;
        Mon, 28 Jun 2021 01:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624844155;
        bh=GbLEzRat74uiT7GZW+oledv8dlkz0eWwQPF5j0WzGUw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YwCz3QKDbG3WeY0dpwS29vzWz2G4kELQkpdDttsGl2BPUTwIO4Zd+O3P1ZKKJ7/rP
         wcxQo2ZjJIVMrS3xoo+uGv1G+GsKqkk+fJdD0ry8696RI7kahQkvdZvYprfbTJoE4x
         tXj3wbNK1DFMbND0QDaWQl6AGy0+KYsMlWN5SSpk4L4VcWLEEn/229Gdf2fGj5gMWl
         8IgY0uFLIMzJWE7H7w/xBMfsRKb/ITP1U8eI66N1Scs6l3bZD3J4bCPHpDb3QnRzmM
         /xI3t4znbEzFpBAO3TokWG5wdn3mdJDA1rLBTseHbXlmDMH3fkibp01CGLtJyK9kGn
         OHJPzpGQH9ChQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210617051814.12018-8-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com> <20210617051814.12018-8-gabriel.fernandez@foss.st.com>
Subject: Re: [RESEND PATCH v3 07/11] dt-bindings: clock: add IDs for SCMI clocks on stm32mp15
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
Date:   Sun, 27 Jun 2021 18:35:54 -0700
Message-ID: <162484415444.3259633.17192427997467189019@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:10)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>=20
> stm32mp15 TZ secure firmware provides SCMI clocks for oscillators, some
> PLL output and few secure aware interfaces.
> This change defines the SCMI clock identifiers used by SCMI agents
> and servers.
> Server SCMI0 exposes clocks and reset controllers for resources under
> RCC[TZEN] configuration control.
> Server SCMI1 exposes clocks for resources under RCC[MCKPROT] control.
>=20
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
