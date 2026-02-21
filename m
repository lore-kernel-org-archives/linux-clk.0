Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678D910FD;
	Sat, 21 Feb 2026 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771686952; cv=pass; b=M70INlbISfHDcqiEae5oUTXJC7ZeYIYFcP70GgWO2jAXE1Fki18jasMt5Mp2SW9jFQCdeh8/i+EAEo9rAucGftpLsSn5u/yfstHPWYucKZiDK2HODIt2o76tuey4ilmWjHt6V6HjDXz9yukM13EVcdADHggb42GAuX2A7BQQeFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771686952; c=relaxed/simple;
	bh=7PBZ6BV0pflgpkVmM7GZBrj5GAsILxdHcBbMFPLndVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qkb5CWJDGJNdwJlBXlNU6Co5AW+GALdhecSkDiK/oobe2ZTDChFWTKbzmYleLxRol6kGgI0MsaW9fIMxG8XtxqP+6Oh7v7q8hynaPKP56kuGUlYiIZGdsgcvRTCNI7EM39sFwwY/Se3YFgvfsclP76SUfHk6LC0lHeb0av7iedA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=IxTlDxIo; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="IxTlDxIo"
ARC-Seal: i=1; a=rsa-sha256; t=1771686930; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c3rqkvZ8f2YCKn6O2yrXwglaa9zp205092pNZVYggxkh9gjixWRYcIzykViMjgbD06xGxJZwtgNYJa/rgIJus8qULszChqvVwZ/eWYvSby4M6Pui5nvF8Ti5uuge2ge0795h1QwDgKY3qLRjjJxN9Jf+IJ7Ha1lwDck5p+r0h94=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771686930; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7PBZ6BV0pflgpkVmM7GZBrj5GAsILxdHcBbMFPLndVk=; 
	b=OWP+sfRFICwwLR8snTogp2NWatEk2B2GvhURr2Cly8BYtcMbVpZZhW//ep73PnhpbIenwEJUUM6NSAGxRuP1ZSQBoCQNkgrN5nwAS0yDXfr8PL6zwNgFDAuM1zOx2+1hP3Tm+9Pko5hsLqdNcE06zCkIn9Tjl8p7nj6wsUlK3bE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771686930;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=7PBZ6BV0pflgpkVmM7GZBrj5GAsILxdHcBbMFPLndVk=;
	b=IxTlDxIoElob1meVtSdHlMH1GF/7ihjvp6A9PSf0nWA+E2BOncXyOP4DuA8PDGjE
	QYzoWsGzfxtDT8rNDFcnn7NwQUqJRE6CA02MNEz/FnAR55dnik6bK6R0VgMCHJO36gj
	25iqD8Gv0XOm+IOrf61tIroqShag3vrgJJ7+J3W8=
Received: by mx.zohomail.com with SMTPS id 1771686923159333.11056390750844;
	Sat, 21 Feb 2026 07:15:23 -0800 (PST)
Message-ID: <f1452f53-a0c9-4580-be51-a29d94bd7691@zohomail.com>
Date: Sat, 21 Feb 2026 23:15:15 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>, jiayu.riscv@isrc.iscas.ac.cn
References: <20260214-b4-k230-clk-v11-0-6de365489b89@zohomail.com>
 <20260214-b4-k230-clk-v11-1-6de365489b89@zohomail.com>
 <20260214-lyrical-rabbit-from-camelot-2e1195@quoll>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20260214-lyrical-rabbit-from-camelot-2e1195@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: rr080112270177fa32e527f14d020f7646000082eb384bd644a03d1a473829161ee7e7031e2efda71e99c5a4:zu080112271340dbca08d2b8d2cd15d0db0000309bf73410f8398c9987581e74f2d478b2e9b4e654c8aca6fb:rf0801122c2b931f9241db5a1103ee22600000212592b58afb33456c686a6ec669e22222f8e52781f07090a3e9ae68a455:ZohoMail
X-ZohoMailClient: External


On 2026/2/15 04:36, Krzysztof Kozlowski wrote:
> On Sat, Feb 14, 2026 at 08:54:37PM +0800, Xukai Wang wrote:
>> This patch adds the Device Tree binding for the clock controller
>> on Canaan k230. The binding defines the clocks and the required
>> properties to configure them correctly.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> This review and the patchset has one year already... so I am afraid it
> will be resend and resend, thus please also implement below:
>
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
Thank you for the review and for pointing this out.

I will adjust the subject accordingly and resend the patchset.
>
> Best regards,
> Krzysztof
>
