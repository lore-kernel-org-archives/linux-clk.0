Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAE6189B84
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 00:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789172723; cv=none; b=EFQ/AE+Kaw50xcPfd+h66qSr8xsoCQwSSRQF5rMsuPsFj/17vgMwvsmnczgpKhFdkCQ+r88Fj86wzZje87OxKBSt1B9JatUuQqIGWRkE/HMyeaGxmQidig17EK5sNwWfMiORkEWodBHp7Fp8XDTVr7GDjUVKMtF8729rY6PpS08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789172723; c=relaxed/simple;
	bh=1a3ZwnBwa1HzobSQmbsDSE0ulkRMx2KM84AVAdNHEiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWuWpbHZp3KCrbuBb6QKjrd9CCTWnaZzItKJP8C724BZnQQ8aMXAme/ycxg+NRcYmIe2bAdcyBR6vS6LdNPj6hGXiFu4M2G1UuTmSaHKx186BZ6oUO2WPsfmU+HX7op8Vpnpp3YTpJ4zq1cncaGXDnOkObrYhjxm/LnLwwdfb/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cqFq1vtz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JxXZvxF6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cqFq1vtz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JxXZvxF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789172721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DKGFm6G/TNMn0NvYxTUs0YYbh7R2/WV2gMX4ZNmGb2I=;
	b=cqFq1vtzE1654P04M+7Sluje9VlF1Mbw7CVxNpXDq7u1eLUHioVW+ejBi2nsc/q80qTLK2
	FivlBvPT4VMdWmFHPsxxs5PxP7kPkl4q0IQ4fJzFkLIdtulloBYLG6ZwnjsWLp53QWyPLf
	R/kuTm0JIxZrZaITDur91TmPNeHvTeI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-4HjOJenmM8iRWVKDGrtj8w-1; Fri, 11 Sep 2026 20:25:19 -0400
X-MC-Unique: 4HjOJenmM8iRWVKDGrtj8w-1
X-Mimecast-MFC-AGG-ID: 4HjOJenmM8iRWVKDGrtj8w_1789172719
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso213810285a.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789172719; x=1789777519; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DKGFm6G/TNMn0NvYxTUs0YYbh7R2/WV2gMX4ZNmGb2I=;
        b=JxXZvxF6tAz7RbNwXnokRBO56YkjuVydSP6Cm4g3N7wmsyGJtbubKT4nYQg32aue/M
         gnzn5eJjvaHAm0wI16ZJDzr+xtW7NiLG9LUsXYTY9v5Jppv3HsZ4/cLtXIrrZGQ01Ibk
         7XhgbxjWZYgLzeMfphlqBJIurCN+H/oftR0zUVKLPHgXHGcDH3iadaotQfWBtCTw/uGW
         yEqgpl/8UKEpuPaGtAVI7wJ67oFLbWfdhrXLzCanOldPfu3DaYreSvb+CG7RxhLxUQe5
         tjuOLb218Re2MTbAm8bTQQlQJBd1h9j6JRgJzAwvymuL3OfLOvCyt1O1+/8KSp4OhMbV
         mc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789172719; x=1789777519;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKGFm6G/TNMn0NvYxTUs0YYbh7R2/WV2gMX4ZNmGb2I=;
        b=UQndlmJlQH0GTXWmdQ5ck0UrOrA+fVR+JcngLlUe+elQQx6kv2jMfTw+B0lmo/PWe8
         8FkXR1EPFXQwZMJHbUZlDPhkbmmO1gRhG1xj6+2rNMltyQM4Dy2PXBD7JnSVjya2+vug
         9LtDk7WIc5qgrjkgqPKEsUVI6Y4p9lCjg0vY8lSrZcx3+qqyVyqcIAIlCkvTItH7xT7n
         QPehI/rz0Woln82+8cfmzLdecuDPf5dYwwy72gyxXrRpbkTjm7ouRJ+HKz9pIz9ZvXzR
         2TdCAfnRHPxA9wJM8pubsR6wZxAKPCX9qqmXBU3Aeda3eYjDDU5/nq3DZjr2zb7SEkMR
         bpjQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3NlhQWm43xb4C6RV02Obfo2aB+tK5XZyNyuN3fb9fNJSLyQVr5C6iCvgtJ+Q94WK8pCh8izZ3DyM=@vger.kernel.org
X-Gm-Message-State: AFuF++nsF/IECj3M86KrqZofs0THyzKdN6KvWZNchi84XFPsmaTytjKj
	ibegjNXNXvudiMlfj63K6lM68A7fpr5R5OwXa/Aki+pHg4KxoGLiGPhxmmOrDFovBWCr4v6h1DC
	UK7X70FtqDsR0VV8uNFAXHGSs4m4gRVd1mrEIYQMh6DRCK5m+yWnnMIDGgOF27A==
X-Gm-Gg: AYBFou0FdMAmudhhHK8f2fRanCaRBavW1sPXeoSY15uR/IuVCfTnAmaUJte3/P/okZc
	UzcplvAvuHksrm+IHrUxnnwtwVmsbjY4mx9R2GXRL0R8RVHiLwvmotcsaCmKYbP05Iq38hfHFKx
	eqxYL5zGlo34DI1gMmasWfO+z4r0HuDAK1bRT59FYW5qWu+McPQBL71Hu08na6E14VmCu4X2XCq
	U3bl1fJuVOnuaWGUoq4YqLVRHF58yOxWBLwlTmKa8xSYRFPiNN7Q52ScSguDLRSuMNA8MbuXssR
	RjVrbKpu/e3MTWK89v9HlD5LdFmhMM/I1rX8qLf4o6DOVu3MvtIGJEQrKRHfD4U8ufRaXbEH6rd
	ylqf9bxMdC5NG/dmEL09iI68fyoCTm0rJDNg=
X-Received: by 2002:a05:620a:2812:b0:939:1ad2:ce7c with SMTP id af79cd13be357-939ea16b999mr1115567385a.29.1789172719189;
        Fri, 11 Sep 2026 17:25:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2812:b0:939:1ad2:ce7c with SMTP id af79cd13be357-939ea16b999mr1115562385a.29.1789172718699;
        Fri, 11 Sep 2026 17:25:18 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e807eba7sm368493185a.29.2026.09.11.17.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:25:17 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:25:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <hppiscas@163.com>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi@etezian.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: s2mps11: Propagate OF provider registration failures
Message-ID: <aqSb7O2gfU0hTuUV@redhat.com>
References: <20260906033651.84082-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906033651.84082-1-hppiscas@163.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Sep 06, 2026 at 11:36:04AM +0800, Pengpeng Hou wrote:
> s2mps11_clk_probe() ignores of_clk_add_hw_provider() failures, stores
> driver data and returns success even though DT consumers cannot acquire the
> registered clocks.
> 
> Return the provider error through the existing lookup cleanup path. Skip
> empty lookup slots while unwinding because S2MPS14 omits its CP clock.
> 
> The issue was found by our static-analysis tool and manually reviewed.
> 
> Fixes: b228fad50c00 ("clk: s2mps11: Migrate to clk_hw based OF and registration APIs")
> Assisted-by: gpt 5

Assisted-by: LLM

I'll fix this up on merge.

Brian

