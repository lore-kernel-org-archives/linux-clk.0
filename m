Return-Path: <SRS0=W+YX=MP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070ABC00449
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 12:39:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2B392082A
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 12:39:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y54yrncs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2B392082A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbeJCT1Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Oct 2018 15:27:24 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35992 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbeJCT1Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Oct 2018 15:27:24 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w93CcoTE019354;
        Wed, 3 Oct 2018 07:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1538570330;
        bh=Jt0bFKRX14lKjIUvjC/LeTOPp6P+yGBXWUzVWRoQLUU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Y54yrncsoTEuCO1tOM5lZ5PB0cPrI+R6J0EB2lT4E0O2xhHs5KarzrWWR8SPAibkT
         ZigkE0fG6HpNIWEUeDj54d+FhU2XspCqUOM/uREOJ/Tb41CXHhdNy4X1jJdI/TesVB
         NVf+1yFD+XM7yY1XqM/0U5pLUKPTOAhek7z2U+d8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93CcoWi013823;
        Wed, 3 Oct 2018 07:38:50 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 3 Oct
 2018 07:38:49 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 3 Oct 2018 07:38:49 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93CcjpJ024625;
        Wed, 3 Oct 2018 07:38:46 -0500
Subject: Re: [PATCH v3 RESEND 0/4] clk: clk: Add functions to save/restore
 clock context en-masse
To:     Keerthy <j-keerthy@ti.com>, <tony@atomide.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <ssantosh@kernel.org>, <d-gerlach@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <russ.dill@ti.com>
References: <1536043778-2232-1-git-send-email-j-keerthy@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <c46b0b42-2325-7baf-2e97-5e45b26aaea4@ti.com>
Date:   Wed, 3 Oct 2018 15:38:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536043778-2232-1-git-send-email-j-keerthy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Keerthy,

Queuing the three clock patches for 4.20 (assuming these can still fit 
in), the pm33xx related patch should be picked up by Tony.

-Tero

On 04/09/18 09:49, Keerthy wrote:
> Deep enough power saving mode can result into losing context of the clock
> registers also, and they need to be restored once coming back from the power
> saving mode. Hence add functions to save/restore clock context.
> 
> Tested for DS0 on am437x-gp-evm
> 
> Based on top of linux-next
> 
> Resend Series:
> 
>    * Rebased on top of Linux 4.19-rc2
>    * Added Tony's Ack.
> 
> Changes in v2:
> 
>          * Renamed clk_dflt_restore to clk_gate_restore_context
> 
> Changes in v3: Corrected the e-mail address of linux-omap list
> 
> Keerthy (2):
>    clk: clk: Add clk_gate_restore_context function
>    ti: pm33xx: Save/restore clk context based on enable_off_mode setting
> 
> Russ Dill (2):
>    clk: clk: Add functions to save/restore clock context en-masse
>    clk: ti: Add functions to save/restore clk context
> 
>   arch/arm/mach-omap2/pm33xx-core.c    |  15 +++++
>   drivers/clk/clk.c                    |  93 ++++++++++++++++++++++++++
>   drivers/clk/ti/clock.h               |   2 +
>   drivers/clk/ti/divider.c             |  36 ++++++++++
>   drivers/clk/ti/dpll.c                |   6 ++
>   drivers/clk/ti/dpll3xxx.c            | 124 +++++++++++++++++++++++++++++++++++
>   drivers/clk/ti/gate.c                |   3 +
>   drivers/clk/ti/mux.c                 |  29 ++++++++
>   drivers/soc/ti/pm33xx.c              |  13 ++++
>   include/linux/clk-provider.h         |   9 +++
>   include/linux/clk.h                  |  25 +++++++
>   include/linux/clk/ti.h               |   6 ++
>   include/linux/platform_data/pm33xx.h |   1 +
>   13 files changed, 362 insertions(+)
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
