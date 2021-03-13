Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70612C433E6
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 21:03:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46A7764ECE
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 21:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234409AbhCMVCn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 13 Mar 2021 16:02:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:42118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234618AbhCMVCL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 13 Mar 2021 16:02:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2711464EBA;
        Sat, 13 Mar 2021 21:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615669331;
        bh=bJ4fC5N4kRq5JnTLxvgigPAtw16sqVxl057n2xWw1EA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Fx9oLpbtoQpX02+9wXjhBAX7KqnDOfGq6KAl6XelUJImalt/aG5kUm29+C9OYgP/9
         +LRDvqGAixL2hehR264ZxgRxIIlF2sR9B0RDp0wTJFOcZVOCxH7THvS/jtC5CliXMD
         1VKjM8Bre3q1npWHXDv6Nm/FWeMptn8rXNgVZ7wheqaLMT/rZlDvxFfPhUxLEc3V5l
         8TaXQ29oNmoAggQdI9N+kVQ3ceqfFlNd5NfA4dUbEzgbok08pCrLqJz5SMmk+3Pl5H
         FEpdsRIA8AzOqyeNP9/0hoDU2RcH8sMAOq+9ueYozhYt7FoEhQbdm5/XZr6mxtHxZO
         eSfQymwOsu84A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210313053222.14706-1-unixbhaskar@gmail.com>
References: <20210313053222.14706-1-unixbhaskar@gmail.com>
Subject: Re: [PATCH] clk: at91: Trivial typo fixes in the file sama7g5.c
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     rdunlap@infradead.org
To:     alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        eugen.hristev@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        ludovic.desroches@microchip.com, mturquette@baylibre.com,
        nicolas.ferre@microchip.com, tudor.ambarus@microchip.com,
        unixbhaskar@gmail.com
Date:   Sat, 13 Mar 2021 13:02:09 -0800
Message-ID: <161566932979.1478170.6086685504198317708@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bhaskar Chowdhury (2021-03-12 21:32:22)
>=20
> s/critial/critical/  ......two different places
> s/parrent/parent/
>=20
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---

Applied to clk-next
