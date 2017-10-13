Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:55048 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753394AbdJMOur (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Oct 2017 10:50:47 -0400
Subject: Re: [PATCH v4 0/9] Mediatek MT2712 clock and scpsys support
To: Stephen Boyd <sboyd@codeaurora.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>,
        James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        srv_heupstream@mediatek.com
References: <1505793630-12590-1-git-send-email-weiyi.lu@mediatek.com>
 <20171012224540.GE18706@codeaurora.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ac7940d1-e23d-add2-b4b6-bd7cf66fea34@gmail.com>
Date: Fri, 13 Oct 2017 16:50:43 +0200
MIME-Version: 1.0
In-Reply-To: <20171012224540.GE18706@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 10/13/2017 12:45 AM, Stephen Boyd wrote:
> On 09/19, Weiyi Lu wrote:
>> This series is based on v4.14-rc1 and composed of
>> clock control (PATCH 1-4) and scpsys control (PATCH 5-9)
> 
> What's the merge plan? Can I apply the clk ones to clk tree and
> ignore the rest?
> 

Yes, please do so. I'll take scpsys, which depends on the clock patches.

Regards,
Matthias
