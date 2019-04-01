Return-Path: <SRS0=OKLv=SD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E956C43381
	for <linux-clk@archiver.kernel.org>; Mon,  1 Apr 2019 08:48:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB6D4214C6
	for <linux-clk@archiver.kernel.org>; Mon,  1 Apr 2019 08:48:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfDAIsD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Apr 2019 04:48:03 -0400
Received: from ns.iliad.fr ([212.27.33.1]:50820 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbfDAIsD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 1 Apr 2019 04:48:03 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id A0F8C20AD2;
        Mon,  1 Apr 2019 10:48:01 +0200 (CEST)
Received: from [192.168.108.8] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 87AEB20A84;
        Mon,  1 Apr 2019 10:48:01 +0200 (CEST)
Subject: Re: [PATCH v1] clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for
 8998
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Amit Nischal <anischal@codeaurora.org>
References: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr>
 <c1762201-a1fa-8ed1-24ff-f30916ee45dd@free.fr>
 <155389876377.20095.15037552865160559827@swboyd.mtv.corp.google.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <fd7f35ce-69c7-e92c-cb2e-b6bcf4126931@free.fr>
Date:   Mon, 1 Apr 2019 10:48:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <155389876377.20095.15037552865160559827@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Apr  1 10:48:01 2019 +0200 (CEST)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/03/2019 23:32, Stephen Boyd wrote:

> I keep asking Qualcomm engineers every time this comes up why they can't
> fix their phy initialization sequence.

If I had the clock-tree documentation, I'd give it a shot. But qcom sits
on their "internal" documentation like a dragon on his pile o' gold.

In the mean time, will you take the patch? :-)

Regards.
