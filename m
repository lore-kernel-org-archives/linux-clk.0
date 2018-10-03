Return-Path: <SRS0=W+YX=MP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443FEC64EB8
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 20:43:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0304721473
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 20:43:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNzg1906"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0304721473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbeJDDdV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Oct 2018 23:33:21 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43916 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727143AbeJDDdV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Oct 2018 23:33:21 -0400
Received: by mail-lj1-f193.google.com with SMTP id r8-v6so6354609ljc.10;
        Wed, 03 Oct 2018 13:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jIv8XYNvpuqRyYvebFgQDSQXBcROd4ogA6brrgm/q3U=;
        b=MNzg1906hyFqTMUi5N5lM+JK+enoKIx+SM88uy2ndgGJDp+o3ZAvM03+KJLn/DoAmL
         iNTqROjXe9RwaUJMlMpaOE9haTsNXnfxO66cG33iZvZcsF0qSEcL/G2uptRI/DRunnxO
         fYR4LrKlGa32PcXI6r3moIZ1MQdc+VFNMSO7C/3DOmfCdg53XttM63OIJ5cbM3vLdVCc
         Uf+Whqf4HRcA34oCGw276ad+jTsd6TVM7L8q60YEOADKSUp8SLSYsexXB1LCBNu/zs/C
         gSZtmZhAUEstxMAufk2cxpZ71MpFHr69nMj6vB/4DIGXXpT8qt8jFEHpjGY+UesfJ0tw
         k6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jIv8XYNvpuqRyYvebFgQDSQXBcROd4ogA6brrgm/q3U=;
        b=Q0KKNAdNmIGupoIjl3XoWffvz2nbKXeH+8llzICbHKawhg2VQC32hzrGu5jhQb8Xxn
         ap3IkEh3V4pgr7jvLpsIASGWh2yAi6BeKjsG2pBEgWjW7zNeXRXDpziUXEuf0LXifiSE
         7zQa2CyNsJriz//h7mt695mFf/2DxV+hekvLfV+njBMdO1wp1FkOnTf5No80y79R7X/e
         i9d5CVyCyIlKmP1JEFRwA6nmFAxf8Jxwo5UUSTlpwu+cD6mcUcrsF5QMFzBKUJgQQkU/
         1cE+hAyuUD3Td5M5p0WVNDHJ2KgIa0X0uflhiGEpZX+8qsy71HSLXXnlC9ReSoPhJ5lE
         3mZQ==
X-Gm-Message-State: ABuFfoiKYT3dZtltP+lZNGmIFyqUlNUJDX2a06A1grl8QwrDy2wOFKdw
        8WKZju4v960pxl/R0NCVVcs=
X-Google-Smtp-Source: ACcGV61owKtg2vcVw92RilwuC5U0y0I8Um9KFDX6KBPE41GsdIvKS1/+D5NXbvE0xQO174llePy6tA==
X-Received: by 2002:a2e:9b46:: with SMTP id o6-v6mr2381341ljj.78.1538599400960;
        Wed, 03 Oct 2018 13:43:20 -0700 (PDT)
Received: from [192.168.0.13] (89-70-52-184.dynamic.chello.pl. [89.70.52.184])
        by smtp.googlemail.com with ESMTPSA id 12-v6sm556276lje.67.2018.10.03.13.43.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Oct 2018 13:43:20 -0700 (PDT)
Subject: Re: [PATCH] clk: samsung: exynos5420: Define CLK_SECKEY gate clock
 only or Exynos5420
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20180924110106eucas1p2465d1fdd263f7921ae6e9c65d32155f6@eucas1p2.samsung.com>
 <20180924110056.21033-1-m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <sylwester.nawrocki@gmail.com>
Message-ID: <c4bef37d-3bc9-41ec-c5d8-dfc8d5e8bc89@gmail.com>
Date:   Wed, 3 Oct 2018 22:43:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180924110056.21033-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/24/2018 01:00 PM, Marek Szyprowski wrote:
> From: Joonyoung Shim<jy0922.shim@samsung.com>
> 
> The bit of GATE_BUS_PERIS1 for CLK_SECKEY is just reserved on
> exynos5422/5800, not exynos5420. Define gate clk for exynos5420 to
> handle the bit only on exynos5420.
> 
> Signed-off-by: Joonyoung Shim<jy0922.shim@samsung.com>
> [m.szyprow: rewrote commit subject]
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>

Patch applied, thanks.
