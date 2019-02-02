Return-Path: <SRS0=iRVG=QJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BDAC282D7
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:32:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CDD5A20869
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="oG2xEKKP";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="gyxPSzhe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbfBBPc2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Feb 2019 10:32:28 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:41910 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfBBPc2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Feb 2019 10:32:28 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 675866030E; Sat,  2 Feb 2019 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121547;
        bh=vhjD8xw2EjzRJiUqEtC6bSIWmKN4mN4V3BFm6YVFVSY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oG2xEKKP5e6vio8JwbV4jxjG3sK4eaWGDluTc+TdWnfqsfLtP6aR1j2thyFNAArKX
         3oHwq/ipDs4fHWLxL1/vGulD+3JsnAX3Pxdy1W79OkBSBmON7RzjF90JidY+rLTtTT
         tq4JlWZDkN2egeYY5MZjEySzSlWCeqK5WEtIQeE4=
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id D6A7160351;
        Sat,  2 Feb 2019 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121546;
        bh=vhjD8xw2EjzRJiUqEtC6bSIWmKN4mN4V3BFm6YVFVSY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gyxPSzheVEjDl0dF0r1JbQ5bAj/kYh9sjEZ7B/8KFJC0ScfSFIT1Fw4CseNP/Bzl0
         bPOdQtw2O1meYCH7FFc7bocroNpcoALeVJZKQP2w6bUiFJXeUAAW9fU0mDPvLqS5lH
         MTOxK50Lu8DKLtilTS58AzVZpWsaUDris65b+zRo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 02 Feb 2019 21:02:26 +0530
From:   Govind Singh <govinds@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: qcom: Add WCSS gcc clock control for QCS404
In-Reply-To: <20181215175657.GB12886@minitux>
References: <20181215103557.2748-1-govinds@codeaurora.org>
 <20181215103557.2748-5-govinds@codeaurora.org>
 <20181215175657.GB12886@minitux>
Message-ID: <1b902e355d7b4f03229f821082e21147@codeaurora.org>
X-Sender: govinds@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2018-12-15 23:26, Bjorn Andersson wrote:
> On Sat 15 Dec 02:35 PST 2018, Govind Singh wrote:
>> diff --git a/drivers/clk/qcom/gcc-qcs404.c 
>> b/drivers/clk/qcom/gcc-qcs404.c
> [..]
>> @@ -2726,6 +2770,11 @@ static int gcc_qcs404_probe(struct 
>> platform_device *pdev)
>>  			return ret;
>>  	}
>> 
>> +#ifdef CONFIG_QCS_WCSSCC_404
> 
> We don't do compile time configuration of things like this, expect all
> variants of QCS404 (regardless of security solution) to run off the 
> same
> kernel binary.
> 
> Instead use the recently introduced "protected-clocks" property.
> 

Fixed in v4. Seems LPASS is no more using "protected-clocks", i used 
"unprotected-clocks" property to avoid inverted logic.

> Regards,
> Bjorn
