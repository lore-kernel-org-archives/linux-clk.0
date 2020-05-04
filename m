Return-Path: <SRS0=oKF9=6S=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AFEC4724C
	for <linux-clk@archiver.kernel.org>; Mon,  4 May 2020 17:16:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CB9B2068E
	for <linux-clk@archiver.kernel.org>; Mon,  4 May 2020 17:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588612576;
	bh=X8/exrxj3Gqx4JdqxgxXSfZQsvDJFYhF/UG016D+yOg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=VbT2woxhQIvUZhaHP5LDr8jmDnulC3d3hAQxVUdvz52jUpYKlVM9Kx5ED12Ad2/FW
	 dXnUIUqBhr5mSQqJCymNkiJxMvzIAMDuklgWwyaNcarl3s6RWCQ7pVcW7141kmX3RV
	 GuwEgJYtWnHbDgC4tTdYDF1Y7IiIvGaN3NmkOpo0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730020AbgEDRQP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 May 2020 13:16:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:50022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729965AbgEDRQB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 4 May 2020 13:16:01 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 762A92068E;
        Mon,  4 May 2020 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588612561;
        bh=X8/exrxj3Gqx4JdqxgxXSfZQsvDJFYhF/UG016D+yOg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hpcvnGe/vSN58KkV+cUjPNIH3kJP+iacB/XpkCgAGj45KXO7GqaAN7ZyRoErq2fmK
         gFv6mz1JdzsaE8jlTI6YFtIgUCrxJ7kaGU6z8sFLm7ALmZUjLuxeR5wZBr4aSFvBHB
         +iUGKMV6PEB1Q3dhcSXJ6wckNbS5axuIFjdMTuVE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jftcli2k6.fsf@starbuckisacylon.baylibre.com>
References: <1jftcli2k6.fsf@starbuckisacylon.baylibre.com>
Subject: Re: clk: clk_register is deprecated
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        ulf.hansson@linaro.org
Date:   Mon, 04 May 2020 10:16:00 -0700
Message-ID: <158861256065.11125.3262677295691476922@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-04-30 05:24:41)
> Hi Stephen,
>=20
> We have a question regarding drivers which register clocks in CCF and
> later need to use these clocks.
>=20
> So far, these drivers had been using clk_register() to get a 'struct
> clk*' they could later use with the linux/clk.h API.
>=20
> Now that this clk_register() is deprecated in favor of
> clk_hw_register(), how are these driver supposed to get the per-user
> "struct clk*" they need ?
>=20
> In this mmc thread [0] Martin proposed to go through a provider. I think
> it is overkill, especially for a device which will not provide its clocks
> to any other device.
>=20
> They other way available is "hw->clk". I suspect it is not recommended
> to do so, is it ?
>=20
> If not, what would be the recommended way to get the "struct clk*" from
> a newly registered "struct clk_hw *" ? Should we add something new to
> clk-provider.h API ?
>=20

Yes we should add a clk_hw_get_clk() API that takes a device pointer and
a string name, mirroring the clk_get() API but cutting out the part
where we have to go through the provider to find it.

This is so that one day in "the future" we can remove hw->clk and make
that an internal detail that struct clk_hw can't see because we go
through the clk_hw::clk_core pointer instead.
