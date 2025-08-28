Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493E723D2BF
	for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 15:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396306; cv=none; b=qSJUJbr+dDQ8Hk1hAalmZ2minFJlvdgy3zcpyZEtIWtE/wu4mPq3s+1n47zwGnXwKacxbVrPHq/FWR0Se6EfKXbtRZp4ZJIchqSgB6F9Gk4aOj1SXlzpBE2flNBpeYhMpct7sYLleE+X+yu1xyWkjE7My+p6nsgg202Qh95YT+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396306; c=relaxed/simple;
	bh=nuOece6ghhXcpjXrD46Fa2xlg5rsU0Y3LSu39LXs6vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7XhwdWxRTdeifkRP/JhQmQ9UtaB8kHHu3oPFqvqeNfz1K/MAf6UFvd0ZLbrk3lvNd0I/81yvXstBvHmRffhcPCphCOOMoTA2eCwMFefbcmH/D6GLBxW38DemmQDcxF0GKnOTLF2AcBsI/vX1nD/D979Nrr2U6S4IfOxmDkSEOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PlWvbwSU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PlWvbwSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756396303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S+knyS2+c+jGuo6fC46mPYtwsTJxg5ztsNayK7xPVlA=;
	b=PlWvbwSU6PU4JG8If3rRoqGtufY62zcHHcb1QA/Juv8GSJ0uyVNaY2Ni2oy+DIYwczs35f
	fPwKQTZH7FzIS4+LQj3gZdqvjnpQrUgh+kMEkoBLRGt5e7DoT4zH+j1gaybkIP4B6wYWfk
	BvLPRNN27Xg7Ok/tz8BIRsMDtTxaXeA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186--cS79Id6P5eKb-qH9l12nA-1; Thu, 28 Aug 2025 11:51:41 -0400
X-MC-Unique: -cS79Id6P5eKb-qH9l12nA-1
X-Mimecast-MFC-AGG-ID: -cS79Id6P5eKb-qH9l12nA_1756396301
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7eac60d6c18so191515185a.1
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 08:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396301; x=1757001101;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+knyS2+c+jGuo6fC46mPYtwsTJxg5ztsNayK7xPVlA=;
        b=K42EKShYJbsndcCL952HdnNYLGMs+oUzvWfaCcbQqF4/I1uRZ5g/iB8OZ1dlI2wHtA
         O2DfCYFyABx2BDa+A1VEtEyVOOowcoe+8d57SJrvpoA7afH57V20soEWJyGwRomT4wnv
         cxHNFhCj4AIAxRpJyiw0qcBENnBtomxCDlQ2pPX4/nrjSuLaaZ3+bLeB3Umf1vnOsqt6
         SONnnDzF/Lnke3zoKWSukiG2Gs1vKaS4YFLh6DIfyTeBgFpem17ILFLEYLiFKVRlECai
         LVbJ+wzaJLUEqbG5ZSFQ9ruZMScHSKWzGuJvMBWM2b3p5DwUKKMNkUB6kIPWTrOCgKaC
         1nHA==
X-Forwarded-Encrypted: i=1; AJvYcCVTWGSHSMnrFeO0t+Ti+NOpa5gvxzO1/rzvPjWC0i/A6Raziwg+IfM+3HO9ePK0bxIVszY+SDtnogo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwifcLUu43ZUcjzhWHj2UwERknJ4uPuWqCP6qv1zrc5K44Mg3io
	+Zhn5lf65iawuh9v7seSF+7QvRGZlvBawsjLs0cRKF4P5TgAj8oKAg9xUW1bDMc53a4BwlBK8Q7
	VgU0XeNXJn+Nd6sRXvaTRLU4Jcv7nEaaWW6iilaGlr88MeIM1QqZoQx6oD5kgbA==
X-Gm-Gg: ASbGncs+T2axlTf3g+Fpc19ff51+ALkTBt8FXY2+glkJU0G8Kis/GhVAbcMST0Z0o6x
	yguBwXXJDqR3mYJG9Ktk3++lDNG1kU4A0yRulqCym8sqyXYFSbYUadnfbOk4OWSQ75KiPQzze1H
	iKGu6jDg0ubtPVlRgpKPbfgRQKWCIeo1bUiAlgI1gHxZyN3s+/46foVd0IbJJmudCJoXCyYKFAs
	SwDmvhjM4V77+R/uEqpQBNjseLazWAhiW/wyCMxakzPXy7uWnouMPXYDpvNvlPRb5gk2TCrULgy
	QekozazY54VfTDHixo6Wpa0H2hPoOl5ZpIh8xDcokbd6P4wjrxEoD2s6b6qjhgpC3iaGxJqIf4d
	pbn1nPfFcdGzoFn3eEkw=
