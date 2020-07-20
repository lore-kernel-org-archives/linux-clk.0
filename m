Return-Path: <SRS0=zu0T=A7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAA9C433EC
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jul 2020 16:12:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA913206E9
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jul 2020 16:12:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WEaPnjNZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387940AbgGTQMU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jul 2020 12:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387455AbgGTQMS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jul 2020 12:12:18 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B1FC061794
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2020 09:12:18 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id 88so8157190wrh.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2020 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ziX/dm0RLSDUr/q7kPIheAPGvEUSPjbonaq0OAEdF6I=;
        b=WEaPnjNZalZ7tz0+C8Y6Cpmd8HMejbH+0HcF6PMZfxmydwOCdwsyLHWmEmRkgJ4WP8
         FQheQNqLSevKtoVfzrB4ryN4A8sVWdGDuFYXO4mvcthMpeO9c+l7L48zi0nakASXPmgd
         mAfvkpNH8cdNYMgb3zjgHnYYmn4ZgLbX572Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ziX/dm0RLSDUr/q7kPIheAPGvEUSPjbonaq0OAEdF6I=;
        b=bBDAVGm1oyX125BeFaaz45LMzqaUs5nLearedJNgfngbODgisCfeqCEM8VQW6CqZj+
         2DXJm4y3jchza5aPpzq14tSBPbTRRBGaPs64rZqpAuNbJdtHKAFKFbx6QalfWEOlJcXQ
         LOxeZvx+Hc3PAR9/tFIJo7LVMsf1gc5/Tq8Yw/gZk0IDt7x18YLX3iyIdLynsVd4JIJD
         3HKMsRVGXAw3LZEG50/BhjU1mTNfsvL8cLdDdPsHxBjECt2UHBVqSsVhEe7W5Pvf8BXS
         WVeGw5krccv0yfalnLpNfijoTyDAxl6ZG2tlV0KQ9b6m6O/0eVuDAd49Fq48bvFsU5l8
         spYA==
X-Gm-Message-State: AOAM533vgNQLixFO5f8pAbfTA3R1HTV/JcvBRNWK0kFucFHGiR7T3i7d
        jqeQrWcgfMON95r0Ldf7fKVxOA==
X-Google-Smtp-Source: ABdhPJwvBH+5Jd3N3gObiF6ptroAC12fJ0YwtBnlcvNbCK74D2txG+ORcQcfnuD0aui297M7pb6bbw==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr15577771wrt.348.1595261536594;
        Mon, 20 Jul 2020 09:12:16 -0700 (PDT)
Received: from [10.136.8.242] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id u15sm35142795wrm.64.2020.07.20.09.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2020 09:12:15 -0700 (PDT)
Subject: Re: [PATCH] clk: iproc: round clock rate to the closest
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lhikichi@broadcom.com>
References: <20200612225212.124301-1-ray.jui@broadcom.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <b960ee7b-9378-0ac8-9e8c-c0701ca85d4d@broadcom.com>
Date:   Mon, 20 Jul 2020 09:12:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200612225212.124301-1-ray.jui@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen/Michael,

Could you please help to review this patch?

Thanks,

Ray

On 6/12/2020 3:52 PM, Ray Jui wrote:
> From: Lori Hikichi <lhikichi@broadcom.com>
> 
> Change from 'DIV_ROUND_UP' to 'DIV_ROUND_CLOSEST' when calculating the
> clock divisor in the iProc ASIU clock driver to allow to get to the
> closest clock rate.
> 
> Fixes: 5fe225c105fd ("clk: iproc: add initial common clock support")
> Signed-off-by: Lori Hikichi <lhikichi@broadcom.com>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> ---
>  drivers/clk/bcm/clk-iproc-asiu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-iproc-asiu.c b/drivers/clk/bcm/clk-iproc-asiu.c
> index 6fb8af506777..e062dd4992ea 100644
> --- a/drivers/clk/bcm/clk-iproc-asiu.c
> +++ b/drivers/clk/bcm/clk-iproc-asiu.c
> @@ -119,7 +119,7 @@ static long iproc_asiu_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	if (rate == *parent_rate)
>  		return *parent_rate;
>  
> -	div = DIV_ROUND_UP(*parent_rate, rate);
> +	div = DIV_ROUND_CLOSEST(*parent_rate, rate);
>  	if (div < 2)
>  		return *parent_rate;
>  
> @@ -145,7 +145,7 @@ static int iproc_asiu_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  		return 0;
>  	}
>  
> -	div = DIV_ROUND_UP(parent_rate, rate);
> +	div = DIV_ROUND_CLOSEST(parent_rate, rate);
>  	if (div < 2)
>  		return -EINVAL;
>  
> 
