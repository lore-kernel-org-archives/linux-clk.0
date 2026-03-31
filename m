Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34B13E5ED3
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 14:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966611; cv=none; b=sWaiSkv/Rurb4zvBmOu62w8NzutHmujZl08Mnz1/7HCJ0/TrWacamHC/N90MME2Q521mJG4QInrXQ+bTR5/1Jeu5+0ZeTaQyBY0pJqX78lrgUu/XMQ3TXBdnjRF1mDY0r51Hry1/S5cUri6nb4QH6Py5k0BNN+YZgVlWqan122Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966611; c=relaxed/simple;
	bh=5Iw9URBB2+huCGNNmJnyie/vcU11kN7G+C2oBsp0qj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWWCJ71AW81BZelLeGx6I3/OADLqtMeqTF1CmhkXVMCxdaiS0iylFrNMU1XfyZW06gBGA2VtZwQ640+JKqthMcLJdvK/1DXay+mINCOppOZruxQwO0SfbsdnWXZknBRbi4qRN885PF7zta+F9I9DvS4z27MYP471/UlUGKUQodg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ctprOuDD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pSOLESHa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ctprOuDD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pSOLESHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774966608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+cvItjsGlgO+YKuRpumctJ3y5xeOoIq89E46KdlSIjg=;
	b=ctprOuDDGs/4FF1UJ6Vuv/9WDcuUlfoc9XO+rnnlPSpvw+CAYWRKJjEMw8ogmR10pUWlJ/
	pha70XZOOyTHtjgpBm9ue0NPlcy6ba0HFEXvt+dSaNYYP2brYEIIsQQ9nDiifQhOWUes6z
	UFg+6wEk+CMAWwBLkY6yqk/uZfHJ45E=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-kLiGXXTiPhaVpdim5HbDvw-1; Tue, 31 Mar 2026 10:16:45 -0400
X-MC-Unique: kLiGXXTiPhaVpdim5HbDvw-1
X-Mimecast-MFC-AGG-ID: kLiGXXTiPhaVpdim5HbDvw_1774966605
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cc5305180so127027606d6.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 07:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774966605; x=1775571405; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cvItjsGlgO+YKuRpumctJ3y5xeOoIq89E46KdlSIjg=;
        b=pSOLESHaqVDimDnxFL8zT5QRh29M1bZpMV9G7EJ+zI9/ScBml+6QddKKZO1tDDnLbf
         816Bzo1xoGiAfTbPFvo/NWM66ZhYk29VPsLlEfaNlbnRPh0qc6rEnRumhglwjc6I6tTq
         pBbPo+HDjCexVFif7wezwXggccbI2iNrosFF3tTyTgRgacyhxOeDH9+bVWRupaUSxdai
         BsDwqliULXNMZh1ekJ/foQqVD2v+NC+6+g1RATdKEgGq4A4LIKyJqEsPXm1oqr+eIc8I
         TU/Cy85eJspvGn2E7uRUePn9lFIZV6KzK3tsxMihDF/LxuDHcd6PRPdC78vIcoDRjF3t
         2WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774966605; x=1775571405;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cvItjsGlgO+YKuRpumctJ3y5xeOoIq89E46KdlSIjg=;
        b=AdxQ05fTPKwKR0vBY0i6Qn9MIS2MfZSNBddKAVjgrSCJUOmp4YBHBxJLy7VO+QsWLE
         1tPRQ4Zm7AmKjkpSbZp7NI//9eRX4Ra2wdCjQn80m9fCxQ0h/Izpw2Ys4TvHwpQTT4cj
         O65TfwpqXbPPROL7YbyUxZyAFe6FjPBumbEhGpCSQAGaF+819fzpmO+JvdKOQj1rY4x8
         25vVWYljvPyxA1zEaZL7bT+Gb0RAsjt9eJL5es+1Lchk0ENvRJlS0YWXU+LS2B7oO9NO
         IZD0P3qLgSHM8jIf5xzQ6cDObPUZSJJTiOXWk0X9JVr5z6pF9dFNryC7Pj96o1MSnUTx
         kufQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdLGArg3QYwVCxitf19fX4AouJWRki1xtAfeFOtlUvN4hDqnfG7jGnINYsTuuwHrgY3lV/SOdk+to=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+yflgbKdn+xOvUqu6d6fLDNDNAPUOyDh5jrItTJFmELNMDCtl
	5//+vQSl+STknQVTEhSXwOjb/f88oN0k9npcZhJ/zGQEsM57F0RrgbKiQD/HD9jo2PcWEtpYZbS
	++IRMj6MjGSBZ2ReOLQp8y4ETFEcSgZZmjwUjBZSgjCdGNkPK5OBxzuvKSJX02w==
X-Gm-Gg: ATEYQzzuaCGRGCSfA7QraRpvNdHCfB2R+4Lg/epf8nApXzEAbT/5EAD1qtG/Jlx0hXv
	pgPokg/PoroPswtJgdMRe0JnPvzuXZJd9MaZN98KsUef8oX14YsWwyNi+VyAfKOppw76mIfdSLa
	NEwA8JuIUH4BtS4aEfnyxlDzNju8qFgNZXN8z9chcGN1AbpZkqIFXwHACiQGesxEf42dqIO2ouw
	FqRjTZUoJJARvRQ3vrnfoyvGlLgVxjLGE81jL63LT1i8dj2WTHKYfkQ1Jit5AVik06MhZtxff+U
	SoJJs5an5UAzN9GQP7UslufjG53+v+zlAjngdoD4cE8XAgV6blIlqMmegh8dFmfTWudcqMJ2n3x
	pd1VA44SWJ0uskrjm
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr227957571cf.17.1774966604490;
        Tue, 31 Mar 2026 07:16:44 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr227957191cf.17.1774966603971;
        Tue, 31 Mar 2026 07:16:43 -0700 (PDT)
Received: from redhat.com ([96.66.166.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c67fefsm86643111cf.4.2026.03.31.07.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:16:43 -0700 (PDT)
Date: Tue, 31 Mar 2026 10:16:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/5] clk: spacemit: k3: mark top_dclk as
 CLK_IS_CRITICAL
Message-ID: <acvXSXNWIEcDUpQ3@redhat.com>
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
 <20260331-k3-pdma-v3-4-a4e60dd8b4b3@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-k3-pdma-v3-4-a4e60dd8b4b3@linux.spacemit.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Tue, Mar 31, 2026 at 04:27:07PM +0800, Troy Mitchell wrote:
> top_dclk is the DDR bus clock. If it is gated by clk_disable_unused,
> all memory-mapped bus transactions cease to function, causing DMA
> engines to hang and general system instability.
> 
> Mark it CLK_IS_CRITICAL so the CCF never gates it during the
> unused clock sweep.
> 
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

