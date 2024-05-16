Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87221DFCB;
	Thu, 16 May 2024 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715859517; cv=none; b=jlMs+4cqIJsq5HgSeIdFRSVvSoGRdmdJGOurQ6V5DqMDo9RM4n5Mvh+l1Su5V7PPrOhf/0Cvp16eYlERGB3H6PxBjLkR6JtuO8mk4jui52S/22/JXgkohqkYSgaQG4CLoqnLgGNuGSBj2iFX5LdyZthALXlsZpL7syrfGYlzO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715859517; c=relaxed/simple;
	bh=6YlANbTSJp+DD89N4n3iOkjqTuHNDTJa4CMV9yVdZkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7u7bATG85IhO8//wX90UYZGx82bceZ6DwDNudc4Wmmm/+wFMOEYqBGjNfmvbxYjJ1+n8WyJRwt083ETECs6/5nYJNZt4tf8xSUy9v0ODjAvuXpxNbZqEf8inCql0YuZr6CZll23v5rt/fgBOpdZoO6cn0VDf6TkOAwRrWQz9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EnW+unrU; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EnW+unrU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715859513;
	bh=6YlANbTSJp+DD89N4n3iOkjqTuHNDTJa4CMV9yVdZkM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EnW+unrUCcxibLwEbfR1jJVHOgS3THUQZzkyGgnVBV2r8SX3rWjQ5hjDbDaeep5uc
	 nuO/SOHzZ1g3XKmounte9suRLuquEUfoX+mMZRKKFv7f0VP4kr/Ui4UW9IWOmD/NxH
	 3s4rqZlKExzQ+vTdC0ZprCl1JgIvBCzcZCLC1g54BtTzekmkqKNI5cwMBx1RSuv4Rw
	 s1Nmb0phK8jnffAlbg3Yi0rslYT8Twphh1cbYANvEZt3avsIhFYESj6Xy5isK4Mj/w
	 W6H2PQUVjYCAyLFajFQi3vQc4eKFfYV8SWdTfk/fVSBBdCHq8EZVwTf9d27ZKMRvEG
	 h9lOwBaTP0knA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 898683782186;
	Thu, 16 May 2024 11:38:32 +0000 (UTC)
Message-ID: <d6b7aa1e-ce0d-4ea3-9f2d-c256a296dd1f@collabora.com>
Date: Thu, 16 May 2024 13:38:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: reset: Add reset definitions for EN7581
 SoC.
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-clk@vger.kernel.org, p.zabel@pengutronix.de,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.bianconi83@gmail.com,
 conor@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com
References: <cover.1715777643.git.lorenzo@kernel.org>
 <acb6aa6fe473c485605c108e551d6d28ceb27a60.1715777643.git.lorenzo@kernel.org>
 <b1e0db1a-2bcb-4d11-a386-e395c2946591@collabora.com>
 <ZkXqoG6xIsrrLyh4@lore-desk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ZkXqoG6xIsrrLyh4@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 16/05/24 13:14, Lorenzo Bianconi ha scritto:
>> Il 15/05/24 14:58, Lorenzo Bianconi ha scritto:
>>> Introduce reset binding definitions for reset controller available in
>>> the Airoha EN7581 clock module.
>>>
>>> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>> ---
>>>    .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++++++++
>>>    1 file changed, 66 insertions(+)
>>>    create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h
>>>
>>> diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/dt-bindings/reset/airoha,en7581-reset.h
>>> new file mode 100644
>>> index 000000000000..1b7ee62ed164
>>> --- /dev/null
>>> +++ b/include/dt-bindings/reset/airoha,en7581-reset.h
>>> @@ -0,0 +1,66 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2024 AIROHA Inc
>>> + * Author: Lorenzo Bianconi <lorenzo@kernel.org>
>>> + */
>>> +
>>> +#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_
>>> +#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_
>>> +
>>> +/* RST_CTRL2 */
>>> +#define EN7581_XPON_PHY_RST		0
>>
>> ** sarcasm mode on **
>>
>> Count with me: 0... 1... 2...
> 
> :)
> 
>>
>> ** sarcasm mode off **
>>
>> There's a jump here, you have a reset index 0 and an index 2,
>> but you're missing index 1, that's not right :-)
>>
>> Please fix.
> 
> it is because BIT(1) is marked as 'reserved' in the documentation so I skipped it.
> Do you prefer to have it in that way?
> 

