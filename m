Return-Path: <SRS0=btre=VA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86288C0650E
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jul 2019 14:00:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 63EDC218A6
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jul 2019 14:00:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbfGCOAd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Jul 2019 10:00:33 -0400
Received: from ns.iliad.fr ([212.27.33.1]:50904 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbfGCOAd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 3 Jul 2019 10:00:33 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 0B91E206C4;
        Wed,  3 Jul 2019 16:00:32 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id E8268206B9;
        Wed,  3 Jul 2019 16:00:31 +0200 (CEST)
Subject: Re: [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
 <f96ab735-1001-5319-a314-b8079efd9046@linaro.org>
 <5d1ff6a7-7b3b-9bbf-f737-5347555a2076@free.fr>
 <CAP245DWbC8vY1pVuYnGvZ=7LVAAaqAm9TtccCktdxNWuuoxf5w@mail.gmail.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <d8cf720c-b44f-f4ea-1c26-92ce34fd31e6@free.fr>
Date:   Wed, 3 Jul 2019 16:00:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAP245DWbC8vY1pVuYnGvZ=7LVAAaqAm9TtccCktdxNWuuoxf5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jul  3 16:00:32 2019 +0200 (CEST)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/06/2019 15:57, Amit Kucheria wrote:

> On Mon, Jun 24, 2019 at 6:56 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>>
>> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 used to be enabled by default
>> in drivers/clk/qcom/Kconfig. A recent patch changed that by dropping
>> the 'default ARCH_QCOM' directive.
>>
>> Add the two options explicitly in the arm64 defconfig, to avoid
>> functional regressions.
>>
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> 
> Acked-by: Amit Kucheria <amit.kucheria@linaro.org>

Stephen,

Can you take the following two patches through the clk tree?

[PATCH v2] clk: qcom: msm8916: Don't build by default
[PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig

Regards.
