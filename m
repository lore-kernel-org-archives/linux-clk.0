Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7881330CD95
	for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756399736; cv=none; b=PmDWTh0DYOurnXONyswpk3zI6uvijw/x6c3ANcI/6LhTfGfSaFvHN1AaOTRloF+mvOq8HWwxDG5d3GJNqSTCBWBECjEJqkY8bmFut5BvPL2gtvU5GBsCvIWRniyf5bCGM6T/r+4JiIE9EJ0sZ+kPEsRMzr3F8kHU7KMx/vtNNic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756399736; c=relaxed/simple;
	bh=cxxGqqht0UDsRw/LgBdx8Bu/jntVwIkDP9B8rSEkLOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3y9DWaI/7oMfI3a/x2Lqw2nCA+8bbJqA4/REv/1zycu5tjydUlJ+ecpxOZsEVcAzSFBYabJkNkqnhus5+WdSbH+HBUs9iKCWxFBeXi8WRTruYWOKFxVOoCY5FPx961/g9MFrVO4ARR52Jl9LEhsr/IvUIf9x5eM49cu5m8YcLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eXlh38uh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eXlh38uh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756399734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91Z3nV2xDDPr0AIVq0M2gFIJkrVUpCIj8oRRwM3WbMg=;
	b=eXlh38uhPT38fdRhYMIVNB5AFCzdWebzHrCkGDv3ziAWf0OOzL0rPthrgBCE8cpz37woTl
	H4gTzrWi8DSViORZPflVTYnqogo3c+jWNQblEIf7gToOu/aErhpFATRdLNGYSAsyvio/K1
	oipnSw05c9E8an77HevvDlPznRVLIZY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-MqW9TWrqMgKyBOk9CfqvVw-1; Thu, 28 Aug 2025 12:48:53 -0400
X-MC-Unique: MqW9TWrqMgKyBOk9CfqvVw-1
X-Mimecast-MFC-AGG-ID: MqW9TWrqMgKyBOk9CfqvVw_1756399732
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7f95f654931so290955685a.3
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 09:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756399732; x=1757004532;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91Z3nV2xDDPr0AIVq0M2gFIJkrVUpCIj8oRRwM3WbMg=;
        b=frm5GIRMWw0K0Sd7YycdLiiuO4M6ri7ch0rk0EUzi35mPSVwgVYMicQ5p447oS6x8p
         tPxzrvmYCOKEEZ0s6LLvX9kfIi/WaWmxL02gEOKqiMOIafZo/lwcAq+xNSd1mLRC8JXT
         yYekCKsAvwZIEDBE0r0l+Yy33LC71XwMEM8o5+rxsIF4nLvw/76tfd1obqgqxQtndL3t
         fA7GO4kZ/Ae35u4y4MHZN2nKMy2HRqh0JEM6TjXrvQNNkIojYF9IqDYKrtOkEa817s3k
         W7P7WFUnffqRYs7j+008zx+ntIl/CnMJiaVcckn8ASjSf2VhgkujV2ckwE9GuIv0Uph2
         9ohQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMb/jG+oolSRecC3aW8s8MWQ28cb4+ePBAyHqv8af3kb+QhVQsubkDDwtpKqpi7bBkefSA0En4by0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2wdLv6OT9YdzivbHRgvln9Ul89goU7EL9LJmCRJcPvjDUcEBC
	pdqL8wt3r26NJN5dwJse5anjtm+Zg7a72V7etWgA3DYKZDfU5gNssoMg9Fa3egwbRH+GaOBFtmd
	BBhi5998bj1xbqQ/sagi6pWnYTZDaDdDaAPZz0fbuU/fEba+bdJeKo+TRmcMTRQ==
X-Gm-Gg: ASbGncvhnWEx6ztoj7a8i+C+DPVgIBed5FNQQQKHeuHADk5sdARAarQvOVYOb0BvSyv
	7zbwTg+P2xc0rmfOnbKtleeyW7GJhUVnQXeueqnTiAVtwVjmarbEUozAASH9bAHSSKHSe84osqR
	grhlexRtGsuZMNotV7hQ3ODNrxJ7rIIZYfx+lXQtlFqzlLG8e/9/Yo82P3foUD/YCWkNPwscXzt
	FF96Q9iBg55j81wN0ftu0T2qYHh/G5pRbsGiecl5Ba+uHleY0BfMMSEQSaHuYKW1e4N85t7ACI8
	5E6FznYyGl0HYX3ANBstLENdqhLGPGpOoNc/wZdZaxxSzsDdBVcwcENHSpBkewEeqydqDUvrdbs
	XyJTCMH/zVrAF7Qsi4E8=
X-Received: by 2002:a05:620a:1a23:b0:7f2:2982:1eaf with SMTP id af79cd13be357-7f229822d16mr1501256685a.74.1756399732579;
        Thu, 28 Aug 2025 09:48:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBTDG4Ww1kwCTyr3kj9IVvcYfVGPYh4Xr0SFGCZucQRn0W59c/rhczTAx0aZ+uZxiIuXhzEA==
X-Received: by 2002:a05:620a:1a23:b0:7f2:2982:1eaf with SMTP id af79cd13be357-7f229822d16mr1501254085a.74.1756399732137;
        Thu, 28 Aug 2025 09:48:52 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc0eea8e74sm14591785a.27.2025.08.28.09.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:48:51 -0700 (PDT)
Date: Thu, 28 Aug 2025 12:48:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan Wanner <ryan.wanner@microchip.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 00/32] clk: at91: add support for parent_data and
Message-ID: <aLCIcWIJ4Nfqt7oi@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <aLB7CJY9nMLoS1or@x1>
 <08dd4d82-8ac4-43a3-8d01-f293db6302e2@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08dd4d82-8ac4-43a3-8d01-f293db6302e2@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Aug 28, 2025 at 09:16:16AM -0700, Ryan Wanner wrote:
> On 8/28/25 08:51, Brian Masney wrote:
> > What tree did you develop this against? When I try to apply this series
> > to Linus's tree (6.17-rc3) and linux-next, only 12 of these patches
> > actually apply with 'git am'.
> 
> This was developed on 6.16 but when I bumped this thread I checked and
> they all apply cleanly on the v6.17-rc3 tag. I also just tested on
> next-20250828 tag and this set applies cleanly as well.

I initially used
'b4 mbox af762c93-c9d0-485e-a0d1-7792e6e37c09@microchip.com' to download
the series, and tried to apply it with 'git am', and that's when only 12
of the 32 patches apply cleanly. I expected to have to 'git am --skip'
on the cover letter.

However, if I download the series with
'b4 am af762c93-c9d0-485e-a0d1-7792e6e37c09@microchip.com', then all of
the patches apply cleanly.

I have a few minor questions on some of the patches.

Brian

