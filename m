Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167FA3659F9
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226267; cv=none; b=kOuiLeutvtz+w+j/vGk/FCRqTCo5xHV/Tf2KQy8m2udB8StnsT2OFDdiIq0XxXltl8DrK6oNhmSJJk8iHuFfGpLfS4L1cOcoanlTOYBtiHfJZIg+oElA56gEUv5sV8FxnjsaqSSt6ZEyXuHxjKBrB69NxzgUKKFM+APp+QKuvkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226267; c=relaxed/simple;
	bh=eVgHeuwAxDo107i2h93QiyvEQnWyp80tDUZrKHlL3Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDsP4HyELscveyb3HACCasQ3uVlte36undw9Py1QPpZyQxW8IjR4ueWkqq+ExiG2sqtmJ8VXdL0ZyXhRkLf0A+kVN5WtlFE1l5lYGZEoF5PDbEhMJHpqdflERxVp6kIlm9Ai4/7HuINP0ERZN5fUzHqQBi/o3MSXVw7EnTLYkvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IoNiVBs5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SU8YZPcE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IoNiVBs5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SU8YZPcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782226265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ixx8Yxxc0VAT2OZlQB8fabZqagj30Du+vDef1Z22MAk=;
	b=IoNiVBs5lCmWtFd7qZuqNLhivjJyT9pcNzRfHxTIo1Jq//r9G/AYI4quREBlVf23+duvfE
	eJKrIVzvs6NyYK/wZa+dYhaqnneaZpeE4Zzp6TdtWuPyQ5WBYKhu0RB1RT6Etd7NoGF7ZB
	GVNPdpcmsOxN4r+g59YDpber2j+qu10=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-cF2BWVLSNnCLwS-JfLXuVg-1; Tue, 23 Jun 2026 10:51:03 -0400
X-MC-Unique: cF2BWVLSNnCLwS-JfLXuVg-1
X-Mimecast-MFC-AGG-ID: cF2BWVLSNnCLwS-JfLXuVg_1782226262
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9205e6b0bcaso725564085a.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782226262; x=1782831062; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixx8Yxxc0VAT2OZlQB8fabZqagj30Du+vDef1Z22MAk=;
        b=SU8YZPcEj9mDPa1hh1CgVAMdE4AB6mP9Gumy0FBPTrL28SX3jzuybDCiJfMag22Euu
         3irrmNg7wWtpdljCa6VlC9nByTVirYApFbLBkmxSGhA6+EdidtAemFHfhVNiAfpYBiYb
         uLsl74P78OaaVddVoCRrCXgt4m8bGjftloUqWJBsI4rH2s6hkC5nTmHSojyXiTP6OeX5
         3RIKtP+a6M4NfaLirMMES4qI/QKQgHpD3BFiyZhUYR9J5M1N/aF8o7/NZtJJbCz6p0aq
         Vyaow5lnaRSG4j14EgulOzDscxbeSGOK7Hd6I8ETLm2no3sckzDYfjjB9v6xPxpFVCZl
         Xc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226262; x=1782831062;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ixx8Yxxc0VAT2OZlQB8fabZqagj30Du+vDef1Z22MAk=;
        b=caDNsi3NpB2r7zEZko6xDPHE2wFXxumf0XVS5mwSvZzi5JvJVZz0K6ZMYecdFTzfbN
         ORuKPh2fEkxz+kFRKl5ZfhFPG/SuiA/PLwhm7O2cRe8q1BfqIjb8+fGQy3oUuTiBxITL
         vna0ABvNwJtSEbvEbmb/5VJpcjM+9hdU7jfPWaOKeXpAX8YEsc8wbRtrPvccfgeVNzH2
         6aHID3CFb6+/fxKOMUCeWdntCkBpIiTMbFQ2vAuzzn4wa4yOmbVD16Aux3kaVY7TwIan
         tjcreIv0jBBTVy5YFC9OZ4Zi8Pc1uIdcJk31o2jOPd0ANJAQhbX1CYveqpwJ1Poid0KZ
         pGMg==
