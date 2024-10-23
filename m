Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AD31459F6
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729696459; cv=none; b=EO69fNm5EUuAYXsUlfZ+51jto/nYn182a0Iw3VuqttcNxRnqW7RE5gQCxOv9l5skFY9kgvcoq2gyJiPwjFgK2kjn+icjJcM94w17yiTP0V4tmo0e3UYh73rgX3ilS2UQhoLaBqFLTJESMrvid0sefoljWBY7adeJ9ASAZn2vVhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729696459; c=relaxed/simple;
	bh=R7iJd7vHHB5mJipBrcLSPkxvw1elVK63sjkGfUt3uw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iriTWIOyx5YpErNfN6fxM8V+yKUwKdHT8ZrB46/yYJIydPvBXYVtp8NEf5E/XnEJu4/bJaXMRTTdQwgsWozQBLP1jL9ovdNm3K1Q4K03sb5JAKJdt0nCZKGLH5Z9Y8gF5fGOyVzWybSr8W3Og2pjafLP3icPEY+W9eF3rQIRo18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OfuekNNk; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OfuekNNk"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d47eff9acso4768785f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729696456; x=1730301256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui/qUfg1xQvEs4poV0yePFVI+AQV5tMXrDDwu5usZGk=;
        b=OfuekNNk7gKnhGw8rN5j34kun0FCFJTDazHCvqZGc+Eka9Nz5LiKteXcrm2l9lAE3Q
         +8i5h0n245ZfCLdh2cAlbTsOXcaHvdM80wZ/BTnTeuFdDJqBw4xCLCEvesEfjvgXzxSy
         xD3dT17op3aJl2wqfub8UbeosTieRVN9Rmo7IqgoLSkFxV5LEUn5tnWX8fSvSYj6mQTZ
         pq/FHf74JiUg4uwBQzrf0TpPqDsWftf8M+Dih8rfmopT6O2shiuOrnOurrcYKhCpP6cd
         mkXVMYoWcOF0ox0T/3ECrBoWDqP3mhxN7R98GBjk5lmOlsrJMVcWEXkluBzs1Icn180L
         eHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729696456; x=1730301256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui/qUfg1xQvEs4poV0yePFVI+AQV5tMXrDDwu5usZGk=;
        b=jH2Ivkwu0LtJVuaQ7oWI+0rcjiRdDeUKE2gXmE1kqY2lMArl7s6Ej7VJapeiV4KuHw
         FXzeNgj2grvY+xakk1bS6QZ9B5pq5SPkDdkCqlnciVpZBG7rg7nk0dM35u399Lplrjgg
         lm2m79kIr94u/OAFyvz0zNxpH68dbaBvM9gS589LZGEA6OA+xloYJCTCNFP2oAPjNnFB
         Rfq3KE5Xr2qz3dl4j4UyYoe4wLV8Wq6TWnhP9DFy/eH/hbTBCcc8sD0iqrJdwU32VTZ8
         88Ly0kx5uMhXxEkntEKTW+ILdr8YJjpKYUNvqECB8XCDslsFkPMh0JK3MYzce4yKN1mA
         z+ew==
X-Forwarded-Encrypted: i=1; AJvYcCUyRwC3onaMYHr50K8DuNHbmZvAj3wW7f5XwZPIo50MGFsCz2jif2zMt4jvpQpZiQ6wTd2uEHYTReA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsh605NuBN0Ant+ptwT2HrES9tcKsey7lqMb0bzBVIDAOFsfp7
	sz7V8r1BIs0S+GNZCwQiI1pG/WSGqshnD6wc8nSoCInfA6NUhZddQf8Hxr936UY=
X-Google-Smtp-Source: AGHT+IGH3Tz8b6ezUqkhq2zKlpO4jHMpxUpFXfGKP54xqTzn91KpRuDEuG4r6k2IfsBRf2j9HGld5g==
X-Received: by 2002:a05:6000:d0b:b0:37d:32ba:ee76 with SMTP id ffacd0b85a97d-37efcfacfecmr1980789f8f.57.1729696455689;
        Wed, 23 Oct 2024 08:14:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9c6b0sm9093206f8f.109.2024.10.23.08.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 08:14:14 -0700 (PDT)
Date: Wed, 23 Oct 2024 18:14:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gax-c <zichenxie0106@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, nathan@kernel.org, linux-clk@vger.kernel.org,
	zzjas98@gmail.com, chenyuan0y@gmail.com
Subject: Re: [PATCH v3] clk: sophgo: avoid integer overflow in
 sg2042_pll_recalc_rate()
Message-ID: <ae8a068d-a1d8-46a6-a90f-baa31a7df7e5@stanley.mountain>
References: <20241023145146.13130-1-zichenxie0106@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023145146.13130-1-zichenxie0106@gmail.com>

On Wed, Oct 23, 2024 at 09:51:47AM -0500, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
> 
> This was found by a static analyzer.
> There may be a potential integer overflow issue in
> sg2042_pll_recalc_rate(). numerator is defined as u64 while
> parent_rate is defined as unsigned long and ctrl_table.fbdiv
> is defined as unsigned int. On 32-bit machine, the result of
> the calculation will be limited to "u32" without correct casting.
> Integer overflow may occur on high-performance systems.
> 
> Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Thanks so much.  Sorry for the extra round of re-writing the commit message.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

