Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9502FC020;
	Tue, 14 Oct 2025 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760439397; cv=none; b=RDcYspXnHI32oqZ92W8oGXcni9W9oJ9tOdKZMzUs8HrelYlRkRChlh/3z2kk+jFaJHipE+TO8qlEwe3bcTUz/nRNYZCPG7zuCLSOO+6SunuCze1UUYhLN6A4Lunm3kRr4dIOr24T7dBEOsBaBKV3GRR5mS6gbDPflP+x5G+Kx+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760439397; c=relaxed/simple;
	bh=J/9kOZww5LGrRgo0O6tGcD+5iZn/yjva2b52MUpAEJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndCHO7kBIkYjgz/xnHKkQcDH6uZDFF68vW6VBIDnpsPC9K3y1+W2tFW6PFjsVMO4eCFeFoJ15+CafjPLuPHy42IqmhJwtG7NPfmsVeVLDueggRjSt1B8WuQDrYYMwjKGMDe3zeuuKA1PYzAmpq2Rf8WFOxi4WG7f6QgjeYSkFzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Tcg1A/er; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Tcg1A/er"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmB3g4YX7z9tPF;
	Tue, 14 Oct 2025 12:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760439391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NfPvLfXoZwJoJ5wtyGv63iF1JU4cExGKAl5PCp2Msjs=;
	b=Tcg1A/erkY81hZzo/zD2KknwXaq2RlDtWjrmdKfTKkjNyI95orer1RLybuzaFGbhaZ2hof
	rIzaApu6idfQ1dX+KmOTcQiJG8b1L0keox1WT9nGzi1uHPfpDxBmUq5GMnVb/cxjxHWnuo
	SLL9UWmYwF2NQ4uFbUHmOPft5Ap3gLAPmtMwya5gQd62mc9yDTiwdRW0MBkyrSOjfYiOWM
	i6yt23SKYAsX+TwbcGe3Zg+LYqL5k2kxBFznPrZzhpDNIoXLUjOwFyZQG1HYsrwzJQk40d
	4tPSUUlTB8QTKiDCxpem7FHYA4KAmpEUNyhaWLB1wUk/ekYSAdTSGlxvtse2Jw==
Message-ID: <de68a605-8b42-4dba-bd59-4708a5bcf542@mailbox.org>
Date: Tue, 14 Oct 2025 12:56:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: clk: si522xx: Clock driver for Skyworks
 Si522xx I2C PCIe clock generators
To: Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
References: <20251011223846.261652-1-marek.vasut@mailbox.org>
 <20251013-finally-stopped-7f5ebac801b3@spud>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251013-finally-stopped-7f5ebac801b3@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8b68caa32da3d6b7e86
X-MBO-RS-META: mxjgcsg4yans5as3ehccs4mhej15nwew

On 10/13/25 10:00 PM, Conor Dooley wrote:

Hello Conor,

>> diff --git a/Documentation/devicetree/bindings/clock/skyworks,si522xx.yaml b/Documentation/devicetree/bindings/clock/skyworks,si522xx.yaml
>> new file mode 100644
>> index 0000000000000..6ad26543f9d21
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/skyworks,si522xx.yaml
> 
> Can you just pick one of the compatibles here?

I reused the existing pattern from previous binding document.

Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml

I can use the 52202 for this binding document if that is preferable ?

...

>> +patternProperties:
>> +  "^DIFF[0-11]$":
>> +    type: object
>> +    description:
>> +      Description of one of the outputs (DIFF0..DIF11).
> 
> typo, DIFF11.
> Does this regex actually work? I don't think it allows anything other
> than DIFF0 and DIFF1, since it evaluates 0-1 as a range and 1 as another
> range.
Fixed both, also fixed rs9 bindings and patch posted.
