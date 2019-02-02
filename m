Return-Path: <SRS0=iRVG=QJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A958C282D7
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:33:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25CA52086C
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:33:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="g73gLoP/";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="i5sl2Krj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbfBBPdg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Feb 2019 10:33:36 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:42686 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfBBPdg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Feb 2019 10:33:36 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5B3206030E; Sat,  2 Feb 2019 15:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121615;
        bh=C3LouqdKTry6iaw5pIRupJWOuNltVTZbLjuWCAQQoSY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g73gLoP/l+uskvb6AGaHEDCkozMkfmWj542Ta5uUC5bD369LW73H8H1WIM0kaF6fn
         sooBWpSL8WdbBXxQvfLpe9OdVi83GQBvY/5HBHfufDyaUxqnzbx67M2pofa7N3xKE3
         vJUY7ubRR5DIg2/ZoNFLDcv9HAl7xifG/e/bZn9U=
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id B19586030E;
        Sat,  2 Feb 2019 15:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121614;
        bh=C3LouqdKTry6iaw5pIRupJWOuNltVTZbLjuWCAQQoSY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=i5sl2KrjbmAQV5zBYePuE3YDOcs2L3r9HNOyOm46/bLDywd/NNgILpd0eG1sdjZ9+
         VFGpPVs2AHERwDGfCVnSXhnDMvZ3Y44pGKlB+7S9U8SRXYwDZLxpoJ4cEcBfqI40id
         PK2hw6dDGKGwyHHLPgdONcdN9c6pVlrmWjfqbLxE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 02 Feb 2019 21:03:34 +0530
From:   Govind Singh <govinds@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/7] dt-bindings: clock: qcom: Add QCOM WCSS GCC clock
 bindings
In-Reply-To: <154507529252.19322.2985382543561079731@swboyd.mtv.corp.google.com>
References: <20181215103557.2748-1-govinds@codeaurora.org>
 <20181215103557.2748-4-govinds@codeaurora.org>
 <154507529252.19322.2985382543561079731@swboyd.mtv.corp.google.com>
Message-ID: <6e07c00781d8b93a1cc361f946bff30f@codeaurora.org>
X-Sender: govinds@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2018-12-18 01:04, Stephen Boyd wrote:
> Quoting Govind Singh (2018-12-15 02:35:53)
>> Add device tree bindings for WiFi QDSP gcc clock controls found in
>> QCS404 soc.
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  include/dt-bindings/clock/qcom,gcc-qcs404.h | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h 
>> b/include/dt-bindings/clock/qcom,gcc-qcs404.h
>> index 00ab0d77b38a..8f800adda225 100644
>> --- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
>> +++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
>> @@ -146,6 +146,8 @@
>>  #define GCC_MDP_TBU_CLK                                        138
>>  #define GCC_QDSS_DAP_CLK                               139
>>  #define GCC_DCC_XO_CLK                                 140
>> +#define GCC_WCSS_Q6_AHB_CBCR_CLK                       141
>> +#define GCC_WCSS_Q6_AXIM_CBCR_CLK                      142
> 
> Does the register really call it FOO_CBCR_CLK? I'd prefer we drop the
> CBCR part unless you really want it to keep it.
> 

Thanks, removed CBCR in v4.

>> 
>>  #define GCC_GENI_IR_BCR                                        0
>>  #define GCC_USB_HS_BCR                                 1
