Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7B45172F3
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 21:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027209; cv=none; b=hKwqtcNwueTicyESaUwbMqAmLQAuTbU33gndFMDTGYxRbvxECibamUdIz8nxNcuGukp4DsiqAIDIOyeqCCpW7NNWUeNDlm/N90vBUzMG9x8dIunIrrngalrtBu7QLWm9/J6ZVWYdnAT0TZ2pwYvQZaAPPNPeKBKVg6IzjcXkEIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027209; c=relaxed/simple;
	bh=Fuc9EQUGqj6/GUb+IkWC45tdACOWCnFci3TWQu04GjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1cchcEk1mQ1xEQB49T6uRau6oLP22N+qybbSW/wWV5XqAPVWlWHw8HcYcbOp8FtYR2qqaenLeAcMgiwixJ3pvltSxuCrWprmKK3d1J/senmwZQ9VCRIJQfGPzHRSOwHebadM0kjCaqRxaOI75d9+SMZJLxDyNZY4sgQ0b4J7Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=bVwlSd05; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="bVwlSd05"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910c9fe21so137147385a.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 14:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790027205; x=1790632005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXu8IvNyQbPRE1tCCCvzelxBcNDsxBYdOKmM6QDYS5E=;
        b=bVwlSd05ex9oSZYY9XR2LQAkdxEm49vuz4VoFyn4Y9lyPm/Itf0yU0f9JKsmck9DK1
         ENrjtTsQgrF4EhnurVnpkZYsTipdgeY+DDJup2yttvN8TmFkQkq9wM3gnSk95jjjkozG
         XrxitRKIboxsfd4HdC64OJ5D7D5FMQlmD0Mty9d2SzxMkWiw5K7FNuxfh1gXKYjOhcmx
         Oinl0h7eawAvVG7t9/cz/2eGRmyc88Fmon0b2/x9H6Um4Q3zizDJrfbEeDbMQbM2vAPt
         3ObdDVZ75eXzrW1FCNhcl+ak1nVKWdhc/wP8H7pG4xoSkMogkZhhA+ZcXgQoKBcTyfeA
         qOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027205; x=1790632005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXu8IvNyQbPRE1tCCCvzelxBcNDsxBYdOKmM6QDYS5E=;
        b=Yu/ZlJdu2HBvViVMuyuFeyc7HrMvPa7qhzalBqs6EmuBlfEqkRiFeXfdGPfhrWmaeQ
         DekI//ING7tnPGijMCMQ/V/x9gE1PGZ3jDdvZwwE5X47HnoWPhp6SYxsPVdygnBJ6aY1
         KmX5R32AL01VIHcSsedD1UvYwARaC/r70+M/JDQC30TxHT3cosaf8svY2R1YX+kWXJ3H
         zznx7+VCgW31zPY7j5IRmG2kOelzjcbgA3hwzZtjNTog2zC005Mswb7gAWjLbTtDpmyY
         Nbiz6bKM5qfr6SJAMDqVhno2DxrNz0jLsNmWmeRntheSUKg49ccVoOI8r8hA0FYWqLcO
         6FrA==
X-Forwarded-Encrypted: i=1; AKwUvBzh0QtLl9r+nB4mQ+L8wnp3G0DdFzIUGKR2j281lk8b3dxbAJ/o76R6e0QUY+Cu2CJO4UVnMDCWsk0=@vger.kernel.org
X-Gm-Message-State: AFuF++mDOUvwno8RDzhvmFs7qJqyg7R1oVe6ys9sIdnWORb730arKI2M
	YZf0i9TWOmnvv3JoW4JPnKzwT6tcugxfNj3EjfhQNERwQ3EDeC4wznKVT9Xri+lcQMs=
X-Gm-Gg: AYBFou3KAEywa3WM+zIbF1aWVRdgPw8+uZwpIAYeTvv4mPe9tQieEbvQWnIXETMEsOk
	rjuLcYRprO0oR4ushcVsRHL8OBWx9wfS1I4VyoLl7gqsuirZZMkjYSf+E6b1+gjLQ993RT4oLG/
	y4ELNd+/3p2tI7NWGW2/CON5kUrhDMfsSYpesQXxLEMGYBZhMK95GTESyvVfGcWyRNvlUI5BuTw
	NW+EgFHXBW12QTpd+zmMece1gEx44kvl/clhOVFW2XzuBnv3TZ3PJ3Ukn8+0UX0G4q23B06xnoE
	ZRxDY/mP98zLbX0Pjn3PlkpRfCHyYLIYdU2EU6UCja7wYyJmTZJYRUnwgcYgVtvu+1HJVU+yx8d
	5ZHirDKI8W2uARZBPQwJ36XSxmuXcNMZnX1YUzAYDq9DN2zuFBrWeK+uBnfb/vVTueMiqLvUz66
	Y2GwQ4cdTP+0aKi0m2p5mQ76POvi4JkUtdETDq7FDui9gfNBtOftW5CY7+nsGeWgE8iz3HS9E=
X-Received: by 2002:a05:620a:90c4:10b0:93c:10ea:d740 with SMTP id af79cd13be357-93c17e324d8mr109812085a.2.1790027205403;
        Mon, 21 Sep 2026 14:46:45 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a604dasm24653985a.11.2026.09.21.14.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 14:46:45 -0700 (PDT)
Message-ID: <cea6054c-904b-4632-8004-f2c0fc15d934@riscstar.com>
Date: Mon, 21 Sep 2026 16:46:43 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: clock: introduce
 toshiba,tc9564-clock.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-3-elder@riscstar.com>
 <20260920-messy-successful-caracara-fcdbcd@quoll>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260920-messy-successful-caracara-fcdbcd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 1:21 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 18, 2026 at 11:52:31AM -0500, Alex Elder wrote:
>> +description: |

I suppose I don't need the '|' here either.

>> +  The Toshiba TC9564 is an SoC accessed by a host system through the
>> +  upstream PCIe port on the PCIe switch it implements.  The switch
>> +  includes an embedded PCIe endpoint that provides access to various
>> +  SoC peripherals (including a clock/reset controller) via its BARs.
>> +
>> +  The SoC is represented using a devicetree PCI endpoint bus, so the
>> +  clock controller is bound to its driver using a platform driver
> 
> Do not mention drivers here. Just say that host can access clocks etc
> via PCI.

Daniel and I discussed this this morning, and in the next version
I'll explain things from a little different perspective, and I
think it will help keep this focused on the hardware.

This particular binding should not even mention anything about
PCI.  Using the PCI endpoint bus means that the devices can be
bound based on compatible string (i.e. with platform drivers),
with no knowledge of access being provided by PCI.

> But then more questions. This is PCI, yes? So how are the clocks from
> PCI routed BACK to the main soc, which would justify having this in DTS
> in the first place?

This clock+reset controller is one of several IP blocks
within an SoC (Toshiba TC9564).  Most of these clock and
reset signals control things internal to this SoC, but at
least one clock signal and a few reset lines are exposed
externally, allowing them to be used by the platform that
incorporates the SoC.

Ultimately the TC9564 SoC has a single 25 MHz input clock,
and internal to the SoC there is an internal PLL that then
drives other clocks at rates derived from that.  We can
only enable/disable the clocks (we have no rate control).


But I think you have more and deeper questions too.

We are using the *PCI endpoint bus* model to represent this
SoC.  To me it seems that there is not full agreement on
some aspects of this model.

It is a weird situation, where the use of this *software*
model provides a means of more completely describing (using
devicetree) details of the hardware "behind" a PCI endpoint.


Despite PCI doing its own enumeration, PCI_DYNAMIC_OF_NODES
allows the PCI hierarchy to *also* have devicetree nodes
representing bridges and endpoints.

Building on that, a PCI function with a devicetree node
can include a "pci-ep-bus" sub-node.  That sub-node
provides a place to describe IP blocks (devices) that
can be accessed via the endpoint bus.

In our case, in addition to this clock+reset device, the
TC9564 SoC implements a UART, a GPIO controller, a network
interface, and so on.  All of these are accessed via the
endpoint bus associated with the PCI function's BAR 4
address space.

So this model differs from "normal" PCI devices in that a
single PCI endpoint (function) can expose more than just
one capability (in contrast with, for example, a PCI
function that implements only an Ethernet interface).

>> +  compatible string.  All of the clocks are simple gate clocks.
>> +
>> +  A total of 21 clocks are implemented, though two of these are not
>> +  controllable.  Access to the clock controller relies on PCIe being
>> +  functional, so the PCIe clock is assumed to be always on.  Similarly,
>> +  the PCIe controller relies on I2C, so the I2C clock is also assumed
>> +  to be always on.
>> +
>> +  In addition, 13 resets are implemented.  Similar to clocks, the PCIe
>> +  and I2C resets are assumed to be deasserted and cannot be controlled.
>> +
>> +  Clock and reset ids are defined in <dt-bindings/clock/toshiba,tc9564.h>.
>> +
>> +properties:
>> +  compatible:
>> +    const: toshiba,tc9564-clock
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  "#reset-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#clock-cells"
>> +  - "#reset-cells"
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/toshiba,tc9564.h>
>> +
>> +    clock@1004 {
>> +        compatible = "toshiba,tc9564-clock";
>> +        reg = <0x1004 0x20>;
>> +        #clock-cells = <1>;
>> +        #reset-cells = <1>;
> 
> No resources except small address space, so does not look like a
> separate device and should be folded into the parent node.

Modeling the TC9564 as an SoC using pci-ep-bus, this
*is* sensibly a separate device.

We actually started with everything rolled into the
stmmac networking driver, but after some discussion
we concluded that the pci-ep-bus model would be simpler
(and other than some challenges related to it being a
relatively new thing, it *is* quite a bit simpler and
better partitioned).

					-Alex

> 
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b2d3257b8f892..66d0e7e65adcb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -27670,6 +27670,13 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
>>   F:	drivers/media/i2c/tc358743*
>>   F:	include/media/i2c/tc358743.h
>>   
>> +TOSHIBA TC9564 CLOCK DRIVER
>> +M:	Alex Elder <elder@kernel.org>
>> +M:	Daniel Thompson <danielt@kernel.org>
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>> +F:	include/dt-bindings/clock/toshiba,tc9564.h
>> +
>>   TOSHIBA TC9564 PCI DRIVER
>>   M:	Alex Elder <elder@kernel.org>
>>   M:	Daniel Thompson <danielt@kernel.org>
>> diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
>> new file mode 100644
>> index 0000000000000..75732fddd3025
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/toshiba,tc9564.h
>> @@ -0,0 +1,54 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +#ifndef __ClOCK_TOSHIBA_TC9564_H__
>> +#define __ClOCK_TOSHIBA_TC9564_H__
>> +
>> +/* Clock IDs */
>> +
>> +#define CLOCK_MCU		0
>> +#define CLOCK_INTC		1
>> +/* #define CLOCK_PCIE		2 */
>> +/* #define CLOCK_I2C		3 */
> 
> Drop both, and SRAM is number 2. Or enable and implement them.
> 
> Best regards,
> Krzysztof

