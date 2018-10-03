Return-Path: <SRS0=W+YX=MP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34580C00449
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 20:44:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6C5B21473
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 20:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbOEn6bK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6C5B21473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbeJDDeh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Oct 2018 23:34:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:40828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726969AbeJDDeh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 3 Oct 2018 23:34:37 -0400
Received: from [192.168.0.13] (89-70-52-184.dynamic.chello.pl [89.70.52.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FA79213A2;
        Wed,  3 Oct 2018 20:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1538599477;
        bh=580FNWKk7jQOda+VQZMSnt0cGX1GDp1604NkqGycYNU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BbOEn6bKizqAB0hApTdXwxEj/NIp7JnDsxPwabKmeqk6IsYlCVxCOPnDtbeAf1eEH
         uiRukcmuadm+eJAC9p4ssbfWp8XwRanU9CMgK06FVTOh2Wj/M4aBcSHL9DbBpr804H
         Ig4muZ7EXfRHybgwkf3dwS4MjwJUljWrHriokJOM=
Subject: Re: [PATCH] clk: samsung: exynos5420: Enable PERIS clocks for suspend
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20180924110126eucas1p221aba92e694fcdf2f0f288f20a0b07a2@eucas1p2.samsung.com>
 <20180924110120.21319-1-m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <aa03e99b-0c6b-cbd8-9036-79647f6cbdfa@kernel.org>
Date:   Wed, 3 Oct 2018 22:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180924110120.21319-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/24/2018 01:01 PM, Marek Szyprowski wrote:
> Ensure that clocks for core SoC modules (including TZPC0..9 modules)
> are enabled for suspend/resume cycle. This fixes suspend/resume
> support on Exynos5422-based Odroid XU3/XU4 boards.
> 
> Suggested-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Patch applied, thanks.
