Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407AE311946
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 00:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785975291; cv=none; b=nd6Ceh5Piov4/VF3hq12GcR9Nfih5r+maesO6ZvOx6xmypZa7EVDalaj/npjJObHJa/nuiv2OKncP8ykfxQGo2Y/vaXNlGiJPQTDG0oJJ2ROECLRNnMZg//rljPwGmd7WA7tOQo6HzRXCMoq+QrI9OkLstBi5FZRI8Wy+Maq7pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785975291; c=relaxed/simple;
	bh=TCOeojARLb3MBkjNdpdSt2zaLkUZYeR0EbfJg8HBZf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ae8lXiVXv599moWVQGhD3Lv0WtXW/Uwp5HYfvfiSzQuMVMy58B37JPKTUKx5IjYnY7r5UuXLqg7bFPQVe5qtsg1LPu0Cniggx+iqlZAIyKSrc2vbAI9Ob8bTjA//5vq9ylQiKR0GMMqPhkU4/sVHz26e6U4kyf4VG9I64vzFwyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hzfo29iA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MYI1AR4r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hzfo29iA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MYI1AR4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785975288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bOdorbk/UlhKifvig4KB0lM7KTYBeYcFRnwahVZUW58=;
	b=Hzfo29iAg5bomVTII2pShfR7H/PdlI2vJ7TeF2KDc///VksgzOkB6mLkmBF6H+ZR4LWpxx
	LHw3frW5SgZTloOvKxZFLr7DXb/nekFTmHf5BqqjLaaNnickW9MSHBIG4amd8Q7GVigTzA
	e8EOsvZsWXzNH11g42GfG3FJe8X++j8=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-t1dmvQxmPcCc1hJJihUxVw-1; Wed, 05 Aug 2026 20:14:45 -0400
X-MC-Unique: t1dmvQxmPcCc1hJJihUxVw-1
X-Mimecast-MFC-AGG-ID: t1dmvQxmPcCc1hJJihUxVw_1785975285
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81ed0c52d9cso52125007b3.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 17:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785975285; x=1786580085; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bOdorbk/UlhKifvig4KB0lM7KTYBeYcFRnwahVZUW58=;
        b=MYI1AR4rZIN9oi+V9Re+827hC83TXsfe1Kl1mgdvXvLROsWqomYslzSiH7tPc5HyY2
         DZyKfxg8piEhXbtyKgGx0MAmJkrfFG9nn99evU6Omt3V9/EXl3rLZCLe2tjZkvsaod/I
         GQEUmSUqzFMJp2gPd5lwe/bZE+1R2ipQjXn9DjvZvA8DCDjFcZvXYrnSZZxK90BMqZGB
         xWJX2+f9sTM8fHQRYdjCRBj3lEssGq63f6IXYqFR6OFywqdZHKyre0JDAeImpDfY57IJ
         uJhfXf8rHLLfMrTl9xZ8oPPhqq2huhMYzqBmIy0d/WBSS6YbaUVTLUoKUa9J6DJOyL8S
         HZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785975285; x=1786580085;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOdorbk/UlhKifvig4KB0lM7KTYBeYcFRnwahVZUW58=;
        b=L+RSAJ3Dl0bb1Oz1tNq8b3HI2T0ZUQ0vDkWBoqydyuNUuyC3wdNEfkMzNUhJzJs6s1
         Gkgyo6Gkbi68jeSigqc1E/21mv4k3DOSPlgbUrJqb5fivGdAbs0ValdLSOFWndeGfj/s
         pIAJcKCXMVk/cH4HlbvS49bpJXKcPjVrJckcqovtHcaAuV2UB8TLiaT/VjYjSJPRePp+
         CTJDcsrKS/8AYCncudrDYm7NSv49G5FJVpo6tXNZcfecfI45cxqZCKS+qdAr99lQJ5jm
         u2xhimwrA+KY3KkVf6VBq5iNcO0AmrfynsLib96DdmJ1YH5C5moBEr0YOhpEqoleLqq+
         GFfg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7cWPVrwFDOMOow+4bjADHU+vOxsmESA2MyrpAcIbVgg6l9qJGczYlkRM0fpNNFpeyUSSARlP91wA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMHSgecABHxHclr3N4jONJHG7573wMSZekfS5PoituDS6hvOCC
	CQk5jU6ZLCDe4FaQxK9EFjxUC0+nht06+KwhCmuH0ttMuxE2US9WNal6ef9lPQK2EjPLfNRJB8E
	M2ZRt8VpYcLtyfRu+l7reAUXSExf6SWLdb1xwik13b3ybcblrMWHflSRcxCjNVQ==
