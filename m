Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A87F9D9;
	Sat,  4 Jan 2025 09:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735982671; cv=pass; b=NxtRLRwCDyCb4KxAwDx7OVSqVM0Jb9Q2I9NoZUeMyk7TTdLmQr8Htjei+jSI3arTXO72lHkgdLT3G7zGJZBMJM9WoQ27BrBqmHiHKsfMQoDo9EXtQQQwt5A+QcdasVpuFnRuIa7XkQPU1nXBfcYCQC9B9ruosvbJbfEnSc293c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735982671; c=relaxed/simple;
	bh=NzH3XpzyOPdlEz1liBhSqEuWIzRapWSV6hAgOGau/e8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=P8+DhuvVs7vhkUJuTDhTJZSQjEbBkxm5X5Ep+BjEgdaCuv24jluNAGTEuB4UEs4v8ClJVHZ9SY8IECCCoAYm7MWkqTHeMZ867B4YxLD/fDRCDAttthd4+eExl7c3zsqOAb+yUlUFXnjL1ywzk1+PFHrfQ8orYbeUkD5jfU4y3CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=BvyrZwoG; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="BvyrZwoG"
ARC-Seal: i=1; a=rsa-sha256; t=1735982657; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LYzSUnTJa4+qoqXwETQswTmLOFuX6In09090bCG1gD2Sk9LGFv/V8C3+HQPArzFcI3w/aW7JFHLaloHc9l0sH3mbHhb8Zd12fYouQe8SSO9ZNKZqqWadU8jyiMNgZ/1+KbuQfQcnIyFDjzOKivQpkDfJnN7ackmus2ktZElb0Oo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735982657; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qvEpx9tQfQXItdvKztc15oCP5fKt3Y58w8GW9qtlxlc=; 
	b=LxEVbyYg6TRMuoWTgQJHODAn3EtzKr2hJrINi/Cdk/FRo/vJCFTbav98k4Q0Z/2fAqLYOUubDrdosLyX0GXndVVRbRJfFMPhhVwv0qA3+qXjpYB1MdbYbGp39tuQEVDwhDergr/x+LWtVnar4E4gmLcLdLWchvsq0vMLLBNoMIM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735982657;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=qvEpx9tQfQXItdvKztc15oCP5fKt3Y58w8GW9qtlxlc=;
	b=BvyrZwoGiBVKgBl3FFntZi2FyBxA990DWQnHxO04kqKDrv7zpz8Y1RAwd57rMFYT
	Sp4IeQV3pl34bp4UevHIHFhMFR/n0BwNxBk6OQxIdGfjjsCeNer9jDcYcwCY8AX7oll
	8igGyH7i9/NwMHU3qnRr3en9PbRQ0hRcvBnsKVX8=
Received: by mx.zohomail.com with SMTPS id 1735982655010619.9969737293264;
	Sat, 4 Jan 2025 01:24:15 -0800 (PST)
Message-ID: <39e6bf64-2ce6-45bb-b622-4b413efc185f@zohomail.com>
Date: Sat, 4 Jan 2025 17:23:58 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Xukai Wang <kingxukai@zohomail.com>
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
Content-Language: en-US
In-Reply-To: <zfjj33otyxiamsc7u2uwnvygcuhe7u2tfgiz6txp62emnddbw5@5iozmjg4eugn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112272919e6c0e1bd9cc03451a21400002fc0fb7a66b46d3058dff1e6030177366b5109484033fe1596:zu08011227921ab4ada6d5e1004a09b7cc0000070a5e76a6dd1681f716aa7fc6946386851f01117160353fc6:rf0801122c68307cbe1cf14e96e53fd7310000da8c39da26132efe406c58157136b906c4764e447eb07a30ab9ff330fafa:ZohoMail
X-ZohoMailClient: External


On 2024/12/30 15:54, Krzysztof Kozlowski wrote:
> On Sun, Dec 29, 2024 at 09:21:08PM +0800, Xukai Wang wrote:
>> This patch adds the Device Tree binding for the clock controller
>> on Canaan k230. The binding defines the new clocks available and
>> the required properties to configure them correctly.
>>
>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>> ---
>>  .../devicetree/bindings/clock/canaan,k230-clk.yaml | 41 ++++++++++++++++++
>>  include/dt-bindings/clock/k230-clk.h               | 49 ++++++++++++++++++++++
>>  2 files changed, 90 insertions(+)
> Please run scripts/checkpatch.pl and fix reported warnings. After that,
> run also 'scripts/checkpatch.pl --strict' and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.
Apologies for forgetting to use `--strict` with `checkpatch.pl`. I will
run it and address the warnings accordingly before next submission.
>> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ffd4e0b052455bf3dcedd9355d93764119df3d68
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Canaan Kendryte K230 Clock
>> +
>> +maintainers:
>> +  - Xukai Wang <kingxukai@zohomail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: canaan,k230-clk
>> +
>> +  clocks: 
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 2
>> +    minItems: 1
> List and describe the items instead.

OK, thank you for the suggestion. I've addressed the feedback and listed
the items under reg with detailed descriptions.

Here's the update version:

reg:
  description: |
    The `reg` property specifies the base address and size of the
device's registers.
    - The first address corresponds to the base address of the PLL
control registers.
    - The second address corresponds to the base address of the sysclk
control registers.
  minItems: 1
  items:
    - description: Base address and size of the PLL control registers.
    - description: Base address and size of the sysclk control registers.

Does this content look appropriate?

>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - '#clock-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    clock-controller@91102000 {
>> +        compatible = "canaan,k230-clk";
>> +        reg = <0x91102000 0x1000>, <0x91100000 0x1000>;
>> +        #clock-cells = <1>;
>> +        clocks = <&osc24m>;
>> +    };
>> diff --git a/include/dt-bindings/clock/k230-clk.h b/include/dt-bindings/clock/k230-clk.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..31d1f82fbcff654072ef1a8985a884377d801e72
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/k230-clk.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Kendryte Canaan K230 Clock Drivers
>> + *
>> + * Author: Xukai Wang <kingxukai@zohomail.com>
>> + */
>> +
>> +#ifndef CLOCK_K230_CLK_H
>> +#define CLOCK_K230_CLK_H
>> +
>> +/* Kendryte K230 SoC clock identifiers (arbitrary values). */
>> +#define	K230_CPU0_SRC			0
> Drop the indentation after '#define'
Thank you for your feedback. I have removed the indentation after #define.
> Best regards,
> Krzysztof
>
