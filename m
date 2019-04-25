Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627E2C43218
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 20:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61F75206BF
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 20:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556225728;
	bh=lL4Nv5q9oLD21CPR8VCuj+apQwcLdBefJBFL6WTfM7Y=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=rIungaJI8NXqknzzoHV/bY5ZnUChatGT5UljEH9gDiToeDNEqzPxAjKDjJD3sclGg
	 WKsd+2XTXeTcjRGbrCPimkA7QTVR0wh8xSwEDdQc2Ft6Gad/wtI3epAi93Ko/G0etG
	 wcf5UiJ26O3QC0+jmsM5YxgndjyEvASt9/TOcEDo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbfDYUz2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 16:55:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:58956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbfDYUz1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 16:55:27 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F3AA206BF;
        Thu, 25 Apr 2019 20:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556225727;
        bh=lL4Nv5q9oLD21CPR8VCuj+apQwcLdBefJBFL6WTfM7Y=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=d3uyH6kERqq57B/M+BfJXRdSmrsGfpzNqDyXuT1joMBRbc1kB4IMHmdlaUTGOIutY
         r32sMyIz1spgbuB90gKcO5uVaABA7PyXnoFDHDeX96wJUKri1jjIPZXQgi4rO0FE3V
         UDGx1Xeb+zQPp3xzqoiBlh8xPqi8B5mRPSFZEKrM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190414192321.23294-5-digetx@gmail.com>
References: <20190414192321.23294-1-digetx@gmail.com> <20190414192321.23294-5-digetx@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 4/5] clk: tegra: emc: Replace BUG() with WARN_ONCE()
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Message-ID: <155622572639.15276.9842920673361020856@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 13:55:26 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Osipenko (2019-04-14 12:23:20)
> There is no justification for the BUG() in this code.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-next

