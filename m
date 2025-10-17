Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE02E8B81;
	Fri, 17 Oct 2025 16:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719860; cv=none; b=B1M8s49/GIAcreAzcgZQrVh0VrNwvWpbpE2ZctJO41y/bHZEEj3fU5nZZ1JgelCZ5ci6QILzB0Som/INNk8vGtOoR9Vlhip/EKAKeEnK2/238QFwX2ncCa9hwibqAv0c+nzeZepriz9CB8zeFPPwL5ELSloYaAUYVf6MreJkfWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719860; c=relaxed/simple;
	bh=HPe6EAmdU+8YRmYd0qw6BSYIKCyaqr/9+MvrVMtwHnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6AhSbVZxSRdjoYX6Noj87w6W4PuYi2OyjlaBEIGmdodkXp1vi8QwAQbUTLGmeORruaSGM/j+bzZEePiLg8h/BJv7wIjKznKefZL0opBPt4MkOzluTBm54uA8iLYCpXQnd7CcKyF7FVXMz9CD7uE7EQDONX05qzjLX/OA6p1GRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nvNb7JM/; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nvNb7JM/"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nC0Bw8z9t4X;
	Fri, 17 Oct 2025 18:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0PCGcbcebxEbmKkqUra8r/5kC8oKG3WtMDn0TPnQmM=;
	b=nvNb7JM/ergf992QdOb+HWiqFnAQbgApIg++mtkKrysn/7LHTAktGAsbNUyt9o1peDmwx9
	JbCJKkknxuVQp9LvVMuoxoNrYgtSoMJ0kwmIoDvS6eMUmOGAhxVO2cPEC/mGjmW7snTufB
	FK9jiVPosKPpk2TBBDDCI35epqEBQEQyhL14gYwOcm/rKqwTOn6ODv9fcwKBdTvMhKsqZC
	IoLrIMK6TdX5VKzFx9wo4uc0MHpaqg8XG98Em3cGn53kVXKBTvHne46ETfHr3N3pMSTL6n
	q3vzrqLJGarAL+HmI9iTRWNjjgS9526TTlwyrLEZ/U/VfREgBHrFnWqYLuLDaw==
Message-ID: <91a59c49-db23-425a-a728-b81c30802bd8@mailbox.org>
Date: Fri, 17 Oct 2025 17:08:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 38/39] dt-bindings: clock: support i.MX95 Display Stream
 CSR module
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-39-marek.vasut@mailbox.org>
 <20251015133315.GA3263713-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251015133315.GA3263713-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 9b13f95dc50aafe5c94
X-MBO-RS-META: wbuyjodo48czus9sqe6m5ubysagbd8jp

On 10/15/25 3:33 PM, Rob Herring wrote:

Hello Rob,

>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - nxp,imx95-display-stream-csr
>> +          - nxp,imx95-master-stream-csr
>> +          - nxp,imx95-mipi-tx-phy-csr
> 
> '-csr' seems redundant.
It follows the existing naming scheme on iMX95:

Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-camera-csr
Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-display-csr
Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-lvds-csr
Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-vpu-csr
Documentation/devicetree/bindings/clock/nxp,imx95-display-master-csr.yaml: 
      compatible = "nxp,imx95-display-master-csr", "syscon";

Shall I adjust that ?
