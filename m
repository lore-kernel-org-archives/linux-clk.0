Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509953043A5
	for <linux-clk@vger.kernel.org>; Wed,  5 Nov 2025 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341767; cv=none; b=ElforZfranGm8JKGJd/S7dNKjjBeQUso3z/37BgqgkkUisZx/bIrWUtk/m5/VoXAqgbaFRw4XCrYeidyNMmuuRFqocUhiT3ozT4Rh7MxH1LmaW0jX4oCuY21XFRNQ6FVIoZRwf4rFF3E2EBbQraIuFHyjO1JyIvD5efYp9PetAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341767; c=relaxed/simple;
	bh=Ii9b2rpzXiRDukDeUtY2WS5XvNAk5U97MkCbAXQdp7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqEPXp0i1MvFl2dM0mSaj6XajqONjw9bQ32EOrVmo+KAGr52PvO/ZZsKUs29QWAodFeXqPUl4GQGmm7o1+ZnQSOBspH/Afb6UnVjsuEBtGbBj6Zi94+c+R2wGPDFZyRDxxg+zJxSt1J+vdwrjEhpQy6tm0087keqTA/3tA5LfD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ugo+/H9y; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ugo+/H9y"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-378d50e1c77so52645491fa.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Nov 2025 03:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762341762; x=1762946562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lgjq5frjKtchDAt0hCN8TCDb53mEX1KChcG+cIgj+As=;
        b=Ugo+/H9y30ONhr7fDfdxbpsqWR3tRjLh+BuyplYG+qinlo2qxVVE4FuU4lqg9t8UmP
         fVDVTXoFX4dBwApTOCOGf3JNHagxzSd5IcYye46YRifeue4oQvK+rCDY6250s2aOUHg5
         fWNdaQqGIKnqGL+6iwoCI4B1KwMjvSghMySRVbLo/w8XC1vtrbeE+e8rvaXdbSppm6Pu
         jwzcMBE7OMaVCmpZm+PQVU/4EMvbFWk7ZoQe404b7k5sOktFJtHcSqzL3FIgWmRkzwO0
         dAicFKMGSMh+zzlQdFh553R+WyaxAPatOLu++DAI9JeRl9GL5PnvoTJduTUCYgVMQAlm
         q8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762341762; x=1762946562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lgjq5frjKtchDAt0hCN8TCDb53mEX1KChcG+cIgj+As=;
        b=J754R5upWfBYz6/8s/zGSqJ6/ZXpJkbOp2BlbazHEkrgAENd5HGkQxCsSXFg450jks
         YNRo7CloONF4idFpXFMHK9IH2dW2jSSTooREUEvLUvgXuoBolZk+vafZrh5XzOM96YXM
         2tQYfIZCcHylTomFceHHeAiNU1/4YhTM7JZ9xJivOnRsJMOvhUcxTzPWotQaB68tBqBK
         XvmPgjS5ScPNKm/6YKSaW90Fdxt0VECai4GXOWNPLHnrlG6h2w6QJZMnhT0FREN6aJ3n
         JECNxfFR+2OjptbqjsRJVNlcjmTbtypW21tGLpuFH69OKm2kiBayg+ZpDuxGK51m3PVE
         wDqA==
X-Forwarded-Encrypted: i=1; AJvYcCXeb63Tz5ZeRFp3R0C7fxhlIVxrFXqY6H5750WDdD3wpxMXpynRW0Ea5PgorKWJCQuTkHN+zfZTqRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSPieGl8YlzVY3SKCHyhK2soq9HaZUTFdVPeWxwogO7dfmCKv2
	TV/WpoTyFLcuBQOSTs63ntxtHxp+nmGJcdbtdM/yMi/Ldzcbh4BOArea
