Return-Path: <SRS0=Uhbp=TO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2566FC04AB4
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 16:31:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA40420863
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 16:31:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ResSDhqr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbfENQbL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 May 2019 12:31:11 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38572 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfENQbL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 May 2019 12:31:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id j26so8890176pgl.5;
        Tue, 14 May 2019 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KrtNpKFbyRA7Yf14BrtYX1O2jmezyFFAzIDM6gIT51c=;
        b=ResSDhqrk0g7EUCk8wjgV3Ip/1b9SfI9ZFCSIS6zNp19QD01DSoszpZBoYsCm+CFxD
         sA39/SvBGyUzpZch911FrQkh7X77N1CQfanX7ZttHcCwDrACDApUAS0dQs1O4wwd14lZ
         almRSaqBRveCuoCTFp39Y6Yzd7NoJSAC3obDtaUYunfkEGS3lI8jU0GTpGHkA9LFbVGi
         rLWGC0AML4nRxKPG9zY/GRO3m6cfxZVR41GMF2loVlHA/G5dhzhLcuFtd/h4gyCXt7BD
         /i+aM9I2xuCUH/fK2MPaMBVCuJUhU1EWkZ81xNsNgJQNTgFgY3zT2Yd7a+63nytY0rXg
         6MiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KrtNpKFbyRA7Yf14BrtYX1O2jmezyFFAzIDM6gIT51c=;
        b=o5Tt9v/yNrFQqZ7Q4NP6ZB5dodbOWo0EvkAxr0slZ5dr276l3quweOztvUCfsb2X7h
         7pv+rHnT2vShIXVK1pin9P+7mTMHP3ZAn8zy1DiqiX7wEQcDRuH+6+cHu8CvAN1C3aIZ
         b/z3d6GqJX9sxZlLVY4ZtiMFIUD4AdiWn7g1jRNgTA8hYj58C4Zlp9j8JsdvhAnxeaKz
         qSII+eluzMdi8RzkZwDzzJLf/S+3bgQvlFfz07vE3fflGMrnXjTdD71ilrsZ/cNL4jct
         XEd/Qn6wDXADhDLkF0IuJv89hSGiJp2eMBvIn82aniMUiqoDosAbGZhtGDIiyxtE5BRe
         bfxw==
X-Gm-Message-State: APjAAAUKFhRh3ERFP+h1CBZTXC8dzxAItQS4EqwcqIGMSjaKIGJamCvI
        8qdpwcPH6AYluJo4ZiXd5vA=
X-Google-Smtp-Source: APXvYqw0E2GLHkJkn9NxXxxrzDixEEMUZ7bjvayKvBHMv/53B8aZJYKYKrqKGiD/1WHWDOPxbS2cTQ==
X-Received: by 2002:a63:9d8d:: with SMTP id i135mr39327590pgd.245.1557851470721;
        Tue, 14 May 2019 09:31:10 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id a18sm32224542pfr.22.2019.05.14.09.31.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 09:31:10 -0700 (PDT)
Subject: Re: [PATCH V3 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-6-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bc9a1ffe-f58c-784e-1fa1-0e609d0bbb30@gmail.com>
Date:   Tue, 14 May 2019 19:30:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510084719.18902-6-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

10.05.2019 11:47, Joseph Lo пишет:
> This patch adds the required APIs and variables for the EMC scaling
> sequence code on Tegra210.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---


...

>  
> +struct per_ch_regs {
> +	u32 bank;
> +	u32 offset;
> +};
> +
> +struct emc_table_register_offset {
> +	u32 burst_regs_off[BURST_REGS_SIZE];
> +	u32 trim_regs_off[TRIM_REGS_SIZE];
> +	u32 burst_mc_regs_off[BURST_MC_REGS_SIZE];
> +	u32 la_scale_regs_off[BURST_UP_DOWN_REGS_SIZE];

Looks like u16 should be enough for all of the offsets.

-- 
Dmitry