This is not my preference, it's rather a requirement for the bindings...

That's why in the MediaTek reset controller part of the clk driver there is
a way to map those numbers (which are always sequential) to actual reset bits
in the controller...

Cheers!

> Regards,
> Lorenzo
> 
>>
>> Cheers,
>> Angelo
>>
>>> +#define EN7581_CPU_TIMER2_RST		2
>>> +#define EN7581_HSUART_RST		3
>>> +#define EN7581_UART4_RST		4
>>> +#define EN7581_UART5_RST		5
>>> +#define EN7581_I2C2_RST			6
>>> +#define EN7581_XSI_MAC_RST		7
>>> +#define EN7581_XSI_PHY_RST		8
>>> +#define EN7581_NPU_RST			9
>>> +#define EN7581_I2S_RST			10
>>> +#define EN7581_TRNG_RST			11
>>> +#define EN7581_TRNG_MSTART_RST		12
>>> +#define EN7581_DUAL_HSI0_RST		13
>>> +#define EN7581_DUAL_HSI1_RST		14
>>> +#define EN7581_HSI_RST			15
>>> +#define EN7581_DUAL_HSI0_MAC_RST	16
>>> +#define EN7581_DUAL_HSI1_MAC_RST	17
>>> +#define EN7581_HSI_MAC_RST		18
>>> +#define EN7581_WDMA_RST			19
>>> +#define EN7581_WOE0_RST			20
>>> +#define EN7581_WOE1_RST			21
>>> +#define EN7581_HSDMA_RST		22
>>> +#define EN7581_TDMA_RST			24
>>> +#define EN7581_EMMC_RST			25
>>> +#define EN7581_SOE_RST			26
>>> +#define EN7581_PCIE2_RST		27
>>> +#define EN7581_XFP_MAC_RST		28
>>> +#define EN7581_USB_HOST_P1_RST		29
>>> +#define EN7581_USB_HOST_P1_U3_PHY_RST	30
>>> +/* RST_CTRL1 */
>>> +#define EN7581_PCM1_ZSI_ISI_RST		32
>>> +#define EN7581_FE_PDMA_RST		33
>>> +#define EN7581_FE_QDMA_RST		34
>>> +#define EN7581_PCM_SPIWP_RST		36
>>> +#define EN7581_CRYPTO_RST		38
>>> +#define EN7581_TIMER_RST		40
>>> +#define EN7581_PCM1_RST			43
>>> +#define EN7581_UART_RST			44
>>> +#define EN7581_GPIO_RST			45
>>> +#define EN7581_GDMA_RST			46
>>> +#define EN7581_I2C_MASTER_RST		48
>>> +#define EN7581_PCM2_ZSI_ISI_RST		49
>>> +#define EN7581_SFC_RST			50
>>> +#define EN7581_UART2_RST		51
>>> +#define EN7581_GDMP_RST			52
>>> +#define EN7581_FE_RST			53
>>> +#define EN7581_USB_HOST_P0_RST		54
>>> +#define EN7581_GSW_RST			55
>>> +#define EN7581_SFC2_PCM_RST		57
>>> +#define EN7581_PCIE0_RST		58
>>> +#define EN7581_PCIE1_RST		59
>>> +#define EN7581_CPU_TIMER_RST		60
>>> +#define EN7581_PCIE_HB_RST		61
>>> +#define EN7581_XPON_MAC_RST		63
>>> +
>>> +#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
>>

