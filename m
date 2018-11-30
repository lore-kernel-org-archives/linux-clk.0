Return-Path: <SRS0=1K30=OJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64000C64EB4
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 09:00:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 193E82081C
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 09:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+xwdI8E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 193E82081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbeK3UJD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Nov 2018 15:09:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:40100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726629AbeK3UJC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 30 Nov 2018 15:09:02 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2B6F2081C;
        Fri, 30 Nov 2018 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543568425;
        bh=CS7LBiTXVQF2qRe0OpjRL7+PieUoD0F1LZaX88FiRrk=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=Z+xwdI8Eq1FkgGmn0ZnNqbdQGrvffJludn1x1EhpRmimRtiaT138HOpKwZyLCcejp
         S3oAf85q32V9h3qL+3NJ6areA9Zd4I04GTIKh2ATPY/Sr7x5mNwoPF/VStqqSqrS1h
         Y4bG/wGQGGjq1EV6fzDh/udOTua/wKOkIbvxJ9+M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Loic Poulain <loic.poulain@linaro.org>, andy.gross@linaro.org,
        david.brown@linaro.org, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1542822041-9675-1-git-send-email-loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
References: <1542822041-9675-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <154356842526.88331.17902411810668916494@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v2] clk: qcom: msm8916: Additional clock rates for spi
Date:   Fri, 30 Nov 2018 01:00:25 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Loic Poulain (2018-11-21 09:40:41)
> Add SPI friendly clock rates to the spi freq table.
> Today it's not possible to use SPI at lower than 960Khz.
> This patch adds 100/250/500/1000 kHz configs to the table.
> =

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---

I am tired of waiting.

Applied to clk-next

