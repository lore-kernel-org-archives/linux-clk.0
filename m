Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FCD2D4B40
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987950; cv=none; b=SZpaEqqJ3O45l/y5+v7VeKhSnhW2xgRa//zzvVaZVhZXXujwxiXRrZqhs2/2UKMRP0xjIwlAtiv5ykxCTx4Ae1icknl4L1KwUz3PHJAwK+BoOuf02DKVGbb76Wbmwxr0cTSzjOto2OZ+2Mxv+UBO5RtKiH55WKwZgu10KALxZs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987950; c=relaxed/simple;
	bh=xyCI5IsABsyRN5E0PfGElo1mx1NfJv1InbwBvkHN9Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9dotfWIkns2cm1W41qli2p4gv7VrtOSBkMMLn+mskiglEPfAOM+fmyX0ffSRhwuQhNtWGffLJsMHmkBakE2In2p062n1Mvk915elW8Zx64cSZuEyHbtg53Slm/+l2kIbHd32RLVVlEGb1GLmpn/PSF2vfNpWI+P9EpS7ZkrXhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FwKR/Q3C; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FwKR/Q3C"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso35467015e9.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987947; x=1761592747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQYtr/7sEDmmMLc6ugUR4fjhLSuMYN4opd792ZFPWlQ=;
        b=FwKR/Q3CP5RGd1Z7vj5jjgmkUaBpwxNfU4MmE1xvam68CSaYHl8woKUv90oOd6m36S
         qtLruRUFNBSf7ey9ZqcxfV4/i05524Cz+n4JCZyq3b+igQihMdRtY6vjYWKQSzL+aGEs
         kahfdL3mklUUgCyRT72qOMuHiVJeDVcMvazhCQUHgzgF+bSboQLschzR8MNMHTiRCWVN
         B7g0FxjahimfJAbQk+gWru3qjO0GEN4pRsS6dNrS+EUuS+o4oBwH32WOkGdzNCMGx1vp
         5xPiOuVSf6amKPvg0P57Ok0xvjYdZI2LiXx0duDGxiZdk/EOQzm7awwVKN3a/zSorg+B
         qxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987947; x=1761592747;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQYtr/7sEDmmMLc6ugUR4fjhLSuMYN4opd792ZFPWlQ=;
        b=WQrXgrDavBVoCKrr0Ywt2UVsNEIm15dt9W6qb/CVtN56rb/adobrxrtcmpHmLEESzQ
         UZ4sr3/IjlSQyCFnsRFMefhqReczKPovLSOVDPy1ecB29KOOMu9aXmXNrCp2LLCQ7gdI
         jP6Aeh9g5UwX6q1qu4XCCOrJzGtDhXyLty0i9eheJHOMY+cLV8k9oylsMEc6opr9+jid
         77rer8G812Ihp1e9H0nqjvteg+54/4edd0DDtBYhtAcPDc/tqpE2mT/oMhrpJQ/IP7dM
         dmY/4DSnAYngq633RGnd8VEKKxg6Pu06gcrEHLp+xz4Iflul9SuVX/Rxrsts2F2e5DtN
         RppA==
X-Gm-Message-State: AOJu0Yxj4+GpYQ3ad9GWqD+X1T0QYWe1Oq1T/61NdI+jue5BINSk0Uqw
	OdbW4xRRIVnAFp0xPLbm1zS6iC3dk7LyClNW7DUZxZR6zkkfM2h19+v7qChyWlRPom4GO1TbiVw
	UGj6B
X-Gm-Gg: ASbGncsLKzuEOdyF81VUzJW9HXy0qOCFmvtYDIqQpw5brTY0XyX0Y5aXSLSXQbv3/3+
	Wc4M/72FHRTNaCLpv5385PO9r/3ML4BrwJfmFJxAnUWt7fbh8alYYu1zSPI4bGh4lAgRS72yz0k
	pzz5CBquSCfObTJ+wNf9Yt8hq3ljKsgMz72recR4ZXmwqO5UdbTqW/0W5Ujw6o7ak52qd+Y0VXL
	LWLWzdAoyM4MkkpYLBD+Zl5730H2+B4/kFdSZ46n4zhAibbmdSGHX31QrRCqRHaWiWfXk0YpLTz
	65DBOSMEBy6DgnkdNSom6eJSsU4dmpxOILeaOqy/kMIKXgmy2Dr9mxKIG2gNqk489u5W5dJD0bY
	hUMnw5y/JIuHEVF1VaX6C8UcDrVqwdUmRhWGIoFHNa4b8+x1S7nzoLFL8CWMUIJujjHPOmWRi6u
	/YPdvbZtIexTNrh18QZxg=
X-Google-Smtp-Source: AGHT+IFVCGpeA2+bow5Xc59mcHd54jCuOxCx/IBPo7BEfszluf4T2+SmNyRQJAdcjVO6TmsyG6PpVg==
X-Received: by 2002:a05:600c:4507:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4711787276dmr107545445e9.4.1760987947193;
        Mon, 20 Oct 2025 12:19:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0f7dsm16419723f8f.4.2025.10.20.12.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:19:06 -0700 (PDT)
Message-ID: <068736a0-a5ef-4905-b311-9376e8fcbc16@tuxon.dev>
Date: Mon, 20 Oct 2025 22:19:04 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/31] clk: at91: sama5d2: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <a2f7cce73739fc795d17710a3bb017158c090735.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a2f7cce73739fc795d17710a3bb017158c090735.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D2 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration

But only a small part of conversion uses parent_hw. Could you please
improve this description? Same for the other patches.

> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Adjust commit message.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sama5d2.c | 157 ++++++++++++++++++++-----------------
>  1 file changed, 85 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
> index f5d6c7a96cf2..231cec1f80e1 100644
> --- a/drivers/clk/at91/sama5d2.c
> +++ b/drivers/clk/at91/sama5d2.c
> @@ -37,9 +37,9 @@ static const struct clk_pcr_layout sama5d2_pcr_layout = {
>  	.pid_mask = GENMASK(6, 0),
>  };
>  
> -static const struct {
> +static struct {
>  	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>  	unsigned long flags;
>  	u8 id;
>  } sama5d2_systemck[] = {
> @@ -47,14 +47,14 @@ static const struct {
>  	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>  	 * to keep it enabled in case there is no Linux consumer for it.
>  	 */
> -	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
> -	{ .n = "uhpck", .p = "usbck",        .id = 6 },
> -	{ .n = "udpck", .p = "usbck",        .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",        .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",        .id = 9 },
> -	{ .n = "pck2",  .p = "prog2",        .id = 10 },
> -	{ .n = "iscck", .p = "masterck_div", .id = 18 },
> +	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "lcdck", .id = 3 },
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
> +	{ .n = "pck2",  .id = 10 },
> +	{ .n = "iscck", .id = 18 },
>  };
>  
>  static const struct {
> @@ -164,12 +164,12 @@ static const struct clk_programmable_layout sama5d2_programmable_layout = {
>  
>  static void __init sama5d2_pmc_setup(struct device_node *np)
>  {
> +	struct clk_hw *hw, *audio_fracck_hw, *usbck_hw, *main_rc_hw, *main_osc_hw;
> +	const char *slow_clk_name, *main_xtal_name;

Please specify in the commit description why did you changed the variable
names or keep them as before. Valid for the other patches in this series
where this pattern appears.

