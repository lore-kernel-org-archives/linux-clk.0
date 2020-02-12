Return-Path: <SRS0=CruU=4A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CADC2BA83
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 17:06:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 147DA2082F
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 17:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581527192;
	bh=HYaCa1NZ3zHYWSJtAxpUAsm/WycgVuTpFXAh6ovDzJM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ZcQyXNbRPytOZ+sw37DZXOyfNs+uj0wMO9CFhzZvdbuRHH1dcUooGfnK/12d1inCy
	 1NF0WD7GY/hmOBjZIwc5hb+l3Cgi4et1MVQfmziEpBS9UKUcAqoigyZWVwZRSDG4cn
	 EGffgIuq0jnFLUVtHrUEWxucSR0pe6xUZVStJtds=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728646AbgBLRGb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Feb 2020 12:06:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:55888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727054AbgBLRGb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Feb 2020 12:06:31 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1043D20658;
        Wed, 12 Feb 2020 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581527191;
        bh=HYaCa1NZ3zHYWSJtAxpUAsm/WycgVuTpFXAh6ovDzJM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XKCw6/+5FhioGy+tOq5QSQrAXjNupK/keY/KggdSlp7bfWHZ+k84WYselyQHA+fTx
         qz42uUD2Wg0usywByDI+zCjCUkZH+gg/soda42sP2avNfEb0fatgce7vkdFauGWf1y
         5RoZkFhQmHjhur1jfMbk9/AEG8LEfUqfuXblobqY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200212100934.20322-1-geert+renesas@glider.be>
References: <20200212100934.20322-1-geert+renesas@glider.be>
Subject: Re: [PATCH] arm64: time: Replace <linux/clk-provider.h> by <linux/of_clk.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Will Deacon <will@kernel.org>
Date:   Wed, 12 Feb 2020 09:06:30 -0800
Message-ID: <158152719034.121156.15651357571349859540@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-02-12 02:09:34)
> The arm64 time code is not a clock provider, and just needs to call
> of_clk_init().
>=20
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
