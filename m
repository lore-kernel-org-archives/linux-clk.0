Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9567323ED6A;
	Sun, 26 Apr 2026 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777218563; cv=pass; b=XQeYreKt7ntrycOIRKffU/uMnog3XSa/Na1TtEAMIACMZJKSL/AFURdr+91M1KTyHVei/E64zfGwGijnCteE8Dp8pwBxcjoXVbm6fEN0SqkrWMjRlPRf26o8KXK+eBBK38DLT4sYlD+/UXo4G9o1c+K0/Li5t9H4cCWsrCmMX6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777218563; c=relaxed/simple;
	bh=miZJFmIaoD2f34f1/bDTsn++d/crun+m6B5eKilkWes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5Cr8/2VxpTykjqUVBb1HpXeaXZb3pu7l/42wScsseRREMPm/1gQw7gsE1JlanhCX1h2NsgZIwulUw35GomR9vodN63UbMbjTPvK6tN7ErHRqYlUt9BypOjh9olxg5E/p4hy7+PHV+4LLQEkL18BEH1Wk9Ekzx6VLcDlC1CDIFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=Lg2tSHVd; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="Lg2tSHVd"
ARC-Seal: i=1; a=rsa-sha256; t=1777218553; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eusy37RyBqcYCrTiIGOI7oMxxsrqhWTdh5aqKAAVdFrkygGnAkdC7+kcAxjLBOQBnHPq0OYda2WcAarmvowW9mOZub3o+6WAX5IEsI9Bxxagmy+rwbObgWj8Y+gEnFPyKnHdwNcXoBK27xUj+3+xtVTuHIBdRoIDwbUuyl05wNU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777218553; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=225jQ2aZE0zJUqGYQ2cOjzPbygimV8PqMJIo/1GJfVs=; 
	b=ejqS2XvPfuWBb+Y60pbGjdvJpPuQFKcchuaVLB+wJjbpv+qRNwQtEfADONeMrFezIKy2l48WFiZORM8CchQhxBSZaFEN8NBV7plVF3jkS8q07fOY0zTPzt+PyZ0HwcUX2Mm1oFCI04W45XLP3Bf0tQXJ3n0gXuYBz5S+FkN3jaw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777218553;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=225jQ2aZE0zJUqGYQ2cOjzPbygimV8PqMJIo/1GJfVs=;
	b=Lg2tSHVdzI3V+D6iN6FxISGL3gUfN5xN8NwU5NjXeohs350juU7WMgeES+JzkgAH
	Y1zIVeluYsK45his3puP/62q+OlAH1LxSdSn2A18elWmwor4YdLBjEagK3av5PYXGHA
	jSn/oZTgvvWa46fiKGN+oUJQlcaSxrnJZslpCo3Q=
Received: by mx.zohomail.com with SMTPS id 1777218550868245.7951303663433;
	Sun, 26 Apr 2026 08:49:10 -0700 (PDT)
Message-ID: <987e30f5-fad8-4e76-89ba-8a1162bd70a3@zohomail.com>
Date: Sun, 26 Apr 2026 23:49:03 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/3] riscv: canaan: Add support for K230 clock
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260425-b4-k230-clk-v12-0-7d5ced1f5da8@zohomail.com>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20260425-b4-k230-clk-v12-0-7d5ced1f5da8@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: zu08011227bfa9a87d9c06a1670fe9c154000061a6e6a4751e0fd6b41258f8d3cd1069e437580c845e8cc2fc:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External


On 2026/4/25 17:29, Xukai Wang wrote:
> This patch series adds clock controller support for the Canaan Kendryte
> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
> PLLs and an external pulse input, with the controller managing these
> sources and their derived clocks.
>
> The clock tree and hardware-specific definition can be found in the
> vendor's DTS [1],
> and this series is based on the K230 initial series [2].
>
> Link: https://github.com/ruyisdk/linux-xuantie-kernel/blob/linux-6.6.36/arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi [1]
> Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/ [2]
>
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>
> ---
> Changes in v12:
> - Rebase onto linux-next (next-20260421).
> - Migrate from deprecated round_rate() clk_ops to determine_rate() API.
> - dt-bindings: Drop redundant "bindings for" in commit subject.
> - Link to v11: https://lore.kernel.org/r/20260214-b4-k230-clk-v11-0-6de365489b89@zohomail.com
Hi Stephen,

I hope this email finds you well. I am writing to politely inquire about
the status of the Canaan K230 clock controller driver patch series.

It has been approximately one and a half years since I first submitted
this series, and it has now reached version 12. Most of the intermediate
versions contained only minor adjustments and rebases, and I have been
resending it periodically without receiving any review feedback.

I would greatly appreciate it if you could let me know whether this
series is ready for merging, or if there are any specific issues that
need to be addressed. I am ready to make any required changes immediately.

I apologize for the intrusion and thank you for your time and hard work
maintaining the clock subsystem.

-- 
Best regards,
Xukai Wang

