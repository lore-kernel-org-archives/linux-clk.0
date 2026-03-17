Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E843E638F
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 14:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756840; cv=none; b=pvVKd9mSXWSRwjMBnVi5jdbIzgrOAAdsn7Yw2BcdP1FPLcRUMlXDvMh8iSh87ZKZzhyCTAXE3brdBazl4P8tve/1H2rulZnnkFdRm2o8fta9+mG8nDtxNNYOxGpKF6/aJsNyXo7mBAURyXiEEnltTiWdKd15EPcgKjv4hiOJFFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756840; c=relaxed/simple;
	bh=jugNfhVGoAZLsOc99uCHasSIqDz4SbgW0PhAWH1GU18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z6qNp86I1Pes5jra8uanX6/H1BGFMH+Vq/Rfn9qhju3ebH01IlT+I4ayb5vYADhaBrql0jbXitp/mK1q53K58c3dRsbxeLzXxBmhA2rVMXWNBCg3vsVElcLplxIuQe6dtSoPT7GJ3R9wXd5tMws6iX4nlGZsjdkZkPCc5J7z5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwDacHVC; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwDacHVC"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c73fbdd9b53so929776a12.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773756839; x=1774361639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xG69i8JOUMrznCX6jQd2A8Mx07c0rQ57RLS0YIP3VgM=;
        b=IwDacHVCJqqz/pl59zB+0pV+tkuM8+dz356kv6oRBiBwjg3VkrlOmbPFG78Rb8Oo/E
         6Ae4mRspZMfm/YwsltuMcGnezSE0xgiVyDDBdoNyRKKpCXw42wBhyi+ay5Q8r2lT9CUx
         jEMOttyCGd3tTunzzeNcTajNFe/TOm+IOQiSFoLiTKfpU5ex8kpMaY/EU3iAwI9Xa6md
         0VeSs3XMmSdL53OQzALfFVFcxNhAgEXrQfxEBeZyKQWvgYKtrWQ3HibKRNBcoCFH5wZP
         i2OleKprJbZ/FNavehvgY1lKCcEMmP2uVzgCo8Rxe5N+6F61EXtDJzzYQVN8BYfV5y4B
         JtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756839; x=1774361639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xG69i8JOUMrznCX6jQd2A8Mx07c0rQ57RLS0YIP3VgM=;
        b=X2vAwpCxECHu0Dn4GH2JMN9Uhk0HsNCXFTkJJaNy9yAwtc2ge+7xuNcW4HEmNNdcRU
         khbgAx12qA4Q4hb5VB5Q42OuRWhq04blvRRfJnysbJegHAhFpC9HB1zkzSlA3Gycyelg
         d4V2Z0vgG/OXlmsLYvPnpu+k620Q1S5axYC9iYuETDZEcXyTyzn5/uH3H1TQ/2cpbxp3
         n6SLE2WAydLkGkifWfB4IeucCsaq/kgPPscT8FDuoQiF+27PC58r1iyRzX6uT8ZBniuy
         nqvajlcgOxXOaysUiIGk2GRz7xkR9iqX/sIqXoG6kcopGgqSHGsGZj21k0VKsRNT88/X
         RAcA==
X-Forwarded-Encrypted: i=1; AJvYcCVP/a8dLVEiKWolxE5FQu8RiIPuW03rbxnyLkR5AHzP23kapc0dZEIknx5L/hMDwWqZUp1PgEsL8xA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3153eDSempySaXGJ3+fSgSPVGg91x2Ut5O0HECvVVBVZBVE/1
	ar9XfREapCNGO9LPcpnygG4h4gl70Odm554OZMSfmId5vd0u1q3d4vRx
X-Gm-Gg: ATEYQzxz6zyh/sPUmXcBc3L27jSThHWbVZcMAol5DhUOdMdcQbkWAQ86nwUY20hH/xa
	HwICd4WNVGacky5l12Rw3TJiqVwN6ZPhV/hZoFeyh4NPPG91kNvmJUzv75uqsU5R0JM3QxCqHkG
	cc/iEHAYcA4aXQTpvZ5H2rX65gPDhWmzLTTNOh83z+W1GfSpVC7oK1Ns64xGC/+1l5UNFYV45PQ
	N+k49ZpvKfgZJhYi107EGZYQ7/qc3FEX1jppKUaZ7F89pHsrhLbPaWbwSPQSZUOMZGa7fpVESL4
	4627lf1t3iyLgN3yaYsKWHWcpnxdSqWtmI8i3f1ilocWC8ZERUyFITayw5pBDulHKtub/yTyLN8
	TpXx6yFJ/7XU/bX2RXBMtyD7Vo+g52N5obV/v/joBs0jMDKHmmmbCk5ZZrNp5N5pwZU5RQ+ley1
	eNcx5n4/L5p1ZSu2cPeSQdnj+Qf6Zp4xchQVL12CE5JbpCn+HHO9qI/1bBBRz6nUbNsWJiyA==
