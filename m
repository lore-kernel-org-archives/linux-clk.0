Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11E531B824
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202325; cv=none; b=mkql2mUUAav07C3z1IVunU+PHnQtGdKexMPIUNpODEA6XWYIKZPmoDB3uSzH2Gs8xMdECIgSyAVgizVYVZlaG1TrzDBLobvAs1YyFc5ywXd8h2x8FX62jFq2Q4WNfGIOe+VFvglo1krn5zHN/ym4KSFTt4ItzqfGeQHffxl+6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202325; c=relaxed/simple;
	bh=UevNXJHbNfmCuhxABKGKPMdec8G8PCjX4ba+hL8sNmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3j4VcsmvDbf+dDMm5a26/pVBcslN2Y3C5R3P+qC5tsk4m6ayOWC4uWapN466vFWFHcjRVn1UP3leV1aMrMpHV2XGKJ+hROCK6z88ir/cC8TFbm6QAW83YekhqQ9OktaZeSVtHcp9SK+53nw+EIyR07sxIJMfbFiLTLLPRb5C8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fA8UdK+A; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tG0doBq0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fA8UdK+A";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tG0doBq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779202322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V0uXNBPWEICurSaeD4MWEpMYBS3113b02AXnGrWCKxQ=;
	b=fA8UdK+AbUea2uv6EwT+PdjxNBKunnj4cAwujEqcfEdBuAyodLqqp1idfvm3NPURN5sPHF
	PGPPRDKkOu3jwfHHs2y9wF/OZ0UnemqLq2Gxbqibdw4hSCXoLC+/8rzfcAS4TM0P9a4gIc
	sewaTEeb+TZ0ah2qwJ8Y1eKCcCdV2fg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-t7LiRzeUPb-mHlJvUWQ47Q-1; Tue, 19 May 2026 10:52:01 -0400
X-MC-Unique: t7LiRzeUPb-mHlJvUWQ47Q-1
X-Mimecast-MFC-AGG-ID: t7LiRzeUPb-mHlJvUWQ47Q_1779202321
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7cfea0b5cb7so9121267b3.3
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779202321; x=1779807121; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0uXNBPWEICurSaeD4MWEpMYBS3113b02AXnGrWCKxQ=;
        b=tG0doBq0VcL0P+hzEN+nv6OjftSl82ixNt5euLCe6W4kHRqCzD1SmDrJlYcBIMjzAP
         /1Jj9tuP3l9lK4u3N5wIvvMuIRX5Fz8Cakw/UL6l0RQlNgdf3gwKhkhqZhIK+9E1vCcZ
         aOt5YCZHX9dl1FcVqX5zKCpKx+JmaKhCXi1rd7iGA0FElzth+Mx9dEq03okvGvJ71mAq
         3Res4qShqDvJCwY0WsF+A4gJpCjYvGiWDdAI7lj9qrEoJemAaxf5ZMBLSV0JQAhD8UfM
         QpZa4p0q1NPdig6WEjl4HqtsvrEMTc+Bgk3XFXkqnvDEoIBWMAoG6l4829FVD6R2lQw+
         3PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202321; x=1779807121;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V0uXNBPWEICurSaeD4MWEpMYBS3113b02AXnGrWCKxQ=;
        b=Y9fSK+Orpyxpl4qgzB8G68gWu8cS7gqpkA4Wlio+Z7SCMVwnfis2H+fBHrJBKajAWa
         l+da9tD+Ts9K+185566OKd/BNL0ZdMHfY+GR6n56xIQDdjgZLuEEk1v9bCCtd/8L2fsn
         +gzTPnzf6IHY2LPpALEodsjjlrzMvTnLmF0rWSouJPwbRaLDkWHinrnJIkvAIHuFXw4y
         NnlMvOG+rtisuZl28tzaaQe12YHnGDmf3BRYOF9xZ78/mm2fZlUJejOOkUOOi3/S4Muk
         UFQIpHjET15S8gzlT8gAYTg+bsveFggGzR/Bw1QCXdv2gQ0rzdIhBS9/9YWY0KXboild
         X0BQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AHELhaYZd6g9LHOSeh9bLRHuS+/uNJ6ODrzS+sEfm57Z2b0rHLywszbU3cuL0ze7uKkMsxIYiBKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW0nRzAXYnomdJHhMc7rhQq0pvbBMZYHurAO2QDl0TYGb/H9z9
	JAUAWVnX8fSGZFQ+5KkD11A9hPrQDDPuCqv2gVSIQ+ycE2Fax2PJvbN1ewq6WQI79oriQJadsIr
	p8dVJL0t17BlvyGQOP7yYK4V6H6ZgC8NJpyrYXZVT36lFXDDgk86aPVvdx3huDw==
X-Gm-Gg: Acq92OGAlirpbPCOEA8QuF3bSW3NB/QFdP/f/sXe3mx6l6VtzB5JqNWnQ8kYdEm+YDE
	48n1ll/ZvMM7iEVtx/5ED+kD1ut8dLMERZKftOsaMrVQIuI73odPRf52haIehx3HwyFAAb87KLh
	efWPr5WV16Zg+04fQU0B0mTozE6SjCT0b7Vvqentp0BZK2NrP6D4Gb4JE3T32tsCNvKUqKG0JZK
	YROwzNfzABLcaZ+MBQovewZBgpuC+EjqOBcQCOfXE+In6sgcAenD4ymsFIjMDpZcCkz0FS2y1le
	10Pe9UwHKFoV5+efv/XPlBQDEOKV2K7TjNzpDsWlIV0xlVVybornrrNnMFmOm7TeJILYRxvPXKD
	hkwfzeTSq6e0/z/pGZmvxQbGMjOE9sZSCtXF9nfIi6ywE3bc4g29/s2Tw
X-Received: by 2002:a05:690c:4424:b0:7b3:852d:eed8 with SMTP id 00721157ae682-7c95a66e7damr198299327b3.20.1779202320564;
        Tue, 19 May 2026 07:52:00 -0700 (PDT)
X-Received: by 2002:a05:690c:4424:b0:7b3:852d:eed8 with SMTP id 00721157ae682-7c95a66e7damr198299007b3.20.1779202320032;
        Tue, 19 May 2026 07:52:00 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c97absm38128667b3.8.2026.05.19.07.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:51:59 -0700 (PDT)
Date: Tue, 19 May 2026 10:51:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
	schung@nuvoton.com, yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: nuvoton: ma35d1: fix ignored div_u64 return
 values in PLL freq calculation
Message-ID: <agx5DSrHkmKeEejN@redhat.com>
References: <20260513055626.1070533-1-a0987203069@gmail.com>
 <20260513055626.1070533-2-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513055626.1070533-2-a0987203069@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Wed, May 13, 2026 at 01:56:24PM +0800, Joey Lu wrote:
> div_u64() does not modify its argument in place; the return value must
> be assigned.  Both ma35d1_calc_smic_pll_freq() and ma35d1_calc_pll_freq()
> called div_u64() and discarded the result, leaving pll_freq holding the
> undivided product and thus returning a frequency orders of magnitude too
> high.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

