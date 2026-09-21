Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D2D515967
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 21:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027208; cv=none; b=R5pJM/BPHbeSbNklETsksgUKSGDgRFYm+SxPlIHXEDzz3UA+eIkE/tniStxHrni1RLFPnYXdzHJMS1btqCTWjbhLBlBVkcmQRfJPvjpcaikhgufs2Nel9rP9HlwHlzWX6s4TByRKPrJiFSSoBiRPfnbh8JCMZRE6s2iCnIQLZgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027208; c=relaxed/simple;
	bh=Yc5Uc7ZFw+ABZqHHGfrsDtaZfnUyH0lPgtl/XXBBFbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdgkS6oIwXoNJssKzHgoEZa4lIbrnpBDMYpLw5KDCziYOt/i6fhsgO6oMX0JdntPPdPKjpXu6d47xJR8x7jTiryLZdMVNyJdJ1IhAkORrVLqa/NI9x97s8t9pPN9O7Wk9Ow1SpSB9inFwW+tM8/eDSxoVjMqRgMcJynGmxyUnAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=usOtonDa; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="usOtonDa"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109fafd6so287228585a.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 14:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790027204; x=1790632004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZyT8k12LGsI6T36jz5Fg5RlaOjRcJ/zSXFiTQ+h2nQ=;
        b=usOtonDaMYeMX3ZXgZaMup8ty4PM3XVEiN6I9tL/g6jEtooQtrH3AtpmkoV3OKDhGI
         CzO8IsyvLopA/W4KWaJDJ0TOuGFmA8BP5aFb7z0qnz4WqAxVWyAKeU8rBM4xeYv1Wq18
         T8psDYuiEpG+4hSUXXCkBp+RV89Kcmoqqw2Sng4JI5oVqP3kwkGwZ4ry9UsZkw/rZ78E
         MCAsCOanEbPyYgdzjH00LujvZA1sCg5Eh2qGEptbkdreLbkHvf4zp+zoX3NnUaXAemV/
         fozqoRz9M+kei7U5YJmCTtEHdTltjJojezjJOZtxhLi6CThD0oYhRnRkxNUxjQ30v5sd
         uEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027204; x=1790632004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZyT8k12LGsI6T36jz5Fg5RlaOjRcJ/zSXFiTQ+h2nQ=;
        b=t2p2lmxu0XL3EXRcaHOnBfekGSIX7I2uk8UvH++wI15Dwy+tzuVLL28VDwAf9py/0y
         yoIjcc2NuhTvtnHwyBuQA1jHDCeenL0gyXTPqfciF/FImHBfp1pd3InJzL2tnXzASaik
         wpbXG1km4iuKhtE9yDEc5Pb79JlcdKlL8CJ49wFxxJgmWJF+pJdg1eF3QvCqhwpsp07f
         1SgLk+iMjmt5DYI994PiI6qGLq0MY+cP+jGuy7p7Usl+IfNVNE19oepsz2C3bc98RcjD
         +4fT9/Jos4P1QImFtzENLOIL7UhnzcVWWiJ4A2GX8woWRQWVP5QdPy1F/bWs1a19eH6X
         AHlA==
X-Forwarded-Encrypted: i=1; AKwUvBzGesAH0x3v5o+YQ26g92+JO6V2xVPAuVFgFZ8ZCP0KjoGel7Vy/SNZheEFDuqffjebAIUDijJ1HZs=@vger.kernel.org
X-Gm-Message-State: AFuF++koUa1ptmlkkEtxDGjTVsnpZyAQK+SGNwTuLUQrTHrRZdMKWMYR
	L0LyJ1SBO0QZzLrDAPidDsPWx05b1QL7vxwaYXMAO43TGcNdE05QaOKixtSe29uO6bY=
X-Gm-Gg: AYBFou0jScmc46l5fRbpIWUqZKXYaCS3yNge+jVxN/aKMIQHnXkjNi3oskFZ+1gjp2c
	roXrw6jR3GFwL6rPmJJxRQLBFB1OKVjEYAgu9Ov4vTKfCILZltvWoh62U5FKB5sgo9RxnBkvL0/
	fB9DlVzIlpLb0YJ0GQY1mB9gVVhGkvEJ/9Kd3qHS+Omp8WVANrrMN7S+kopb71ttt/EXZzDsxvW
	HqLxNt5c/gLbPXsFzyF62MVvb0ARaYBnp7bsq8CReNLrNZOvYb8GAVSWPMgpePA+usnzeARJyqu
	t0PWYS2PamXXQYzy2Rp/H2Y7m7Gg3MMRp9E1zVPjiiT2hQHyc1yJsg3wjjzv6zcbKDFPWxzbUSB
	Af+ZoNr59BbSw3igtu53zYdqBBiQ65KnDJYwGyuIVSgBbvoiL5ZW4a3gdStZTLYAq091jA00Q6R
	Sgti8Erb2D4EZhscXqAqMiSqNBEQy3OhcKL5b3wEq/W03DYM8EYpBNKHWvHZV2kFwq5fhPPR4=
