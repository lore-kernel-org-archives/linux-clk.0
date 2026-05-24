Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0851519B4;
	Sun, 24 May 2026 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779610604; cv=pass; b=NNNK+wcH1L0YgDKsc+Pwy9UQQai9iP0reD+VGbRDFIrg9EaOhIqUohdCABCg4hPGP3r0yEsCSuX+89xn9VcJQYpqLhl5Rwjmnm932UzRsWnUq19uNOIFQM42Fg3NL/R+nWW9g4KA3Zee4dsUMmx9fXmz1LIS8V1Vh7ej65ee334=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779610604; c=relaxed/simple;
	bh=LIOTkxHHoupeefog3sB7TdaW9PQIuAHiPYH6C5s2qZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wg6JGxTRcEOo4LoRDSZ/YmU/FIzGtL/O0i+opgEtNQZwrPC1a0cKpLg6xTB3FlXIXpKIIawl80vkqL9gt1hFuFS1tKE2ACtfQ4y3kSG9rOUubwcXklA1b/ZiThD5oVb7bGZzr4JRiCFnqh6zrLCwHpmllBLTBGOp34vm+LW94dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=AedBdfyX; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="AedBdfyX"
ARC-Seal: i=1; a=rsa-sha256; t=1779610587; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cUOwPIx6qfiFmgLCH5f3QxNtUdUWMlcLeq+/824dVkd4j+AS+EcnDJcUlsA5KhfnowH+99Zu9asZcxv+8bIA9QeRGlb6ZGv1vb5oT78yQypTPlTSvT5qJYXJCl8cJMzfGNk7th7jwZemJFodGRFmgvWf/D2vUOypwO19e+xFB3w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779610587; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f+BcqMfSRMkHNRkV+bnfbEWhWrwUx4sqId1SmAVeFZA=; 
	b=dmC8iQDcB3WUrZgX9T0Pqs9fXuqSXhN/uRaXxOZqoFBMPVJMlFu93GJvpA5P1eYFw4PGhaqvFAY+yyd3OKsSjy8ILSDaCz12ReRf7U15trYjIaRd05QCw+U4ttOzXsgNrr4dZ0X1L2REYQSGRwEljQE5f3HRyVj7skKen8sg4mE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779610587;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=f+BcqMfSRMkHNRkV+bnfbEWhWrwUx4sqId1SmAVeFZA=;
	b=AedBdfyXsgDs6fl69lPu03X3jaQMDrHVby1SRFy69EV4IQjkerMKUcGdj/H+CU45
	z8DRnGJ1oUKVPf2QqwGUhNEkiz8Z9L2L+J8f68+gUVurFwoHvyDGjPIAyTwsEhJbvU6
	6yzaYu/R9fRE4HGsn4gMaQBDvmB5ys+wOrChUfLY=
Received: by mx.zohomail.com with SMTPS id 1779610584243760.6124410802614;
	Sun, 24 May 2026 01:16:24 -0700 (PDT)
Message-ID: <89885938-f126-4e1b-aedb-3edb2da5df2d@zohomail.com>
Date: Sun, 24 May 2026 16:16:06 +0800
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
 <1f74efd2-444f-4330-a1e8-62f75e85ecfa@zohomail.com>
 <20260523-punctual-backslid-712c06f0db61@spud>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20260523-punctual-backslid-712c06f0db61@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: zu08011227a77cded047123cf15881bd2500005897bdee7dc29404c51879fd2aa9d5b7ee1f6dec0232dff2a8:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External


On 2026/5/23 22:02, Conor Dooley wrote:
> On Sat, May 23, 2026 at 03:00:15PM +0800, Xukai Wang wrote:
>> On 2026/5/23 04:39, Conor Dooley wrote:
>>> On Fri, May 22, 2026 at 08:59:12PM +0800, Xukai Wang wrote:
>>>> Fix all sparse warnings detected during LKP randconfig testing:
>>>> - Replace plain integer 0 with NULL.
>>>> - Add static modifier to k230_plls and k230_pll_divs.
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lkp@intel.com/
>>>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>>> Forgot to reply earlier, but I went and squashed this in.
>> Thanks Conor!
> I dunno if you saw my message about giving what I have in my
> branches a go, but if you could try what's in the riscv-soc-for-next
> branch, that'd be great. Just to make sure that I have all the bits in
> place.
I have successfully tested your riscv-soc-for-next branch on K230
hardware. The clock controller probes correctly, and clk_summary shows
all PLLs and clocks are running as expected.

-- 
Best regards,
Xukai Wang

