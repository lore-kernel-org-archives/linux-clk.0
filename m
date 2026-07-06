Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BED26F2B9
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329412; cv=none; b=YC7WA2zmmy9U0ELMP9DgErJE7tb+h5t1nzZhcDGz/rs3oeDwcPBVogsUuYO28ohkxldvF27fcKx3K5rntFcmm9WF28/mWLkrOqfzldQxqEB/mof4KVomBXB2HIuBMVVVZyCFvJFIO7HaBNKtmERCmpefsnll3hYPbuQGUUjeYV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329412; c=relaxed/simple;
	bh=n9nR8Fg+JMZq1BaP4ahqBVtAOKem/sDG6ZYm02uG/jY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QHg5AGD46Ph8qUAHStQBYUz5s6LSi/ZFV8ztAXGVs1YKxWXnKlk3J4bFApPl1xpk34BCgHdcaWqOSpoAYjBLXINkOeBberUUzB6BoFkJ6/ySGR98i8O81WMCHDvfz2HSTQ4a/Mhz+oaV3p6N3b4f3+ST8g0Kybdsk5FUeBAAgds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Hbc29WBd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Hbc29WBd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so13737695e9.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783329400; x=1783934200; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQyAj/mTcNP80GWpdq+ZAxNRRGcOVsB8iHT6S7Y5T98=;
        b=Hbc29WBdvuueQ+jrH04RQCa2vDi/wF8TZUS4dsp0I0yKsiNpHC1CZ8TFop+oQ/QCl1
         gCaVshiQn4VoMRK6Q2OLsy6ZyRD4qZjrQ+m5XmdE7862+88fQW/TfVWZj9hytDXBaJn7
         +hYXXZmrQFuYxmizpRyb7mU3/Hfavqdcsgp5hKHC/sFlXRSrOh7T8IWRs7sItyl6vTyD
         fnZw9VBpFZ3hE4FdOLc+PtxPyueHVLnS6sfztluk2k55ozsoFcEVkqB+gQ5G4Hu5DFlQ
         ukd3As2zfwBZ28XbApl66ZHmviIZGiO2FApESXIK3/a07mvcmnp3UYn8gF6lLmRXQ/CD
         qvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329400; x=1783934200;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FQyAj/mTcNP80GWpdq+ZAxNRRGcOVsB8iHT6S7Y5T98=;
        b=V8Vt9HcME6kx5mf5cgoSTGNMjbERm90NRNJ/I4VfJT9XUdA+I7nuRDC9ANfqPdkyfn
         4PUvYup3OjHTUDjrJ5xoqCK9Q+a9bErf6bU3CsozrB5Ce12DZL7987RS6JcBlxIuIyB9
         RLsn2XYuQUBHBcrFDOT2shtOokW4kU5VX3OQK+eevfSE4H36WePJVmScQMl3mx8t0PUn
         1lNoahVAQMzPnTRiPw6/6kGVDIm7fgliEkrBtW2KUbS32qm5vEfUXMZkNTduLmqehsVV
         CvyXY3w4aJtm+tOf5fYr5bioGqDXR7VehGC1tybCCNpxIyy3hfhK28XgEynJ3v6AeP8R
         Hiow==
X-Forwarded-Encrypted: i=1; AHgh+RpHSiewknqfErBKomTxRz2UpdU5aldRZ/k36CRUxFYKFi973kqh8HMW7KD5rD0o8nFnm8APCNSp0UY=@vger.kernel.org
X-Gm-Message-State: AOJu0YznHT0GzjruWThHaBgTlPZ3BJDVLiG6gG1rHjB8mUMLVPMpqMe0
	B60DQA6r9Oo7S6cBwFbbQHdx7SuXP/U14qcd2FTPmThdAkxq9Qtv7Jjus6ydGwxo8fEpCicFTKA
	3fwZw
X-Gm-Gg: AfdE7cnlnO0NpYLmdRnNjtcKYqoSyX/llJdh0DrGzs31naZ0VGhRkkNkzYfeznP7lk2
	5IPAK/gJoAnwSsdPs8Pm7F6Z6epp2+qNLK5UAk4QV8i++6blXlT93cPlKTU4oVzFyPKeElpJmOw
	U2Hl3t3v2VTanufidS3T/+QBWBUDANvdfYVfu0yFzea3kLb1xQ9e+Tw+wWHx77uEC+HpCdCB6FC
	R8INeE9kcFHvM7VJpYRfAQ+wH2OUH40XNJ9AKmgROKuqxNKZ7i1PJot+M59o7/e5pqS8fsO2w8M
	m9fA0UOL6lV7M+fEc58qOM67kTKypxWhGLJBiW64DAyo2yFn04MCJOM0d7Lx4SE1MaMqQa6H+sY
	7iXib4tGGBupLOQ+XRnfEcuYqMRnQRHfotidHsIs2qkT+muYMu1dCNSWSh3kI+Cxw/jDfgK7AOl
	NvJRAdBKfJ8L0=
X-Received: by 2002:a05:600c:3551:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-493d11fb8a4mr101976925e9.35.1783329399663;
        Mon, 06 Jul 2026 02:16:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6381e4fsm412373525e9.8.2026.07.06.02.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:16:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-rtc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 6/8] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sat, 4 Jul 2026 16:25:07 +0800")
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
	<20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
	<CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 06 Jul 2026 11:16:37 +0200
Message-ID: <1j1pdgiikq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On sam. 04 juil. 2026 at 16:25, Chen-Yu Tsai <wens@kernel.org> wrote:

>>
>>  extern const struct clk_ops ccu_div_ops;
>> +extern const struct clk_ops ccu_rodiv_ops;
>>
>>  #endif /* _CCU_DIV_H_ */
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
>> index 766f27cff748..e2d6833a6d33 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.c
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
>> @@ -68,13 +68,14 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
>>  }
>>  EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
>>
>> -static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>>                                             struct ccu_mux_internal *cm,
>>                                             int parent_index,
>>                                             unsigned long parent_rate)
>>  {
>>         return parent_rate * ccu_mux_get_prediv(common, cm, parent_index);
>>  }
>> +EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_unapply_prediv, "SUNXI_CCU");
>
> This does not need to be exported since all the base clocks build into
> one module. And maybe it shouldn't as we probably don't want individual
> clock drivers implementing ops.

Indeed, I'll add a patch to remove the export of
ccu_mux_helper_apply_prediv() as well, for consistency. It does not
appear to used out of that module either.

>
>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>

-- 
Jerome
