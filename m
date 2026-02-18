Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F53346FA2;
	Wed, 18 Feb 2026 19:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771443453; cv=none; b=tGUo37uESp9LUScH6/g8OFnGR08Rwir1K4XmflGwFwgNBvb7EpFD+OljFcSfZJ8KfMP0vNrBdbm49fdIbDbnJGAzH/UYieu7iN/XhScWMIEa4mJCkBzHlYHl4sQsjGMbaIm/N7wQhT0rrnDTLrXBFsKPRBhO7dFo3q/b4BW2Ajk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771443453; c=relaxed/simple;
	bh=QSiqkbhCSpolIkwNN+rC3vaMUgZzv7ANdP1o/sqB688=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZiP/hE4KwJ/dvjxciQ8D1AJttbDfcsUMdfeZtyGRswQpCR6St2qFOglmMd62Ty1KIyKVIz+qeFX8LGlkXYBmO9VqXnzCemJ0PfuZZnBTI1A9ZqM9ATIhdQs9k59ctnYxrtfPaj+giFHDgkylKxORqRWHMVi2fl4qNfE1E+EgK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOkcS/Er; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOkcS/Er"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036B0C116D0;
	Wed, 18 Feb 2026 19:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771443453;
	bh=QSiqkbhCSpolIkwNN+rC3vaMUgZzv7ANdP1o/sqB688=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZOkcS/ErtAIjMD3HRMBI7YVgjiLKsh2sPQVPvL/D4zPQ5ZRVgaBxhD4Ch7Iw1gIiu
	 J9PY+wv38ObXbCKmiN9W4BjTkiOAo+hRJx6TnGOOU4OQkJ2LJYEVO2pjl+mCti25/E
	 w9Kjs4e6dqd0/n19qO9MwqHlnpnfWMKgloNzMfz6rnC7XR4+cijeaZwBFnmCGzE5GH
	 Zm9Fhw2nIu3cC3mpdXGT6iliz7KPKlUQm2pUl5ZSVtVZ0RREyJDAKhCGpEKBejosUt
	 I44ELY2gGbxbmq34KB6sP9CUc5WUdbamfCmJesc19M3oNKrkOT4To2UTwBeql/bZY1
	 18Vo2OrPJnBcA==
Message-ID: <fc25180a-859a-45da-b3f8-7ccb2e4d73cf@kernel.org>
Date: Wed, 18 Feb 2026 20:37:29 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll
 support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-amlogic@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
 <20260218105611.36216-1-linux-kernel-dev@aliel.fr>
 <594f4fcc-ad88-4969-b9e5-98061fd5b73c@kernel.org>
 <1j8qcp6ed1.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1j8qcp6ed1.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/02/2026 20:28, Jerome Brunet wrote:
> On mer. 18 févr. 2026 at 20:17, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 18/02/2026 11:56, Ronald Claveau wrote:
>>> Add PLL for the clock controller of the Amlogic T7 SoC family.
>>>
>>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>> ---
>>>  include/dt-bindings/clock/amlogic,t7-pll-clkc.h | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>
>> So you ignored my comments?
>>
>> And that's v2, not v1. You sent v1 and GOT the comments.
> 
> I think this was still v1 and if you look at timestamps, Patch 1 was sent

No

> before your first reply, then there is lot of time between the different
> patches - probably done manually  ... at patch 6 (the one you've
> commented fist) was sent twice.

1. v1:
https://lore.kernel.org/all/20260218101728.35497-1-linux-kernel-dev@aliel.fr/
Wed, 18 Feb 2026 11:17:26 +0100

2. My reply 5 minutes later:
https://lore.kernel.org/all/a848fa43-6a46-4fd6-86a4-96aaf82e2a02@kernel.org/
Wed, 18 Feb 2026 11:21:13 +0100	

3. This patch send half an hour later:
https://lore.kernel.org/all/20260218105611.36216-1-linux-kernel-dev@aliel.fr/
Wed, 18 Feb 2026 *11:56:09* +0100	

after I already provided feedback about wrong threading.


Best regards,
Krzysztof
