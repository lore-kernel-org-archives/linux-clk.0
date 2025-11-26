Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0487A2E11C7
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150781; cv=none; b=dfEShBV30d1qHnCTXlHgjPMRybCe1vxzQXDZFtcaAWT5uxq+kEF8/CtBdwCRrf78EHOTUjiwTpMMPg2ghbxFqOmpVk3JeQ4qoVgqQcwZq9YjKVD7eV9BXtGKHQ+9mb1yzwb7KN8G27Wq5ae2DrDOHKezB+A5hwHYhLoRHf80Q44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150781; c=relaxed/simple;
	bh=wdSMtj+M11pcIblUFe9S8TiR+mzmYuyBKKkjBChI/HU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hdm6S8ZRBOuBCnrD24FTSwNDfAO/fgF4r4HQGeqVuyqt9ZioGjRspa8yTINtUKUVc7eChcXfcLeyDJ48jfH3Vc4+8237diXc/F1VJktgsR4ehvgG1EdxpWMdwzF8AoIPQPr5+TX8ceTnRY8nUxciNZ+87K5OtsbxM2d3pJX2xHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=AN3ExcYw; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="AN3ExcYw"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 76EBE40F18
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764150775;
	bh=wdSMtj+M11pcIblUFe9S8TiR+mzmYuyBKKkjBChI/HU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=AN3ExcYw/u+SVr9D0Hb+B4mwkxLh0WBLUS1b9vTEm41CSuqSKksbtFMRW4plykjeg
	 4udu/psX2QHFoO1HFW/aQJw1CWt/86tylEY2isU4zg/eTyS0xb2xl9MmOTogXrE9lZ
	 HB/Mrsb5tJIhlt3GjEWWsyUHaNaA1rumD3/rnY1dnt+4h6y+ycMAAH+1opTw/SCoYs
	 EAwxKDwShXSwRrQ5QlO4EQxdZebyrf5VNSejLTr2SLs2DmLGnMJ5JJvjnHuN1L2Yqw
	 KEYsd6LyFZMqicYsB1ewsDKvKkGsNrImZN4uP2vaPT2tmp/UAv0py65U7szWdvinN0
	 xJE10dgypMu1AZ4usD7Ad97r9dkKv3NQl2CqFJ9IJG50LpMYTKLT6zhyythRxM/0OW
	 5TAtNjpExKdYXjWXmybt0/NqP9e4BsmV0fxAOaNiAHc326B1QoHbV/N5wp6pXkjGFX
	 KD7ZpsxjghowzlVNLfISuv/czn0UrMTenitlqvTZzBX76rhBJyJLD1u8iSPSYZ4pKI
	 ZFuAmkS9qrpYODxuoFHdDfgkkcl7gzo0ABuWxstnNwFqlVC4Vd+pF0QhT9BgCOVZEP
	 OPtdRM0vo5Arkl8TmgrxGuumwUj/8MpD9eu2pYiVB06V9gFXF40mXRIWY5wyXDK/ny
	 eoLYeNR7rSQzwanu9ccHEQw0=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b739f418149so430383566b.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 01:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150775; x=1764755575;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdSMtj+M11pcIblUFe9S8TiR+mzmYuyBKKkjBChI/HU=;
        b=mdtMRX9IX5J0bqOtKmemLRt6eujWsXxzToIGKLm7GbyG/N4mx2oK57cTK29SzNE4pU
         E3xG3F0fv3zBCnuiLnx5mlViPzvS3xsWrjKTJbDeOhVavMM18XogJYxd3atZPBCrmmDm
         XtEBrYgDxlOZ/7Ss4N2FSn0ZpTjOcfXVhZ8gu/MICD+9iM0aNxO43qSZh8XD8AvO/KSo
         GY83DtUrIvEdC+o/9twdNo8ROiHigsAK31pNGrwf9WlRmxzKE3Z9eGFj6P859ebyrq1c
         +sixRun7BeMVXj5wjVTQFNnfq2gsEyfMkTVdglRoClbrDYJ5R1Udfb+cwsb44tvxSJfI
         +ZEA==
X-Gm-Message-State: AOJu0Yyn1zKUu4S7JsAQag2W1Xp5HrxedT/FYBInmqUKJDCtsiIR/Iez
	tKld+scT0L5FFqLTK6uLhfZ9vToSg8VHZMCrE5ixOJ+Xgf+ryhP11tH+mVLVFU8Qp/WWh1t/pCe
	MCkwu9GT34X7tv8G2nUZ0ziMiJblVrZMvngwnasrX0Aec+N9iB3qUgldIf6L08TngJ75iwFWgDc
	2wIkgwmWJqmj+xCf9pVzBxCKLcb3WVNVCKu2AbpjkxHxKdC/2rqWAATMO39Caw
X-Gm-Gg: ASbGncuwOungIEJVI33crTFEzGMGc8n75NNrxS1V8Sc05H4f5YY2cphidrNaHT1cm8I
	/DMkSSM7rHxE0N27WSzbQdlLoEtcf8OAiC2tq2rcxheoULUWz+dVr3XcaJysmzxQ3w6FlCTz+G2
	WgDMx48WEOkqxNU6w1Lo+TD4waBC7c/13smzlP5kATtbz6XFUfE35TPtM3GaW4JdLy0pCadodFV
	QW5nR8C13IuSEfAsxl4hw==
X-Received: by 2002:a17:906:c10e:b0:b73:21db:6f52 with SMTP id a640c23a62f3a-b76717056ebmr2042628966b.42.1764150774837;
        Wed, 26 Nov 2025 01:52:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7rYQkSZ/K+5y708hKLHWh5WQR5bgUu/p/wNJt/1YY+yDDz19c6IG6C7LFjLS5cBl1pMOKAKYdk7FA9XZNZi8=
X-Received: by 2002:a17:906:c10e:b0:b73:21db:6f52 with SMTP id
 a640c23a62f3a-b76717056ebmr2042627866b.42.1764150774416; Wed, 26 Nov 2025
 01:52:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Nov 2025 10:52:53 +0100
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Nov 2025 10:52:53 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251126032534.1628-1-vulab@iscas.ac.cn>
References: <20251126032534.1628-1-vulab@iscas.ac.cn>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 26 Nov 2025 10:52:53 +0100
X-Gm-Features: AWmQ_bngQ4XmWZ5xeR12UU1yRkWcrEimUONS2FO7QTwpyRD04GUx3k_qm5nWehA
Message-ID: <CAJM55Z_3FzKaLJVeR+Yj+gfYBL0aOLEvMOiCVqzamUDgzvSdTw@mail.gmail.com>
Subject: Re: [PATCH] clk: starfive: jh7110-sys: Use devm_clk_notifier_register()
To: Haotian Zhang <vulab@iscas.ac.cn>, hal.feng@starfivetech.com, mturquette@baylibre.com, 
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Haotian Zhang (2025-11-26 04:25:34)
> The clk_notifier_register() in jh7110_syscrg_probe() is not unregistered
> in the error path, leading to a resource leak and potential use-after-free
> if probe fails after the notifier is registered.
>
> Use devm_clk_notifier_register() instead to automatically unregister
> the notifier.
>
> Fixes: 538d5477b252 ("clk: starfive: jh7110-sys: Add notifier for PLL0 clock")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