X-Gm-Gg: ASbGnctBvXh1XTPSF16NWJ4kiVnmHABQJxWe3+CMhaRc4RNezTr0SSDp3sj52fzswp8
	7TYSmlaprKmp+plQgbA6NwPYwxoDFylxRcYRmKvIk3500qov8mwtU+zi6up4iRHiCSD+92fU2+x
	cCfLd5UuZLRBkGhGonrNFO5/ZWbqjEsYTPejKVYn94a2FPcqQmld73qgjQX0g9ArZQpSL+DodbP
	ksk/L9wwJ10csMx3x2rk3LFtwYrUcjf++1vrOGwRAxChmJbL6SiaI5TQ7RA5Nb7BpN1ldYaMwaB
	Nz1GlK0eE9ayIJ2yo5RVv2VzOZ5jFLfgKbEmAjHcqw9jnJZMOnG3H9IFrpIkWNHW6vu+EvB/sNE
	oSntUmmBFZH7PxQ++eNCnRXjKYdAHC5XS8UQ7GpqkwucQx2srRu0CyTvvsUVH7Zm2UWJA6Q0249
	cAHm4EJuTLiBxSDEQOUF/mNN2JX6bFHJQGZCoo9RoJnjV5Dn1g5QXuqi1QKA==
X-Google-Smtp-Source: AGHT+IHpvSjuUZgOT3CU6iwhd3QH+qr/blJkYgQLVxgzQhufOUjboKrykT4Eu5lvIJTa8VYLu1Svkg==
X-Received: by 2002:a05:651c:4006:b0:37a:3b04:1a1b with SMTP id 38308e7fff4ca-37a513e604fmr6509411fa.12.1762341762189;
        Wed, 05 Nov 2025 03:22:42 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a415c8070sm14290231fa.28.2025.11.05.03.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 03:22:41 -0800 (PST)
Message-ID: <1aedf1a8-ddff-47fd-8afb-dd60dc42e12b@gmail.com>
Date: Wed, 5 Nov 2025 13:22:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] dt-bindings: regulator: ROHM BD72720
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel
 <sre@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-leds@vger.kernel.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-rtc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <cover.1762327887.git.mazziesaccount@gmail.com>
 <48fe6e2642db4484640b173cd71be1b245929122.1762327887.git.mazziesaccount@gmail.com>
 <176233320981.143013.4115240062372455834.robh@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <176233320981.143013.4115240062372455834.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2025 11:00, Rob Herring (Arm) wrote:
> 
> On Wed, 05 Nov 2025 09:35:59 +0200, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The ROHM BD72720 is a new PMIC with 10 BUCk and 11 LDO regulators.
>>
>> The BD72720 is designed to support using the BUCK10 as a supply for
>> the LDOs 1 to 4. When the BUCK10 is used for this, it can be set to a
>> LDON_HEAD mode. In this mode, the BUCK10 voltage can't be controlled by
>> software, but the voltage is adjusted by PMIC to match the LDO1 .. LDO4
>> voltages with a given offset. Offset can be 50mV .. 300mV and is
>> changeable at 50mV steps.
>>
>> Add 'ldon-head-microvolt' property to denote a board which is designed
>> to utilize the LDON_HEAD mode.
>>
>> All other properties are already existing.
>>
>> Add dt-binding doc for ROHM BD72720 regulators to make it usable.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> Revision history:
>>   v2 => v3:
>>   - drop unnecessary descriptions
>>   - use microvolts for the 'ldon-head' dt-property
>>
>>   RFCv1 => v2:
>>   - No changes
>> ---
>>   .../regulator/rohm,bd72720-regulator.yaml     | 149 ++++++++++++++++++
>>   1 file changed, 149 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml: patternProperties:^buck[1-10]$:properties:rohm,ldon-head-microvolt: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml

Nice! I'm not sure if anyone has said it but these bots are helpful :) I 
forgot the type to ldon-head when switching from -millivolt to 
-microvolt. I'll address this for the next version.

> doc reference errors (make refcheckdocs):

Thanks for including the make -command to the mail! I didn't even know 
about 'refcheckdocs' target.

> Warning: Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
> Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml: Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml

Hmm. I suppose this is because the MFD binding is added only later in 
the series(?) I suppose we can't help it because the MFD binding 
references the regulator binding as well. So, this is kind of a chicken 
and egg problem?

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