X-Gm-Gg: AR+sD12v3uzVv42ew6Ekm9ekJGCZHxXZVtKifBAdZFlnCn1G69+OrR80qPFgDZ5qHlw
	Sg7g3WLjF3nYgVzjZ1bxlVJi6Hq/tg8Kp0q3n5STc8fptZNmyEg5gNUhjbZvzRyq4Go4CW17bAI
	ZzO2ZiqPLBOhfo/Aydn3PIyt5m+YNZJZydwWTBTHAWiG8ea4dePdoYZRxAeAB4flszp2LIVgwSM
	8L0HjRX6bx9e/qn4yOpcm7qwZG/W7UJKJ/I0oYo/BRBId72fnCABXJLOy6m1keJDeviY3wwUvA1
	umfMNy7bj/tMhozi8oGhCCiyknX7ZKxCECKrorG6CA1sip92+gFPTl9KsCu2vU9tH+RgvTaSre0
	VWdIVyoVubOG/HbG+xR6KeG5YFFYbBvAiRos=
X-Received: by 2002:a05:690c:3613:b0:81e:9826:942c with SMTP id 00721157ae682-8201bab4aeamr67377857b3.0.1785975284915;
        Wed, 05 Aug 2026 17:14:44 -0700 (PDT)
X-Received: by 2002:a05:690c:3613:b0:81e:9826:942c with SMTP id 00721157ae682-8201bab4aeamr67377517b3.0.1785975284317;
        Wed, 05 Aug 2026 17:14:44 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-82013c49127sm29075737b3.32.2026.08.05.17.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 17:14:43 -0700 (PDT)
Date: Wed, 5 Aug 2026 20:14:42 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: fix self-consuming provider module pinning
Message-ID: <anPR8mIUmDV1j0gA@redhat.com>
References: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Chen-Yu,

On Thu, Jul 23, 2026 at 03:00:51PM +0200, Jerome Brunet wrote:
> clk_hw_get_clk() lets a provider get a struct clk for one of its own
> struct clk_hw.
> 
> When a struct clk is created, the module usage count of the provider
> is unconditionally increased. For a self-consuming provider, this means
> it pins itself and the module can never be unloaded.
> 
> Increasing the module usage count should only be done when the consumer
> lives in a different module from the provider. Use THIS_MODULE to
> capture caller's module and increase the module usage count accordingly.
> 
> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
> pass a NULL owner. As a result, any provider module will get pinned,
> same as before.
> 
> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> This issue has been present for a while. Virtually all users of
> clk_hw_get_clk() are affected. The majority are compiled as builtins
> according to the defconfigs. It is not problem in this case but it is
> if the configuration is changed to module.
> 
> The following modules are using clk_hw_get_clk() and are compiled as
> module with some shipped defconfigs:
> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
> * drivers/phy/cadence/phy-cadence-sierra.c
> * drivers/pwm/pwm-meson.c
> * sound/soc/codecs/lpass-va-macro.c
> 
> Currently those module cannot be unloaded once they have been loaded.
> 
> """
> rmmod: ERROR: Module blabla-module is in use
> """
> 
> With this applied, we can get back to removing the direct usage
> of the struct clk in struct clk_hw and eventually remove this
> struct member entirely.

Do you have any thoughts about this patch to the clk core? I agree with
Stephen that we should add kunit tests for changes to the clk core where
possible, however in this particular case I think it would be very
complicated. It also feels more like an integration test instead of a
unit test to me. In the hopefully limited cases where we don't add kunit
tests, I think it would be good to get multiple trusted contributors to
review.

Thanks,

Brian

