Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B19C433E6
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 22:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1D6623A5C
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 22:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730442AbhANWO2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jan 2021 17:14:28 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:39177 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730457AbhANWO1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jan 2021 17:14:27 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3214B3EECD;
        Thu, 14 Jan 2021 23:13:44 +0100 (CET)
Subject: Re: [PATCH 1/9] clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>
References: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
 <20210109134617.146275-2-angelogioacchino.delregno@somainline.org>
 <CAOCk7NqUpa0DqW=han49MtwUqNkNsQC3OPpO7B-872bvNukDJw@mail.gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <9942f98c-c186-5cd0-d6ac-a18a4e20583e@somainline.org>
Date:   Thu, 14 Jan 2021 23:13:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAOCk7NqUpa0DqW=han49MtwUqNkNsQC3OPpO7B-872bvNukDJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 14/01/21 23:12, Jeffrey Hugo ha scritto:
> On Sat, Jan 9, 2021 at 6:47 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
>>
>> This clock enables the GPLL0 output to the multimedia subsystem
>> clock controller.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> Any reason why you are not also adding the div_clk?
> 

Yes, just one: I haven't tested it... and my devices worked without.
Perhaps we can add it whenever we find out if something really needs it?
