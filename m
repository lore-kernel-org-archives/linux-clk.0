Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C570C74A5B
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 21:48:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjC2VsQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Mar 2023 17:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjC2VsQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Mar 2023 17:48:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087D7131;
        Wed, 29 Mar 2023 14:48:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 79226B820FC;
        Wed, 29 Mar 2023 21:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BAFC433EF;
        Wed, 29 Mar 2023 21:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680126492;
        bh=NPGw0lPE2KSGhVv0i8LlSzcuxTij5SYgnZr2BkVRU80=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EqePdtJoq+ABZziRasM0WIA3ZFVqgfAYZATWixychq3iRuS534kvURGasjQLyiACo
         KnuhDV3XHlEwmDtx1ngoOlfYuCHgDjv/GkXjm0os/okEKlGXfEVPofydYePlLm9Ts5
         UsejSFLQFO9Y84mIJUmBSG15VM115YK37bZF1Xwswsg9gOsL54cHo2ewD8n9zuE/y7
         ZTtf1r/Jvw3e0MqlEv+PuJyUS1ae7QvwOaCVy8LvatgVuGX9Psd6urzfGZSeYCjqaX
         N481KqKdQ7Qx709Nt/Z6S7ozWWQubzMCiGjVZgGact+zzrCX+hb8a0KRuzmH/ato1w
         3nTElUbWQcOfw==
Message-ID: <b7a7d45026c2abe4dc7972eeac0fc3e3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202211111439357842458@zte.com.cn>
References: <202211111439357842458@zte.com.cn>
Subject: Re: [PATCH] clock: milbeaut: use devm_platform_get_and_ioremap_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     sugaya.taichi@socionext.com, orito.takao@socionext.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, chi.minghao@zte.com.cn
To:     mturquette@baylibre.com, ye.xingchen@zte.com.cn
Date:   Wed, 29 Mar 2023 14:48:09 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting ye.xingchen@zte.com.cn (2022-11-10 22:39:35)
> From: Minghao Chi <chi.minghao@zte.com.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---

Applied to clk-next
