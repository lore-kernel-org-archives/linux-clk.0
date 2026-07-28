Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC08843B489
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247888; cv=none; b=bXWDwug9CNAV48ZETiwdu63O51Bl8jzUeuqQ1g6m4sSsTBVBO+UOjqUMvE6YxBm11Zdr/EW+REnV9wFiE2i4LiNuIOiHqjLqq2I0fGVjyUyEherkFWdeQ5r1a30JNtT3x1Vl8TM1T7N2FN1ts0gBWPvg4wL5cZbKDwKqb485ZFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247888; c=relaxed/simple;
	bh=0fz0IdD0HThpC7IO3Z9qzbU0xi6FpEUe0g7j3i48V78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bsg7XGO8FwC07Y29XqCaIceBoo2vxZYnaX6Jgu9i/+abMO6bvWET/1IAiwGNOsZwvqfTIKQqg2Lun+8H5YcRqOAsWTZzpj0WteGfVgWHNPCjWmu3E+lLziYCwZgkHz5v4AcwzLN7MXAYSgzT+L9FNe+WQ3T7v5A3gZXRXcCzT00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RSA2p/IW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RRtk5zBn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RSA2p/IW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRtk5zBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785247885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TF93kallz27XSXLRWu1t46UFHr/jncGwJpnhKwCAGTY=;
	b=RSA2p/IWa4otxDg68n6Jj2QaP6dkR8CgE0WAi9yr9eLl7czwTwfFC5AnJiBL+WQNInirGx
	49Dex+HQDKOZE0Q0OXCEH4TtzshNwbulSM5iRk2/lszQ7zvjWC9q4HQLu9CcV5Ds/h3Oa8
	aFwJheJuIdsBSXKnTxMZJp4JioAzf4M=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-dzuKTnKeNeGj1ibM42iXsw-1; Tue, 28 Jul 2026 10:11:24 -0400
X-MC-Unique: dzuKTnKeNeGj1ibM42iXsw-1
X-Mimecast-MFC-AGG-ID: dzuKTnKeNeGj1ibM42iXsw_1785247883
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so388844085a.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785247883; x=1785852683; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TF93kallz27XSXLRWu1t46UFHr/jncGwJpnhKwCAGTY=;
        b=RRtk5zBn5E8H0vOiwut9KirX4iIPRltVQZxOENU+1UZWXWHUfOfsTQbvfT2AXXiLsM
         TI/2/w0rXVKtrtzHiGQVUmraen+cgIOFTSSfKCdtN/rOVqg44reRrs5MtTB3x9DmEb95
         cMZpfyB8UErPI530lg2zZWBIrsXvJt3/uTYvpWCwpzy05zvkWjnyDpWmZ7uZQYWdhYYi
         sK0cegntb62iNXkEFL1rZDthnLWZuV8ZOaLAPsrO4G/z42HcAV9ATIxp/HbS0imA/cuE
         tF2WRxayn8KbjTnVvoyVCFMFlJ+gp5hRITMD5zFvbiqb7nXVowgkSa7JJo+lAEMxjgqc
         g8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247883; x=1785852683;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TF93kallz27XSXLRWu1t46UFHr/jncGwJpnhKwCAGTY=;
        b=Tw87i8KL1ZnYHsRHsDQjzPlDymv9S9d+3HA+Yx3Cjw/PApT9pf3bOj6O34z1+fvo7V
         tYNLC8qGbAC2JIL7s7ZVByQt3y5Q9mobNTBeoH/ZqB8IB6YMk3ewLWNGSd67AJ4G5xp8
         VTF10W/e0jDgmEGZ6QeEToOQssfQZAwwq/EAXpJCIQ6n3xKOFw7sSSTCI1rLOc002zs1
         S0kqnY5TsWOWR55XzNN5rLNQeeNpt+fsrKZ/da7u+lr9B9xpF/UZmmCxBA8YQLkk+yPM
         XxNy5cPxzJYPTM/Lv/BHyUF9XfsHndsyxMC0s6N4G3ZKQFydazBtxoQcZSDJ+a+2wDuX
         7qkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyY3BicMM5/jjFM06MtJaRrzh9OU09bwX46G/mFC4iIX8szhszqXM/0zhoehGZpgUTW7rLd9R1zbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytla9GiAJv+FX7WcDXDx1L++0pf8Ai5+tJeNzcxM6Z5bZteH/f
	b5LqXoM3iU5G1wchLT+1XLCA+NGQR7HFt1ElQfhWiq3o0xGz6zVleAnIUjNGlUjJnxl2wqVhC9a
	al/9LmkNZFMc0UnE33/K4BrvYFKBywX8jx/m/4FVpGp9+QYpUtHJoLigWZHdIrmrEQSVtxQ==
X-Gm-Gg: AR+sD12aKgV2XHkQjzdYNN3P9RLOuWr/bQnCqnBHexrdAlukUOve4Vl7Vq/xn0z2bMn
	06WEmjVxP0LzA3Ywb6KRGT8RpZU9I/j1r5wuEZLaPM95qa148vb1YAFEbm75t303IppZxXKXH7B
	Viiz1pqaLzm6DaVN27GJGakZonijMP83XQJlGpZwCxhAWz4fWt4qC98HVSdQ2jGP0ESgVJbWW7h
	d/STz5VNFNkYo0571EM7AtG8co6uyLf2HW4+n4sohlwllinPX7eqnvwbQTVmejma5Oq17JqosWA
	PwW+/okg/YkDHw3qxD18WmS9kTgLFC7zgDH3fOY46q2FM3AfH+pHd5lkqlrNVPmBijl09F9ZSh1
	kWGoTrxSmXBAA+Gl0DedXz5XS1K6pYj4AQf8=
X-Received: by 2002:a05:620a:270a:b0:930:a12d:b158 with SMTP id af79cd13be357-933026c7e40mr229019285a.21.1785247882455;
        Tue, 28 Jul 2026 07:11:22 -0700 (PDT)
X-Received: by 2002:a05:620a:270a:b0:930:a12d:b158 with SMTP id af79cd13be357-933026c7e40mr229012885a.21.1785247881818;
        Tue, 28 Jul 2026 07:11:21 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de657299sm839772085a.35.2026.07.28.07.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:11:21 -0700 (PDT)
Date: Tue, 28 Jul 2026 10:11:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: ti: composite: resolve parent clocks by DT
 index, not by name
Message-ID: <ami4hzvy4PQ8cuTE@redhat.com>
References: <20260727-mathieu-wdt-clock-theo-v2-0-c048a6394436@bootlin.com>
 <20260727-mathieu-wdt-clock-theo-v2-2-c048a6394436@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-mathieu-wdt-clock-theo-v2-2-c048a6394436@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Jul 27, 2026 at 09:41:41AM +0200, Mathieu Dubois-Briand wrote:
> Resolve parent clocks by their index into the device tree "clocks"
> property rather than matching names as strings. This makes it consistent
> with other parts of the same driver.
> 
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

