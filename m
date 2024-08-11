Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54B311CAB
	for <linux-clk@vger.kernel.org>; Sun, 11 Aug 2024 20:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723407550; cv=none; b=REehD7BRPclYuGBzs880139b6f+aZdgfMefjJUe2qgTUbuFt/3WUAHE+dKChhvczoaWNA3gxYrtxPyGyFHtjB94llX1W9sAKJO0Evf66IiFUug4weNIRYDEP4WU+o4H39I0xN626isEeNdJcsTocCcJEBvbU1X6N4s0TkANLQcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723407550; c=relaxed/simple;
	bh=ePEwDMXK/sUVOgcQ2Ko0n94CLm/nKfdHBXqQPomFNYY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Xk9QYuhHtrk0WBEkzTDkLXb+n7c3mBAaiwhIlcuzXPfqyiIy+PnzPnQS6zy4P7IXmKVLUqzYS73ZjDKWYAfZPKeHHxNatdZGGRV7WvH19Pr2Noh5c56Iq8FMFQUDc9HHzcQxW7OitUdWnPS5FYteUF9Vk4OCFO9R/J47yiIgBsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=p5o4ArLH; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="p5o4ArLH"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1723407544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=avYIGd3Krb0jitE0JQR1G+BW2JvujW9lhAompcelzLs=;
	b=p5o4ArLHxxKBFW/W8tNRAOJPR0B+ur/ljeAawHHMVeD/RtlMla8BxDFhrA1rSuI2z4oMqM
	5IrJooETD3PintWwGjCi6WpaRs37je2iEXhjIbZ8vQWLntnQ78hKlNjQTppuRjH0K8IFgD
	4PpZ79UmRaNMgeldvgEDZsKUz9xYt6YMoLj67NxUd9O/3I/koSmhav5wh4h6ndfqtTNw/M
	561t8+7bFO4Np0D17DD71oBj9sqXR3FCyn+J2a7/auSHj0hnuIECQVMTz4kOmw6/cDAiS3
	Subyo6h5273SfmwrfWQ4fn32WEPJtE4RjPtiHGoIxvMFdfKsA7+iRpwCCiwGNw==
Date: Sun, 11 Aug 2024 22:19:04 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] clk: rockchip: clk-rk3588: Fix 32k clock name for
 pmu_24m_32k_100m_src_p
In-Reply-To: <b827ebfd49aeef3aaed9d35b7cc42555@manjaro.org>
References: <20240710165354.1338287-1-eagle.alexander923@gmail.com>
 <b827ebfd49aeef3aaed9d35b7cc42555@manjaro.org>
Message-ID: <300daf3be205f463922e277d63b73205@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Just a brief reminder about this patch...


On 2024-07-13 05:51, Dragan Simic wrote:
> Hello Alexander,
> 
> On 2024-07-10 18:53, Alexander Shiyan wrote:
>> The 32kHz input clock is named "xin32k" in the driver,
>> so the name "32k" appears to be a typo in this case. Lets fix this.
>> 
>> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> 
> Makes sense to me, and it seems to be a typo inherited from the
> downstream code, [1] which the base RK3588 dtsi confirms, [2] as
> well as the RK3588 Hardware Design Guide, version 1.0.
> 
> Thus, please include:
> 
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> 
> I'd also suggest that this patch receives a Fixes tag, and gets
> submitted for inclusion into stable kernels.  Thus:
> 
> Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the 
> RK3588")
> Cc: stable@vger.kernel.org
> 
> ... but you should actually submit the v2 with these tags, if you
> choose to agree with this suggestion.
> 
> Furthermore, it seems that the board dts for Radxa ROCK 5B needs
> some related fixes, because it deviates from the RK3588 EVB design,
> but I still need to dig deeper into that and actually do some
> testing to confirm it.  Perhaps that will apply to other similar
> RK3588-based boards as well.
> 
> [1] 
> https://raw.githubusercontent.com/rockchip-linux/kernel/develop-5.10/drivers/clk/rockchip/clk-rk3588.c
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi#n423
> 
>> ---
>>  drivers/clk/rockchip/clk-rk3588.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/clk/rockchip/clk-rk3588.c
>> b/drivers/clk/rockchip/clk-rk3588.c
>> index b30279a96dc8..3027379f2fdd 100644
>> --- a/drivers/clk/rockchip/clk-rk3588.c
>> +++ b/drivers/clk/rockchip/clk-rk3588.c
>> @@ -526,7 +526,7 @@ PNAME(pmu_200m_100m_p)			= { "clk_pmu1_200m_src",
>> "clk_pmu1_100m_src" };
>>  PNAME(pmu_300m_24m_p)			= { "clk_300m_src", "xin24m" };
>>  PNAME(pmu_400m_24m_p)			= { "clk_400m_src", "xin24m" };
>>  PNAME(pmu_100m_50m_24m_src_p)		= { "clk_pmu1_100m_src",
>> "clk_pmu1_50m_src", "xin24m" };
>> -PNAME(pmu_24m_32k_100m_src_p)		= { "xin24m", "32k", 
>> "clk_pmu1_100m_src" };
>> +PNAME(pmu_24m_32k_100m_src_p)		= { "xin24m", "xin32k", 
>> "clk_pmu1_100m_src" };
>>  PNAME(hclk_pmu1_root_p)			= { "clk_pmu1_200m_src",
>> "clk_pmu1_100m_src", "clk_pmu1_50m_src", "xin24m" };
>>  PNAME(hclk_pmu_cm0_root_p)		= { "clk_pmu1_400m_src",
>> "clk_pmu1_200m_src", "clk_pmu1_100m_src", "xin24m" };
>>  PNAME(mclk_pdm0_p)			= { "clk_pmu1_300m_src", "clk_pmu1_200m_src" };
