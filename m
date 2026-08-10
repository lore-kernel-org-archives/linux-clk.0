Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B11443A86
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 21:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397406; cv=none; b=jxIhNVataxSh5Uyp23ZKeEZIImOh7p6gA8GpcS5NBnaeRIuUNBmVIuLbguHfgxbzgoNqNKUc6e4+TI5m3Sf2zBMGYPASsL5gYoyRpLhokqYjFfZ6NC47vSsY+rcRL1OshQTao+7s+7UuDXzitpg3GLzCAAgElelsLer7t/hKdeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397406; c=relaxed/simple;
	bh=KlsRE1nvgMWbUCCfsCqLaBkqTAG5KPcziTSTxm4TAZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAPOCle9sukyUPkbCasill6zD8ZOkIYNoyyJg1D2dnfqLDkNIOQ8bQ+oh0rpULSObkYI5nxWabXsSTw5bO43ayirVIEDu2mJaxj+oEPmjqFC7OR3wwu5mEFTm4WRfrxNQ00vttyzdDtpl1KuLCVNBeopMeyRRDS6wX9m/QgGgAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ffSkT5ep; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UQanWlCq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ffSkT5ep";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UQanWlCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786397404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zsKi5A5SAA7rPP1PbUs4CoGffjmVgKp5PFlyNfYqwL0=;
	b=ffSkT5epTaOaKHveJpRF4KI3d0Mn7ZyhB6hzMcTttfJDfMV+e2dTRAMNGWNLqZ/XLGzxUy
	GxrLL5Pdknq9+Iuzs/q8wHVQBMd11vqKNnHok8m83dYVjY2jOUuO30ECffQw7jh9mANMKZ
	GISYLGcvPuJ9tIHzExragIr2SrXeavU=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-K1ckBgRbMCOqaOrKBzLpSA-1; Mon, 10 Aug 2026 17:30:02 -0400
X-MC-Unique: K1ckBgRbMCOqaOrKBzLpSA-1
X-Mimecast-MFC-AGG-ID: K1ckBgRbMCOqaOrKBzLpSA_1786397401
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-668841f9af1so5556891d50.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 14:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786397401; x=1787002201; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zsKi5A5SAA7rPP1PbUs4CoGffjmVgKp5PFlyNfYqwL0=;
        b=UQanWlCqhbJCR87lggr5Dnbt7TKuNcLseOKyL9jeNkOvxVLWzUrpeLKz9OjGAznjSg
         J1IWlP5IAXh76bxP+LbeZWAxUsVqNKe9HB83o2Xa4g4OTPCmBn7pbBXUubJXAi5x+wuL
         xwph0BNjX1Q6hu2MNn5b8qrHM0f1Yk04q0X6XKz9pH1YKa65hXC6IiLzNh6Xx/ppsE/m
         dSZW0H5dKKlo2ZMWaWrW81S+fwjpYPrf/GF0nOujLFsK9hxwTZyXs5/BJPyESkihhSmd
         6aa+DwhYDQdFd9PJfcZ2+v5jpjL/h8RQY8Sut80omz0fv+dGMbx8hfnUw0jshZec1bz7
         0I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397401; x=1787002201;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zsKi5A5SAA7rPP1PbUs4CoGffjmVgKp5PFlyNfYqwL0=;
        b=NsxtgdMZW+YT35yx9CNtEHq/yUvH6cgs7V3RxL3Lr0hsg/C7fTCEJ9jcCciFIjMfIY
         KycVrHQZMmK6oCR42e6734art1EdV6V8yzgBPNxB/vaZvoTL4zgJuEKEtFclqlgFx1BH
         7QHSbpi3kIo3G9bGo/D7WxCWcBkymWbPFTKmd11UfaLKv2QaQ63c6VCisfu/46CAXjY2
         iDqDMe7OlhJK406DZh9NUe2Dxqc+mUH1nSrEqLq0vTFaEeggiYkG4KZ6uHt8iZCOCTbH
         mQHfLBGcXBbjbJlzQKNyWj8r0AhL1Y6axadXQFVQ/p7MOQMY+UEI1XzYFvZcNaStGDDG
         Nkaw==
X-Forwarded-Encrypted: i=1; AHgh+RqcErulwtN/RxoNtFpi7Ca/+Ox45cF43naZPisqkM51AUnkpo2fmkrwEMIL5TsX8kHy/v1cyg/dhMc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6erz6eJ6bllCyYWeGRXD3uNU5Q+xaBBkuOQsw7VLjLCgeuQyX
	ETyW/2FxGRYy2JSBVwCn6zsMXEXZzpeTHNnTFeH9PKHWsyoFXg+9wvzvrn54hU3aDMSAV0AfFjQ
	kyQjvbXgS+c/rm9jx4tEbh1/hjDFhmxF4RN5ewo6VXVblwx0AR+Cgtv5CmjBGww==
X-Gm-Gg: AR+sD124Zn2vSwJzA6xtt70krc/foi6TFR5mw6EnW4458rOpCJYMcc06MWxTQm5hiWE
	9rskrOE/K241ETplosKWAFjAq8+N4hRZZGD8h2b1ErCyqDyNOHqN64bxt7fw9yHWMEEBZCwPame
	raDx6haK06ohgbIe6aPxxr6vgzbXnmwrJ4+TkffWOtlxTq3BS9Ov1OvqTLM2XpZhNw3ScR/YLrh
	8EljHmmPfhLbCH8njhmPeq0t5eqcnJV+XorpjE3ORS/6L7uYfHUQifXr81JV3DhDX0sgL8X1DBJ
	mJTOVxUWNf57dXeLyGxq+RXhVQPTqzxFNqZE+9MEWbb+FaBg8TmQJ5F16G/sj+SINNTfsp5d1sg
	8b8AOnfm0oElaQD9Z7AI6uVVshb8saRC+PJM=
X-Received: by 2002:a05:690e:1341:b0:66a:faa6:b5ae with SMTP id 956f58d0204a3-66afaa6b713mr7196136d50.19.1786397401494;
        Mon, 10 Aug 2026 14:30:01 -0700 (PDT)
X-Received: by 2002:a05:690e:1341:b0:66a:faa6:b5ae with SMTP id 956f58d0204a3-66afaa6b713mr7196081d50.19.1786397400986;
        Mon, 10 Aug 2026 14:30:00 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acad2ade5sm7178798d50.7.2026.08.10.14.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:30:00 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:29:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v12 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <anpC1eRq5ajN01En@redhat.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
 <20260804163807.1285869-9-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804163807.1285869-9-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 05, 2026 at 12:38:04AM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
> operations on MMC PLL clocks.
> 
> Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

