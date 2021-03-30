Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11376C433E1
	for <linux-clk@archiver.kernel.org>; Tue, 30 Mar 2021 00:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D89E1619A6
	for <linux-clk@archiver.kernel.org>; Tue, 30 Mar 2021 00:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbhC3AuX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Mar 2021 20:50:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229709AbhC3AuN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 29 Mar 2021 20:50:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79A1761987;
        Tue, 30 Mar 2021 00:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617065413;
        bh=WlcDHTsL/++ADm3igDYuxYt/sN+5arS6fz0ryE5i49Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EZn6gqtezMJcHI7kKyh3BCXxdb0X5ZGJhHxOw4zoxZ7Chz/X7kd0XZtohJ1MSwuzc
         cE6REp1Z8me0BNIqjRxypgLfdHTx+rSeggC4RkkKDLaMn9OhOQe9OxGSlphO4NM/xs
         yDr0k6+PuLfY97sO6JLVRbs5OAx48Z/VFtXbn/ivfq4n+guSbZuC+CDHtFJ9FKLbkQ
         zV1JbvVPEC5+tl2MN8s1g8mZRj2l9USfYRstoF5BuzFbjUv2tG43ADo9MX2PcViHxL
         Tl6oTwm4mw9p9ZiLUNDNqdVISXzUPUzQtr7iQY1ZeKLREQMYCe6oYlvG0H8r1xnU03
         EgfwwtUm/DeGA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org> <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 13/25] drm/msm/dsi: use devm_of_clk_add_hw_provider
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date:   Mon, 29 Mar 2021 17:50:12 -0700
Message-ID: <161706541233.3012082.17908704840023674123@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Would make it devm_of_clk_add_hw_provider() in the subject

Quoting Dmitry Baryshkov (2021-03-27 04:02:53)
> Use devm_of_clk_add_hw_provider() to register provided clocks. This
> allows dropping the remove function alltogether.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
