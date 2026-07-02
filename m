Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025E2383C67
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 19:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020272; cv=none; b=GO1xBfq+YoY3jfkVqJMzzhI8Xrp5CmUagcHeI/lPoslgmpzo6glFQbKR+oq8TdjZmYb7j+Yxyb+EW1KMHSZblfEakGDx2eX6Zpaf248QH0vtTL+2iBA7whK4ZkhXE1UxMLtXQtjO91nNIZJZbW8ubEORc9Snfque0QR/gu7UZU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020272; c=relaxed/simple;
	bh=STqErUIB6lQ1GSgE/uIqGk2C0fbKhYjGQq1Fu1HrLJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbwcXWinZfxm2NxtxvPK4c8pYOQDxKpMmQEW8021u2tQDUAvrOHShgX+lnaXDoJv4ny4FVhyR1PafPB1Inum2wNhg9aYL1HE1ndaVjjQ5gWwW57EAq2QUQr/RaDWp+8rkKMReHTnCUIUF7/YZnHB16Rb++bGzo6u8GXXShkPx28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZGkYXrk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZGkYXrk"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso9645975e9.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 12:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020269; x=1783625069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1iJoqMShC+TvOCSI7HOO+Cah5rIfKqS+yxnlq3esHG0=;
        b=eZGkYXrkdy5dByHa3w+pYBeGU9pXw0FMVms6cyobrSNyaOWCdB9UYVUvlGqej5cF6b
         Jn5jejXXkLeQXDt3X16Q3xruUfSy9oxTktyrdDYDjEYxlOOWFaZr+ZwINAFfAzWTjH+Z
         M+Pk8UFMUvHX7t6IVOQf7DM9J0BXnRhxifIfWKFcx0OSdMR5bSKaTrSGwQHQ39pZ/diD
         M5UX0ylnoNLkZgv5sZoLNw+TRq+FL210lZuK1ul5bBIb3hGebwxzabyeYu96qW7RmPXy
         Mqhn+6Ifp7Okgavgvu6dhayQiBb6gKgdOSyxWta/65INXPazYUFvEX5zFgY/H/nlIr8R
         rUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020269; x=1783625069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iJoqMShC+TvOCSI7HOO+Cah5rIfKqS+yxnlq3esHG0=;
        b=jEdLDpkoHBenupAY10UZ4rSIxngEcBDuLikG8gZlKQkWWPHN4EgJSwOhg692oEvuM3
         M7ymOLIfP4H52eYlMFHkHfnkFzH7wtwwR8JU7Soh25kiPaiTNK5pWA3/Wx4wiU/WPzwW
         bWYMoHyY6mGZp8uETsrvSuEIzBwSombW5HG80B9OpzVHN30aFoWncdxEEaYrAX10tmD5
         yN9UT+wpFFCnQulp//SkQRBCcfb0s2t4ifMQ5PQwDJCsW44RBIvUCFYkkaAjiuTyXQVZ
         PkCS6UFPXc4mFHAU7ZHmtbUMC/sQketV1MIJ+2JoEtoxfsa0DmLnD0GfVz6B8I94yTmB
         xC3g==
X-Gm-Message-State: AOJu0YyWk9JbwfgYoLVt6ZMfZjckY5NiEc7GLWsKcRHMZkj8rxKpFnDX
	7av92qvSNKSbd9wYXr0Gz2ogRq++reySKDCC2hXHYzscfHMPHGyJBFiT
X-Gm-Gg: AfdE7clQVv5LWdC2NZPyIWDgyiRlAb4De1h/0096okS+jptE1L3TbrtogOXt6rubgbZ
	S6poAiaIXAbOrAJ0FAqfKFlksv7UqHoj+HSBMCo1PxbJ5l3buiuaDZk/089jlw4/LET33je619J
	aTHSHHq+SLr+dUqAyCn+H2NJlk4RNPntSolxe/qOLWzbveYs828f9sGOdFppDCXwijoTsu/hXDp
	6R4L+XDwzYzkF+UICBGl/A8fT8P0Bml8i2yt2mxG3t44NvW27oljMSitEaamkNHnU7ccKfI2nr1
	z/dmj2ATv2CBM1W/rEoHw5qE3FwH5FDD9c+yx6l3FhhEu43kcK7NhZwJc9NS1ljeIF+aG78eBK7
	rE7/kUzLuxk63HT718UK2wyckwg9Q98KLeyu/H0UpK0xC+D4DbDCKhBGuw2gbZy0dpp0BRnBCeF
	r7MJRmGvsvG3J2G6B0V1of1i4EKaHMyX3Mv7mHn1jSg9JetDsdgAyimoMYw900aUY2NzRipjEUM
	+0IT7NM
X-Received: by 2002:a05:600d:8649:10b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-493c2b905d3mr87929245e9.24.1783020269382;
        Thu, 02 Jul 2026 12:24:29 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6381e4fsm82751675e9.8.2026.07.02.12.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 12:24:28 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2723c6d5-7a3e-436b-9ac2-12e5b0a3d1c5@gmail.com>
Date: Thu, 2 Jul 2026 20:24:27 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] clk: cs2600: Add KUnit test for CS2600 driver
To: Richard Fitzgerald <rf@opensource.cirrus.com>, mturquette@baylibre.com,
 sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260630155549.824059-1-rf@opensource.cirrus.com>
 <20260630155549.824059-4-rf@opensource.cirrus.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260630155549.824059-4-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On 6/30/26 16:55, Richard Fitzgerald wrote:
> +++ b/drivers/clk/cirrus/Kconfig
> @@ -8,3 +8,16 @@ config COMMON_CLK_CS2600
>  	help
>  	  If you say yes here you get support for the CS2600 clock synthesizer
>  	  and multiplier.
> +
> +config COMMON_CLK_CS2600_KUNIT_TEST
> +	tristate "KUnit test for CS2600 clock driver" if !KUNIT_ALL_TESTS
> +	depends on COMMON_CLK_CS2600
> +	depends on KUNIT
> +	depends on REGULATOR
> +	depends on REGULATOR_FIXED_VOLTAGE
> +	default KUNIT_ALL_TESTS
> +	help
> +		Build the KUnit tests for the Cirrus Logic CS2600
> +		clock driver.
> +
> +		If unsure say N.

Could you format your kconfig help text with a tab + 2 spaces, as the
kconfig documentation shows in its example?

In fact, your previous patch in this series (adding COMMON_CLK_CS2600)
formatted it correctly.

- Julian Braha
