Return-Path: <SRS0=KID9=QW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BFEC43381
	for <linux-clk@archiver.kernel.org>; Fri, 15 Feb 2019 19:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BBD621B18
	for <linux-clk@archiver.kernel.org>; Fri, 15 Feb 2019 19:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xt+S/E2l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbfBOTTu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Feb 2019 14:19:50 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59900 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfBOTTu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Feb 2019 14:19:50 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1FJJjFw129695;
        Fri, 15 Feb 2019 13:19:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1550258385;
        bh=d5KLYy1vUatCQhywNWRGMrvVU6sWcY+zsGl3O+PhULU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xt+S/E2lsqI63WCClM1jgtvvWNZuQ02Du1BQ3+pRFc/WND3l/TlFvAj/LEY8kzW/o
         1dmVBDwGX+gg2R83V74iJph1lQvV+n3z7Z9AfgjzYVo0MRmBmEsyaddV0U6wfOVa8P
         H37cwWYQDebVuRrBj4ggNWs425oxTaHzXjGAtHD0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1FJJjYZ093478
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 Feb 2019 13:19:45 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Fri, 15
 Feb 2019 13:19:42 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Fri, 15 Feb 2019 13:19:42 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1FJJdlf003367;
        Fri, 15 Feb 2019 13:19:41 -0600
Subject: Re: [PATCH 0/4] clk: ti: get rid of CLK_IS_BASIC
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <linux-omap@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>
References: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
 <20190115182021.GH5544@atomide.com>
 <b7571829-fb5e-c2be-59d1-b08d73bfca6d@ti.com>
 <20190121195856.GI5544@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <611d9c22-de8b-3913-4cc8-11c5e30b50a6@ti.com>
Date:   Fri, 15 Feb 2019 21:19:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121195856.GI5544@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/01/2019 21:58, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [190115 18:32]:
>> On 15/01/2019 20:20, Tony Lindgren wrote:
>>> * Tero Kristo <t-kristo@ti.com> [190115 09:15]:
>>>> Hi Stephen,
>>>>
>>>> As requested, this series gets rid of CLK_IS_BASIC flag usage from
>>>> TI clock drivers.
>>>>
>>>> Boot tested on am3/am4/am5/omap3/omap4 series of SoCs. Also, ran a quick
>>>> suspend/resume test on omap3/omap4/am5.
>>>
>>> Does this also fix the issue Andreas was fixing earlier
>>> or is this separate clean-up?
>>
>> The series from Andreas would be needed on top of this.
> 
> OK so I acked Andreas' series, and here's an ack for
> this series too:
> 
> Acked-by: Tony Lindgren <tony@atomide.com>
> 

Queued up for 5.1, thanks.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
