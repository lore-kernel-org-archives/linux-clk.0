Return-Path: <SRS0=F5gx=MR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E977C00449
	for <linux-clk@archiver.kernel.org>; Fri,  5 Oct 2018 11:10:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E06DA206B2
	for <linux-clk@archiver.kernel.org>; Fri,  5 Oct 2018 11:10:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hW7BxHEV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E06DA206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbeJESIj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Oct 2018 14:08:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:58708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728044AbeJESIj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 Oct 2018 14:08:39 -0400
Received: from [192.168.0.13] (89-70-52-184.dynamic.chello.pl [89.70.52.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68306206B2;
        Fri,  5 Oct 2018 11:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1538737820;
        bh=//0CIVmHWk2GF4KEEIv15gmxVUG7jlxIcRJKBv0G7Rs=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=hW7BxHEVh2VlH5MJZtecNP3pGfNX7H+sRfTfnj1BXXY+bbwB70sm+JOLzk4HD9ksk
         9evQMBFE1CV8bn7yl7Ui/TwLXAFu/KisLNY3QK044A4oh8s731bzz68uKtL3J1Z5Jl
         LDh3frhs2S4cBh6VcRhMl/Fbus4psYnJ/5Gl+8xU=
Subject: Re: [GIT PULL] clk/samsung updates for 4.20-rc1
From:   Sylwester Nawrocki <snawrocki@kernel.org>
To:     Stephen Boyd <sboyd@codeaurora.org>,
        Mike Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <beb0946f-de6f-4d1b-4e42-f2b4dee0b2e0@kernel.org>
Message-ID: <7134b301-d078-0ac0-0fd5-464077c54655@kernel.org>
Date:   Fri, 5 Oct 2018 13:10:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <beb0946f-de6f-4d1b-4e42-f2b4dee0b2e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Please disregard this pull request, I will sent an updated version shortly.

On 10/04/2018 11:13 PM, Sylwester Nawrocki wrote:
> Hi Stephen, Mike,
> 
> The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:
> 
>    Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v4.20-samsung
> 
> for you to fetch changes up to 0cd70a1f69af5cfcd8010f919d28613f2eb4436c:
> 
>    clk: samsung: Use clk_hw API for calling clk framework from clk notifiers (2018-10-03 22:40:27 +0200)
> 
> ----------------------------------------------------------------
> clk/samsung updates for 4.20
> 
> - consolidation of system suspend related code in Exynos, S5P, S3C SoC clk drivers,
> - fixes of system suspend support on Exynos542x (Odroid boards) and Exynos5433 SoC,
> - removal of obsoleted Exynos4212 ISP clock definitions,
> - correction of Exynos CPU clock implementation.
> 
> ----------------------------------------------------------------
> Joonyoung Shim (1):
>        clk: samsung: exynos5420: Define CLK_SECKEY gate clock only or Exynos5420
> 
> Marek Szyprowski (16):
>        clk: samsung: Remove excessive include
>        clk: samsung: s3c2410: Use generic helper for handling suspend/resume
>        clk: samsung: s3c2412: Use generic helper for handling suspend/resume
>        clk: samsung: s3c2443: Use generic helper for handling suspend/resume
>        clk: samsung: s3c64xx: Use generic helper for handling suspend/resume
>        clk: samsung: s5pv210: Use generic helper for handling suspend/resume
>        clk: samsung: exynos5250: Use generic helper for handling suspend/resume
>        clk: samsung: Add support for setting registers state before suspend
>        clk: samsung: exynos4: Use generic helper for handling suspend/resume
>        clk: samsung: exynos5420: Use generic helper for handling suspend/resume
>        clk: samsung: Use NOIRQ stage for Exynos5433 clocks suspend/resume
>        clk: samsung: exynos5433: Add suspend state for TOP, CPIF & PERIC CMUs
>        clk: samsung: Remove obsolete code for Exynos4412 ISP clocks
>        clk: samsung: exynos5433: Keep sclk_uart clocks enabled in suspend
>        clk: samsung: exynos5420: Enable PERIS clocks for suspend
>        clk: samsung: Use clk_hw API for calling clk framework from clk notifiers
> 
>   drivers/clk/samsung/clk-cpu.c          |   6 +-
>   drivers/clk/samsung/clk-cpu.h          |   2 +-
>   drivers/clk/samsung/clk-exynos-audss.c |   1 -
>   drivers/clk/samsung/clk-exynos3250.c   |   1 -
>   drivers/clk/samsung/clk-exynos4.c      | 226 +++-------------------------------
>   drivers/clk/samsung/clk-exynos5250.c   |  42 +------
>   drivers/clk/samsung/clk-exynos5420.c   |  76 ++----------
>   drivers/clk/samsung/clk-exynos5433.c   |  33 ++++-
>   drivers/clk/samsung/clk-s3c2410.c      |  43 +------
>   drivers/clk/samsung/clk-s3c2412.c      |  43 +------
>   drivers/clk/samsung/clk-s3c2443.c      |  43 +------
>   drivers/clk/samsung/clk-s3c64xx.c      |  66 +---------
>   drivers/clk/samsung/clk-s5pv210.c      |  41 +-----
>   drivers/clk/samsung/clk.c              |  23 ++--
>   drivers/clk/samsung/clk.h              |  18 ++-
>   include/dt-bindings/clock/exynos4.h    |  30 -----
>   16 files changed, 103 insertions(+), 591 deletions(-)

