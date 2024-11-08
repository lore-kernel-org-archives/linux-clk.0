Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62D21A9B23
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096896; cv=none; b=KZVkRctNPsGeIjD7l4ejBHp38l7lRjACqx4BvXtQmb87f1KlAle0XYxTJSGBj4pJkPrc6Mvp9qzNWfc1XXTZHSxWhwpaf02FTyQFu2H+RlZ+bdvCSqaJQQEdOivNWXj/GvFbAWtUiZ48+klLfst0EC1ETwIwsF8hXbgKq6hlDUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096896; c=relaxed/simple;
	bh=YH3LNbSn0wPVEk/wOFHU1OMDcGX+bTlPteohwZ97IvY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=jNNsiPv/e+iXaW/V+bxlLWllqG3D6cgynz+c24EdWvRp6IExec58mzBj+AZl8nVRQI2jfJRGL+nfCi60JTbPjwrFqtaY06m6SSyd18kYHg5Pwny8Q16ykZfLPQdW2heU7VreF/zLzy8NDoJwYPHZSwelF7EGWpM2mRQcicnWPdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com; spf=pass smtp.mailfrom=wirenboard.com; dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.b=hXaRTrTD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.b="hXaRTrTD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so21293795e9.3
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1731096893; x=1731701693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SnJi290h8vr4C/mD2ddPtqPV3xjVoWTEKK5WxcOCaRU=;
        b=hXaRTrTDMXT67a+Bvtm6TRRQzT/SzJnNEyR9bj2OdihbU0UIH0yXFNcjbaURN9ovsT
         TPW9esWoPjZFasYjyNJsB0/w2JyJp7RDBeoe5bDXybKNZBjDlr5LwPSN2B6bVD+HtpaX
         N6MZI2eLB1tsIVw4WBFJynZ/zNQtGqpAfOtNIqNgKeU7Oo86GEkPKdSqcUI1w5+PZX0f
         1r8w8mWHaODu3k7NNE1vBdNRHC+OJ+tt8r8+ISM6v+JEVu5Jxa2lf891Njallfo7rAl9
         D24Nzc7wKdG0impzuLlhAVHlHtGm8IUK8C1X3AZTgolaP2ZH7Rlt5BxpbAROi4eVXsgZ
         XzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096893; x=1731701693;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnJi290h8vr4C/mD2ddPtqPV3xjVoWTEKK5WxcOCaRU=;
        b=ZH+0SQ+0dBDSSYg4zSYXEm5r0fSwoz6XHCjnLHwdv//Szj2xpDySo+PwUMGH2c+DXz
         YjyLxwvgPD0h8p1VhCtJUYQj29t2dGIgxWbCm/ox4dnpkvoMWQ9zJKXwZIQPbHkw7zoF
         qN5FEn89tfA3Im1LgxXFB9JF3pCPtSKmx4t4cdeCPYkYW5CpccLoZvfKfsFyv+eqFsgt
         Hw7S51btFY8rdAyyI4f3+VSE6+2G9Jd6+Q/In7Qx0tyzMQsynBYUXWXoieXleFQPVcJ/
         ZoUaOALD6L5SzRDOR/Px/O/oOXucmj05MGR1kYM2o7G8xpnSaGAoHoLnGtlsrz74471k
         BQNg==
X-Forwarded-Encrypted: i=1; AJvYcCV1VEDDSJXnSeK0bJWxtCU9a4fQ0IPJtidkmHiI6cfMxuJ1rkpd15PqlaRU7ujmMx+ydqaan5umFvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgFAEa6RScM1hFhiHRvGOLkES7Z5CkkogpR3zO0GmIzzPABEdA
	X4FKATz9atpGPxavTIep2BIjsfGkpz8ooGmnHxF1THjZFQjaa19gI/z9rF0hzsg=
X-Google-Smtp-Source: AGHT+IGN5sV2BbFWTnqEaNdU1iKUMM5d5J1yjXajKUVbx428HpwPMeTpAjJj5+kAG/3PF10HUkZuzw==
X-Received: by 2002:a05:600c:870d:b0:431:4fa0:2e0b with SMTP id 5b1f17b1804b1-432b7519708mr32564385e9.28.1731096893182;
        Fri, 08 Nov 2024 12:14:53 -0800 (PST)
Received: from ?IPV6:2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49? (20014C4E24E5BB006639286E9EA6BB49.dsl.pool.telekom.hu. [2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432aa5b5b7fsm116672495e9.4.2024.11.08.12.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 12:14:52 -0800 (PST)
Message-ID: <7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com>
Date: Fri, 8 Nov 2024 23:14:51 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: andre.przywara@arm.com
Cc: jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
 mturquette@baylibre.com, samuel@sholland.org, sboyd@kernel.org,
 simons.philippe@gmail.com, wens@csie.org
References: <20241025105620.1891596-1-andre.przywara@arm.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
Content-Language: en-GB
From: Evgeny Boger <boger@wirenboard.com>
Organization: Wiren Board
In-Reply-To: <20241025105620.1891596-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Evgeny Boger <boger@wirenboard.com>

We had stability issues with some of our T507-based boards. T507 is the 
same die as H616, to my knowledge.
They were fixed by essentially the same patch, which we unfortunately 
didn't submitted to mainline: 
https://github.com/wirenboard/linux/commit/dc06e377108c935b2d1f5ce3d54ca1a1756458af

It's worth noticing that not only the reparenting is mandated by T5 User 
Manual (section 3.3.3.1), it's also is implemented in vendor BSP in the 
same way.

We tested the patch extensively on dozens of custom T507 boards (Wiren 
Board 8 PLC). In our test it significantly improved the stability, 
especially at low core voltages.

 From my understanding, all Allwinner SoCs need to follow this kind of 
procedure, however it's only implemented in mainline for a handful of chips.

-- 
Kind regards,
Evgeny Boger
CTO @ Wiren Board
https://wirenboard.com/en

