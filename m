Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A5C3242BE
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817650; cv=none; b=MWQKBjMOuFQ4OJs7pfb8u+ovfC2yo0ZpyFMN99ayEFcp0c3JamDEBeoxUk9GBSW7q6zXFikOVRLWNJY3QSfiHIg2Mwi51cXB5EVWQWq7K2zwbXbg2D2Dd9RuJ9/VvwjR+f4PyjyT5VMOnB8aM9y5Z4xvUZdiEJk8TGyhJXCdrrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817650; c=relaxed/simple;
	bh=kg9Xp/R9DfaR82RsUOUd8pUoL9wzn3C0edR+7vZ5gSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOPoR5Mqv70UAkd7JI8rlGYadFNLkaIaP+4RgmJehQ8wLoqVHL5QSiE0ET2ZJ2q6dQUTd/71j7pRHN55R/Gb2l68sRG9ucBWFs46cwhEcUqTmEa6enDC0ZO1nde83PaX1CPnat4aGRGUw3YH+f1WoNjEbZqblybUWg5XwI8yG4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c9Ao8jJo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dU+/oUjS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c9Ao8jJo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dU+/oUjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784817634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KBbJHj3/HGRQnu2lI6pHC51IXPFz8msF1DYjvpECwOc=;
	b=c9Ao8jJosDxo7N1AmvG10ikJ4rnSfmr2IZgwhTRhl2aJPRUVRWHLluFQc8lc3SMok8J6RJ
	7P3IXHS51S24Jf4CuHqeL4SndOdaArgMh1BtZp7uXMge4rbK2JB5vlRmhwE90hkWzAmZlr
	8fRhJy211ucV1vTTjq47W/M6VKlYDtA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-3c64_vohNa68_tISVleb8Q-1; Thu, 23 Jul 2026 10:40:31 -0400
X-MC-Unique: 3c64_vohNa68_tISVleb8Q-1
X-Mimecast-MFC-AGG-ID: 3c64_vohNa68_tISVleb8Q_1784817631
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so153416685a.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784817631; x=1785422431; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KBbJHj3/HGRQnu2lI6pHC51IXPFz8msF1DYjvpECwOc=;
        b=dU+/oUjSOlC9t53ktRfF/J8+squORYID7xpnLDSQLSEBbD7siYIDDeKFWYON3axS83
         CWdteHAiLm9HIzAcIVtTFDhlIC/TFWLzVVj39NFZZxe4cMFDLrLhkUGCkEPFeAxlTFif
         dNoOcM2hWjFC7VW45ntAaq2twpB89vwx+yDEEpumhBvbjxrf3+6wuxN/ctreGg6j2gJF
         nClweZmX3K6ASfhectRHVva8ci9zcgDXJIARZI7b/0Y1rbjmID+PuvNxsnuKn5x+ViT5
         EJgNaAy7RkAhB/P9Aa4belDYOFvWKN1YuTjpgaTz+sJ+3mBaqb91N/wYkDr2fFlpGQPB
         75EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784817631; x=1785422431;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBbJHj3/HGRQnu2lI6pHC51IXPFz8msF1DYjvpECwOc=;
        b=Vo2OK/XD8v0rOBG6Fc9bmCujGJOc07tUVW5/CMv0vkKhJS9gKtflVjNzSMGuMTj4vx
         vWp2QLEqGF0Cv2Ge5aVDMVZ1fCPIsDl9QYBDAnFixhuqBoFSTAWEbN195ts0NGj6t4Zz
         YvF7UpWnZJsKUDi1GSDPy9qtlAff4XFw4ALJOap4kyyAcDCWL0crvGVBGBfPxbs/+A1n
         kqkb1HRe6PeCXEYmOnze06HzGdYkaR4Iy3XQ0166lqcOYdqgmMt+c77RKJvnMMZer9y4
         Rc4G1pLo68XRlMOt5MoSYVJ+N92Kxv2v81E/XCbHLOrE+4MrwrhI+1lQ95gTNoSUAtGz
         RtlA==
X-Forwarded-Encrypted: i=1; AHgh+RrypECE69GnJ5B4W0MvQCGcAsr3tmOC+59eNL1vrJB4/aED4KS2KwfA+0MOcI5aFf9+AxZikpcmqqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTVz9KYI13k6uxjHaVEsrmvgkL0MrfREzWDufRqiVJLOb1kY1t
	9hL15ofWptDgLQ6Wm2JMwRtr7lzLcaCkfJ+HcZQahFKCrNtwmNgisbWZ7qODF6saBvkAdHCdVcS
	h6Rpll/Sf+yiFJNZBNZnjy4hy4KoKPIDvdZJO6ILXXJRZ2ADopH2Jmu2AYM2/QA==
X-Gm-Gg: AR+sD10pbezeF0mIhb/Kd+74oXTAFVXJiZK6PJO4Et19L2py/U68ce8+Hur8D+XFe8Z
	liQkBXSON8vhd27g6c7Tdoozk+90O1uHNKjxLd6dHJBStciDNT83oHaFEJAtc2yRoIfIKBYk9V+
	UiEch2/isRGAnVbIrv49i3+eTGdaMp/bNp++UuKFvp1r1BsQ2OVWMm/alye9Z5BNVh/7MprRN7x
	NRxWBFIov8jmN3Eer7J8z1InYyXbnAgcDNAbUlLm023yMrwbH2F4VtfTxT2NdqpxmUEKcLhIqfx
	N126Geu8nJGSogykEQytf2a0dHneKBomRsOP3ili2A0bY773SHBCjAH6TN2EP+VYkYy4aOecp3E
	0bPXAoksCcnzktGNQFV91WxG2dtPgMWo7qeo=
X-Received: by 2002:a05:620a:90ce:10b0:92e:8a84:7041 with SMTP id af79cd13be357-931035ce976mr246944285a.8.1784817631244;
        Thu, 23 Jul 2026 07:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:90ce:10b0:92e:8a84:7041 with SMTP id af79cd13be357-931035ce976mr246937785a.8.1784817630329;
        Thu, 23 Jul 2026 07:40:30 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a6a157sm425415285a.37.2026.07.23.07.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:40:29 -0700 (PDT)
Date: Thu, 23 Jul 2026 10:40:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: fix self-consuming provider module pinning
Message-ID: <amIn3DO_65uyItS_@redhat.com>
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

Hi Jerome,

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
> ---
> Changes in v2:
> - Update comment in __clk_register()
> - Add missing documention for the new parameter of clk_hw_create_clk()
> - No functional change
> - Link to v1: https://patch.msgid.link/20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com

Reviewed-by: Brian Masney <bmasney@redhat.com>

This looks good to me. I'm planning to send Stephen a pull next week for
content that I think is ready during this development cycle, however I'm
not going to include this. I suspect he's going to want a kunit test for
this and I know it's going to be complicated. My suggestion is to post
some kind of rough test scenario for this, even if it's initially not in
kunit. As I get some spare time at work, I can help you to see if we can
get a kunit test together for this.

Brian

