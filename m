Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227A53FE357
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510670; cv=none; b=pvK7ghQfUiaV9sOUmXn3G7Ny7bNN9fAVT6IyL1nPfE0mnjurezEoJ76XIRXoBdIc3avCKGGzTtrEfWqZb57Y3BXIXwJNg711mw4CKKyQ4VEj3oKq++NdFw5pE/RDnaWzOkHfuLctl8AcbYFszUIzx8Wd6bK38SIPMMpFcsInPc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510670; c=relaxed/simple;
	bh=YeUj9wXNgdrewjn/2kxGJgL8PSFFtIVeng7DFODP/tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rns6dNeSuFgof46h4xdnTItVudPFZCxAtuIEwSj8b0FWFxGVimvjbscPiHOXG3BuNvpnTRRs3iJZgxmXDhHFXYFZzF1EwW8WzqDS79uj5OQZqzznk1ylUBlcs1gL4VBP6I5YFL2CDNYekTrdmlIT9Hp2uGOEgRSSBrg/On9p9d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QWvdoJlk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iPHnMoLp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QWvdoJlk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iPHnMoLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eicqwhgs+eER0wAJIrvpo3UBssGzYDYUrthaa+7DjQ8=;
	b=QWvdoJlkm226nC79juU7LLp4wEMKCYqu0wWmneg5IZ3h2O7hbaV7FUGD1r4GFBJl8JF+VW
	jsA2dB+QB6uwvNcKjeXxDrjzVxFE17e4rmI4Spj03Wb8OlbG8ZODZp2/TRwZuFvdV9oOXV
	xcXrqhdIi1YT075UgWzA3keSaQOksMU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-vsq3PAMUOsC8t7q8QCpNpA-1; Mon, 11 May 2026 10:44:26 -0400
X-MC-Unique: vsq3PAMUOsC8t7q8QCpNpA-1
X-Mimecast-MFC-AGG-ID: vsq3PAMUOsC8t7q8QCpNpA_1778510666
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b7a1ea06bfso96821266d6.3
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778510666; x=1779115466; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eicqwhgs+eER0wAJIrvpo3UBssGzYDYUrthaa+7DjQ8=;
        b=iPHnMoLpKC3JNAWBRNQE7n6c2ISTDcxzhNh3O0OTvKW100V3beNuH/vIgN9w8Oye4x
         2XNMgt8AemLtZOmgnOmEpphGqKTfJMGYwLnFo1zYcEqa3SK+biNDEOtgUazc3ucCBd9G
         bYQjdABRS2RiDCRKYYh5Y8ns4DDqc5p+sAi/W4AqVxoqX7gs00FMVBagRC4TbsnwHgN1
         ospG3YuNQL1baSpe8eiAx0jMo7EIy/nyAKIuG5bYnjK40U8+cHImn3S9/l4sMHfrkMil
         POnfoSs6Xh9lYZihmEYLf0WWm4qWJeo68sXtOP/DfVtxdGuasAzKE7pWx5U0Eymbb4rX
         H8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510666; x=1779115466;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eicqwhgs+eER0wAJIrvpo3UBssGzYDYUrthaa+7DjQ8=;
        b=CIRocG3DjQW0rsFpPihSgDy0uooobKRz5evyK9o0B7A2lj03hP3PlDCFgkueHOdqdY
         NJVfW7uU5fkV2E48+5Nj68xXJNMCb34ALj4Taupz9kysBikaof8F2ag+uj65TDF3N1lX
         pSv18u+KZmccfn9BJHBtLjNWSwIS2bMZzTu9xJo1757yuDa7aYaAf1N+tkJ6oR3TyWlK
         lkiTNp0PQAg8hW/VUYefMUfUFVFmUOjCMFWquvRnwmkgpXF+pJV3vKksHtLw99U1w1ly
         C/bKlG8uYSD0xztAESbEKRhW/XroTwJ6YVf/fF44zN/Uq03+y4VLbaTRtFz/axLQri/F
         v8Dw==
X-Forwarded-Encrypted: i=1; AFNElJ8FySlmE499+oCkFyyvhoKh5lS8QQwqONE9CfgrOjJhBKdUi8PTsL6ztJafFcPOaNFZ+Qoaeo4l3j0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9JXlHuXSfHFMUh7IAYIsIxW6W+1+LhWpTWW7TO3T8g1s08/sY
	fvg7nYquxCfDdGsWAM8ZMm9kLf+La6MHPWRq3XGKwCAq8IQ2W8JvISt7LpwoIH47r7Er1TSeIVN
	aeDcgSHLUEoDvk9L0bskfKIHC9KzjRlh73bKpuo2cqtyNUyDumBArBMAo72ZkTg==
X-Gm-Gg: Acq92OFfs0/PO0J0fY/yGmOe9fD/L5mwfHOC5Ft5EwGieXa5+2cLDe1qeSHU5LtA1X8
	AwSY8az8JQixflrrjNMyj7p0gQJCKL0wAjkP0xjWs49bUbnHHLncl/4+gsRxy2B6JR04NWVY0UX
	kQ6LzsfhrJkJrzsD/t1ir0eyktWTaO/+dowcsZdbRxIUjys19dIslMllk6zF3aJfw4+3U+LbtXk
	RfcGmv/lUjtUcCiDHWvm9xSNIQNMVvTLNV3TnXL5m0ClNxqkhlf657FwOXptnFXeXmuyEy0wL2Q
	nGLfM8xHewbM3ZtVmW8wj1QT8NnfeNJnMBU3X3sUgeshVEIMASu/HVus1GwGO9uPiqSUiXnwEBg
	Ja0oSGbOsEjyS9B+20hcd612MdAY+mLpcOH2JAFzebzkd2V6jYU/KSFG5
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246380056d6.26.1778510665815;
        Mon, 11 May 2026 07:44:25 -0700 (PDT)
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246379126d6.26.1778510665344;
        Mon, 11 May 2026 07:44:25 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c6b8398sm345352276d6.37.2026.05.11.07.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:44:24 -0700 (PDT)
Date: Mon, 11 May 2026 10:44:22 -0400
From: Brian Masney <bmasney@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 01/15] clk: scmi: Fix clock rate rounding
Message-ID: <agHrRhvz_gHLpxPr@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-2-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508153300.2224715-2-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, May 08, 2026 at 04:32:46PM +0100, Cristian Marussi wrote:
> While the do_div() helper used for rounding expects its divisor argument
> to be a 32bits quantity, the currently provided divisor parameter is a
> 64bit value that, as a consequence, is silently truncated and a possible
> source of bugs.
> 
> Fix by using the proper div64_ul helper.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

