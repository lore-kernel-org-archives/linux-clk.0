Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130F26F2B9;
	Mon, 30 Mar 2026 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868045; cv=none; b=lyQOI5l4DuMC51oAgbJax9gSLGZxuB6G6RwxR2TKgKUDHUowRYT7kzn+BBtLeKrMZvXqi0r7KMw9Wdu36Ss9MU4IzvDMFzbV7Qp4897dyMeFboeMB1SFccUuhBMk9eIDi7PFu/5tFlO4kN6zFPwHTvxRIN3pQRn5oU0lCgvG1vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868045; c=relaxed/simple;
	bh=MEE7gxYUNUvwMXzUPch6YApiPur4BpArrAJWoVhakJ4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hkuFhYdf95DFQ/Kb8aYRr4H4Ffj7OewjOkI7rCtCKPish7HySkHgKIf9upxQf7Bm6Vf+LzUYuXef8uRPSJcRDqtCW0CRplC4/3gBEO9L5KNOs2G8m14EAm9M/CdGf1nM93j/oj3hZRfC7az+Ex7dYY13/sNihDnozSdbLZIjP94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0Lq6/Hx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0Lq6/Hx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B203C4CEF7;
	Mon, 30 Mar 2026 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774868045;
	bh=MEE7gxYUNUvwMXzUPch6YApiPur4BpArrAJWoVhakJ4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=I0Lq6/HxMNeCt+twC6dNapO2SuOUtCdaVbfHFaRyMJD7AMQ7LBaPTBQtNC8Nj6dkr
	 1FOP0ZWdk4qCVdFaKsXLNncnXiQCyafcEzRrAyp3JR8fd9dY+dXD0TIEsa8mY3nIX6
	 xFgwscJaQaBCxKFbnhCW72vpkf/RXIczdEAu8hfyCfahE0HY9bgmeG1TP0sD1LNy5f
	 WliqCCy3oXWZnoQOAils5nWYgxiANN19GGynNyzze6Y35yUyx5WZUW69oYWM7ZTWpP
	 8PKe0aK/lLZLqyCJA/IVgq03vVs7IS5G4Eu/PsoFYQ6k4EH4G6tL7RjBoQiOTC4w4S
	 0WxYASLXD+crQ==
Message-ID: <cf3490f1-149d-447a-bbec-de7ff8f517af@kernel.org>
Date: Mon, 30 Mar 2026 12:53:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: amlogic: Fix redundant hyphen
 in "amlogic,t7-gp1--pll" string.
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>,
 devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ferass El Hafidi <funderscore@postmarketos.org>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
 <20260326092645.1053261-2-jian.hu@amlogic.com>
 <20260327-rough-spry-hyrax-8236de@quoll>
 <9830ff89-a145-41d1-98e9-1412f497d3f2@amlogic.com>
 <ebc6da60-d49f-4a44-9ecb-3ae70413a248@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ebc6da60-d49f-4a44-9ecb-3ae70413a248@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/03/2026 12:48, Krzysztof Kozlowski wrote:
> On 30/03/2026 12:44, Jian Hu wrote:
>>
>> On 3/27/2026 3:23 PM, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Thu, Mar 26, 2026 at 05:26:43PM +0800, Jian Hu wrote:
>>>> Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
>>>>
>>>> Fixes: 5437753728ac ("dt-bindings: clock: add Amlogic T7 PLL clock controller")
>>> Please run scripts/checkpatch.pl on the patches and fix reported
>>> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
>>> patches and (probably) fix more warnings. Some warnings can be ignored,
>>> especially from --strict run, but the code here looks like it needs a
>>> fix. Feel free to get in touch if the warning is not clear.
>>
>>
>> Thanks for your review.
>>
>>
>> This series is based on the clk-next branch (version v7.0-rc1).
>>
>>
>> Here are the check results without --strict:
>>
> 
> I checked before. Now I double checked:
> 
> b4 shazam...
> git format-patch -3
> scripts/checkpatch.pl 0*
> 
> Clearly a warning, also on v7.0-rc1.
> 
> So maybe you don't do it on the kernel you are claiming or just doing it
> on different code than you sent.
> 

It looks like it is b4 shazam problem which duplicates the Fixes tag. I
don't quite get why the tag is duplicated. I don't see anything on the
lists which would add wrong tag.

Well, that will be problem when applying, but nothing to be fixed here, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
