Return-Path: <SRS0=rhXi=UU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D41C43613
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jun 2019 11:36:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A0F5208CA
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jun 2019 11:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfFULgB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jun 2019 07:36:01 -0400
Received: from ns.iliad.fr ([212.27.33.1]:60418 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726229AbfFULgB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 21 Jun 2019 07:36:01 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 2EFD0206B9;
        Fri, 21 Jun 2019 13:36:00 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 1364E20687;
        Fri, 21 Jun 2019 13:36:00 +0200 (CEST)
Subject: Re: [PATCH v3] clk: qcom: msm8916: Don't build drivers by default
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <0171956f-b367-9f3b-f690-71657d8c50ec@free.fr>
 <fe935706-b18d-8966-a447-c1fb2be25c85@linaro.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <d6f20e7b-2609-faf3-3dfa-aba644d8a9b6@free.fr>
Date:   Fri, 21 Jun 2019 13:36:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fe935706-b18d-8966-a447-c1fb2be25c85@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Jun 21 13:36:00 2019 +0200 (CEST)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/06/2019 15:47, Georgi Djakov wrote:

> On 19.06.19 14:44, Marc Gonzalez wrote:
> 
>> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
>> built by default. List them in defconfig after dropping the default.
>> 
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>> ---
>>  arch/arm64/configs/defconfig | 2 ++
>>  drivers/clk/qcom/Kconfig     | 2 --
>>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Sorry, I wasn't very clear. IMHO the defconfig change should be a
> separate patch and the v2 of this patch is ok as it is. It would just
> make things easier to merge.

Oh, I see. Could you give your Ack on patch 2 then?

Would the defconfig change go through the clk tree?
Or maybe through the qcom tree?

Regards.
