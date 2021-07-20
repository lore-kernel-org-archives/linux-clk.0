Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC32DC636C8
	for <linux-clk@archiver.kernel.org>; Tue, 20 Jul 2021 21:10:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDAF5610F7
	for <linux-clk@archiver.kernel.org>; Tue, 20 Jul 2021 21:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhGTU31 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Jul 2021 16:29:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:56326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233642AbhGTUWH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Jul 2021 16:22:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43D196108B;
        Tue, 20 Jul 2021 21:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626814965;
        bh=WyLspQ2KJuAx6HwfIg9h0ZW+O+516qDOaUuHKdQEKag=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oL8z2Js6NHsnBPfEQzD+E1rX3b8WoQSh0pkIc3JZBqUvq6TG+0QLUi4Kxg70tWENO
         Oeq7HUpI4ebTes9v74aZeQcXKST4FhlIFX3wYe5RdQOGbTrU9OqmL6se4ofNmXyUko
         vRf1bYbdhZc1ugRvQSxZzaDqEGrRWy+DbxgOYX3ExU6MUHAia7hfYNNfpiYKX0pFth
         sAdEwiFKmxSiKxJZ11zM8sJjuAg5/KjGl6uZ/jxhTP3MJbWsM4i51YbRANjyckjTpi
         xueedGLjCWGPvlUiYTIcZjVIsWM5xp/CaUNtDv85tO5OQPNfnSd60KdKTsb24N9juG
         FPBEKB12QVgRw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1626189143-12957-4-git-send-email-tdas@codeaurora.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org> <1626189143-12957-4-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 3/7] clk: qcom: Add display clock controller driver for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 20 Jul 2021 14:02:44 -0700
Message-ID: <162681496420.2679160.15418956767648062693@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2021-07-13 08:12:19)
> Add support for the display clock controller found on SC7280
> based devices. This would allow display drivers to probe and
> control their clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
