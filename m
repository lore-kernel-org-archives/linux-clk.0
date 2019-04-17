Return-Path: <SRS0=liI3=ST=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF92C282DA
	for <linux-clk@archiver.kernel.org>; Wed, 17 Apr 2019 11:14:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 766FA206BA
	for <linux-clk@archiver.kernel.org>; Wed, 17 Apr 2019 11:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c7f3FlOS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731116AbfDQLOx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Apr 2019 07:14:53 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54596 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729522AbfDQLOw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Apr 2019 07:14:52 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3HBEjJM053831;
        Wed, 17 Apr 2019 06:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1555499685;
        bh=Hr1AYxzHHxBW+hJnyWaePcMnVTcVC3XIMjGCvVuhcAM=;
        h=Subject:From:To:References:Date:In-Reply-To;
        b=c7f3FlOS0znmuIc3HtLT6HvQ78A4N2RlwA6CiGP/AUeadgXNpuZi5MGGl4fk/1Dlp
         8iLKFjIbeRba8Wh/El+BzKPQ33qd8KIF8KSGQcfaBQE5y5dt7nbpmdafaUqEjzKL5h
         qL2VBd8CEXK9zSAbvWADIOugora+o7I7bEQjcY7g=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3HBEiuJ077249
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 Apr 2019 06:14:44 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Apr 2019 06:14:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Apr 2019 06:14:43 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3HBEfxu044974;
        Wed, 17 Apr 2019 06:14:42 -0500
Subject: Re: [PATCH 0/3] clk: keystone: sci-clk: perf improvements
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, Santosh Shilimkar <ssantosh@kernel.org>
References: <1555093342-428-1-git-send-email-t-kristo@ti.com>
Message-ID: <e0c73c94-a830-4e5a-92b8-3d8e51dc9084@ti.com>
Date:   Wed, 17 Apr 2019 14:14:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555093342-428-1-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Santosh,

Seems I missed adding you to delivery of this series, sorry about that. 
Do you want me to re-post?

-Tero

On 12/04/2019 21:22, Tero Kristo wrote:
> Hi,
> 
> After some thinking, I decided to switch the clock scan method for
> the sci-clk completely over to DT based scan. For example, on am65xx,
> the boot time improvement for the clock probe is from 398ms down to
> 7.3ms. I retained the full firmware scan code behind a separate
> Kconfig option; this can be useful for some debugging purposes if
> someone needs to see all the clocks in a device.
> 
> Also, added patch #1 for cropping down the registered clock names,
> currently they are pretty long forms containing the full interconnect
> node paths, which makes the debugfs sort of un-usable.
> 
> -Tero
> 
> --
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
