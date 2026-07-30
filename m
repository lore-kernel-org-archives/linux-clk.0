Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CAB446079
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 16:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428943; cv=none; b=XM8+zToWwrwcayGMBCR+pm1qOFbZArM71FgjNycEeiH5PMCC3Mwu6ny0ob0zQgzsGTZgib71sItjV1jBHOf9ASAr5d0zHoKPff9mvFOztW2rBSTXQxj5OcoNF2odd7wcRbfX1aUt2nALLZ0NGVzzVKhuSgf3NHjdY/j/B7ECVgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428943; c=relaxed/simple;
	bh=8S+TWKatXbX5wujIAAzGp39n4pQcsk+sM8ipb22/aEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/wdulqRYOSn6PTbVZHExchsqc4dvA+y8OGopbdLs9bxft8peUjuaEaU32pX4ip/ABqHTbnqj/X/FnhIGdRQJPJrnqZGhSS8NSw03iXp90+Lh8JZ/qWaiozxEAw3wxz4VekcvYH0iQ+aKKwFYHwyARmdwLvgVm1Nth2OiHVg9NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vh+u0OyP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lNau7CJX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vh+u0OyP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lNau7CJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785428938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWnL5VleVaqHnf4WDlOmR61fSZ2iE1J6L7mVb4UvJLk=;
	b=Vh+u0OyPShIz+Ql+4AtVYhASkEjsLVtiTsaE/ax9Reg9xw0hxlwFz59zfQmwoKIfM+A69P
	vUFPo9MA6cHCjHNSRVNOg/v262Rrn/+LeMoC5K0HKYqt2YgcDyPx9CCmoVrASuvAxFyZhv
	w7qAfCnxFl4ES2BN99XUG/xa2ECb9Vg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-lx1PbKXePFKFPIePWIjfkg-1; Thu, 30 Jul 2026 12:28:56 -0400
X-MC-Unique: lx1PbKXePFKFPIePWIjfkg-1
X-Mimecast-MFC-AGG-ID: lx1PbKXePFKFPIePWIjfkg_1785428936
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f5b54da461so2697b3.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 09:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785428935; x=1786033735; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YWnL5VleVaqHnf4WDlOmR61fSZ2iE1J6L7mVb4UvJLk=;
        b=lNau7CJXR/pmzZfCeLUSU+m2uqmppCNWOZ2gX4CGQiyS2jk/27sjnsCwAaTNO0LJ4b
         YzieQRIXGdk/T6lKhddVin4Qf5ExFrPxxQl32ubPc56Tw4B/AEA5zyiTzEYUoaR5SSpi
         KqBsqmV9MIARwHXWCvhq/W4wiyr1S1AtVCJCNXKuYYPQa/5uTFsWppEejnPFefYwl/9F
         XYCp07zKWbIDlIT3kOaBf1/dphmlt8rVitQNPlhpUDwXKt2PDyHK083+G8LuIwytHXtm
         Gefd4cASwQKHioCiL1QbuD1oyBzuCIAkzl1R3m6HZf/Y/GhxFqOYPZCxAoiHfXElqAGw
         eU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428935; x=1786033735;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWnL5VleVaqHnf4WDlOmR61fSZ2iE1J6L7mVb4UvJLk=;
        b=LtaaptLQ7JRbQIlZYb3en0wES64zfVohImdhbagvxazRiyKh1URm6d4KJBgc1Ti+gS
         raM02BAJoHKQTGUkGchTM5e5YaKZpDl3itNtfhUuBoiFCzG77Xx1L7gnLYsRMN0Y4RQR
         +fs8t2TUEcTJjGLmgaapdpu0ArSdlDwzlMXoITQQ4Zf2G3LvSDMctE7MHfdDdge04SHA
         sYLIrmwf4IbnyexZSL+cdFu8qdCxKWVq/NLql0wVCKLWmY9e4dNFO52kT+zCs2lKSkCt
         2YGnLRw1dBKuiV+KaPWyRg1VlCFdqMFDcCSBWsYvtR1W1Zxci10FsZ1adHp1L6VNsiCR
         9LMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3JFWQDLfxjDjMSBUjWUC5Zfl1pCGdJD+YnzvaKFpFTUbhR0RKOus7vdUFXVWmf1KvljHfW1toV6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoBvPaSiSAV2yFIxEY3sPpxaxCcnVP7jdrB46CGBx9AW1X6cWi
	VBk6ZZgfexzwHaoqkprknvmfHqMyK4lyErPAu0H2uIp2nEPuRMutIapoZAZiMy/IM+97BzoG6uU
	Qgg0LGDRtbCrv2NCN5Glreqgwj75vjX95086awGJz0oRXkeNlTB6ECOYAKTl38Q==
X-Gm-Gg: AR+sD10IOGmRURjO2Rhgar9ZmWaPxKmMOkqhy7gecWeSF5I3dnZ7czCzMkZBscAk17Q
	WARoXNIMea3eq1kRJuNhSIm6Tcf3I7K2wgnYr3rYug/kbwG6F5gh7Xw5iGT8+gR7kkC0FrWbk6p
	ZLOwyQhY6WA/4OltYUvhzeg13uFxZ2Rv/iG1bx6aSmTHXNBQxGL5UgCj5pVxuFNeqIC/1K/p9B8
	2S95a2mRF6+gddIn3gscIu0t8Ka5ttEYeBRtZBD9kMz1tp2ujflmncjPR7ViGwolXHjIak9+0nK
	FLn3Agd/DEEgHYAZMZhOlF7dULRLC3Pv9tr6dxBGT1wAGKKG1z+MmnMSMXCf3Efa3swBk5aPFIB
	36RuHE83V0Lji+3/taWVxyxZuqfKfgyYgaXQ=
X-Received: by 2002:a05:690c:3503:b0:81e:6c2e:f114 with SMTP id 00721157ae682-81fb895416fmr21778807b3.30.1785428935637;
        Thu, 30 Jul 2026 09:28:55 -0700 (PDT)
X-Received: by 2002:a05:690c:3503:b0:81e:6c2e:f114 with SMTP id 00721157ae682-81fb895416fmr21778617b3.30.1785428935253;
        Thu, 30 Jul 2026 09:28:55 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb88c4a57sm13093077b3.8.2026.07.30.09.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:28:54 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:28:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v11 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock
 & Reset Controller
Message-ID: <amt7w327inR5rZrU@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-2-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728142806.1954638-2-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Yu-Chun,

On Tue, Jul 28, 2026 at 10:27:56PM +0800, Yu-Chun Lin wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2f9472c1a090..65dd2be63903 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22741,6 +22741,16 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
>  F:	drivers/net/dsa/realtek/*
>  
> +REALTEK SOC CLOCK AND RESET DRIVERS
> +M:	Cheng-Yu Lee <cylee12@realtek.com>
> +M:	Yu-Chun Lin <eleanor.lin@realtek.com>
> +L:	devicetree@vger.kernel.org

You add drivers to this list later in the series.
devicetree@vger.kernel.org shouldn't be listed here so that the list is
not CCed for just driver changes. It'll get picked up if someone is
making changes to the dt-bindings via the "OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS" entry.

Brian


> +L:	linux-clk@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	include/dt-bindings/clock/realtek*
> +F:	include/dt-bindings/reset/realtek*