X-Received: by 2002:a17:902:e54e:b0:2b0:5472:ac80 with SMTP id d9443c01a7336-2b05472af91mr89495745ad.42.1773756838550;
        Tue, 17 Mar 2026 07:13:58 -0700 (PDT)
Received: from localhost.localdomain (61-230-23-18.dynamic-ip.hinet.net. [61.230.23.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b04f40f515sm114820005ad.74.2026.03.17.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:13:58 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: krzk@kernel.org
Cc: afaerber@suse.com,
	conor+dt@kernel.org,
	cy.huang@realtek.com,
	cylee12@realtek.com,
	devicetree@vger.kernel.org,
	eleanor.lin@realtek.com,
	james.tai@realtek.com,
	jyanchou@realtek.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	mturquette@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	sboyd@kernel.org,
	stanley_chang@realtek.com
Subject: Re: [PATCH v4 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
Date: Tue, 17 Mar 2026 22:13:52 +0800
Message-Id: <20260317141352.17813-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <949b509d-c712-43e7-85a0-60f4c5e24a09@kernel.org>
References: <949b509d-c712-43e7-85a0-60f4c5e24a09@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On 17/03/2026 02:57, Yu-Chun Lin [林祐君] wrote:
>>> On Fri, Mar 13, 2026 at 04:10:51PM +0800, Yu-Chun Lin wrote:
>>>> +#endif /* __DT_BINDINGS_RTK_CLOCK_RTD1625_H */
>>>> diff --git a/include/dt-bindings/reset/realtek,rtd1625.h
>>>> b/include/dt-bindings/reset/realtek,rtd1625.h
>>>> new file mode 100644
>>>> index 000000000000..e69b5ee14cc6
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/reset/realtek,rtd1625.h
>>>> @@ -0,0 +1,195 @@
>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>>> +/*
>>>> + * Copyright (C) 2025 Realtek Semiconductor Corp.
>>>> + */
>>>> +#ifndef __DT_BINDINGS_RTK_RESET_RTD1625_H #define
>>>> +__DT_BINDINGS_RTK_RESET_RTD1625_H
>>>> +
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET1     0
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET2     1
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET3     2
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET4     3
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET7     4
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET9     5
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET_BIST 6
>>>> +#define RTD1625_RSTN_REG_ID_DUMMY0          7
>>>> +#define RTD1625_RSTN_REG_ID_DUMMY1          8
>>>> +#define RTD1625_RSTN_REG_ID_DUMMY4          9
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET11    10
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET12    11
>>>> +
>>>> +#define _REG_ID(n) ((RTD1625_RSTN_REG_ID_ ## n) << 5)
>>>> +
>>>
>>> Not a binding.
>>>
>>>> +#define RTD1625_CRT_RSTN_MISC      (_REG_ID(SOFT_RESET1) | 0)
>>>> +#define RTD1625_CRT_RSTN_DIP       (_REG_ID(SOFT_RESET1) | 2)
>>>> +#define RTD1625_CRT_RSTN_GSPI      (_REG_ID(SOFT_RESET1) | 4)
>>>
>>> None of these are really bindings. Register offsets is hardware data, not a
>>> binding.
>>>
>>> Drop all of this above and further - actually nothing in this header look like a
>>> binding, since you called these "REG".
>>>
>>> Best regards,
>>> Krzysztof
>> 
>> The defines in this header are NOT register offsets. They encode "Bank ID+ Bit
>> Position" for use in Device Tree.
>
> Bit position as in register bit position? That's still not a binding.
>
>
>>
>> Agreed, The naming with "REG_ID" is misleading. I will improve naming all reset
>> IDs in v5.
>
> No, all are to be dropped or renamed to standard IDs (incremented by one
> from 0 or 1).
>
> Best regards,
> Krzysztof

Hi Krzysztof,
 
Understood. I will redesign as follows:
 
1. Binding header: Sequential IDs (0, 1, 2, ...) without hardware details.
2. Driver: Internal mapping table to convert IDs to register/bit positions.
3. DT: Uses abstract IDs from binding header.

Regards,
Yu-Chun
