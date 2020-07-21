Return-Path: <SRS0=lm+m=BA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D350C433E1
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jul 2020 02:31:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 287192077D
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jul 2020 02:31:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Xeg/fzRE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgGUCbA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jul 2020 22:31:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13528 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbgGUCa7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 Jul 2020 22:30:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595298659; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+lKiFZuHiJNHzScEMbgiCkTJR8FyOIj8yhZnIH0+q4Y=; b=Xeg/fzRETe/SIZJMNfSVh/GmIP5ZnfBW5b+JGnycNM7iBlSGN+3LYrMPuPyqeE80uc38rbQo
 k5pJEsRaathq4nw5eYACNC0ijUfvhI2VPVjfw5uD+unU5d65+R61NtSfoVMPGDCTeLgb7EaO
 5LM31FUqOo4K9VuGr4Km+jUQCgo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f16533e3dbcb593a9f2c929 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Jul 2020 02:30:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 008A9C43391; Tue, 21 Jul 2020 02:30:21 +0000 (UTC)
Received: from [192.168.1.117] (ip70-179-20-127.sd.sd.cox.net [70.179.20.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mdtipton)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB325C433C6;
        Tue, 21 Jul 2020 02:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB325C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mdtipton@codeaurora.org
Subject: Re: [PATCH] clk: Add support for enabling/disabling clocks from
 debugfs
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        tdas@codeaurora.org
References: <20200630003024.6282-1-mdtipton@codeaurora.org>
From:   Mike Tipton <mdtipton@codeaurora.org>
Message-ID: <d8af2119-1d1e-44b1-a18b-3b99069b1ca0@codeaurora.org>
Date:   Mon, 20 Jul 2020 19:30:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200630003024.6282-1-mdtipton@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/29/2020 5:30 PM, Mike Tipton wrote:
> For test and debug purposes, it's often necessary to enable or disable
> clocks from shell. Add a new debugfs file (clk_prepare_enable) that
> calls clk_prepare_enable() when writing "1" and clk_disable_unprepare()
> when writing "0".
> 
> This can have security implications, so only support it when the code
> has been modified to #define CLOCK_ALLOW_WRITE_DEBUGS.
> 
> Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
> ---
>   drivers/clk/clk.c | 38 ++++++++++++++++++++++++++++++++++----
>   1 file changed, 34 insertions(+), 4 deletions(-)
> 

Friendly reminder.

Thanks,
Mike
