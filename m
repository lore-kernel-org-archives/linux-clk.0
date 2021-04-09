Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669ADC433B4
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 01:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3886A610A8
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 01:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhDIBsr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 21:48:47 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15988 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDIBso (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Apr 2021 21:48:44 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGgvs6ztxzyP83;
        Fri,  9 Apr 2021 09:46:17 +0800 (CST)
Received: from [10.67.102.71] (10.67.102.71) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 09:48:26 +0800
Subject: Re: [PATCH -next] clk: qcom: Add missing MODULE_DEVICE_TABLE
To:     Stephen Boyd <sboyd@kernel.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mturquette@baylibre.com>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20210408135509.208921-1-clare.chenhui@huawei.com>
 <161791383177.3790633.17835417455437133606@swboyd.mtv.corp.google.com>
From:   "Chenhui (clare)" <clare.chenhui@huawei.com>
Message-ID: <87ec5a80-16d0-f3df-c05a-7750c29f881b@huawei.com>
Date:   Fri, 9 Apr 2021 09:48:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161791383177.3790633.17835417455437133606@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.102.71]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

在 2021/4/9 4:30, Stephen Boyd 写道:

> Quoting Chen Hui (2021-04-08 06:55:09)
>> Add missing MODULE_DEVICE_TABLE entries to support module autoloading,
>> as these drivers can be compiled as external modules.
>>
>> Signed-off-by: Chen Hui <clare.chenhui@huawei.com>
> Any fixes tag?
> .

Thanks for reviewing, fixes tags will be added in v2 patches, which I 
will send out later

