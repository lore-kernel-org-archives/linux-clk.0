Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BA9C433E6
	for <linux-clk@archiver.kernel.org>; Thu,  7 Jan 2021 04:12:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A85923139
	for <linux-clk@archiver.kernel.org>; Thu,  7 Jan 2021 04:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbhAGEMU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jan 2021 23:12:20 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2545 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbhAGEMU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jan 2021 23:12:20 -0500
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4DBCSD3M4LzVxqX;
        Thu,  7 Jan 2021 12:10:04 +0800 (CST)
Received: from [10.140.157.68] (10.140.157.68) by
 dggeme755-chm.china.huawei.com (10.3.19.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 7 Jan 2021 12:11:35 +0800
Subject: Re: [PATCH v7 1/4] dt-bindings: Document the hi3559a clock bindings
To:     Rob Herring <robh@kernel.org>
CC:     <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <vkoul@kernel.org>,
        <linux-kernel@vger.kernel.org>, <dan.j.williams@intel.com>,
        <mturquette@baylibre.com>
References: <20201215110947.41268-1-gengdongjiu@huawei.com>
 <20201215110947.41268-2-gengdongjiu@huawei.com>
 <20201221185425.GA355861@robh.at.kernel.org>
From:   Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <9e53ee69-f963-e0b8-e853-7a56ab8e45fd@huawei.com>
Date:   Thu, 7 Jan 2021 12:11:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20201221185425.GA355861@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.140.157.68]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2020/12/22 2:54, Rob Herring wrote:
> On Tue, 15 Dec 2020 11:09:44 +0000, Dongjiu Geng wrote:
>> Add DT bindings documentation for hi3559a SoC clock.
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>>  .../clock/hisilicon,hi3559av100-clock.yaml    |  59 +++++++
>>  include/dt-bindings/clock/hi3559av100-clock.h | 165 ++++++++++++++++++
>>  2 files changed, 224 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/hisilicon,hi3559av100-clock.yaml
>>  create mode 100644 include/dt-bindings/clock/hi3559av100-clock.h
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Thanks a lot for the Reviewed-by.
Whether this series patches can be queued to mainline?

> .
> 