X-Received: by 2002:a05:620a:372b:b0:7ee:84f4:8134 with SMTP id af79cd13be357-7ee84f49bfbmr2632531685a.73.1756396301010;
        Thu, 28 Aug 2025 08:51:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJeyZ8hC7qSu0hkLbJpyPcPTqfRgt1CgSMTN9TL/BiqkQO+pTUormRnaRlWD6V++9KCREhlQ==
X-Received: by 2002:a05:620a:372b:b0:7ee:84f4:8134 with SMTP id af79cd13be357-7ee84f49bfbmr2632527385a.73.1756396300477;
        Thu, 28 Aug 2025 08:51:40 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc14478510sm2413085a.35.2025.08.28.08.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 08:51:39 -0700 (PDT)
Date: Thu, 28 Aug 2025 11:51:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan.Wanner@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 00/32] clk: at91: add support for parent_data and
Message-ID: <aLB7CJY9nMLoS1or@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Ryan and Claudiu,

On Thu, Jul 10, 2025 at 01:06:53PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This series adds support for parent data and parent _hw on the at91
> clock drivers. This also updates all the SoC specific clock drivers to
> use this format as well.
> 
> This is a continuation of the V1 of this series here [1].
> 
> This has been tested on the SAMA5* SoCs, the sam9x* SoCs, and the SAMA7*
> SoCs.
> 
> Changes v1 -> V2:
> - Remove all the small sama7g54 SoC driver changes and put them in their
>   own patch.
> - Add the SAMA7D65 and the SAM9X75 to this update.
> - Add a patch to move all common used macros into the pmc.h file.
> - Update changes from v6.6 to v6.16.
> - Remove patches that where style fixes and include those in the update.
> 
> Changes v2 -> v3:
> - Adjust each patch so they are fully atomic.
> - Add a patch to have the SAMA7D65 systemclocks use parent_data and
>   parent_hw.
> - Add a formatting cleanup patch for the SAM9X75.
> - Adjust commit messages that no longer show invalid information.
> 
> 
> 1) https://lore.kernel.org/all/20230727053156.13587-1-claudiu.beznea@tuxon.dev/
> 
> 
> Claudiu Beznea (28):
>   clk: at91: pmc: add macros for clk_parent_data
>   clk: at91: clk-sam9x60-pll: use clk_parent_data
>   clk: at91: clk-peripheral: switch to clk_parent_data
>   clk: at91: clk-main: switch to clk parent data
>   clk: at91: clk-utmi: use clk_parent_data
>   clk: at91: clk-master: use clk_parent_data
>   clk: at91: clk-programmable: use clk_parent_data
>   clk: at91: clk-generated: use clk_parent_data
>   clk: at91: clk-usb: add support for clk_parent_data
>   clk: at91: clk-system: use clk_parent_data
>   clk: at91: clk-pll: add support for parent_hw
>   clk: at91: clk-audio-pll: add support for parent_hw
>   clk: at91: clk-plldiv: add support for parent_hw
>   clk: at91: clk-h32mx: add support for parent_hw
>   clk: at91: clk-i2s-mux: add support for parent_hw
>   clk: at91: clk-smd: add support for clk_parent_data
>   clk: at91: clk-slow: add support for parent_hw
>   clk: at91: dt-compat: switch to parent_hw and parent_data
>   clk: at91: sam9x60: switch to parent_hw and parent_data
>   clk: at91: sama5d2: switch to parent_hw and parent_data
>   clk: at91: sama5d3: switch to parent_hw and parent_data
>   clk: at91: sama5d4: switch to parent_hw and parent_data
>   clk: at91: at91sam9x5: switch to parent_hw and parent_data
>   clk: at91: at91rm9200: switch to parent_hw and parent_data
>   clk: at91: at91sam9260: switch to parent_hw and parent_data
>   clk: at91: at91sam9g45: switch to parent_hw and parent_data
>   clk: at91: at91sam9n12: switch to parent_hw and parent_data
>   clk: at91: at91sam9rl: switch to clk_parent_data
> 
> Ryan Wanner (4):
>   clk: at91: pmc: Move macro to header file
>   clk: at91: sam9x75: switch to parent_hw and parent_data
>   clk: at91: sama7d65: switch to parent_hw and parent_data
>   clk: at91: sam9x7: Clean up formatting

What tree did you develop this against? When I try to apply this series
to Linus's tree (6.17-rc3) and linux-next, only 12 of these patches
actually apply with 'git am'.

Brian

