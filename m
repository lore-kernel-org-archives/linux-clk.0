Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596A6C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  7 Dec 2021 20:25:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbhLGU26 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Dec 2021 15:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhLGU26 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Dec 2021 15:28:58 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B08C061574;
        Tue,  7 Dec 2021 12:25:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C508FCE1E05;
        Tue,  7 Dec 2021 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E730DC341C1;
        Tue,  7 Dec 2021 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638908724;
        bh=RjxVVZnOyr79Lidnc0Xpm5aqZPHxYnkZnehJfSy83Ug=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dTW5oT8QuuVLExkWV0CvFtrK3L8fOnCd9NzCaCLRWEtL79TFYZm9/IVjBNBUEgYpG
         YaarU4JXPCReqrfxuvunNbKvEXbpLAUs70dhVeX1dmjLSexegFt6FYr7N+/yBatK3/
         brKm/UJ/a6ewVClkqcIPo1Ed/zWWMdDfL3jKXIigBPOR7onFDF/acHDddaLMQrjt50
         rW2Y8pm1WpfvA2t1d1rcWOxzG0mL5sM/dJua/Urh+/skgJI+FINVYEOdeGrUbuNreQ
         InB3ZXWb6t4LsRlGtM0C466nwIsAyBnwd+GuuwVheDL261A1FvwWhzM++HXZ4gqM+S
         QEdp1KMznnMow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211117072604.GC5237@kili>
References: <20211117072604.GC5237@kili>
Subject: Re: [PATCH] clk: versatile: clk-icst: use after free on error path
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Date:   Tue, 07 Dec 2021 12:25:22 -0800
User-Agent: alot/0.9.1
Message-Id: <20211207202523.E730DC341C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2021-11-16 23:26:05)
> This frees "name" and then tries to display in as part of the error
> message on the next line.  Swap the order.
>=20
> Fixes: 1b2189f3aa50 ("clk: versatile: clk-icst: Ensure clock names are un=
ique")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Actually, applied to clk-fixes
