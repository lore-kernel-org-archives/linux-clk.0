Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D99F330304
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989310; cv=none; b=EwnjI8GDW/8xSIeUnV0G1WtBF5J+1YLlx2Tv6n8ci0SuLGdn1WnObptyusExnTylUsh97uZcrQ56OS7POxNPKWG83ozdXj3k9dTVEBuoas5OZ2WPfWZsaXu74AdwlOJhvlYo0AAx1EIB8GKVJLjzCn99+RV5FmN8RUmRdGYsE+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989310; c=relaxed/simple;
	bh=uQSzjldxRTZ35ORML6b3Cd4RgGLVmAPkW+5ZxaJHB28=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fp4SmONSkB14q6mWheQ3lvxAgGZi/KcLTWO+mbrKkfmZyrZxIWEWQa0ZZSNGNT8qP8SD30wD5dezEBJCxzBx06Dg7hSYcC4uOLrytBPAseuXmoMpycmm2tGNy1PTcBWWTMH9Nh448LybGjk+hNuPJNlRcRC1DiU49GFOYD4Q7Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=f38f3xHA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="f38f3xHA"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c4b5a1b70so5260703a12.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989306; x=1761594106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S+3slhELo00fMq3w//kko/evMNTGZF1TLZtlTKBnvEc=;
        b=f38f3xHAdE+ycTYIPZX40GnfoIm4Kvx3pCaNBHweC0BH1cqw7K5HswGsRf9vqYrqnZ
         wRdyVjB8ptllWQqgH3ZNwGVHM9GiUKYuF7icRp5JW/T6Nej9tp8uuRSfM/MKf8cn9H75
         qhKS6XAlSQuf28XqSp4cWNI/XzEbj5fL9D/rrgtZ/IDhYlaj79XO6qUUUhl/2boLScMS
         d0QZfGqR2ZaX5mMr5Ol4gRVN0Tmp1X7XBiJwmyeW41sHT6OSwqGZKAbe7k7EBP4PVswg
         eLypgtM+ECJ91S+6j8u75cmVNz4gnE8YrendcQOis7ABOqXQxKEYWZ4AKFDDfqK3P+Cu
         AS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989306; x=1761594106;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+3slhELo00fMq3w//kko/evMNTGZF1TLZtlTKBnvEc=;
        b=JW9Q0G68K9OJQHlXfRt6kRwOjRkrQ1uHdxKUcGCHZsrYlT56WR7HiocCNSntgUVuwE
         N3dNefmu34vuvn/Ww87omOYGj5QH2CzXATqU/NWSpn3yQ/hQF2lTWlqJNHQHuGH4LYNu
         JquAsEVt/GNfCCkjgQm//WCpPlme6A4efBgrNUIr0E6DSoJrPB0JvBGKTT3R+K4Wtbv/
         GGQkafxt9mhjRFx6IYZ52f2QQdphXT5x3i6ivgG06Eo7L4e0Te/5hZbUFrPKpoh5KYSr
         kJoIgsmDAsp9HOH4HJ7ptkTCW823wOjsojAJIfWPYD42mhK/Az68WxmCQMCCBMqzRP0t
         5M8A==
X-Gm-Message-State: AOJu0Yx1cZLAp/+J5QGOZxiA6Seref2bDd+hAYrAP1LUKXqyubK/XYou
	NVkimFiWm5cbFlkvuYCC1oWabBrgkyxUjnSRMa0n5m4no9XhuRVUC6i041Xo40RjMmU=
X-Gm-Gg: ASbGncsAs1mj0wzqJVLX6yvRQJcnlAeF5hDAYtxd99S4CAZ0NRbctwVURicD5kvnDV3
	M/ecMYA63ye63SPle7hOM6SZ2GZ3iJpakWdhYb/fnLXl+g2Yxn+KtQileM2YiZvcTuflyot0VwY
	TZd0iSJsp+msvLx8C67E+81nZGmxEsfiEjC7aosevM1PxRLjv1ItY9OPrBBQKRP3TDvUxLPFGOU
	79srUYKlD299Y03ZdS1EhMFmkEL0ymj4JilCWWxalAekvjI7HxpIlN40UAPOoMKyonvOoYxh5Rj
	TNm3VMQUPQ1PS0mFLkQ2W00FTn87pMdQRQ3Cjc8lAxTR9LFPBQsaq51RcTWzRjh72iaFMdAmZaN
	CVYChVRvY/C1Gjm0DSjBMS04vC8iISSx3Tqhv7Uic2YYzV2EPMX+Ieqnbxlmbsadnq0qN4ZZ9/6
	Hx7fAgNuYl
X-Google-Smtp-Source: AGHT+IHDIxoLORK8TXA5ZD6/WsOqHWJqq7Eq+n+YHr0BJm7nwggP3jvxI5a/xsatvpj+kR59rawzjQ==
X-Received: by 2002:a05:6402:4306:b0:628:b619:49bd with SMTP id 4fb4d7f45d1cf-63c1f6cea4amr12864517a12.25.1760989305960;
        Mon, 20 Oct 2025 12:41:45 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c49430145sm7409668a12.19.2025.10.20.12.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:41:44 -0700 (PDT)
Message-ID: <5650e47d-97ab-49a3-8342-7aad9daa5a1c@tuxon.dev>
Date: Mon, 20 Oct 2025 22:41:43 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 05/31] clk: at91: clk-peripheral: switch to
 clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <b0635913503630a8e1880b0b9ba8656465020181.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <b0635913503630a8e1880b0b9ba8656465020181.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of parent_hw for peripheral clocks.

Could you please explain also why as done in other patches?

The rest looks good to me.

Thank you,
Claudiu
