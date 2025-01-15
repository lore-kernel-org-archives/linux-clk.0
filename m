Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0F61EEA37
	for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736940549; cv=none; b=lNZN2HVeBVJG+c/3w83dVyDayG2MBitDlUPqu/w+RSv0b5fBo64eKWHbTj2uhFI90/n2aDvt5OnQxs4s4Cd4NX1SxHb69ZJ6Mksg6ALw2vxBBQn3poeGJss6+amKHHDCxWLNVlvAsIbBGVJ1d5uvMTakSHPIbTXEexfrZF119fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736940549; c=relaxed/simple;
	bh=uTFP6ZpMn/k1zzIlbPVQLLkt/cLEj8+uvjfAYF6d4HQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLCdBSQFDVNC3KN7woNn7A5ZgtBenFWU6LOzu4bKUjeiKXCpcvtg5gyHkCGeJE8dWNg9k3+Y9H1R1BbE2baVhStBQHUklmhanRXj+PxFhYFuB+deoyPa+99VWgCI2O7fpJk0fakeQThW8KKZESMRDUfJJJ6EvgWacPcOlfLSsX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VlRCjJP7; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VlRCjJP7"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so48539471fa.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 03:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736940544; x=1737545344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTFP6ZpMn/k1zzIlbPVQLLkt/cLEj8+uvjfAYF6d4HQ=;
        b=VlRCjJP7fUdJ1b1RHZIHJVQQ5sMGo2mHOqezrlA5olORew8MnpueNO2FsdKEzL0sL9
         udx0HDelxHymBYR3bNaUTCjlw+pLxxEu+qpiqe7AA2xdSVsBGLAKqlO0z8b8Hfp8scf2
         KS+TCmX8bUWN8cxkM5JRACZGvs/8C2IRJcqgRQVRXr4JK4M8kHCg5ynoEKZgB+lSFVC8
         gu3kqbrJVCxhn3w9ZklF1wJVpKerR7xjnzxCn4LBld/Jtujmb5jU/OuJD773yYOpvZDV
         IkYSFDtVaYyC3oBNJnKPt7CVYaG4Jw3LEdUl7AS90+Yl20+nuHPcl78gSwb7Kg5NP3U4
         Y85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940544; x=1737545344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTFP6ZpMn/k1zzIlbPVQLLkt/cLEj8+uvjfAYF6d4HQ=;
        b=hgQ3Gn6TUtHw6Hd0F/oMA53a8kwd7hQnZhNRm+vebtSxFAGVnzdRLD8/f4AhmCyBBY
         Nn7B+IF2NntJ0XIJOaRl+EfX4i9T/86tI70mYxy+g6b5SHBoyVjeui/Jfz10S1RaYdAq
         Zxw8jB6k6NneN8X/cezkViVHY45hlHaqUNvRWXQz71w98cbSvaMb68RAvWBV4Edhni8C
         NGdQgGlgIXBd/hV01s58SVM3o2OcGT2QoID125xzYt/SipHBihV+9xwFG0mA7cFOMMMH
         i2Vaq1xyWO2QSjIQl15UnEhCA46zqSF42WzVit9SdgUkSo8eoAkgEq/SfVTZPgAmK7a4
         eWNw==
X-Forwarded-Encrypted: i=1; AJvYcCUQuo9aBn6Q/jzrtFjc21DAAlv97PjqViYTcFtppfMlIAPJS2XaX4Yw1Vl2iQNphQ31wtdrLLDMOSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAykwOdnVF19pgrndIxtIguO8G1M0f1OV0ReGxMKKTJnxPBDS5
	0Yg7tAyC2mF73XrSGU6Wa5Dxdw+3beKyYfzpsjsC69JJPAOmrquSQUpY8Vdc7KxxEGoK9ZHVKBl
	tMR/BoUCYqXgUmroR9qVAS6+yKtzmkymi4l0G9Q==
X-Gm-Gg: ASbGncs5gv8iaV+xpbTf/SLLUqk4fyo5/yML/GSu7wpA+pBCFkPHLrgyBtHrGkwypPE
	9Hu5M2TeTAN5jEa0vAQd4us+8O7jta9z0x0/JEA==
X-Google-Smtp-Source: AGHT+IGozXlEMI3LBw/qY3E+yx+y/orU2yG5EeAWz02nrW7RaGJmBfZlWUTPktBH/YT5OusvKQ2aNuo9qsZVZYVAgKY=
X-Received: by 2002:a05:651c:4cb:b0:2fb:8c9a:fe3f with SMTP id
 38308e7fff4ca-305f459ab0amr99799851fa.22.1736940544130; Wed, 15 Jan 2025
 03:29:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115081914.12841-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250115081914.12841-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:28:52 +0100
X-Gm-Features: AbW1kvauKuAE65tppT9sI3Z5Re3aLNOVxZNOfHCRFI6_U39r95LgRscj7MPl27o
Message-ID: <CACRpkdacgLmfusCtN=beYoL=pM7_f7VzHa6pzRbmAdYoYPA7hQ@mail.gmail.com>
Subject: Re: [PATCH] clk: nomadik: Correct str_enabled_disabled() SXTALO case
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanislav Jakubek <stano.jakubek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 9:19=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Commit 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers") should
> use reversed check for SXTALO.
>
> Reported-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> Closes: https://lore.kernel.org/all/Z4diEj__bbQl4ULS@standask-GA-A55M-S2H=
P/
> Fixes: 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks a lot for fixing up this Krzysztof!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
