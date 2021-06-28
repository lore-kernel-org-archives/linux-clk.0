Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219E1C2B9F4
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 16:03:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED26861C6B
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 16:03:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbhF1QGA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jun 2021 12:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbhF1QF7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jun 2021 12:05:59 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B17CEC061574;
        Mon, 28 Jun 2021 09:03:31 -0700 (PDT)
Received: from [192.168.178.130] (p57bc9a82.dip0.t-ipconnect.de [87.188.154.130])
        by mail.bugwerft.de (Postfix) with ESMTPSA id A55534C087A;
        Mon, 28 Jun 2021 16:03:28 +0000 (UTC)
Subject: Re: [PATCH v3 3/9] dt-bindings: clock: cs2000-cp: make clk_in
 optional
To:     Rob Herring <robh@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, mturquette@baylibre.com,
        sboyd@kernel.org
References: <20210617190912.262809-1-daniel@zonque.org>
 <20210617190912.262809-4-daniel@zonque.org>
 <20210624213317.GA2020700@robh.at.kernel.org>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <963c50c4-6adc-e437-dd12-08e75c2dbc84@zonque.org>
Date:   Mon, 28 Jun 2021 18:03:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210624213317.GA2020700@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/24/21 11:33 PM, Rob Herring wrote:
> On Thu, Jun 17, 2021 at 09:09:06PM +0200, Daniel Mack wrote:
>> CLK_IN is only used in dynamic mode and is hence optional.
>>
>> Re-order the clocks so REF_CLK is specified first.
> 
> It's not a compatible change. You can't do that unless you can explain 
> why it doesn't matter.

Hmm okay. And that rule also applies even if I patch all mainline users?


Daniel


> 
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
>>  .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>> index 79b90500f6ac..68efed8e5033 100644
>> --- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>> @@ -22,14 +22,15 @@ properties:
>>  
>>    clocks:
>>      description:
>> -      Common clock binding for CLK_IN, XTI/REF_CLK
>> -    minItems: 2
>> +      Common clock binding for XTI/REF_CLK, CLK_IN.
>> +      CLK_IN is optional and only used in dynamic mode.
>> +    minItems: 1
>>      maxItems: 2
>>  
>>    clock-names:
>>      items:
>> -      - const: clk_in
>>        - const: ref_clk
>> +      - const: clk_in
>>  
>>    '#clock-cells':
>>      const: 0
>> @@ -70,8 +71,8 @@ examples:
>>          #clock-cells = <0>;
>>          compatible = "cirrus,cs2000-cp";
>>          reg = <0x4f>;
>> -        clocks = <&rcar_sound 0>, <&x12_clk>;
>> -        clock-names = "clk_in", "ref_clk";
>> +        clocks = <&x12_clk>, <&rcar_sound 0>;
>> +        clock-names = "ref_clk", "clk_in";
>>          cirrus,aux-output-source = <CS2000CP_AUX_OUTPUT_CLK_OUT>;
>>        };
>>      };
>> -- 
>> 2.31.1
>>
>>

