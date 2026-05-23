Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AAB28DB46;
	Sat, 23 May 2026 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779549954; cv=pass; b=mcbXOpVmg6MfV3dN+lZUjOkdprTAaHn4n6EaolPeC1FaTPYJGDikK6PqkZgbDNSFSFhWMZqPzQGE462VAl80c5pgEh8U+xjrHkljTVPHrknUob+cVwtMEGa4sVf5FuF7hWO26Nwpn2oKIYck7SP36EnvX3WcJ32Tn2ubTfrcQrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779549954; c=relaxed/simple;
	bh=ypvOXGHmPfwupkJQo0lkg7l8Xmzz75cpEihNyUsSVws=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Tuh1q3T0nKjaxUPzPUdzMpZsy9ZC3a1UviCXQeTH+NnzZY12VoVlG33R0PpeqdGHmSvwXRWx838yeQq5NIIAqbpBkMpLv/3rP2DZWSzL/NRklx7UOrajpHHnIXV7pDc0lnc6qWsrvSQENg/gxo4n5NSRLKOTnBeofX03aWdo2/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=Fge9WiM6; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="Fge9WiM6"
ARC-Seal: i=1; a=rsa-sha256; t=1779549940; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UoJtSar+/fAJsaOXr0Zc6Z6ZWQtDCIiC3uMrHWrlHksB66qkLrbObXeLkFYg0cXY6bWgPaCjhrWvZdztBIp0bmPQnque7sL+abZLuPfF0X8iqb1VjsMyGgXq0vVtgDrSkPIBzHCB/BwyMm6YWGRnUbb4kHRX0t4dXgsd3iAer6E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779549940; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ypvOXGHmPfwupkJQo0lkg7l8Xmzz75cpEihNyUsSVws=; 
	b=IzPdXURskMJy9J2/DyTqVzJWpExN2QJYaWzYzqgNq6noNDkX5NwShdi8N/9ErzokoQBpJOVFOAiRTzoobvC+d1v3nkFV+KkJVYenxoKBP3hevW7HQZGgYQ64/S8vU0MI/wbGkUG4xUBt9sKFGUDg37NfawzCfld5XnWC8tSmHZQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779549940;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
	bh=ypvOXGHmPfwupkJQo0lkg7l8Xmzz75cpEihNyUsSVws=;
	b=Fge9WiM64DkZTehzmzJ23k1OxthuLN4BfpU0Qn8wj1wn2ClZxiLlDPU877PS7prK
	PtVECX/hWy1tGV8jK52goKSO06V3AEdqDZ/flpKUkZfTsC/dZyRZ4NZSeIcBGOfeWYK
	ebVCLuzFoIqk7Y2QWpRUciOEvWJqK0yZY1GSEWKo=
Received: by mx.zohomail.com with SMTPS id 1779549936497366.38328264930124;
	Sat, 23 May 2026 08:25:36 -0700 (PDT)
Date: Sat, 23 May 2026 23:25:18 +0800
From: Xukai Wang <kingxukai@zohomail.com>
To: Conor Dooley <conor@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] clk: canaan: k230: Fix sparse warnings reported by LKP
User-Agent: Thunderbird for Android
In-Reply-To: <20260523-punctual-backslid-712c06f0db61@spud>
References: <20260522-eligible-vivacious-3ce9bc30dd53@wendy> <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com> <20260522-removed-lyricism-7c879febc3b3@spud> <1f74efd2-444f-4330-a1e8-62f75e85ecfa@zohomail.com> <20260523-punctual-backslid-712c06f0db61@spud>
Message-ID: <75285B3F-92FD-48A4-84D1-6C2BF2FBCE17@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: zu08011227f17df843053cbf16afe5966500007938fc8c90888f46af5fc70e4e66e963e3d34c89acadaa1e39:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External



=E4=BA=8E 2026=E5=B9=B45=E6=9C=8823=E6=97=A5 GMT+08:00 22:02:31=EF=BC=8CCo=
nor Dooley <conor@kernel=2Eorg> =E5=86=99=E9=81=93=EF=BC=9A
>On Sat, May 23, 2026 at 03:00:15PM +0800, Xukai Wang wrote:
>>=20
>> On 2026/5/23 04:39, Conor Dooley wrote:
>> > On Fri, May 22, 2026 at 08:59:12PM +0800, Xukai Wang wrote:
>> >> Fix all sparse warnings detected during LKP randconfig testing:
>> >> - Replace plain integer 0 with NULL=2E
>> >> - Add static modifier to k230_plls and k230_pll_divs=2E
>> >>
>> >> Reported-by: kernel test robot <lkp@intel=2Ecom>
>> >> Closes: https://lore=2Ekernel=2Eorg/oe-kbuild-all/202605220724=2Ej4Z=
eM3KI-lkp@intel=2Ecom/
>> >> Signed-off-by: Xukai Wang <kingxukai@zohomail=2Ecom>
>> > Forgot to reply earlier, but I went and squashed this in=2E
>> Thanks Conor!
>
>I dunno if you saw my message about giving what I have in my
>branches a go, but if you could try what's in the riscv-soc-for-next
>branch, that'd be great=2E Just to make sure that I have all the bits in
>place=2E
OK, I will pull riscv-soc-for-next branch and test it on K230 hardware imm=
ediately=2E And then report back the test results as soon as possible=2E
