Return-Path: <SRS0=cuWe=W2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562FBC3A5A3
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 06:06:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 187632186A
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 06:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="X/14isQB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfH3GGs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Aug 2019 02:06:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33884 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfH3GGs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Aug 2019 02:06:48 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7U66iKq014590;
        Fri, 30 Aug 2019 01:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567145204;
        bh=qwhQsFTna3/EuFjyUJIYZ0Bj2vIrtTq3mKUVrHojvnY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=X/14isQBg9M69LaPsb5AgVAsluLVpQpFprSYyZxpoMefEen0L+9kOdppRWXphAUJd
         mRWHOqNvd+eBQZKZpXNeoSQZh1dYpwS0mD0SfNNojN9iUsq0ey0PwxAeUSMjJ0RcW8
         /LfTGrau0IIzbP+W2fGh1nytl3xunhOtGmji7KxY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7U66iPk054137
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Aug 2019 01:06:44 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 01:06:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 01:06:44 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7U66gLQ116654;
        Fri, 30 Aug 2019 01:06:42 -0500
Subject: Re: [PATCHv2 4/6] clk: ti: clkctrl: add API to notify reset status
To:     Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
References: <20190828065929.32150-1-t-kristo@ti.com>
 <20190828065929.32150-5-t-kristo@ti.com>
 <20190829200515.AFB0622CEA@mail.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <ed1e3868-af4d-8141-2a04-202923715d06@ti.com>
Date:   Fri, 30 Aug 2019 09:06:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829200515.AFB0622CEA@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/08/2019 23:05, Stephen Boyd wrote:
> Quoting Tero Kristo (2019-08-27 23:59:27)
>> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
>> index e3e0a66a6ce2..47a0d1398c6f 100644
>> --- a/drivers/clk/ti/clkctrl.c
>> +++ b/drivers/clk/ti/clkctrl.c
>> @@ -680,3 +689,38 @@ u32 ti_clk_is_in_standby(struct clk *clk)
>>          return false;
>>   }
>>   EXPORT_SYMBOL_GPL(ti_clk_is_in_standby);
>> +
>> +/**
>> + * ti_clk_notify_resets - Notify the clock driver associated reset status
> 
> This is completely unused in this patch series. What's going on?

This is needed by the OMAP reset driver. See:

https://lwn.net/Articles/797597/

-Tero

>> + * @clk: clock to notify reset status for
>> + * @asserted: true if all HW reset lines are asserted
>> + *
>> + * Some clkctrl clocks have associated resets for them which effectively
>> + * prevent the clock to transition from/to idle if the reset state is not
>> + * in sync. For the clock to transition to idle properly, all associated
>> + * resets must be asserted, and to leave idle, vice versa. To provide the
>> + * current reset status, the reset driver should issue this callback.
>> + */

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
