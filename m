Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53CAC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 18 Feb 2022 01:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbiBRBJq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 20:09:46 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:38226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbiBRBJp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 20:09:45 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5006E3BA7F;
        Thu, 17 Feb 2022 17:09:29 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1B5BC83764;
        Fri, 18 Feb 2022 02:09:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1645146567;
        bh=14iST5FeUS5RbDDo2bOjE1LXbfmy9laLrqGHDAyvzi4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZAywQqC5RsrGjyElizKPE/nCXZBZIX8od4+rb89nIg6heSkYBE+xcpbSW1YFJkjTT
         fy4S/q0aOXIRUwAjhQad1TO/Y6FyAZ1fRE50Mo9E0+MiuplRIfQ9vfWON7zIkgvEs9
         G/gyo5j/4VZc2SMNViifBUBDh/H2bBQHndpbFAAspRmDRKqLij95lR2dLXiN3MBt38
         F/niEP9ZtGi9IzU96RobI5wfKZznmlYUYZMNoIclLfEJ1Aopb9lxZwTre/+vX3tMW7
         Skp1UoFntLWVU7UKG7zq2aEqgbIgi4mTF7O0Eg76ecG3AA8LKV9b7G78cj9SeGKHSU
         hEsi7Yv7agALw==
Message-ID: <7605efbd-1a5e-ef80-5638-8376a325e3ba@denx.de>
Date:   Fri, 18 Feb 2022 02:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] dt-bindings: clk: rs9: Add Renesas 9-series I2C PCIe
 clock generator
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20220213173310.152230-1-marex@denx.de>
 <20220217233954.6C8ABC340E8@smtp.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220217233954.6C8ABC340E8@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/18/22 00:39, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-02-13 09:33:09)
>> diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
>> new file mode 100644
>> index 0000000000000..774053748d9f0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
>> @@ -0,0 +1,102 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/renesas,9series.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Binding for Renesas 9-series I2C PCIe clock generators
>> +
>> +description: |
>> +  The Renesas 9-series are I2C PCIe clock generators providing
>> +  from 1 to 20 output clocks.
>> +
>> +  When referencing the provided clock in the DT using phandle
>> +  and clock specifier, the following mapping applies:
>> +
>> +  - 9FGV0241:
>> +    0 -- DIF0
>> +    1 -- DIF1
>> +
>> +maintainers:
>> +  - Marek Vasut <marex@denx.de>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - renesas,9fgv0241
>> +
>> +  reg:
>> +    description: I2C device address
>> +    enum: [ 0x68, 0x6a ]
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: XTal input clock
>> +
>> +  renesas,out-amplitude:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [ 600000, 700000, 800000, 900000 ]
>> +    description: Output clock signal amplitude in uV
>> +
>> +  renesas,out-spread-spectrum:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [ 100000, 99750, 99500 ]
>> +    description: Output clock down spread in pcm
>> +
>> +patternProperties:
>> +  "^DIF[0-19]$":
>> +    type: object
>> +    description:
>> +      Description of one of the outputs (DIF0..DIF19).
>> +    properties:
>> +      renesas,slew-rate:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [ 2000000, 3000000 ]
>> +        description: Output clock slew rate select in V/ns
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
> 
> Can it operate without an input xtal?

Not to my knowledge.

[...]
