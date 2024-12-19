Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94972236EB;
	Thu, 19 Dec 2024 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734608436; cv=none; b=QaEr2ul1lGFA8l8oBx1bUtWULvy8AiSTg02azvTt9X683tTN30KYLZPHEMg+V9czAa1tWmZNuXXsCXLysx0ovyEGXz3+V/tumkDxNAmLdN31HI/3K8eaeLb0Q+9TezvTS9PlpDudkMLj+cjgsRfB5H4wWwljDSIw5ivydyaFYuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734608436; c=relaxed/simple;
	bh=bXf1n5av++1NpzldNupTfjreWKWKA3AaiMuabD8m+hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KlhsfjioObCV26Uuyi7gXcDamcWRqgMmctPKgZhNCRbK4FOnWE66AYxEn+L0iyyXcXHACY6XwFl2iywQSgDxfsU3YE+Vc+L2/bgN+JGCJ6+QicR5rQxeiWkorgqM0XGJ1dSRDkEqmSqwBOECf4f+fObbR8iRwxuD+wUTmOhP82k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFGDTvua; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFGDTvua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50D6C4CECE;
	Thu, 19 Dec 2024 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734608436;
	bh=bXf1n5av++1NpzldNupTfjreWKWKA3AaiMuabD8m+hQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pFGDTvuaBFdrwRN7mos2xpbaqirH3A4Gc4bJuBccj4t80IWcimfpBZ4rPhu9k3sQq
	 2J4WMAfR/NY6hkNB4V5TLN/s7/3pKzI2G2ZRhBGfCTk//qZWENa3une6PX/tjb99ST
	 pW7v3JSgfqWZLhUhYQyg83LeYUz4iksvD+LzXsAgIhoQBaiNydBzgwgNp3haNNE/s8
	 C6QWhwnXrsx0SSoNSiZP+1xoEIF+qBnB+a7Y85zOCi8qUPiIJCephujKyyLPXW6xyB
	 KRaEQzw/KKFVcB+fwqbYrLB+Q8siczbbeWe9munP7bfBGVz6t5X1GpsWwCuup95V1t
	 I/4u8G5fZEyOg==
Message-ID: <73077b74-10b0-4191-a024-8b9edb21f507@kernel.org>
Date: Thu, 19 Dec 2024 12:40:30 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: cs2600: Add Fractional-N clock driver
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Paul Handrigan <paulha@opensource.cirrus.com>, mturquette@baylibre.com,
 sboyd@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
 <20241219024631.3145377-3-paulha@opensource.cirrus.com>
 <wv5od7uzup275onlvq36w4gvyh2j5oxepqkxiptanm5udidq5u@mbr64dxodkwd>
 <Z2P6wgUowoW3v7UX@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z2P6wgUowoW3v7UX@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2024 11:51, Charles Keepax wrote:
> On Thu, Dec 19, 2024 at 09:48:05AM +0100, Krzysztof Kozlowski wrote:
>> On Wed, Dec 18, 2024 at 08:46:31PM -0600, Paul Handrigan wrote:
>>> +/* DEVICE_ID2 */
>>> +#define CS2600_AREVID_MASK		GENMASK(7, 4)
>>> +#define CS2600_MTLRVID_MASK		GENMASK(3, 0)
>>> +
>>> +/* UNLOCK_INDICATORS */
>>> +#define CS2600_P_UNLOCK_STICKY		BIT(3)
>>> +#define CS2600_P_UNLOCK			BIT(2)
>>> +#define CS2600_F_UNLOCK_STICKY		BIT(1)
>>> +#define CS2600_F_UNLOCK			BIT(0)
>>> +
>>> +/* ERROR_STS */
>>> +#define CS2600_ERR_DEV_DEFECT		BIT(7) /* Device defective */
>>> +#define CS2600_ERR_OTP_CORRUPT		BIT(6)
>>> +#define CS2600_ERR_REG_CFG		BIT(5) /* Invalid register config */
>>> +#define CS2600_ERR_PLL_DISABLED		BIT(4)
>>> +#define CS2600_ERR_HW_CFG		BIT(3) /* Invalid HW Config */
>>> +#define CS2600_ERR_REFCLK_MISSING	BIT(2)
>>> +#define CS2600_ERR_CLKIN_UNSTABLE	BIT(1)
>>> +#define CS2600_ERR_CLKIN_MISSING	BIT(0)
>>> +
>>> +#define CS2600_PLL_OUT			0
>>> +#define CS2600_CLK_OUT			1
>>> +#define CS2600_BCLK_OUT			2
>>> +#define CS2600_FSYNC_OUT		3
>>
>> No, the entire point of the binding header is to bind. Drop all four
>> above and use properly your header.
>>
>> Otherwise I claim your binding header is not used or not really a
>> binding.
>>
> 
> This excert is from the drivers internal header not the binding
> header?
I replied in patch two, stripping unnecessary context. There is no
binding header here, so I do not understand your comment.

Best regards,
Krzysztof
