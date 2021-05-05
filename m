Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F06C43462
	for <linux-clk@archiver.kernel.org>; Wed,  5 May 2021 16:57:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C829F6140F
	for <linux-clk@archiver.kernel.org>; Wed,  5 May 2021 16:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235946AbhEEQ6m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 May 2021 12:58:42 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:33694 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235844AbhEEQ4f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 May 2021 12:56:35 -0400
Received: from [77.244.183.192] (port=65286 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1leKo8-0004SH-Tg; Wed, 05 May 2021 18:55:33 +0200
Subject: Re: [PATCH] clk: vc5: fix output disabling when enabling a FOD
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210409125732.376589-1-luca@lucaceresoli.net>
 <CAHCN7xLSgkJKs-8baa9O303=x1jB=7khedyBMcoHP_33Obqdbg@mail.gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <a1ecb31b-8969-62d6-fccf-9196e595dd21@lucaceresoli.net>
Date:   Wed, 5 May 2021 18:55:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHCN7xLSgkJKs-8baa9O303=x1jB=7khedyBMcoHP_33Obqdbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Adam,

thanks for reviewing.

On 05/05/21 14:59, Adam Ford wrote:

[...]

>> @@ -581,6 +585,23 @@ static int vc5_clk_out_prepare(struct clk_hw *hw)
>>         unsigned int src;
>>         int ret;
>>
>> +       /*
>> +        * When enabling a FOD, all currently enabled FODs are briefly
>> +        * stopped in order to synchronize all of them. This causes a clock
>> +        * disruption to any unrelated chips that might be already using
>> +        * other clock outputs. Bypass the sync feature to avoid the issue,
>> +        * which is possible on the VersaClock 6E family via reserved
>> +        * registers.
>> +        */
> 
> Thanks for the comments here.  I with IDT/Renesas would better
> document this.

The support person who assisted me said he would suggest to document
this better. It would be good if you could add to their work.

> I might see if I can convince one of the hardware guys
> at my office to test the impact of radiated emissions.

That would be interesting to know, sure.

-- 
Luca
