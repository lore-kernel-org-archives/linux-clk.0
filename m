Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24FCC4332F
	for <linux-clk@archiver.kernel.org>; Mon,  4 Oct 2021 15:18:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9470C613C8
	for <linux-clk@archiver.kernel.org>; Mon,  4 Oct 2021 15:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234607AbhJDPUS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Oct 2021 11:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbhJDPUR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Oct 2021 11:20:17 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 76D71C061745;
        Mon,  4 Oct 2021 08:18:28 -0700 (PDT)
Received: from [192.168.178.130] (p57bc9c60.dip0.t-ipconnect.de [87.188.156.96])
        by mail.bugwerft.de (Postfix) with ESMTPSA id C45154EBB25;
        Mon,  4 Oct 2021 15:18:26 +0000 (UTC)
Message-ID: <ef40eb7c-2f3c-4745-a9a4-dd265bd7b240@zonque.org>
Date:   Mon, 4 Oct 2021 17:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 0/9] clk: cs2000-cp: add dynamic mode and more features
Content-Language: en-US
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210901093631.1403278-1-daniel@zonque.org>
 <72d37dde-f50a-df89-57c7-243e7f287680@zonque.org>
In-Reply-To: <72d37dde-f50a-df89-57c7-243e7f287680@zonque.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 9/22/21 11:44, Daniel Mack wrote:
> Mike, Stephen,
> 
> Is there a chance to get this series reviewed and potentially queued for
> 5.16?
> 
> We have clearance for the devicetree side, and the functional changes of
> the driver are all guarded by new feature flags, so my patches shouldn't
> break existing setups.

Gentle ping. Anything I can do to get this reviewed?


Thanks,
Daniel



> 
> 
> Thanks a lot,
> Daniel
> 
> 
> On 9/1/21 11:36 AM, Daniel Mack wrote:
>> This patch series adds support for dynamic mode, configurable clock
>> skip settings and a tranisition to regmap.
>>
>> The most significant change is the additional support for dynamic mode.
>> Currently, the driver only supports static mode in which the (currently
>> mandatory) CLK_IN clock input is not used by the hardware.
>>
>> Unlike v3 of this series, the patch stack now maintains full
>> compatibility with existing bindings. Rather than infering the mode of
>> operation through the presence of an optional clock, the driver now
>> parses a new DT property to enable the dynamic mode.
>>
>> Thanks,
>> Daniel
>>
>> Changelog:
>>
>> v4 -> v5:
>> 	* Fixed a regression for static mode configurations
>> 	* Added Rob's Acked-by signatures
>>
>> v3 -> v4:
>> 	* Introduced cirrus,dynamic-mode in favor of making CLK_IN
>> 	  optional
>>
>>
>> Daniel Mack (9):
>>   dt-bindings: clock: convert cs2000-cp bindings to yaml
>>   dt-bindings: clock: cs2000-cp: document aux-output-source
>>   dt-bindings: clock: cs2000-cp: document cirrus,clock-skip flag
>>   dt-bindings: clock: cs2000-cp: document cirrus,dynamic-mode
>>   clk: cs2000-cp: Make aux output function controllable
>>   clk: cs2000-cp: add support for dynamic mode
>>   clk: cs2000-cp: make clock skip setting configurable
>>   clk: cs2000-cp: freeze config during register fiddling
>>   clk: cs2000-cp: convert driver to regmap
>>
>>  .../bindings/clock/cirrus,cs2000-cp.yaml      |  91 +++++++
>>  .../devicetree/bindings/clock/cs2000-cp.txt   |  22 --
>>  drivers/clk/Kconfig                           |   1 +
>>  drivers/clk/clk-cs2000-cp.c                   | 240 +++++++++++-------
>>  include/dt-bindings/clock/cirrus,cs2000-cp.h  |  14 +
>>  5 files changed, 261 insertions(+), 107 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/clock/cs2000-cp.txt
>>  create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h
>>
> 

