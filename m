Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4AD13DBB6;
	Sat,  4 Jan 2025 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735992618; cv=pass; b=RnAplS0eSsZEh74aNmtoG1z64UDOc3E3Vzb5nCvizVvFkDZaBUG9rwRO8qIY6jhd5xenqmCE/xWBTQhA/jseThfTM/Ls4PZ+GK+d7InQmV0s67hqSHJgIp3EaTwqekG/ghcD3Ctf/XgNsZc8L0+WylhYpUFRGEsoZLj6LkAHSEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735992618; c=relaxed/simple;
	bh=5JUHjp6L6hJ21gt6LbMC8188fqYyX1G1sECKcMtoG3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLnqMiWF7FiwloowPl5/iU+yJsxxLXwcagB2h4vM6Mw+5HwopSB7tmjZV8vI+KLJ06nmuqfTADgRknPRef5gSLBpUaf4vbcR1ZjLrstWWIs8i1CD0acd+DlmHrUAVxX6gEM/lVMXnCMrJC65YBXDcm+409JHl0rZ2tW+0+gwh4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=EIK+82I0; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="EIK+82I0"
ARC-Seal: i=1; a=rsa-sha256; t=1735992604; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lPt8JGbNPaODiEKElOAcn8idvZ3+61xpm3EP8xEu3ZMYfJPfGMuy5TXVr8AO3utQeNiWKwpwsIk2YY/cFXQhDTcy90L3nyFidAK3pFme1qEzwOVY3xjcYfQANWaIez/QM753lMKCjZ/d8eVfZFpTNpFHyQ/vr07XnvG2QEPAblg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735992604; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rXgxd4o5NjeP8XW0EW788UDZSYjiaeg8Pztng5GUR1A=; 
	b=lCntKarPiqn+UQHJQO34pYu//dxOotLNjUzBjTmWz71G0YHnFJgslAZ6lH+YzFVJbW15zvFcuSve5GHykbZa+8QHmN9XMz5GO42vQC9RmDLiSgymSHFwbuMvX+nJX7NP+GWpiDjZUhQUtTK/7CmKoQDv7qn1c3ENjQouI55RPM4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735992604;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=rXgxd4o5NjeP8XW0EW788UDZSYjiaeg8Pztng5GUR1A=;
	b=EIK+82I0gx0pM1oKMX6A6dLhIqepdqY18uYwkxU5x3nCJrevO6pnjk+uBCh1YdFm
	+A8WqsdH8PKECBrIX1fdbhK+8AalNx4iogZ3YV6tTeID4pof1izHi0XQMFhRRy6bUK+
	cVFzOGtHoqFeNzWT5LiPPSLku8J8G9VvPSE+i32k=
Received: by mx.zohomail.com with SMTPS id 1735992602298612.8567103281483;
	Sat, 4 Jan 2025 04:10:02 -0800 (PST)
Message-ID: <68de77d0-b289-4137-85f3-050a1a10eb63@zohomail.com>
Date: Sat, 4 Jan 2025 20:09:43 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
 <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
 <zfjj33otyxiamsc7u2uwnvygcuhe7u2tfgiz6txp62emnddbw5@5iozmjg4eugn>
 <39e6bf64-2ce6-45bb-b622-4b413efc185f@zohomail.com>
 <a097980a-c2b7-440c-8eff-b540acfd4027@kernel.org>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <a097980a-c2b7-440c-8eff-b540acfd4027@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112273357ae56f066f34e26e187de00009fa745e4b013b75f5ba77aea31dee152b69591f8df3e995104:zu08011227aaeab78d45b963750c283283000046e7d40b9e797c87120571555c4b4db3c1cc53350543a5e19e:rf0801122c33f344c4e8e2ae312c1a7a600000068732a4d2f3c18cbef365f9b2d60a6535e04d1be579789a143d6b102506:ZohoMail
X-ZohoMailClient: External


On 2025/1/4 18:40, Krzysztof Kozlowski wrote:
> On 04/01/2025 10:23, Xukai Wang wrote:
>> Here's the update version:
>>
>> reg:
>>   description: |
>>     The `reg` property specifies the base address and size of the
>> device's registers.
>>     - The first address corresponds to the base address of the PLL
>> control registers.
>>     - The second address corresponds to the base address of the sysclk
>> control registers.
> No, drop all these. You duplicate schema.
>
>>   minItems: 1
> Why?
>
>>   items:
>>     - description: Base address and size of the PLL control registers.
>>     - description: Base address and size of the sysclk control registers.
> Drop redundant "Base address and size of the". This cannot be anything
> else in this context.

Thank you for point these out, I’ve removed the redundant descriptions,
and here's the updated version:

reg:
  items:
    - description: PLL control registers.
    - description: Sysclk control registers.

Does this content look appropriate?

>>>> +
>>>> +  '#clock-cells':
>>>> +    const: 1
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +  - '#clock-cells'
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    clock-controller@91102000 {
>>>> +        compatible = "canaan,k230-clk";
>>>> +        reg = <0x91102000 0x1000>, <0x91100000 0x1000>;
>>>> +        #clock-cells = <1>;
>>>> +        clocks = <&osc24m>;
>>>> +    };
>>>> diff --git a/include/dt-bindings/clock/k230-clk.h b/include/dt-bindings/clock/k230-clk.h
> I missed one thing - filename is supposed to be the same as binding
> filename.
OK, I will rename the file `k230-clk.h` to `canaan,k230-clk.h` to
maintain consistency with the binding filename.
>
> Best regards,
> Krzysztof
