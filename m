Return-Path: <SRS0=yexa=UK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618D4C43218
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 07:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 356902086D
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 07:24:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bVnnB3CV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404237AbfFKHYq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jun 2019 03:24:46 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35816 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404144AbfFKHYq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jun 2019 03:24:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5B7OeJr126159;
        Tue, 11 Jun 2019 02:24:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560237880;
        bh=S8TifoSSLw/cZ4aADOxrmYf5qF6IrYpAFQ1SQ0QCb3s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=bVnnB3CVUJ/0ovjEYE1i1ahcLlwqlxdrFq6nUOKiQOwSV9m50Go0XLY4ALDkTRyJN
         fFM9K0d/2pf8Mwy5xz3hA9DPtEUI2djgk69kwG0jc9b8E+EH6rhVONqBmtrBfuNllW
         U7qAOmXDnwI9QPMdLdEpzECj55faqabRYwGVragU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5B7OdCm094175
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Jun 2019 02:24:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 11
 Jun 2019 02:24:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 11 Jun 2019 02:24:37 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5B7OZg7127298;
        Tue, 11 Jun 2019 02:24:36 -0500
Subject: Re: [GIT PULL] clk: keystone: changes for 5.3
To:     <santosh.shilimkar@oracle.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <3bd8aa21-60a5-f36a-b86f-425ce4f0163e@ti.com>
 <fe1da566-d8f4-8f53-cad7-d3b2a6e2c638@oracle.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <885237d4-c7ce-3d08-472b-55cc12561e47@ti.com>
Date:   Tue, 11 Jun 2019 10:24:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fe1da566-d8f4-8f53-cad7-d3b2a6e2c638@oracle.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/06/2019 20:17, santosh.shilimkar@oracle.com wrote:
> On 6/10/19 5:13 AM, Tero Kristo wrote:
>> Hi Stephen, Mike, Santosh,
>>
>> Here's a pull request for the clock changes for keystone SoC for 5.3. 
>> The patches were acked by Santosh, so I took liberty to create a 
>> pull-request for these also. I snipped patch #5 out of the series (it 
>> is against drivers/firmware) and am planning to send a separate 
>> pull-request for this, or alternatively agree with Santosh how to 
>> handle it.
>>
> [...]
>>
>> The following changes since commit 
>> a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>>
>>    Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>>
>> are available in the git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
>> tags/keystone-clk-for-5.3
>>
> Am assuming Mike/Stephen will pick this up.

My email client accidentally picked up old email for Stephen, fixed now.

Stephen, do you want me to re-send this?

-Tero


> 
> Regards,
> Santosh
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
