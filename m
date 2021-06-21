Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D46C4743C
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jun 2021 11:56:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28529611CE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jun 2021 11:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhFUL6t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jun 2021 07:58:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59642 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhFUL6t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jun 2021 07:58:49 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15LBuVaV112034;
        Mon, 21 Jun 2021 06:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624276591;
        bh=/pcWz2xFQVtib2M9MYWzic93GeQSFEeEukJVrx91L3U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FHbIEcmlSxEG1MWwf+BQCc91gXmpbBrEg9kyxSdXx/7NgtADuOo2IMAGW+/F71N3Z
         DO29+74BLnxF1S3cm5sBUPclD16r9He099sQlLTl7sRcTRctJf6xHeRnr39cJK+EtL
         vPQU5llgXJcXfvw9mE++LPIW8AZNDbxmJBhH2mLU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15LBuV2u058299
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 21 Jun 2021 06:56:31 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 21
 Jun 2021 06:56:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 21 Jun 2021 06:56:31 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15LBuNJT026137;
        Mon, 21 Jun 2021 06:56:26 -0500
Subject: Re: [PATCH v2 0/2] clk: keystone: Add support for AM64 specific
 ehrpwm-tbclk
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Device Tree Mailing List <devicetree@vger.kernel.org>,
        <ssantosh@kernel.org>, Vignesh R <vigneshr@ti.com>,
        <linux-clk@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>
References: <20210528045743.16537-1-lokeshvutla@ti.com>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <49e19ea4-8cd1-60c4-9391-2d3c36746f3a@ti.com>
Date:   Mon, 21 Jun 2021 17:26:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210528045743.16537-1-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 28/05/21 10:27 am, Lokesh Vutla wrote:
> This series adds support for AM64 specific ehrpwm Time-base submodule
> clock.

Gentle ping on this series. If there are no objections, can we merge this series.

Thanks and regards,
Lokesh

> 
> Changes since v1:
> - Fixed register offsets and bits for clocks.
> - Update the compatible to ti,am64-epwm-tbclk, as high resolution is not
>   supported in AM64.
> 
> Lokesh Vutla (2):
>   dt-bindings: clock: ehrpwm: Add support for AM64 specific compatible
>   clk: keystone: syscon-clk: Add support for AM64 specific ehrpwm-tbclk
> 
>  .../bindings/clock/ti,am654-ehrpwm-tbclk.yaml   |  4 +++-
>  drivers/clk/keystone/syscon-clk.c               | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
