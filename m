Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020011F4C8C
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 00:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775695325; cv=none; b=CUj1cBtWaz1daIVPuL1FO6I7Vb1kQJz/b2ZQ0trEq8o4zcLSaaDqEOG91rKX0LVBa3oRowZhxpzZnNtNJnRhaJbJih6HFTkCue5pTBcD15/rKdQ4EkqYqyOY1uy5YW2EiqRYWYc9BDPscjRVTDQ0+fQHN7vU5VdaT9dOS3dDtv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775695325; c=relaxed/simple;
	bh=I8+D2rIPYlmBL8Vtp9AQuj++1M4cYDSlEqpsNTwvx5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAMJ/kjNfMBoi25ePOULGjlSwfcBtlawJt13QIsEE7JrkFwr1BCSvgkMH7vWzQFvwVzKQjsR2FuOptetZlqyNKk2j3FW89sXoPj3ykYcikDMNFh+tERu2kneBKRDKI7f68tdv9VnLIhOO5VubcJfYCODS2oD8HR519Af310gMTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BJrdtkpA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYHSRnkp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BJrdtkpA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYHSRnkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775695323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t4QXOBa/UPZ9Yv/mDvjcaoQFWTAL3SoG9ObyNB8G5Q0=;
	b=BJrdtkpAGsRACgTrEWMWZwUOmvzKdwCi6DPoIE7u1Y0U5nESU0f9nLe/23Z2UKAe8V3yC8
	aY8rNc5T4AvOkbvTmaz227o2iSF7gvBCTdtv9BZSPVjxz7pHV3sG392hyom3sKhM2xLtkd
	SgzNf5xud0bAnS91/1y8uTZpspdM/VM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-mxAAGiHGNTayRaF1JaMnkA-1; Wed, 08 Apr 2026 20:41:59 -0400
X-MC-Unique: mxAAGiHGNTayRaF1JaMnkA-1
X-Mimecast-MFC-AGG-ID: mxAAGiHGNTayRaF1JaMnkA_1775695319
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso17943751cf.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 17:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775695319; x=1776300119; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4QXOBa/UPZ9Yv/mDvjcaoQFWTAL3SoG9ObyNB8G5Q0=;
        b=KYHSRnkpiMUsLlxHaqpbS23w8JDN/UmxRar2cvbLbFI+rIuO1mU/LXEGRTX+mlyLuQ
         e5/ipAV0Thpdhv4B9DHqjFjbt8PawMvTvIF4Nx0RRwz9O6xfSNZTTDEa9YCaPzbqvlV8
         FN9spV+Uibc+6zhH47llqgTmUHnRgnzyQt9SoPvNi07m0PIbK/c/AO/DBovg9uS0Ev25
         DHXoHQalP3bENkpqS+B9VhNBi3JJFLZfXtTjKoQIHe3Ogh6IjHXJwsCboPJyea/u7PrG
         qtTPL4Z+0UT2M64IONi8VUADiIYk+EBL/7tadfQaxHR09PrXLBDsK69skFdUTq8VAur7
         mrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775695319; x=1776300119;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t4QXOBa/UPZ9Yv/mDvjcaoQFWTAL3SoG9ObyNB8G5Q0=;
        b=Hko5ZJrhpp43laB0uPPQC294Rz7isDStHmzgG/xYQ/gDr1I2t5glpu9w2OmPf+zcNq
         EiHdSwlRlYbMHOBJQ0hIMy0AUAsikbqt+/Zb9jdFijH1iFDYLiDOnsVke9q7UIUg1jbE
         dBiJj2CF4o9wpPNtwkHxZpScSbM4cBdsX7vGL3O8wI7Q6ZM6Ne2nSo6Kac5cWjyKdR0f
         ysErDHcG7U2VGg7Gpoumq8+Z3RazF1O/1/ApRX9hvMnTisFznlB8H2r6No+9keQRh1v8
         yZZnfIu+NqEoR4MeBX6W4KW3kZhwwq4aZ3Fz22XHUu3NnT8CoNeiL6+n6uklMcNpbMEw
         Hprw==
X-Gm-Message-State: AOJu0YyECdsPM57oqubOCrzgcIDAXfuGMyXgXJVIhNwjc8y0NS3VmbbX
	KypY6YhKD9NYJHmSvnsFkgQmombj6SwdaTsIRICXx/aUeoiV2U9PiALOMNSuzcT63drSgDfQv5w
	zlvM/CzUIQRhmlYpg3qDjYPw2AJkL00gJXTz9mpTtMJJ/gMoj4VqGunAsK47CHw==
X-Gm-Gg: AeBDiesBHGfQaXH8frSZF2F2kLX/htsPVf/Vp7UTjeIuUmj0aJmx4HzBzzeeGlFCh7q
	axKveqywEW0///Qy4Pa1eNGfGt4r9waxHRu0QCfR17l02jWhNozZ3r5xqOFQJbMlBhWBxEKNG7P
	gCBKkfn+eJE3R8duu7Hu43Dex/1oU/WC2IO9ABziY1ntLpeOVnxWbWyd42K5CyGxPS8YeAP6z45
	xn6MacYy/lVJ5GxR224EX2H03RFMAn7d5dZ87YP+IfXSBlcHhjj7SXb08YF4HlM6SR47nCwsoNg
	Sp4pL9nx/QhLJAX8efEGx8fY17OPCu2UyupnIdvJUg/u432hCzTcYoEBv4zAWoQpQJdMdkXqga7
	O3f5LML7bDgANrczVLeUJ78KR/PSWHpUCrbENHFsQtv1i59lOlWF+kvcE
X-Received: by 2002:a05:622a:5c07:b0:50d:84e4:e1f6 with SMTP id d75a77b69052e-50dc228af69mr23516791cf.33.1775695319032;
        Wed, 08 Apr 2026 17:41:59 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:50d:84e4:e1f6 with SMTP id d75a77b69052e-50dc228af69mr23516491cf.33.1775695318605;
        Wed, 08 Apr 2026 17:41:58 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50dac753208sm39931121cf.20.2026.04.08.17.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 17:41:57 -0700 (PDT)
Date: Wed, 8 Apr 2026 20:41:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] clk: fsl-sai: Add MCLK generation support
Message-ID: <adb10qFASiVL-xKC@redhat.com>
References: <20260409002952.319668-1-marex@nabladev.com>
 <20260409002952.319668-6-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409002952.319668-6-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Thu, Apr 09, 2026 at 02:29:06AM +0200, Marek Vasut wrote:
> The driver currently supports generating BCLK. There are systems which
> require generation of MCLK instead. Register new MCLK clock and handle
> clock-cells = <1> to differentiate between BCLK and MCLK. In case of a
> legacy system with clock-cells = <0>, the driver behaves as before, i.e.
> always returns BCLK.
> 
> Note that it is not possible re-use the current SAI audio driver to
> generate MCLK and correctly enable and disable the MCLK.
> 
> If SAI (audio driver) is used to control the MCLK enablement, then MCLK
> clock is not always enabled, and it is not necessarily enabled when the
> codec may need the clock to be enabled. There is also no way for the
> codec node to specify phandle to clock provider in DT, because the SAI
> (audio driver) is not clock provider.
> 
> If SAI (clock driver) is used to control the MCLK enablement, then MCLK
> clock is enabled when the codec needs the clock enabled, because the
> codec is the clock consumer and the SAI (clock driver) is the clock
> provider, and the codec driver can request the clock to be enabled when
> needed. There is also the usual phandle to clock provider in DT, because
> the SAI (clock driver) is clock provider.
> 
> Acked-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

