Return-Path: <SRS0=E8mG=X2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5501C388F3
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8317D2133F
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bR9ugv4d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733271AbfJAJVU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Oct 2019 05:21:20 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36072 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387555AbfJAJVU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 05:21:20 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x919LIfv066238;
        Tue, 1 Oct 2019 04:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569921678;
        bh=g2nxL4/yH00YZC/kWJ25TG0vCrn4PDOGYgkZYMmb2V8=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=bR9ugv4dKBQNzvyDRB+LDMo7bo2P54K7o9/b1Ve6U7OP/dO0Hh/i1G8Wllw8jf5Su
         +2hJNoRr2MYvYnZ7EHT29rsHilgekYBu6PQiFZqcVACVCQ271nSXGQRA0JSLAY12vE
         3OdioEL9efs9fZRCVbrWBbTMohFlrnIzAoW5XPoM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x919LIqG003188
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 04:21:18 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 04:21:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 04:21:17 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x919LGKc061620;
        Tue, 1 Oct 2019 04:21:16 -0500
Subject: Re: [PATCH 0/4] clk: debugfs: add some simple debug functionality
To:     Tero Kristo <t-kristo@ti.com>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
References: <20191001090202.26346-1-t-kristo@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <b8ec93f6-4dcf-2ff1-ff64-6da4ebd7f553@ti.com>
Date:   Tue, 1 Oct 2019 12:21:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001090202.26346-1-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/10/2019 12:01, Tero Kristo wrote:
> Hi,
> 
> I have been using a variation of these patches myself for several years
> for debugging / testing different clock issues. Basically what I do here
> is extend the functionality of debugfs to allow write access to certain
> properties, like rate, enable / prepare counts, mux parents.
> 
> This allows simple testing of new features or debugging directly from
> userspace. The functionality is hidden behind a Kconfig option because
> it can be rather dangerous to allow access to these unconditionally if
> the user does not know what they are doing.
> 
> Any thoughts?

I haven't reviewed the patches, but I've been using (earlier versions 
of) these, and at least for me they were of great value finding clock 
related issues.

So what it's worth, +1 from me.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
