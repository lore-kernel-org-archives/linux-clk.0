Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBFDC43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 18:32:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1343E20859
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 18:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZDGuI/AO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388198AbfAOScK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 13:32:10 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44700 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbfAOScK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jan 2019 13:32:10 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0FIW2ie010311;
        Tue, 15 Jan 2019 12:32:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1547577122;
        bh=kXCPiqIV7N1HRuUlTm+rbpmKX9N8RjJnWGOM+o7L1+U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ZDGuI/AO0+kifqfW7t02HT8eHWHpx9T0StNQ+kyDvf+S2Qm2GEe+bhEvErVu/o3Y2
         wZJemub5qo/6vAFuZ3m6gen6WBGufiwv/Qih+emCXIhSyfOR3GkXuWjjK5uERxK7bc
         2ZnKZgfcLfkqo89B0uDWMdeC3t9PqGyrolYHpUPk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0FIW2ct018166
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Jan 2019 12:32:02 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 15
 Jan 2019 12:32:00 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 15 Jan 2019 12:32:00 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0FIVwFc020023;
        Tue, 15 Jan 2019 12:31:58 -0600
Subject: Re: [PATCH 0/4] clk: ti: get rid of CLK_IS_BASIC
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <linux-omap@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>
References: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
 <20190115182021.GH5544@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <b7571829-fb5e-c2be-59d1-b08d73bfca6d@ti.com>
Date:   Tue, 15 Jan 2019 20:31:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190115182021.GH5544@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/01/2019 20:20, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [190115 09:15]:
>> Hi Stephen,
>>
>> As requested, this series gets rid of CLK_IS_BASIC flag usage from
>> TI clock drivers.
>>
>> Boot tested on am3/am4/am5/omap3/omap4 series of SoCs. Also, ran a quick
>> suspend/resume test on omap3/omap4/am5.
> 
> Does this also fix the issue Andreas was fixing earlier
> or is this separate clean-up?

The series from Andreas would be needed on top of this.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
