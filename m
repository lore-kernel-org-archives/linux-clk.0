Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7771D2DC359;
	Tue, 14 Oct 2025 11:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760442660; cv=none; b=jx+0oeM4vcetyOJJeqPllBFxE34OqZm01s0n6RPCVrEdWGzxnHbs2EHr8Han4BSS+LhMn2pbDGYKGg80Cjot25tSmOTatzEnnpeP6ZIIHfoegAdgxase6MnDW/gd5vN8xAMxW3znuHp10QpTB/lkmOtNPNvoZytascZZIdqOOLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760442660; c=relaxed/simple;
	bh=Uj4OXdIQAE4kGcJ49pU0BbBL7WNRPVIIggbcw44y/pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVqWVlK2t9Lw0paJ/xiG+dJnO1aHw0yWST7ydtc29yF8edHzhG+iAYQQbuK0IZHE00oPujtubPbD1BpBUuCwgL9Neqpw8BOGAmjd8qmdQykhvyYIq9xs+5P/iO9URNKM7C0ksDWy2Qia3kFPhi1TYdO6p2dGEYEgcXXS5IQFGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GkKchx0u; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GkKchx0u"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmCGQ5CZ8z9v76;
	Tue, 14 Oct 2025 13:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760442654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMNRHWzye4fEMo9V9I/sy/z7Qj73KleUZOXSTbXOCDY=;
	b=GkKchx0uTTywibaUYUiB+jQ38OtMwd5KzWk2aYmnsNgQA/Y4KpKEKjkdyjR4C3lrai8Wtk
	LvrLhKtNXi35a7GonWkGgufct3sKyf88x6VCa8crFg2ivGJ9Z5E3OvUSxH3dI22msLU5UK
	honVKVFvi3iHnyOwkJSZ7FWsgGE/v7Qp7KmSyjAa4wmB0Kd+DYRJvTD7fXNjYamZVRw3HP
	Ygmc+P/IVHWHWhNu/T6YV9ugjiUV+3Y6IyB7wMaQR1SPIGHS/3goO9svCA1JdxwDq3Yrok
	TivZmFIyTcSM9/Ojpd5d23gveoEx3oaiBnrW6t06pWdcu662FRUM/CghJRoJXA==
Message-ID: <932b3d3f-534e-4b9b-b85b-5886c3f59c22@mailbox.org>
Date: Tue, 14 Oct 2025 13:50:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 02/39] drm/imx: Add i.MX95 Display Controller DomainBlend
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
 <20251011170213.128907-3-marek.vasut@mailbox.org>
 <aO0rBBzI3cGWzO34@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO0rBBzI3cGWzO34@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 997ncizbotjz3d8tasincds5jn7nnqa3
X-MBO-RS-ID: f823ad7086e9524dd23

On 10/13/25 6:38 PM, Frank Li wrote:

Hello Frank,

>> +#define STATICCONTROL				0x8
>> +#define  SHDTOKSEL_MASK				GENMASK(6, 4)
>> +#define  SHDTOKSEL(x)				FIELD_PREP(SHDTOKSEL_MASK, (x))
>> +#define  SHDLDSEL_MASK				GENMASK(3, 1)
>> +#define  SHDLDSEL(x)				FIELD_PREP(SHDLDSEL_MASK, (x))
> 
> Can you keep bit fields as consistent order,  from 31..0 or 0..31.

I sent a separate fix for that, so it can go in before these patches:

[PATCH] drm/imx: dc: Sort bits and bitfields in descending order

[...]

>> +static const struct dc_subdev_info dc_db_info[] = {
>> +	{ .reg_start = 0x4b6a0000, .id = 0, },
>> +	{ .reg_start = 0x4b720000, .id = 1, },
>> +};
> 
> Not sure why need map register address to id? Does graphic link or use
> dt cells pass it as argument.

The display engine component (de) does use it to figure out which 
matching domainblend component (db) to access , since there are multiple 
instances of each.

Is there anything I should change ?

>> +static inline void dc_db_alphamaskmode_disable(struct dc_db *db)
>> +{
>> +	regmap_write_bits(db->reg_cfg, ALPHACONTROL, ALPHAMASKENABLE, 0);
>> +}
> 
> This helper function just write value to one register, not helper much
> at all.

I agree, but it also makes dc_db_init() a bit more readable, so I don't 
think inlining this is going to improve the driver much.

>> +static inline void dc_db_blendcontrol(struct dc_db *db)
>> +{
>> +	u32 val = PRIM_A_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
>> +		  SEC_A_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
>> +		  PRIM_C_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
>> +		  SEC_C_BLD_FUNC(DC_DOMAINBLEND_BLEND_ONE);
>> +
>> +	regmap_write(db->reg_cfg, BLENDCONTROL, val);
>> +}
>> +
>> +void dc_db_init(struct dc_db *db)
>> +{
>> +	dc_db_enable_shden(db);
>> +	dc_db_shdtoksel(db, SW);
>> +	dc_db_shdldsel(db, SW);
>> +	dc_db_mode(db, DB_PRIMARY);
>> +	dc_db_alphamaskmode_disable(db);
>> +	dc_db_blendcontrol(db);
>> +}
>> +
> ...
>>
>> +struct dc_db {
>> +	struct device *dev;
>> +	struct regmap *reg_cfg;
>> +	int id;
> 
> where actually use this id?
Please see dc_db_bind() .

I will be handling the rest of the feedback on this series piece by 
piece, thank you for your input.
