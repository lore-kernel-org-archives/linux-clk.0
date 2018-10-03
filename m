Return-Path: <SRS0=W+YX=MP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EC6C00449
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 21:03:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1388D21473
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 21:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVFJbIxv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1388D21473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbeJDDx3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Oct 2018 23:53:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:44340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726967AbeJDDx3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 3 Oct 2018 23:53:29 -0400
Received: from [192.168.0.13] (89-70-52-184.dynamic.chello.pl [89.70.52.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3A6F20684;
        Wed,  3 Oct 2018 21:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1538600607;
        bh=1UyZsfA5ZcPfr11PTNBHzXEQXRT2Eab5LmKdP6fh5p4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=uVFJbIxv8aDjFkBdZBhxSqyD3GKwZeCIVmxD4BUNa8X69GjHphdq2PK+/F2zDf5nF
         YeIW9tzvZS/Uouk3iO+jJu+gnIXPatVPRoztZhG/bNI0jdxlrFNjlMMR5VEbk8IgE6
         QbBDdzBtCzsuFhcjbxzj+fQPxF5/gm80awSDnASY=
Subject: Re: [PATCH] clk: samsung: Use clk_hw API for calling clk framework
 from clk notifiers
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20181002115219eucas1p23816d543c4dedb233406869c22713a95@eucas1p2.samsung.com>
 <20181002115210.15541-1-m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <0834f69e-0b25-200f-f15a-fe4bc929223f@kernel.org>
Date:   Wed, 3 Oct 2018 23:03:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181002115210.15541-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/02/2018 01:52 PM, Marek Szyprowski wrote:
> clk_notifier_register() documentation states, that the provided notifier
> callbacks associated with the notifier must not re-enter into the clk
> framework by calling any top-level clk APIs. Fix this by replacing
> clk_get_rate() calls with clk_hw_get_rate(), which is safe in this
> context.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for fixing this, I have applied the patch to samsung-clk tree.
