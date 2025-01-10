Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D62205ABA;
	Fri, 10 Jan 2025 11:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736508533; cv=pass; b=lqDo0JDLg3U8QW6ZfQc4PQCSwG4FjL1mClKOCaXj59Q+vFvYVjs0XzAiSBoyDDLxyL8DTEM3KXbi/lnvaUDiy5eBJrl/TvJerQLvemSPLd9Tgb7orJge2z5mDbfnhtuEjIPiEm5XSLkE5Ft+lSwZhQ7+yN2hRFzwWIg8Xc78S4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736508533; c=relaxed/simple;
	bh=tGMWP22lRZiF4apXgcb505FMdg6oFsqiueeDoZ6ayTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BxcDSMvfxVrBFdPSkZBHDsz2YIU7WW+19W0MxfzS3G16BJqZXUHLOfplKQ5NplfZ/hlLbUXtZhXcKp/jZ6GwUXpgWJq6R1LuDndZBgT7h/S+BcgPEoJOTZ4J5G/hPpBt39uGJNwAPG0quVB5YBhxEVpaPTaNiT86223BqVBiPKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=JrDYpn1G; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="JrDYpn1G"
ARC-Seal: i=1; a=rsa-sha256; t=1736508520; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HOsZMRubUSsrTtq3uc4mGcMRc+Gx2Why+/bdWNpqiEgMpsP2Ew0urbMMdTEqP52S1ZsQ2nLTDF+wwmD7PDc0zPNjoUEIdYvoN4yQDOctTBguelQItIrrfPnNEFLk/tV3wvLQlhgwSzamA7jlwZneOXLgSHcHqVW0kupcbjFYNPY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736508520; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XHW0skSs3z9DAkFAXG0k1p6sJGwaFKMr+xHEcjQkUDs=; 
	b=d2Bm5Yn/FZgbUkTijCqIh5zyYFYoe+3pnRLwtsFO08fbrSJiVzNa2L3EecyBMZJC4sg7OhFCuSXRizB7cHFRQ0r02Rq5K6wqqRFUnFjpTOowIJCpNa6p+tTl7UtCbMlTPvPKuzOwx3RXrtok9vOETi9Yzrg6Dhdu44OlysbmsSM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736508520;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=XHW0skSs3z9DAkFAXG0k1p6sJGwaFKMr+xHEcjQkUDs=;
	b=JrDYpn1GZtOtp6yhVlp0v3+kEZdRX1Uhq7D4JEj4kMCnXCWulhoIi2ndiOp7qPsG
	Jp2LHWZO/WNJNhJVnJVGrV/fLbdwPd6VqXCJGXOnKrfTjFdTEtjeJTzTc+oWCUyoykG
	UdQ1342QT0A2P1H2hbTJB61o6D0lGnTTH9GLCynk=
Received: by mx.zohomail.com with SMTPS id 1736508517025335.50238890288267;
	Fri, 10 Jan 2025 03:28:37 -0800 (PST)
Message-ID: <a5f8fd53-2519-441d-8931-31cb9aa2eba0@zohomail.com>
Date: Fri, 10 Jan 2025 19:28:23 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add bindings for Canaan K230
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
References: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
 <20250108-b4-k230-clk-v2-1-27b30a2ca52d@zohomail.com>
 <nvfvyy7vajbskfn542lxbvfkxuhasmnyni2uudy3cdybzlddiu@u46fcydzgxsw>
Content-Language: en-US
From: Xukai Wang <kingxukai@zohomail.com>
In-Reply-To: <nvfvyy7vajbskfn542lxbvfkxuhasmnyni2uudy3cdybzlddiu@u46fcydzgxsw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: rr0801122709f634376509b2493cc2e97200001096a1de42159b5406b81eaba735507eb9a8d3bb1521ea2f3c:zu08011227444e24f6f4ad2d26b942796c000060cbfad896ead820a72bac243b820dd7b4ea8ff2fada4817c6:rf0801122c7f5264423e9b8c4dfdda28080000ba302a89ede9433c226f7a94c3dcf4cc1662c260caa3fa6865a3335b41cb:ZohoMail
X-ZohoMailClient: External



On 2025/1/9 17:02, Krzysztof Kozlowski wrote:
> On Wed, Jan 08, 2025 at 07:53:07PM +0800, Xukai Wang wrote:
>> +properties:
>> +  compatible:
>> +    const: canaan,k230-clk
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  reg:
>> +    items:
>> +      - description: PLL control registers.
>> +      - description: Sysclk control registers.
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
> 
> If there is going to be any new version, then keep the same order in
> required: as in properties:
> 
> In any case:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
Thank you for the review and your suggestions.

I will ensure that the order of `required:` matches the order in 
`properties:` in any future versions of the patch.

> Best regards,
> Krzysztof
> 

