Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515D5C4338F
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:10:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33B8F61186
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:10:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243155AbhHFBK7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 21:10:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:56290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242769AbhHFBK6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Aug 2021 21:10:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6473161176;
        Fri,  6 Aug 2021 01:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628212243;
        bh=9ddLVrEMbcuwWfjwyTUIp5+wk0404rhszEa1fNlCPCA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BokKoxbZwHwfnT1FjTY+QFhY2B/lSzPFFf8KfDT0XkkIFVcogOasJuOVP99xqq/7F
         oT7LU2nlAvbyq2QOtAbqtv6sbFt8mUTHGjO6m6//kBqrdsaWzffFfGh3g0zl4t91TY
         Jk0U0/BRLbiDf2t6xzpuB1b1gNDEGZs6At46OlB8ExF6spPR9v4DR+TxLp2nRt1AN/
         uSWXksH9y2/FgVcyiBkEYwYsWHD7nlkTHaMUD+0iG/EHkvLcNsaiRrDKF9qLGxmesx
         lReMKX3CoPVytgpN2vCm6s4HTat93ja7TpWRPTBBWbYW1pAktdvd1qE8BCyGvL0Lv7
         IOMy0nNzny81A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210702225145.2643303-6-martin.blumenstingl@googlemail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com> <20210702225145.2643303-6-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 5/6] clk: stm32h7: Switch to clk_divider.determine_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 05 Aug 2021 18:10:41 -0700
Message-ID: <162821224129.19113.5484324790744582709@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Blumenstingl (2021-07-02 15:51:44)
> .determine_rate is meant to replace .round_rate in CCF in the future.
> Switch over to .determine_rate now that clk_divider_ops has gained
> support for that.
>=20
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Applied to clk-next
