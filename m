Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59634C4338F
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BAD461179
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243144AbhHFBKo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 21:10:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:56190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243156AbhHFBKm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Aug 2021 21:10:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8D9161186;
        Fri,  6 Aug 2021 01:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628212227;
        bh=z2LbFuvGZ9oYZoczOAsC1gtln5yj7whAdrI8YVYi4+A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YJcnG6Iy7n5jROmDuxFiUyasnuF7HQfKIGLo966QXl5a8/k8h74Z0Mn3eyqYM+Jjb
         kdiyVwcXSmmG6ycFGZMPZs0VgH92QovxdhaflWzLZI+j/xy/aYXoqnwWcowYHDEBfE
         Ft31AoL9u40VqDNn6FYuwVr9Low05VH0abyhuhDLGnujeikQpU+NQ/RZryhH2ZTppB
         esbCz7qPhPpqWzN2/IcE3NvxMiWnylINKBbJ8Ph2W43vnn67q8i+kyk97yBLDRnEki
         32w1AyQHcm9fLRpP5WMJUdsUmn8TL/w1MK25i5yW8UPappQM8irzkvRT3gB61AIvsU
         lJ8aMyKE8tBww==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210702225145.2643303-5-martin.blumenstingl@googlemail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com> <20210702225145.2643303-5-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 4/6] clk: stm32f4: Switch to clk_divider.determine_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 05 Aug 2021 18:10:26 -0700
Message-ID: <162821222682.19113.14294600581719716007@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Blumenstingl (2021-07-02 15:51:43)
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
