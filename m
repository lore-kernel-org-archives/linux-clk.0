Return-Path: <SRS0=lNOc=M4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CC4C5ACCC
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 22:30:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77E732098A
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 22:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHaE7vB4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77E732098A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbeJQGXG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 02:23:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:39744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726663AbeJQGXG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 02:23:06 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17EC92098A;
        Tue, 16 Oct 2018 22:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539729035;
        bh=Xu5alnA+ajSMspAyIvP7o1D2bjmbt6hC8HOHJgfFVS8=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=vHaE7vB4SjXkizZgH7a2NUSFWbm8WUQCF0vUwDdzzJjWl2joUPz+c2S6ocYzXdq68
         hBXkaHL+UxDpEFAuSPRNlvUjifvItCFDQvbb/OWfu3kHKRlsCLMGcdWmBUuoJFiCjt
         e7XqCiERSsfMGQK2cZQ4LNQQU9ftwk83DnPWXEVk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Jon Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180927023203.9218-1-josephl@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        Joseph Lo <josephl@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
References: <20180927023203.9218-1-josephl@nvidia.com>
Message-ID: <153972903446.5275.7356932939944657752@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V2] clk: tegra: Fixes for MBIST work around
Date:   Tue, 16 Oct 2018 15:30:34 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joseph Lo (2018-09-26 19:32:03)
> Fix some incorrect data in LVL2 offset and bit mask.
> =

> Fixes: e403d0057343 ("clk: tegra: MBIST work around for Tegra210")
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Applied to clk-next

