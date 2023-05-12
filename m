Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536D6C7EE25
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 07:53:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240175AbjELHxN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 03:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240309AbjELHxL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 03:53:11 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2859E73C;
        Fri, 12 May 2023 00:53:05 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7D8A124E20D;
        Fri, 12 May 2023 15:53:04 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 15:53:04 +0800
Received: from [192.168.125.131] (113.72.146.187) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 15:53:03 +0800
Message-ID: <6cb0a92b-df60-7b04-775e-d7f0147ce737@starfivetech.com>
Date:   Fri, 12 May 2023 15:51:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     William Qiu <william.qiu@starfivetech.com>,
        <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        <linux-kernel@vger.kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Hal Feng <hal.feng@starfivetech.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-6-xingyu.wu@starfivetech.com>
 <20230512065046.bhblj4uci7hnjoof@krzk-bin>
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230512065046.bhblj4uci7hnjoof@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2023/5/12 14:50, Krzysztof Kozlowski wrote:
> On Fri, 12 May 2023 10:20:34 +0800, Xingyu Wu wrote:
>> From: William Qiu <william.qiu@starfivetech.com>
>> 
>> Add documentation to describe StarFive System Controller Registers.
>> 
>> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> ---
>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 67 +++++++++++++++++++
>>  MAINTAINERS                                   |  7 ++
>>  2 files changed, 74 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml
> 
> See https://patchwork.ozlabs.org/patch/1780353
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.

This patch need patch 1 about pll clock driver binding.
Do I need to merge syscon binding and pll binding together?

Best regards,
Xingyu Wu
