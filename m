Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F6A2DCF4C;
	Sat, 23 May 2026 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779519649; cv=pass; b=VT9k6GFd90AOnrfsFPt7o8rGALGPdFnC+mKNjZ0wQXfo0AslMtthmiM3V0V092/uPjR95Zonlzj4F4f08xVZ7iMfu0AvQMY48we9h75szSPNNU7gWtv5K2hpXgLD1+V+BIZ1GVDSQIEkpLC0BoaYH6sQa3L4nW+I+lSy93pSoyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779519649; c=relaxed/simple;
	bh=yVSvniizSgFfcNsHMwJCuBWZhW/bAqIz7Zf8cWSp5K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qEoVp8zhhkN0vlhsCjPqD6KxBPP6lBSiAgNttGC9fBx9wVhoVbdU2jx0a5NKyVTxuiF8Bidipwwr4Q/5UVyJQriGWz6N9jIFFFFP2n13bVXFRliZUdHNs38CJrUA0yYqmM+tvRZo59lGghKvGBIaimKHyyaQCogYua715laLNo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=KdnDz4Qt; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="KdnDz4Qt"
ARC-Seal: i=1; a=rsa-sha256; t=1779519629; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M34utHEyQKZAMeobS3B35LkIVRP25eNflVynpQ/IfP0sjWB2KDqJVg2viFgdEkprc8iLYc0R2MPi7JTfC2JbtNv7I8VtS5/Dy5M8XKjo17modpyVu76h7GIQDQcQsIp1cGjbEwl9pp1YSRNqF1v9AVmq2pID2dJGGuj1NT4pA2k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779519629; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yeWxZcjLCzcDxdHmfowF+eUIDI+tNtFTvg63nH+kw1Q=; 
	b=BXynZf7gWW8KbKvxcBGiqpK6MGGvy8LWbFWB30Pc9QndJ3Iyy6wI+JtZuHuU+vI3dh6JjuyNi1qIxQP3XawomyF/ofEWz2GCdjyCel0irsbMCWdleRu8J1ALgHbHZ13nRLGx9zou4ojBeghEiuzmX7T0UrtGelGXpfh0qM3yu7o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779519629;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=yeWxZcjLCzcDxdHmfowF+eUIDI+tNtFTvg63nH+kw1Q=;
	b=KdnDz4QtS88d7j9j2CMmRe5JttX/njeKEpc8QpMsLGFzoPUjf7YQfAt17GR9628f
	Py3fhlA4M1ZsOcvLFynRM4vpVHn7RAxPudAAerNHP8LDI9Jl35U9w7AQ3hVEJMOhWBh
	reVO7UJ4c2FzYTeIGs2KZOc1LwfHb9P/+kkHCpr0=
Received: by mx.zohomail.com with SMTPS id 1779519625819699.4345382578165;
	Sat, 23 May 2026 00:00:25 -0700 (PDT)
Message-ID: <1f74efd2-444f-4330-a1e8-62f75e85ecfa@zohomail.com>
Date: Sat, 23 May 2026 15:00:15 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: canaan: k230: Fix sparse warnings reported by LKP
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
 <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com>
 <20260522-removed-lyricism-7c879febc3b3@spud>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20260522-removed-lyricism-7c879febc3b3@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: zu080112270f3b225d59c968fc3f003e8e0000419f44ed1e2083cdf9e0d7358856c5c545f8380336d5a2d4bc:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External


On 2026/5/23 04:39, Conor Dooley wrote:
> On Fri, May 22, 2026 at 08:59:12PM +0800, Xukai Wang wrote:
>> Fix all sparse warnings detected during LKP randconfig testing:
>> - Replace plain integer 0 with NULL.
>> - Add static modifier to k230_plls and k230_pll_divs.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lkp@intel.com/
>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> Forgot to reply earlier, but I went and squashed this in.
Thanks Conor!

-- 
Best regards,
Xukai Wang