X-Received: by 2002:a05:620a:4496:b0:93b:d7d7:8739 with SMTP id af79cd13be357-93c15e4296bmr271488185a.46.1790027203515;
        Mon, 21 Sep 2026 14:46:43 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a604dasm24653985a.11.2026.09.21.14.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 14:46:43 -0700 (PDT)
Message-ID: <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Date: Mon, 21 Sep 2026 16:46:41 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
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
 <20260918165234.687224-2-elder@riscstar.com>
 <20260920-fiery-fanatic-manticore-6abf0a@quoll>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260920-fiery-fanatic-manticore-6abf0a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 1:18 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 18, 2026 at 11:52:30AM -0500, Alex Elder wrote:
>> Define the binding for a system controller used in the Toshiba
>> TC9564 SoC.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>

Thank you for your feedback, Krzysztof.

>> ---
>>   .../bindings/mfd/toshiba,tc9564.yaml          | 56 +++++++++++++++++++
>>   MAINTAINERS                                   |  1 +
>>   2 files changed, 57 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
>> new file mode 100644
>> index 0000000000000..32e73a727c82a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/toshiba,tc9564.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC9564 System Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.

OK.

>> +  The Toshiba TC9564 is an SoC accessed by a host system through the
>> +  upstream PCIe port on the PCIe switch it implements.  The switch includes
>> +  an embedded PCIe endpoint on one of its downstream ports that provides
>> +  access to various SoC peripherals (including a clock and reset controller)
>> +  via one of its BARs.  A system controller provides managed access to the
>> +  first two pages of this memory region to ensure accesses made by these
>> +  peripherals produce well-defined results.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: toshiba,tc9564-config
>> +      - const: syscon
>> +      - const: simple-mfd
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  ranges: true
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 1
> 
> Both properties and simple-mfd are redundant. You do not have children.

I think ranges, #address-cells, and #size-cells might have
been left here by mistake, and I hadn't noticed.  (They are
required to be included within a pci-ep-bus sub-node, but
even if that's why they're here, they're in the wrong place.)

I will remove these three properties, as well as the
"simple-mfd" compatible string in version 2.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
> 
> And this should be additionalProperties instead

OK.
>> +examples:
>> +  - |
>> +    syscon@0 {
>> +        compatible = "toshiba,tc9564-config",
>> +                     "syscon",
>> +                     "simple-mfd";
>> +        reg = <0x0 0x2000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
> 
> As you can see here - no children.

I have seen some examples of syscon nodes that incorporate
sub-devices, while others do not.

Our purpose for defining a syscon here is to coordinate
access for multiple devices to several registers located
within the same page of memory.

I think this device was originally defined in a sub-node
because the only memory accesses it requires are within
the range covered by the syscon.

Should we instead define the syscon to be a fairly trivial
standalone thing, and then refer to it in the clock/reset
device node by phandle?  (Or have the driver look it up
by compatible string?)

     tc9564_config_syscon0: syscon@0 {
         compatible = "toshiba,tc9564-config",
                      "syscon";
         reg = <0x0 0x2000>;
     };

     clock@1004 {
         compatible = "toshiba,tc9564-clock";
         toshiba,config-syscon = <&tc9564_config_syscon0 0x1004>;
         #clock-cells = <1>;
         #reset-cells = <1>;
     };
> I also have doubts that this is needed - I see no updates to the misc
> binding, which would be referencing it. But then another point would be,
> that you do not need separate child node, which has no properties.

I'm sorry if I'm missing something.  I saw other examples of
syscon nodes being defined, and tried to copy what I saw, but
obviously got it wrong.

> Well, has one - address space.
> 
> Lack of full picture is not helping here.

I will gladly provide a better picture, but I also want to
stay focused on what's necessary for the binding.

I have more in my next message.

					-Alex

> Best regards,
> Krzysztof

