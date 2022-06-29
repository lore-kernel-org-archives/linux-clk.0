Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0618C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 09:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiF2JNz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 05:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232283AbiF2JNy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 05:13:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C25028731
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 02:13:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F0AF6B821EB
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 09:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9293BC34114;
        Wed, 29 Jun 2022 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656494031;
        bh=poJPf/GWZDw5wdbbQb/+grRLymadMWhbJAZX2P0ufMQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YViNbJEGLgdnpD3R0aBVFOXY90aKmaMmWLdN6/s2OOBdlW5VyRx8YfMk5/Lh5+iKI
         c31Q0wiU0dSMtQR2wpMSoLQKkMiAZjzTmo5veO2PnUsro/+21dfsg2tAjkVTTj62ua
         5h32Lsli6ZZr7h8l+JjrRb5fX9DOFevMUgFXhGd9Ip2FQDlbKTzumuTJPRp3Q6Vku6
         kaP5XFAic1Gwqu/ciWJf88rP7b2zGJe/e1SbBuYP/qWWsJwopK0AwKAbzhJk861QF7
         /bymKydzXvV7yDEMEExerugP+Ulq/8g1lvwW41OSg0fDxnqwFFIoytbeOPRKqDlF5G
         wdWp781beSz8w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220516132527.328190-25-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech> <20220516132527.328190-25-maxime@cerno.tech>
Subject: Re: [PATCH v5 24/28] clk: Test the clock pointer in clk_hw_get_name()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Wed, 29 Jun 2022 02:13:49 -0700
User-Agent: alot/0.10
Message-Id: <20220629091351.9293BC34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-05-16 06:25:23)
> Unlike __clk_get_name(), clk_hw_get_name() doesn't test wether passed
> clk_hw pointer is NULL or not and dereferences it directly. This can
> then lead to NULL pointer dereference.

Why do you have a NULL clk_hw pointer? Is there some caller that is
simplified with this patch?
