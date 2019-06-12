Return-Path: <SRS0=Rxbn=UL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8393AC31E46
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 11:42:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53FBD2082C
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 11:42:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JOwPNAVn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406569AbfFLLmN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jun 2019 07:42:13 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51272 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405753AbfFLLmN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jun 2019 07:42:13 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CBg7Y9056114;
        Wed, 12 Jun 2019 06:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560339727;
        bh=X9GWetnFoc3lyVeRgvGF28lI3oaQo9eTrBsWyExDUsY=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=JOwPNAVnxPF8akyfccJUGpSBZo4oNldJl+MyiUHAT5DGSW/s9vcEhctlJ9WhTQPW5
         TTQljSJOcLcJ17Dw0D6E1MKSuICjjmW/1EzApRD9jSwR3dcPwuGKGLv4HYZzFF2fNN
         HjHF9IEG795+FbYjvIde6Jkt8Cwpa98RqlZu6Ius=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CBg63t037191
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Jun 2019 06:42:07 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 06:42:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 06:42:06 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CBg4hW126419;
        Wed, 12 Jun 2019 06:42:05 -0500
Subject: Re: [GIT PULL] clk: keystone: changes for 5.3
From:   Tero Kristo <t-kristo@ti.com>
To:     <santosh.shilimkar@oracle.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <3bd8aa21-60a5-f36a-b86f-425ce4f0163e@ti.com>
 <fe1da566-d8f4-8f53-cad7-d3b2a6e2c638@oracle.com>
 <885237d4-c7ce-3d08-472b-55cc12561e47@ti.com>
Message-ID: <220b6f41-9eb9-0b7b-4113-d93ec4b5aed1@ti.com>
Date:   Wed, 12 Jun 2019 14:42:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <885237d4-c7ce-3d08-472b-55cc12561e47@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/06/2019 10:24, Tero Kristo wrote:
> On 10/06/2019 20:17, santosh.shilimkar@oracle.com wrote:
>> On 6/10/19 5:13 AM, Tero Kristo wrote:
>>> Hi Stephen, Mike, Santosh,
>>>
>>> Here's a pull request for the clock changes for keystone SoC for 5.3. 
>>> The patches were acked by Santosh, so I took liberty to create a 
>>> pull-request for these also. I snipped patch #5 out of the series (it 
>>> is against drivers/firmware) and am planning to send a separate 
>>> pull-request for this, or alternatively agree with Santosh how to 
>>> handle it.
>>>
>> [...]
>>>
>>> The following changes since commit 
>>> a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>>>
>>>    Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
>>> tags/keystone-clk-for-5.3
>>>
>> Am assuming Mike/Stephen will pick this up.
> 
> My email client accidentally picked up old email for Stephen, fixed now.
> 
> Stephen, do you want me to re-send this?

Actually, please ignore this pull-req... I will send an updated one 
which contains the firmware side change also. This seems like best 
applied via clock tree to avoid any merge / cross dependency issues 
between the two.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
