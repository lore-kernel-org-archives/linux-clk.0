Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B0EC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 10:31:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbiBOKbt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 05:31:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiBOKbs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 05:31:48 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A297714087;
        Tue, 15 Feb 2022 02:31:37 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2278481DB4;
        Tue, 15 Feb 2022 11:31:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1644921095;
        bh=Jp6DELwylC9l2KcOYBgmrBOoQohPZJac3Q1WiDJ1T54=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=L0ubO0OGmtVbXYBoGIYcZjqvI8Qu0pEjenvBNmG3Bgdzkruk0OMuX4jHC4AeW1iti
         gP+6FbQnRzwCseJeJXLOpZssxxvRXxwRGIUspWvG+Tm5BPJaDQ7mMEJ5FkFd/4fkyN
         z44bAupCVpsgkW5FasL2FYUgwjQNi8uQDaf4z9q6liohcgpoJGK8Y21UjUvVf8rxKH
         sqhVlak+W52JFjVuSjkcFsaaRzRAdwojFKAmV9Acr1Sbmf1M/kk6q5MAw5WlzuHfoR
         I/lwG+QE3xNTLk/agVKR+3gY7BgDxf8eDlxNFJqIfexsBwfuTmROTUnZzJvw3u/sce
         HCldh5JUskC8w==
Message-ID: <8406fe5c-9d79-db12-38ef-792683d88afb@denx.de>
Date:   Tue, 15 Feb 2022 11:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] [RFC] dt-bindings: clk: Introduce 'critical-clocks'
 property
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com
References: <20211108224242.278128-1-marex@denx.de>
 <YaU1oThMxsBJj+re@robh.at.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <YaU1oThMxsBJj+re@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/29/21 21:18, Rob Herring wrote:
> On Mon, Nov 08, 2021 at 11:42:42PM +0100, Marek Vasut wrote:
>> NOTE: This is an RFC patch showing how this mechanism might be workable.
>>
>> Some platforms require clock to be always running, e.g. because those clock
>> supply devices which are not otherwise attached to the system. One example
>> is a system where the SoC serves as a crystal oscillator replacement for a
>> programmable logic device. The critical-clock property of a clock controller
>> allows listing clock which must never be turned off.
>>
>> The implementation here is similar to "protected-clock", except protected
>> clock property is currently driver specific. This patch attempts to make
>> a generic implementation of "critical-clock" instead.
>>
>> Unlike "assigned-clocks", the "critical-clock" must be parsed much earlier
>> in __clk_register() to assign CLK_IS_CRITICAL flag to clk_init_data .flags
>> field. The parsing code obviously need to be cleaned up and factor out into
>> separate function.
>>
>> The new match_clkspec() callback is used to determine whether struct clk_hw
>> that is currently being registered matches the clock specifier in the DT
>> "critical-clock" property, and if so, then the CLK_IS_CRITICAL is added to
>> these newly registered clock. This callback is currently driver specific,
>> although I suspect a common and/or generic version of the callback could
>> be added. Also, this new callback could possibly be used to replace (*get)
>> argument of of_clk_add_hw_provider() later on too.
>>
>> Thoughts (on the overall design, not code quality or patch splitting) ?
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-power@fi.rohmeurope.com
>> To: linux-clk@vger.kernel.org
>> ---
>>   .../bindings/clock/clock-bindings.txt         | 16 ++++++++++++
>>   drivers/clk/clk-bd718x7.c                     | 15 +++++++++++
>>   drivers/clk/clk.c                             | 25 +++++++++++++++++++
>>   include/linux/clk-provider.h                  |  2 ++
>>   4 files changed, 58 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> index f2ea53832ac63..d9a783c35c5a1 100644
>> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> @@ -169,6 +169,22 @@ a shared clock is forbidden.
>>   Configuration of common clocks, which affect multiple consumer devices can
>>   be similarly specified in the clock provider node.
>>   
>> +==Critical clocks==
>> +
>> +Some platforms require clock to be always running, e.g. because those clock
>> +supply devices which are not otherwise attached to the system. One example
>> +is a system where the SoC serves as a crystal oscillator replacement for a
>> +programmable logic device. The critical-clock property of a clock controller
>> +allows listing clock which must never be turned off.
>> +
>> +   clock-controller@a000f000 {
>> +        compatible = "vendor,clk95;
>> +        reg = <0xa000f000 0x1000>
>> +        #clocks-cells = <1>;
>> +        ...
>> +        critical-clocks = <UART3_CLK>, <SPI5_CLK>;
> 
> This will need a schema definition in dtschema.
> 
> Otherwise, the concept is fine for me.

I sent out proper patches, also for the schemas.
