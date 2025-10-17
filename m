Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14DA2E8B73;
	Fri, 17 Oct 2025 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719851; cv=none; b=ILTcNBDRg8K83oQ+7cFIg85p3FGw56ioaXjMJlapEC+f3xeIgZeMvyxod2M/ss8slLGZAIYyFYTgXJs8RSEfWUhieIAQ6lMFhBMyr6RR2sT1VvDRcDPv6RveVUlfjOdYiA6/Tx86AJNZiOsRBtAWUjumFA0j/QNlnPH7LuQoR8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719851; c=relaxed/simple;
	bh=y1HDyPqgPBCxseG0CH+jizOCFtCD+MoxUwXKsWDn+4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twDqHWJ4InChfnQ4GvFUmEY9v8fRw/s9sCjsW8ixp3SfD83APZ53WUIGQU2AG6Frpw/3fRTSx8EhSZ2NmM2jA/c803v/oJahVPS5KeaoqyJoFAcPzigU3GDJsa7T9YOKUyLOhJ1/eAPmoHcxR4DCReBfVU4TI/xZKa4p4TSARtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=L/d8FT6D; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="L/d8FT6D"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cp9n222cVz9syZ;
	Fri, 17 Oct 2025 18:50:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qaGTcJpcyPpectgG4eeGbkroVEPw69MtYewCR/dl3fk=;
	b=L/d8FT6D9fjEXEJCuVcmx/uuPsi2MdTwgGIsd3A11IDhTui6KxV/WWGStwKKy6Pq+U0NU9
	qJWE5WncoVnX+bSrUs9nJb6DK5BmH8sI0B9g36ymRiy5OXrfA290ZhCpnDiVqeE3aMVKN7
	tmQcbDhF8eID30SqPjO6mMQUtgDay5BgV5Ss7lmHDvHGPwE+cnu2nrap+NE66F1VAh6hEY
	Fnmh4g6DdM0NMWchgt6yoRIgKxUA+Lxchy2i8RrE5ZwT58MytKF4T0x7ox9Ed493s+yvVX
	kJpAOhrKgwUO1aNWRQwMaqZfWL3UZzUwoCaGByc0qA/4WVQ9nJPIGY6eAh8F8g==
Message-ID: <1b44d979-3ea4-4874-aaa2-4e6cc9395d04@mailbox.org>
Date: Fri, 17 Oct 2025 17:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 27/39] dt-bindings: display: bridge: Document NXP i.MX95
 pixel link support
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-28-marek.vasut@mailbox.org>
 <aO1OIa86kNtboV+X@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1OIa86kNtboV+X@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: d4ee99cbb628ba38429
X-MBO-RS-META: cseaqk76a5hj6wzpqix4t7uyn1dqk6yb

On 10/13/25 9:08 PM, Frank Li wrote:

Hello Frank,

>> +
>> +description: |
> 
> use >

Why not drop the trailing | altogether ?

>> +  The Freescale i.MX95 Display Pixel Link (DPL) forms a standard
>> +  asynchronous linkage between pixel sources (display controller
>> +  or camera module) and pixel consumers(imaging or displays).
>> +  It consists of two distinct functions, a pixel transfer function
>> +  and a control interface. Multiple pixel channels can exist per one
>> +  control channel. This binding documentation is only for pixel links
>> +  whose pixel sources are display controllers.
>> +
>> +  The i.MX95 Display Pixel Link is accessed via syscon.
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx95-dc-pixel-link
>> +
>> +  fsl,dc-stream-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint8
>> +    description: |
> 
> Needn't |
> 
> why need this id

Because the IP is generic and can be attached to either output of the 
DC. We need to figure which one this is attached to, to configure the 
correct bitfields in syscon registers.

>> +      u8 value representing the display controller stream index that the pixel
>> +      link connects to.
>> +    enum: [0, 1]
>> +
>> +  fsl,syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      A phandle which points to Control and Status Registers (CSR) module.
> 
> Why not use stardard interface, like reset, clock, phy ...

No standard interface fits, this is really a special remote register.

>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
> 
> video-interfaces.yaml?
None of the properties in video-interfaces.yaml fit , so it makes no 
sense to pull it in here.

The other issues are fixed, thanks !
