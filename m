Return-Path: <SRS0=1K30=OJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CB1C04EB8
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 07:13:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A0792146D
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 07:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VApAm0kk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A0792146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbeK3SWD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Nov 2018 13:22:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:53588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726572AbeK3SWD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 30 Nov 2018 13:22:03 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F8242082F;
        Fri, 30 Nov 2018 07:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543562023;
        bh=LgAiJxMiwpPQwI0FkQS1J58MaTUS/KzWDBb8bzTmmnI=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=VApAm0kkaTnsz6qGs1+jC6GYJPYH1AsId7OuKbz0kAto45o2YfirPHHagYcP0K/Q2
         Ka/dcFm2UEfkDEUm+Nj41yw1UThVk11pwMY7tUYF+NigcnvPhkmWApRAxNsHe0MmbN
         OKzoUmT4vGjnSupbbqiakX3He7bq04IYN6lr1E3s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        YueHaibing <yuehaibing@huawei.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1542281788-129746-1-git-send-email-yuehaibing@huawei.com>
Cc:     YueHaibing <yuehaibing@huawei.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
References: <1542281788-129746-1-git-send-email-yuehaibing@huawei.com>
Message-ID: <154356202192.88331.9059182727616559057@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH -next] clk: stm32mp1: drop pointless static qualifier in
 stm32_register_hw_clk()
Date:   Thu, 29 Nov 2018 23:13:41 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting YueHaibing (2018-11-15 03:36:28)
> There is no need to have the 'struct clk_hw **hws' variable static
> since new value always be assigned before use it.
> =

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next

