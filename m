Return-Path: <SRS0=XCXc=UE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3963FC28CC6
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jun 2019 07:51:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13BA1206BA
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jun 2019 07:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Hc88SVJm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfFEHvI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jun 2019 03:51:08 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57850 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbfFEHvI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jun 2019 03:51:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x557p12c084053;
        Wed, 5 Jun 2019 02:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559721061;
        bh=Uii2Xjx5BpE3QqLNIntmpZQ4yu4iSLNPZaKQtbxCiAY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Hc88SVJme67yYSFUQ8AZ4LQgi9Hmix2GgByP9AO6xlpDX7E+/b6lUai8mZ8R4+9Pu
         TxFisOHqqlmSdRsUj8CYvFRgXNC90okDCcntgmQd356oZtxFInbWdtIUstOHRk678P
         UINevnyr1FUuzPXtxSBrqieqzT/FiyFCxya3mUQc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x557p1Lt115807
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Jun 2019 02:51:01 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 5 Jun
 2019 02:51:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 5 Jun 2019 02:51:00 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x557owC0084384;
        Wed, 5 Jun 2019 02:50:59 -0500
Subject: Re: [PATCHv2 0/5] clk: keystone: clock optimizations / fixes
To:     <santosh.shilimkar@oracle.com>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <ssantosh@kernel.org>, <nm@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>
References: <1559049024-30872-1-git-send-email-t-kristo@ti.com>
 <7d97db9a-71fd-0c44-a4ef-ef4d726cdb20@oracle.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <a0f19a9a-e06a-324b-82fe-ec0024f56fe0@ti.com>
Date:   Wed, 5 Jun 2019 10:50:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7d97db9a-71fd-0c44-a4ef-ef4d726cdb20@oracle.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/06/2019 20:55, santosh.shilimkar@oracle.com wrote:
> On 5/28/19 6:10 AM, Tero Kristo wrote:
>> Hi,
>>
>> This is a re-base / re-spin of the Keystone clock optimization series 
>> [1].
>>
>> Changes from v1:
>> - rebased on top of 5.2-rc1
>> - added support for clk-ids 255+
>> - changed patch #3 to parse also 'assigned-clocks' in addition to 
>> 'clocks'
>>    DT nodes only. This allows automatic (DT based) programming of clocks
>>    that are not directly touched by any driver.
>>
>> Please note that there is hard dependency between patches 4 & 5, patch #5
>> must be applied after patch #4, otherwise bad things will happen 
>> (basically
>> boot breaks.) The cast magic in patch #4 is done also so that this order
>> of patches can be used and bisectability is retained.
>>
> Acked-by: Santosh Shilimkar <ssantosh@kernel.org>

Thanks Santosh,

Stephen, are you going to be picking these up directly or do you want me 
to send a pull-req?

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
