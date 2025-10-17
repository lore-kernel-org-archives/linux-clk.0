Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69ED2E8B7E;
	Fri, 17 Oct 2025 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719867; cv=none; b=dKWgYdhKV2CQzh3LVCEKlFMakd0Zt6yzaJ14108VPmGrcLoVhfW8SDGUlpPzlXHfy/y6T/B9Uwjb/HInU7+AF5nOZ7QkhKjGTtSM/3baWloAtHWRIJzd7zpVf+IJCOheo7gLtbYYCC2fPNp2YYTrek/5qA2NXayjiv6klAY4X5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719867; c=relaxed/simple;
	bh=jiYZwSUFJloZCDoz0GoZrQ9olAkcacA8Tzq/V9VuUZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=At0HpxiJ/ZruLsUSdHE/cHBoF2Dz92ijUd5dLM5Xc8VeRf42oanIqfx+wkd5BkLKrMWqWOp93BdZ/L+JBDbK2RSabylq9/lAiwSUuzhFxJDrARs3JmS58f4xmRA8X9nXMKk9kgA4sL368Go6lzUflvxtIrO8+KYeYO/dLyiEoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ri3EMDsZ; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ri3EMDsZ"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nK2L1Jz9sSq;
	Fri, 17 Oct 2025 18:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJsJIIBmyS44r/Za6Ww7u8aRde5yPPmd2EJgiWuqZok=;
	b=ri3EMDsZEN4UnyNu0+7sYCnpRhI59tlwCE72BMClrJG5Z/9VF3E0TFTmdsWE93bSKc4gE7
	hhs2WbanfCytWk3dPq2JFhRQEvXftZxx1UYwFG60B/mLGbhhsMPKLkMeRKu/tqRZflxcxk
	8Hf2wvQ4HzRjc9duTrppLkVLAHgai6wntue296XwapLUXyZUSLeEQtOJBS5RMjRAzDqi0T
	cQXsbhNO03cUtPukXFA86VbXx2WuUpqDmoX1f3ltipWOY3Sd8NjQoKGJjOmcjXv1XaBzXc
	8ECMjKEBoEfQcSen58Q+dgonWGKRG+xvzEcbsFzqjErR0jqaNLLqlnMKeersDw==
Message-ID: <49a97a81-f5db-40c7-83ae-2e12b790a6ae@mailbox.org>
Date: Fri, 17 Oct 2025 17:18:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
To: Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
 <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
 <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
 <ae9d1289-c0f9-47b9-b6be-e39d170425a2@mailbox.org>
 <a9a9867c-2653-45f0-89a2-39132335aac9@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <a9a9867c-2653-45f0-89a2-39132335aac9@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 06fa1a62a3227d44521
X-MBO-RS-META: 4jmhrbazn39p7xypji99r43776hhwgqg

On 10/16/25 4:28 AM, Liu Ying wrote:

Hello Liu,

> Have you got i.MX95 DC IP spec?  If no, then it would be difficult for you to
> write DT bindings for all i.MX95 DC units.  Note that this is something
> necessary to do.

Nope, still waiting for those.

> And, a bit more information about display pipelines in i.MX95 display domain:
> 
> Dither -> pixel interleaver -> pixel link loopback -> camera domain
>                              -> pixel link -> MIPI DSI controller
>                              -> pixel mapper(LDB)
> 
> Note that NXP downstream kernel wrongly adds pixel link between pixel
> interleaver and pixel mapper due to ambiguous i.MX95 TRM.
Is my understanding correct, that the Dither Unit ~= Display Engine ?
