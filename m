Return-Path: <SRS0=IOJl=YR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74061CA9EAF
	for <linux-clk@archiver.kernel.org>; Thu, 24 Oct 2019 12:28:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C55A2166E
	for <linux-clk@archiver.kernel.org>; Thu, 24 Oct 2019 12:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ED+AWRoD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501931AbfJXM2y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Oct 2019 08:28:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42644 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfJXM2x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Oct 2019 08:28:53 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9OCSnYe027831;
        Thu, 24 Oct 2019 07:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571920129;
        bh=XKDzS588QHzU3lfZbz48kFp9v3KywTRpsctwZodHCxs=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=ED+AWRoDrSB5HeYTGbEjBUHCaDz0cR+fnPHz8WQo61aGMQFLBXYz2NtjSBPsgu5Kt
         M90Xw7bfrMWx0wrdj+J/NBct73iAHx5xzfS9MpoJ6gAuPcQIpU4oI3r6x9cNbN+h9w
         lCGk7tk+25oMcxHRnYVxMu8Qcze7VBir5o0oG7o8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9OCSns4002006
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Oct 2019 07:28:49 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 24
 Oct 2019 07:28:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 24 Oct 2019 07:28:39 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9OCSlS0127335;
        Thu, 24 Oct 2019 07:28:47 -0500
Subject: Re: [PATCH 0/2] clk: ti: fix GFX clocks for reset support
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
References: <20191007122604.18508-1-t-kristo@ti.com>
Message-ID: <313e46e3-b9e1-19c8-5580-9770176a3549@ti.com>
Date:   Thu, 24 Oct 2019 15:28:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191007122604.18508-1-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/10/2019 15:26, Tero Kristo wrote:
> Hi,
> 
> These two patches are on top of [1] to support GFX module reset
> properly for am3/am4 SoCs.
> 

Queued towards 5.5, thanks.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