X-Forwarded-Encrypted: i=1; AFNElJ8jFZ+Sb4eoi7f69JapwRkpuKsgueA6+0nSXAfJ7/kRLncg6uLCIiCy0etnU0OtXTV+hChUk+jdRrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGKprhlGVGwAkopjAfQ+7f09c+zNWQHdplyFsYwO/ux10/flB0
	tXLMVONroC/IWk7lMu6Ktfv1kx0o7t2UZSO4TtKhw2TpVkfcvIr7TTaRhsT+y6tvhE2W08cpSbx
	lsFJZqU1wGSkQ4xVhkOkrPs/pwPMeJ/jMnnYIImbr1DT+WvYNVDjsF74Te6+pnuC0H55ojA==
X-Gm-Gg: AfdE7cmchmZec0Cb4XjqYz6bLjGMuZEs+8i7YUY/Xzgfsbs8gIu+NUyxErQipmdX2oX
	vcKQeI08YKOqqj3WmrWzv3GnJbK4CCggIcOeBOmlLVFZJsulfTk513W9FqcOXtBLQ+kFNAyw1JW
	TiL7WlhnoARGrzn4CtEpvEPapoGqkbgsQubRN868F8QZEU1xIZujgQ8ORdkYLr+0P3XaxV/uNvg
	EkzumZr60zERjLY8kngC7dPdfp9OidJWr2trIgn8PNS2WkQNLfEHkPQMZCzl8GwO6p88yMJrXV6
	uUTis3dE/z4cqVg2xdtF7sPRNrUU0hqRFMWvSGT9BtSnhPS4u9F3M82dmYVcVKSbYjMu3dLh3M3
	jOu3x1byqdh38o5RXuF4ning5aRu8jW4sU9+GI7zjyGcDiw==
X-Received: by 2002:a05:620a:2a10:b0:916:12ea:1e13 with SMTP id af79cd13be357-92668c9d013mr437006385a.34.1782226262432;
        Tue, 23 Jun 2026 07:51:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2a10:b0:916:12ea:1e13 with SMTP id af79cd13be357-92668c9d013mr437001185a.34.1782226261884;
        Tue, 23 Jun 2026 07:51:01 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926000c3257sm297210485a.29.2026.06.23.07.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:51:00 -0700 (PDT)
Date: Tue, 23 Jun 2026 10:50:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: si5351: fail prepare when PLL reset times out
Message-ID: <ajqdU4mYssgBx0K7@redhat.com>
References: <20260623135625.49610-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623135625.49610-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Pengpeng,

Thanks for the patch.

On Tue, Jun 23, 2026 at 09:56:25PM +0800, Pengpeng Hou wrote:
> si5351_clkout_prepare() clears the output powerdown bit and, when
> requested, resets the parent PLL before enabling the output. The PLL
> reset helper logs when the reset bit does not clear, but returns void,
> so prepare still enables the output and reports success.
> 
> Make the reset helper return the poll error and propagate it from
> .prepare. If the reset fails, restore the output powerdown bit before
> returning the error.
> 
> Fixes: 5142cbcea324 ("clk: si5351: Wait for bit clear after PLL reset")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/clk/clk-si5351.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index e755db545..4e60261da 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -907,18 +907,18 @@ static int _si5351_clkout_set_disable_state(
>  	return 0;
>  }
>  
> -static void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
> +static int _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
>  {
>  	u8 val = si5351_reg_read(drvdata, SI5351_CLK0_CTRL + num);
>  	u8 mask = val & SI5351_CLK_PLL_SELECT ? SI5351_PLL_RESET_B :
> -						       SI5351_PLL_RESET_A;
> +							       SI5351_PLL_RESET_A;

Whitespace change can be dropped.

With this fixed in a new version, feel free to add:

Reviewed-by: Brian Masney <bmasney@redhat.com>

