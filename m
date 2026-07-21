Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD89A3C10AB
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 22:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674143; cv=none; b=Ka6P+9nJ24B/0yEIqYpUZp45jNS3iobXrK50xpA7AqjEQa0gxyzKWJwzEuMrbLMtCpuDIj+KbnTiWckEmAo+zWIr552EUvwUTYzr2XZzIwKOHYEmE7IDGgjKYoOIJG7TymH6uRIFVwk1VF6ssJ5gLHDB5gdOJ5DzjsWa4K+wzuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674143; c=relaxed/simple;
	bh=tERJXwtHw/dwgXThTSdoDXlXxtU+a4flHyUFW7E2D+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TafAm90bCAy080Yw+r3QIpC3DowYSD6jABj/TeJZGJBGR04aQ17uiHOQHiw13IxcPcs7ONSyTCdOzzUd2S+7aDwVBZ6zM26LbJ7hcz5o1EeD8ghdtiXcSgrho4YZsYD5Idq+Adxp4mk2XSvbdk80gpycKz2ECXF1woZx+OGw7Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GppMmgb9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XO+ndMpp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GppMmgb9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XO+ndMpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784674140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rnBRPHoNiq0pTqq6Jfy7fD9vUPKHe4GhNLqfr8ijK2s=;
	b=GppMmgb9xsCp625upWxDyYpzaTbhqwKkGyRbVcWhNHsedCOTl/L9cl+ba0y7JbpBfNflwm
	gY5R+49m0SKjFGvFhkqYE3558qvkQ/uVujEsLxBtKLVs3Moo9fK0XN/zAohHnpthOC7ntS
	baqcDNpXbARJOYPHoAjIC9tVkiLc0wM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-zDbRkCPPN7e56J5woZLlNA-1; Tue, 21 Jul 2026 18:48:59 -0400
X-MC-Unique: zDbRkCPPN7e56J5woZLlNA-1
X-Mimecast-MFC-AGG-ID: zDbRkCPPN7e56J5woZLlNA_1784674139
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930f5da3467so16573085a.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 15:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784674139; x=1785278939; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rnBRPHoNiq0pTqq6Jfy7fD9vUPKHe4GhNLqfr8ijK2s=;
        b=XO+ndMppOasi93ePddrJrHzBpg7HwHL8F/QCfn/tigWNcF2sDXyN/TYXEIn1qehC6v
         Cw5ndESz2VdLqBQNwN0L5cBrnTkAzOgoc7KUwCWJW5EhRf1VkVzEIMIuiJxesCoGqmNM
         x3wjYror1HaaW44u8nVaF78lq4wnW4tFufQ++OQx7QB3n5ySIN7erWiYxHIafaJPH+WX
         kULswzqG3jkqYDvTR7WBZzTTSWQ4eRtARSlr+5VZmf8F623/DZGjF+Rs6pJ+E6KniY4M
         rqpaI1kRL8cZ7KQ5p1YpUGC1S6EaOrQEXd0cPoDoJd4L1ghp8Uv9V8oDBtVE8bJFSngn
         tRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674139; x=1785278939;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnBRPHoNiq0pTqq6Jfy7fD9vUPKHe4GhNLqfr8ijK2s=;
        b=CfXKtXbDmuKfRmIb32t59/m44IpQsK5vQ8EQGXl328EaTKuE6tA0O16Q92YD9a1MrZ
         PkbAaj+cYaX2fshSHjP3S4yUQUhvdxSYafVbbHoiHQo9axV4w0jYrzKWpUcMqRK6BaAv
         2+mYU0hVgD7QiL1+E4XG0s2c+InPVu6YQzvWKyhaHFhysgtID0Sjhz8TGn/rJRE2mhOV
         z8tyttrcskBaxZgXmFmJWuNOvEXWAAP9hdoYWmFo1Pih1RkbyCmGF9VDF683zlNa0NGL
         y1IlPR9IWfl8L+PCuuwaspH94nKTxll3dfH8y7YhJkUHbzocrwOwKLjZjrm+rnbl0Xxy
         BchQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRpPhxoUtuV4lIP/ozhzEnj2a8UDfvoYxvcSIYqs4hBocBEfjia2HJzn6A9uHKncBHXS1oC9wSh2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo4WckR72YgF9be30Z5FDgfF5OUp4WngF8SZISwj8GSWREouB3
	TYeF8ocLi51GUiXZ5s26dqI/5wWCzI7KhJArzZNk3p8+8wPFLo5pZZblMw5OZ80nhg2VvVjhJEJ
	o+ZGKfloh3dKWC9TDLpUln0eiBy5vjvuM8kYefq6qOvfgiwUkzCSlPRhfcd/fUA==
X-Gm-Gg: AR+sD13dLdfjMOidUdjtp9A3SX6FjzhXiLReq1rgXq0jMCFWPRRmQZPXNWcbFf8ax5r
	3vpfumS08Jbq9FHgQmI9PtaPqsa242IW2AyO9MUewpIAMhq5uur88EG6rdwbB68tWlHe5bzrVhC
	/MoPhbWvJbp4WG4AzsN/aTkdP6aHmhywE0I7YxHwge3RcJP9mO+diSrI8ANNzJeNQ3ZjRick7as
	Xa3ogJ0ZuOPUN0nBFb5xZue4014QiuHkthWT6S+NbKCvno+/raKpu0NcfWJ8ZwMIn1kMAZqXlj2
	NmC6lw0bYgvcow9FWBM13b7K0Fm1P0URMTMEcE5Pb8R90c9iXLHB40A+tNJlAhAcMA+JeCOuB/7
	uJtFrKYyy56i6GyU9+R/wu5qv941BJTSB2I4=
X-Received: by 2002:a05:620a:2b98:b0:92e:6637:d98 with SMTP id af79cd13be357-930b3ed9d5cmr1967181385a.18.1784674138807;
        Tue, 21 Jul 2026 15:48:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2b98:b0:92e:6637:d98 with SMTP id af79cd13be357-930b3ed9d5cmr1967178985a.18.1784674138334;
        Tue, 21 Jul 2026 15:48:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a9ffafsm7374685a.45.2026.07.21.15.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:48:57 -0700 (PDT)
Date: Tue, 21 Jul 2026 18:48:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: fix self-consuming provider module pinning
Message-ID: <al_3V8N9z25ho8g2@redhat.com>
References: <20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Jerome,

On Tue, Jul 21, 2026 at 12:08:17PM +0200, Jerome Brunet wrote:
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
> I initially thought about using the dev parameter and compare it
> against the clock own device but this proved unreliable. A clock
> does not always have a backing device and some paths, such as
> clk_get_sys(), do not provide a device either.
> 
> With this applied, we can get back to removing the direct usage
> of the struct clk in struct clk_hw and eventually remove this
> struct member entirely.

__clk_register() has this comment:

        /*
         * Don't call clk_hw_create_clk() here because that would pin the
         * provider module to itself and prevent it from ever being removed.
         */
        hw->clk = alloc_clk(core, NULL, NULL);

With your change, can this code path be updated to use clk_hw_create_clk() ?

Brian

