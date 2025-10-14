Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA5430FF23;
	Tue, 14 Oct 2025 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760442731; cv=none; b=spDDe2KBRUgHSIgVIihGTv7L00QNqmEyAu3cA1FhUHWOq/+So15SOuOt3+vL4gDEX/LhT95M44ji0xAAa0tHdD8kwqy5y/3WZ2Z6lv9u37shOE7b1PgcI8HSo7cl8bZdg2iJ33QLccY+b+7gK7CrbhfY2DKJgkm5suaqPU8Uh08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760442731; c=relaxed/simple;
	bh=itkVo9bammQ+3REx2xoYclzzLU8USRKmOyBuvD+u8T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t23nucpJg739b1L9skT3e/jqYmlVTxosxuByyIhoZCCAmqUawKmzvaMIsr3VaYvha3UlB3oNkDQFVCg0O8Ebs79lyFavD3AxDvBpM0YaBScWUsOyxqpXMBpD/qNlywbZ5ZqjaXYuipf5VXLQaTrxE1sEeISCuePHUjCo3IcJIIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cNL5UimL; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cNL5UimL"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmCHp4c8bz9twV;
	Tue, 14 Oct 2025 13:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760442726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w3BLcmVUVGLpFJRX39w4eFwRPegwyahQOD0DU9dd3LU=;
	b=cNL5UimLZlsis2oIWIfiLbCo2w/5oP6hHGeuaEqAclU0/h0l571JrergmmbeF2eFDQpHgr
	gLQuhoqvqoea62NmAq0ufs4m7LgjpT6VshSnuGJdP8PAp8WoT9zb23olnX9EkfRNGINmRP
	BAom4KpXpWXaQhdfUmDsKgFT7px+ZRxyTssg9inIZ9xNz9WWllunwlB+f6hlHxKuXkvdBr
	+PREv7fSxh3Kw3YF711QVvObkRiWqzQJrXurwdJkaPpjrhJShQV5OmAfrABL8jFtYCppzi
	GH/0XrK0MDheq+MoZFw0ouWTy4DAMz2xGwAVMgdc+P04oTP5V2lOExkjap0IWg==
Message-ID: <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
Date: Tue, 14 Oct 2025 13:52:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
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
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 582067c29d1c33a4667
X-MBO-RS-META: cmy55i75tfkwaedpgnmschc4jpxirtkc

On 10/13/25 6:49 PM, Frank Li wrote:

Hello Frank,

>> @@ -90,13 +102,15 @@ patternProperties:
>>         compatible:
>>           const: fsl,imx8qxp-dc-signature
>>
>> -  "^tcon@[0-9a-f]+$":
>> +  "^tcon(@[0-9a-f]+)?$":
> 
> why here allow no address unit tcon?
This might be something Liu can clarify too.

TCON on iMX95 DPU does not seem to exist at all, or at least has no 
control registers. Hence no address.
