Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A65B1ACDE0
	for <linux-clk@vger.kernel.org>; Mon,  9 Sep 2024 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725867624; cv=none; b=HTGQI9lBBikstoujlICcK/+fET5CLyfmCt5jL4WXm3yf0nAycm4tThT1jsS4dv6Ju9EqNIOAWgdGNfaylqEmx01xWN0IoNqX0t4lcXEcZlAxkE/arP/Dn73D6f7xe6qej8dXzFLBMNsiNkW+lj5PPtX8s/1xSifPjcA8Qaf4ZRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725867624; c=relaxed/simple;
	bh=cYz4PuhSNVrc+9Fq9A0L2xKgaLVQuJFXyFAuQyZ0fuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oFwdTvuK+3jAF/n48A8QDiikEPFSzXQ676TE+sOl2k/uDAlg8nzVM56I9kUQOpa0GqiRc8xgcOSUlwhJOEnGD5suInYD052l+OR6OoEsGZ7umjGyCCuEjZdytDUpkBos4GIJuwhpH3t/fbaiqg2YtSM6QPabN/lybZ/ftQk0K5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0Ozy5wPo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0Ozy5wPo"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cba8340beso988995e9.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Sep 2024 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725867620; x=1726472420; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wxk+0HV3ie5ca2PMas8a05vKnaU5pacSMpokYxPfcBg=;
        b=0Ozy5wPo2PJV9slXvxiuIzrsACtQb1A4SKebHusrRfmgvdAWBahWqfDxcMgZX9g+U2
         QOK/2Q2EbZ72xsAIB/fMMWcDOU0zZbUIzGOiVYE5BWVq0PBO6y3RIC5kArtpnKLxCfYB
         dZ4vEAWM9/2PrFalXL8eUefuouMP+5x6xju705LricNSNyGNtTjfcq80tr+YfVf3l7uf
         lbSs6P7u0sKJdiXVNiamkguSXXPxHwDBxTJBDSvXp4g/ICOb1sMzcNiqyVdCdYNvqIT+
         0IFnxrEgHgqj1Ci696NvPvIu0NHE5pHdMI9B4Cqs2YWb0NBS1r9Yb2eYXcr2I0ZHEg0l
         aikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725867621; x=1726472421;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wxk+0HV3ie5ca2PMas8a05vKnaU5pacSMpokYxPfcBg=;
        b=OyOht+GrOd2myWCLHSUgmM/kkZ5JFMUdFHpZ6OIOsTLJuCNM2CvmqwnjKnGhYLyVD6
         3q2PH17ufKdWq2/Ygk9rmrm1rwFaM2JenHDqW4MTCMyaowI8fxVpCGed1soAUh2OBSK/
         CfL5/FDwdcgTXnZC8isaoN6dw6Jbdr/HrSNcLmZoU05bc2eVu7DAXz2L15YLx501jUdo
         dnxRv+8tEBwKC5SchQrLskmOuSGsPQciD3DXNYAojlwkS2I++TfLTMQysh26nzTMMMdw
         T6l6DfsRzdO4Xc9843hAJaHvOZ871d5ibU2hH5lzZRt155NU/7rTBY+P11xTSdWsCo3n
         v2Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWKHEuRIvajSn1XwoXJcvDEQUh2BPaxfkTrjFDgCkBV8Mxs1yEoUAOgmOeljJCygApP0gmDj39gGNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZVd+Ht3PwyDwKfL73pdRaszfHCG5d/quw8H548Hp6AreODQXg
	ov0GOUIWQOFo1WUdhh8ynzhTPWBhyI03jBAQ1Qrx0vl7VitqHL2aaM859ObG72w=
X-Google-Smtp-Source: AGHT+IGLe1vcw8K+nWAka8XMIewFAvdqJjh2hBlCRr5j7xHSNC6LsISkBqOfC1/aAZ5SBH2fbxKxOg==
X-Received: by 2002:a05:600c:3b18:b0:42c:b697:a62c with SMTP id 5b1f17b1804b1-42cb697a7a6mr16044445e9.5.1725867619791;
        Mon, 09 Sep 2024 00:40:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:788a:4542:ae86:67f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8182dsm68716935e9.36.2024.09.09.00.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:40:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: meson: Support PLL with fixed fractional
 denominators
In-Reply-To: <46c55bd0-0076-4eaa-8b12-0e28f650e5bd@amlogic.com> (Chuan Liu's
	message of "Mon, 9 Sep 2024 09:55:16 +0800")
References: <20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com>
	<20240906-fix_clk-v2-1-7a3941eb2cdf@amlogic.com>
	<1jjzfpqb5a.fsf@starbuckisacylon.baylibre.com>
	<46c55bd0-0076-4eaa-8b12-0e28f650e5bd@amlogic.com>
Date: Mon, 09 Sep 2024 09:40:18 +0200
Message-ID: <1jmskhtgv1.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 09 Sep 2024 at 09:55, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Sorry, I don't quite understand this one. Is it because you suggest keeping
>
> "(1 << pll->frac_max)" here, followed by "if" to determine whether to assign
>
> "pll->frac_max"?
>
>
> "unlikely" is used here. My idea is that it will be possible to determine
> the value
>
> of "frac_max" at compile time, which will result in one less "if" judgment
> and
>
> slightly improve drive performance.

I'll rephrase.

Please drop the 'unlikely()' call.

You may add that :
 * in a separate change
 * if you really really wish to
 * if you provide profiling numbers for the different supported
   platforms and PLLs, not just the one targeted by this patchset.

