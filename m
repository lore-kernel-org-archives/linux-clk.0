Return-Path: <SRS0=pXcS=43=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B57C10F27
	for <linux-clk@archiver.kernel.org>; Tue, 10 Mar 2020 11:04:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8963B2468D
	for <linux-clk@archiver.kernel.org>; Tue, 10 Mar 2020 11:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="Y28vOHU2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgCJLEq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Mar 2020 07:04:46 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:60931 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbgCJLEq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 10 Mar 2020 07:04:46 -0400
X-Greylist: delayed 2382 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Mar 2020 07:04:44 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=on/1XDRbw6x43hmVH8OZnVWKvKhaSL5RS5ovw2YMc8c=; b=Y28vOHU2jUV8tyB8DksmJSwq1L
        KZJOlg2bCXAbxAaN4gPv/5FgmYDU/JyALC4z0PC15JABJ8Uq8+yuRRI65UokTh8G1MIcXBrLlO64X
        paGfflOsWwp9GckDYb7RJlN33nN4iSjCuIEm9tjAA8wF6UAzMcQ7c3SN1dqy7KD1JSklA+tFbY6SA
        Ofi8T8796ayaJK1aAe9m5dyocpk3Iy0mL8zYUAInnah/zt/EdEwj4BL0eqXOtHlP5NO1Nip0z6R/d
        gFuvQxrhbENPWhOVsss5bE3Gg7VozHhdPmlVzhJosIAdl3nOStW1m6htGNaD1bU8f6eMo7FV9/JxG
        2ZS+L0Ng==;
Received: from dsl-hkibng22-54faa0-215.dhcp.inet.fi ([84.250.160.215] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1jBc4L-00070l-JT; Tue, 10 Mar 2020 12:25:01 +0200
Subject: Re: [PATCH] clk: Do not recalc rate for reparented clocks
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20200305175138.92075-1-thierry.reding@gmail.com>
 <158380492739.149997.15800995149056434664@swboyd.mtv.corp.google.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <21f65d74-eb09-6735-4338-8c5e865533ad@kapsi.fi>
Date:   Tue, 10 Mar 2020 12:25:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <158380492739.149997.15800995149056434664@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.250.160.215
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/10/20 3:48 AM, Stephen Boyd wrote:
> Quoting Thierry Reding (2020-03-05 09:51:38)
>> From: Thierry Reding <treding@nvidia.com>
>>
>> As part of the clock frequency change sequence, a driver may need to
>> reparent a clock. In that case, the rate will already have been updated
>> and the cached parent rate will no longer be valid, so just skip the
>> recalculation.
> 
> Can you describe more about what's going on and why this needs to
> change? For example, we have 'set_rate_and_parent' for cases where a
> driver reparents a clk during a rate change. Is that not sufficient
> here?
> 

I believe this is related to the memory clock change sequence on Tegra, 
where the EMC clock may have to be reparented multiple times during the 
rate change sequence.

If EMC is running off parent A, and the requested new OPP also uses 
parent A, we have to temporarily switch to a different OPP with parent B 
so that the rate change sequence can be executed on parent A without 
affecting the system's memory accesses.

Mikko

>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>   drivers/clk/clk.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index ebfc1e2103cb..49d92f4785a2 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -2079,7 +2079,14 @@ static void clk_change_rate(struct clk_core *core)
>>   
>>          trace_clk_set_rate_complete(core, core->new_rate);
>>   
>> -       core->rate = clk_recalc(core, best_parent_rate);
>> +       /*
>> +        * Some drivers need to change the parent of a clock as part of the
>> +        * rate change sequence. In that case, best_parent_rate is no longer
>> +        * valid. However, reparenting already recalculates the rate for the
>> +        * entire clock subtree, so we can safely skip this here.
>> +        */
>> +       if (core->parent == parent)
>> +               core->rate = clk_recalc(core, best_parent_rate);
>>   
> 
> I wonder if we can undo the recursion and figure out a way to make this
> only happen once, when we want it to happen.
> 
