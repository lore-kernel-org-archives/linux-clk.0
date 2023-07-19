Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57901C001DE
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jul 2023 21:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjGSV5F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jul 2023 17:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjGSV5F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 17:57:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACB11FD9;
        Wed, 19 Jul 2023 14:57:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F305961839;
        Wed, 19 Jul 2023 21:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EBDC433C7;
        Wed, 19 Jul 2023 21:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689803823;
        bh=ZLQvNTjEVCYzwSTjbgk264AUntpBOx9X8u3UOjdAqKw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=b1JcMva3tTkCUdD/k+a7mePggLAQhMvMgi+wi/zhT+GVmQ0JWwodtMkuW1mJEOkjU
         KtEMg5o/+MsPYRgC+SVUuwz3igwzC4ED8/WEfQM+mBUBdxK1VCkwoL4QxhSIOsVgad
         n8Jk43vNe2FRKZ3qlfmiC12oGMAFVq8+sIMG9oyTO7qpJKD4lzM4xQ48iphb7Vx6xa
         OV0dXOK8IjjBdMx+GUSrek/OWsYUAJP+8L2rT2eGxZhQ5u6uaTncKi3OAzBsuUFEn8
         kr2nGJGII4McNpE5A8g5EMHNDvRqbGln81SuD/1cf32OY4OnlgT0TSvdmmb9JaUcw6
         oN+vsCZ4qaU6Q==
Message-ID: <5a3acd0897f09bf38d95106de3c2a5c3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230627140145.729609-1-colin.i.king@gmail.com>
References: <20230627140145.729609-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] clk: lmk04832: clkout: make read-only const arrays static
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Colin Ian King <colin.i.king@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Wed, 19 Jul 2023 14:57:01 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Colin Ian King (2023-06-27 07:01:45)
> Don't populate the arrays on the stack, instead make them static.

What improves with this patch?
