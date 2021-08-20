Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAB4C4338F
	for <linux-clk@archiver.kernel.org>; Fri, 20 Aug 2021 22:29:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38EB561165
	for <linux-clk@archiver.kernel.org>; Fri, 20 Aug 2021 22:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbhHTWad (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Aug 2021 18:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbhHTWad (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Aug 2021 18:30:33 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395C8C061575;
        Fri, 20 Aug 2021 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=izXKzWURE6SXRuGkgwQXavYNCbp4aPyrNz1Al+9X7vI=; b=oskR+vO3L/UKRtBOg6l2gmsOYj
        YDAk10Orsa8jcyDN3ZzUH4+cvTTmms3KwaxeilSt8LQ9t4mltrNHw9mSsRp6TzkChNKONYNL3W6ll
        7tlmqEW5KGyLS2SNdZxABRxpjJO/gbmcRemMC+xVJjDiAb1fik4CTWlQjEnPnGZBX7V1Kl4un2cwr
        pSid5fotEslEefRi40I7HopgWWm7qk20VMqrOf7gzh+J/RHlE5fZzbpzMpJ9XxEXRSBNV9jp7v+/E
        nvZ5B/Z4lhgEh/yHhA4l9RXH17mO/4ruTT6azAad1CUfKY5bWJi2sL6uupY7k/SRP4kU7vCg3AXMB
        Q+gBxFdA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mHD1O-00CCAZ-ET; Fri, 20 Aug 2021 22:29:54 +0000
Subject: Re: [PATCH v2] clk: zynqmp: fix kernel doc
To:     Rajan Vaja <rajan.vaja@xilinx.com>, mturquette@baylibre.com,
        sboyd@kernel.org, michal.simek@xilinx.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <1629445113-32649-1-git-send-email-rajan.vaja@xilinx.com>
 <1629446294-1056-1-git-send-email-rajan.vaja@xilinx.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cd0903a4-6d7a-ab52-7dec-dfd8e978daf7@infradead.org>
Date:   Fri, 20 Aug 2021 15:29:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1629446294-1056-1-git-send-email-rajan.vaja@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 8/20/21 12:58 AM, Rajan Vaja wrote:
> Add missing description of 'custom_type_flag' structure member.
> 
> Fixes: e605fa9c4a0c ("clk: zynqmp: Add support for custom type flags")
> 
> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> ---
> Changes in v2:
>   - Updated Fixes tag.
> ---
>   drivers/clk/zynqmp/clk-zynqmp.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/zynqmp/clk-zynqmp.h b/drivers/clk/zynqmp/clk-zynqmp.h
> index 84fa80a..a3cd2f8 100644
> --- a/drivers/clk/zynqmp/clk-zynqmp.h
> +++ b/drivers/clk/zynqmp/clk-zynqmp.h
> @@ -56,6 +56,7 @@ enum topology_type {
>    * @type:	Type of topology
>    * @flag:	Topology flags
>    * @type_flag:	Topology type specific flag
> + * @custom_type_flag: Topology type specific custome flag

                                                 custom

>    */
>   struct clock_topology {
>   	u32 type;
> 


-- 
~Randy

