Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6957EC433ED
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 14:26:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44132619B2
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 14:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239124AbhEQO1l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 May 2021 10:27:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42119 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239273AbhEQOZi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 May 2021 10:25:38 -0400
Received: from mail-qt1-f199.google.com ([209.85.160.199])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lieAP-0006eN-8t
        for linux-clk@vger.kernel.org; Mon, 17 May 2021 14:24:21 +0000
Received: by mail-qt1-f199.google.com with SMTP id g13-20020ac8580d0000b02901e117526d0fso5316408qtg.5
        for <linux-clk@vger.kernel.org>; Mon, 17 May 2021 07:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b8fOlxYIjxroeXZaPApUy+9pShAujZ8BOr3a1vv0QfM=;
        b=KnREpDnz7wOlWyW532bzHBB+OePn+c3m5UD0cJMF/a/9L/fU1yQMCEyo7aHxwxTFxe
         ZVKsH3lXRJwzM49BE8tZ42ky1MpjpCjw7eSlRrmQ29Suq1Lo5jJ7HWM6o75NRIaNDnxt
         /UV7yeoPacCQIKuY20UBx8jgKTszR+PV+iZJw0akimGoRwajRL3rGM8wIMKbKhx50brw
         Tu8RrvitgvwhrsyNm6+NFyhIAD6aOc5w4KqL/SLU7g69D5aezf37fSOiPD+IkaXfJcMd
         dvtOGCbaLkmBuMJxkxozLr9wNDN+DBZwD+iQTSJmESa8rzscaZo9u5zGM2S1ITJ81wQA
         hKgA==
X-Gm-Message-State: AOAM531l7un6BEFjrecqzADqIWC9Uht/ZicxnTqBuB/jONpe5F24yD9q
        UDi16YikMQpACAWmRDwAPtwX38RZhsg/ejCXOqNL6XfcVw/cO2qIt73+YBVIu/Ijk5mRtOqU5dj
        M6POvFVatp41LVPt2xD/h8EBIOfhsrP/dWdWdWQ==
X-Received: by 2002:a0c:d80b:: with SMTP id h11mr211348qvj.10.1621261460009;
        Mon, 17 May 2021 07:24:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFThVtFmA2e59WhPfODKDeGjLXwwKQduT0MHPDWTRVXP0ipfgDODV9fTCnG5Tk19ONs5RSmg==
X-Received: by 2002:a0c:d80b:: with SMTP id h11mr211331qvj.10.1621261459879;
        Mon, 17 May 2021 07:24:19 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.1])
        by smtp.gmail.com with ESMTPSA id u27sm10534108qku.33.2021.05.17.07.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 07:24:19 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] memory: tegra124-emc: Fix compilation warnings on
 64bit platforms
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210516161214.4693-1-digetx@gmail.com>
 <20210516161214.4693-4-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ae6dfddd-0e08-bb40-fd4f-36276be30cef@canonical.com>
Date:   Mon, 17 May 2021 10:24:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210516161214.4693-4-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/05/2021 12:12, Dmitry Osipenko wrote:
> Fix compilation warning on 64bit platforms caused by implicit promotion
> of 32bit signed integer to a 64bit unsigned value which happens after
> enabling compile-testing of the driver.
> 
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
The patch was not suggested by Nathan but it was:
Reported-by: kernel test robot <lkp@intel.com>

Nathan however provided analysis and proper solution, so co-developed or
his SoB fits better. This is not that important as comment above -
including robot's credits.

Best regards,
Krzysztof
