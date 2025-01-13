Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA2C22F171;
	Mon, 13 Jan 2025 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771852; cv=none; b=fOnpWgkaBJcZXJ5YnZTP64T2F8kdmf7b7aE8fTVDCu9D7Qoa3wvhjsLLJ8vvQoqq3XbV83YkJ7Zr0cMatZDy1veoHYA3EsDwHG7FfUX6cYZ0gIHeUCqdhJwEXJP5yXOt+zGZ1SHi7P0PtuIKAfgLJypP2n3CDsFenKa86M3ocHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771852; c=relaxed/simple;
	bh=mbBPNW6c+RqtsWyc2pa53sOG/h8AhY6zg2pwRtr3DSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPtOQMb/tzY05kvIx4OcnVLkqHQalY2Ix+OWLjNu+KGxlnUAadd+bZ+KVWNHopgcKOZE/SsJ0RogDd8+vC6CL15vSvjp//krlTDHHFf25KchsyKzfyKHpaQOl3ljjVbWeLNNZsKTTdP/4odAc1DcTLHY72zKdl53hOm987SVwD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWZnSS4j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWZnSS4j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BB3C4CED6;
	Mon, 13 Jan 2025 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736771852;
	bh=mbBPNW6c+RqtsWyc2pa53sOG/h8AhY6zg2pwRtr3DSs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bWZnSS4jU6dMOiHPmW05mUGpSDekqAsMRY5cZJVj6MIM3e53yOEDMktqjUyid8GsP
	 6DiavyJlOjLNqWqnzhBK/zApP4PPBrXa+OQEv56GVxjjY9EkttJOlr2zt0ZOw7GxXp
	 rm4iBSfAMuorTHQMUIb04b+Qwxe/YMA2qn2fCe7qTNiCRll1RBXpWSsRrjfV69DOg/
	 cNO7+HxdR4fAYmqZqvqrTqZTikaLUCMr5YinQvU+rArXccDsSDtAWwPj8tAZOCTjzs
	 UFp6vk06kRIFeMdqj+ppDKiQPDHQmSsXKW2FVy1pW8DsTftrf+sf9iHDDn1eICD3ax
	 /GAQXptPgQv6Q==
Message-ID: <cf9732b1-fd09-454e-bfd7-bef55b234175@kernel.org>
Date: Mon, 13 Jan 2025 13:37:27 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: add clock definitions for Ralink SoCs
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 yangshiji66@outlook.com, linux-kernel@vger.kernel.org
References: <20250113082818.345939-1-sergio.paracuellos@gmail.com>
 <ebb32bec-3fd4-4129-ab5d-d519b10c4405@kernel.org>
 <CAMhs-H9ysdJ9nUuStWJpRqTzm-09ZS5TMdhWgKMZx+JZdo6teQ@mail.gmail.com>
 <ec255edc-adcd-4c18-8f9c-209298f2bbff@kernel.org>
 <CAMhs-H9Osx__jBoxqAW1zWO4Q+nMymVfiWe_-ZSzp92Jht+JTg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAMhs-H9Osx__jBoxqAW1zWO4Q+nMymVfiWe_-ZSzp92Jht+JTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2025 13:29, Sergio Paracuellos wrote:
>>>
>>>> 2. What is the point of this? We do not add constants when there are no
>>>> users. Commit msg explains here nothing.
>>>
>>> All of the old ralink SoCs' dts files which are in the tree are not
>>> properly updated. I expect to have them updated somewhere in time
>>> merging real base stuff from openwrt dts [0] files. Not having this
>>> header with definitions makes very hard to update dts and then
>>> checking the driver code becomes a need to see the indexes for the
>>> clocks to properly setup a consumer node. Because of this, this file
>>> is added here.
>>
>> Still there is no point without the users. I do not see any reason why
>> this cannot be combined with fixing driver to use the header. Not
>> combining is an indication this is not a binding in the first place.
> 
> Driver uses a bunch of arrays for the clocks (base, fixed, factor and
> peripheral) and they are registered consecutively in order just using
> the ARRAY_SIZE macro for any of them. Thus, the direct application of
> these definitions would be for dts consumer nodes, not the driver
> itself.

So what do you constants here fix? Driver can still reorganize arrays
breaking everything. If defining headers for proper ABI, then use that
ABI to make everything build-time testable and visible. That's why this
is not supposed to be a separate patch from users.

Best regards,
Krzysztof
