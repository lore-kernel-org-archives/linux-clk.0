Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E06C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 17:30:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 988AD64EEE
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 17:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhCQR3v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 13:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhCQR3o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 13:29:44 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8F8C06174A;
        Wed, 17 Mar 2021 10:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=h6wmvZ5/Ar4UF46iz5n8VsbXtUi4o8sV5lh4Ai33jNQ=; b=iDDeeyXu3Tn1neZGuy32K1ipHS
        8U04LLjT1iGKqsVeGexkEp9FIsV+iJk3KCIuXUMGdsN/Xdh4v43ZHy+oJ0G4g+179NtX/64F1U4pe
        DGj5C3emW2YQmbhfS/sKeviNcthEYO3zc87L7ME75BzWj8RmnJXYo50vxKIOq9rQLAC5MlFdPA9WQ
        G+xbP0+nS1WOMKh+HWLR1FTLiF0bdsRiOq+BTHFSZhZvp671auWV3sHOlvHXeVnVR5OcSTIOaqpMt
        KPGVFoF+8JcX5r8TvAiNyoa/9QfJAVm727aR0tYjpXyIpkewLHuEPIDm1hTmIR/KbXEeLrgTICFwo
        qNl74hmQ==;
Received: from [2601:1c0:6280:3f0::9757]
        by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMZzJ-001fRs-U9; Wed, 17 Mar 2021 17:29:42 +0000
Subject: Re: [PATCH] devicetree: bindings: clock: Minor typo fix in the file
 armada3700-tbg-clock.txt
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, mturquette@baylibre.com,
        sboyd@kernel.org, dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210317100840.2449462-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1003e9ad-eb2b-70d6-76f1-c72ee59ebccd@infradead.org>
Date:   Wed, 17 Mar 2021 10:29:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317100840.2449462-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/17/21 3:08 AM, Bhaskar Chowdhury wrote:
> 
> s/provde/provide/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  .../devicetree/bindings/clock/armada3700-tbg-clock.txt          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt
> index 0ba1d83ff363..ed1df32c577a 100644
> --- a/Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt
> @@ -1,6 +1,6 @@
>  * Time Base Generator Clock bindings for Marvell Armada 37xx SoCs
> 
> -Marvell Armada 37xx SoCs provde Time Base Generator clocks which are
> +Marvell Armada 37xx SoCs provide Time Base Generator clocks which are
>  used as parent clocks for the peripheral clocks.
> 
>  The TBG clock consumer should specify the desired clock by having the
> --


-- 
~Randy

