Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4692D35B653
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 18:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818821; cv=none; b=dSs9lvwvvO58onLz113hqInJL7+tVxZnhGvkO7L0ZZjC1hXqVauwIvGHWJx4sX206149kjSinO8i0VxyBsjhFfM1AXsbuyW40IBft5s6PblKyJsNJQLPgyUswuKytYlCBk69Uri9rHfJPJDJiGrnpGir4Z//gJW0yN389U/ybRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818821; c=relaxed/simple;
	bh=V0Tna2lGH7kfeiYnCrun8PNvpd//QWqXS+gJzoPXz1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rk6OPD7kWPE+3y1l46+lJz8NQNXmOQEdvnS+/KdzCnAt9MPN7Ki2qIpkG+pPjEsakAlno51Al7XPY6VMiUlkTyK18z+n+/0sDBx3Y1CGUCaFSkY5l8qnoxTx5QD8wcnLIiRu/H09IKHx817WXBPTWexKsTjKA7dqb1xL60ENWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D0lHgfAE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Apk2Qa+w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D0lHgfAE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Apk2Qa+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779818819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mtuYbvQl5xGtavWlu1yVakqj5t0N5rS/4aiatiahmNA=;
	b=D0lHgfAERfxdTLz6n0n7s4/oyzmfvfCf638LCse0q2OPhUO6Nyvvbf6X1AR4C22FI20Veh
	8K2B4niWOKBSU037YWBsaFHNfAJHfWRtGrr65c7fXX/bEWDbM57H7au9v7LRMDQ7iU4M0A
	o8tnJAyRMC8ppumutTFT9Z/DniDyfSs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-YsF57gE7MVyL4zFn1uF-tg-1; Tue, 26 May 2026 14:06:56 -0400
X-MC-Unique: YsF57gE7MVyL4zFn1uF-tg-1
X-Mimecast-MFC-AGG-ID: YsF57gE7MVyL4zFn1uF-tg_1779818816
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90ccab62c33so1161354185a.0
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 11:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779818816; x=1780423616; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtuYbvQl5xGtavWlu1yVakqj5t0N5rS/4aiatiahmNA=;
        b=Apk2Qa+wwRZ2JVh1pTLlqcRyqvQm3nbQPZFv8njvXoBE1ElxVpYO0F0Gv3rnkzqG9b
         UHv7Xr6kPNKrfl5z0ayC3RP3B3l27+oxe58rb4me1oVa++hSyB51o/G2sXa4/IqAjozu
         KoSKqD9kMALaNVb48vpnadTQfKajv5zdS6FGCkduewjz9HpgFSu24HqvkqehiHqYnr9+
         jIS5ZZR2zZUbK9IqYwjeoIGQ/v+ghH+GLy7W6Nm92I1WqxY8xblPjNbQ4DZUo3UjVGw3
         Z9mluy9ZxIgSPGKDayLfy2m9oHhmuVfIbS+vXkQNSl4wrrbpNC7aH3zd4xFLoKoPqKGr
         e0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818816; x=1780423616;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mtuYbvQl5xGtavWlu1yVakqj5t0N5rS/4aiatiahmNA=;
        b=hLrb0rS0FyOLfEEWBQvkqM2NDoyud1uxAtIt7K6qlxEd9Pi8nk55zbfOJWCVm4WziR
         hQCL9/1MkjCxVF3ghGGV0BG+Kpq1R1bqsThGr1HXqKEsxrD4E5h5qUPY/Orbjk++Hi8+
         zk8T5zv1Ead4JRQ0/LFaT1RGqLY7sGT92sgBvduvY97E4rhYQTQhnYaZsL9glgXrccIE
         uMyPdJnF0UWoVFJCkwcFweUJJ+Q1SFfCrvdGV+WYZP3dTKyBTXvmKP1jplEnkn0veapu
         nySmhRg/bE45ygHJR7d4XmXjq4msSKWfaA4MmrIm/lge6fYrpvnSEj9jj+liV4WG7nRQ
         Ceow==
X-Forwarded-Encrypted: i=1; AFNElJ+DFvNOEqS4y+bdF7jAwKehPRKwNH5LWpTmZkSZLkmwiz5wfi2PgiaBEFxLaItnForStZ/xQ/S26/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuTlcLryEkRpK58rJ5QkYska46bsIn2Pt5LunqWlmH/V3DD+Gd
	HWfUiyaWnSohUDwr2cItu01nxl+QGjgJlupNmFO1DBOgY82G0cmUFuIVGRBMQ6nKPtHQLJVpVkl
	BKDTt9kfKmOrldhMP59CRwndNSsUkmar2UgnRE6trjc7FKY1G0skAQBzm3aIZnA==
X-Gm-Gg: Acq92OEJiXViay+1nlnx+DCviWGtgiZEHABZvyUBnPx2stXPzUvwm7eEJcYaDJs4IiF
	ynj8gp8I8YLwEA84e2hcrlprFpbs/j1qhna7QTq6tsC0GFG1hU6XCTSdfT/hbftgLVKEMHsTH1T
	Iev8CeH5XR5aci278v4akhQkBIbhwfmfgzZq8rqZA0JkpMwSHCZmkl3fzcQpNHykK1ERO9wlQ1q
	zVA3QKLX4uvoiH8UE5mFcfLPvsdhE/uZ2Yk6EHK3fH4a9BGBq7SoCXmhkmpHfdpj0aB8sMgYQGB
	2y4FUag6Js8hTSNwHI+qnhFtCNBwA004QEiV2el5GoCIsFuBWJk0qAM4nMZUaK+/B7Cdf/piFu7
	IqcEKM9/oN4UfTNBdVCr9PQIR/nDHTU0rMEWg1Ng/EbHP6iiM3q2vy+dY
X-Received: by 2002:a05:620a:25cd:b0:909:e4dc:fb27 with SMTP id af79cd13be357-914b499fca8mr2868925685a.28.1779818816182;
        Tue, 26 May 2026 11:06:56 -0700 (PDT)
X-Received: by 2002:a05:620a:25cd:b0:909:e4dc:fb27 with SMTP id af79cd13be357-914b499fca8mr2868919685a.28.1779818815704;
        Tue, 26 May 2026 11:06:55 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f881d91csm270637885a.44.2026.05.26.11.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:06:55 -0700 (PDT)
Date: Tue, 26 May 2026 14:06:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
	schung@nuvoton.com, yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field
 width and fractional calc
Message-ID: <ahXhPUqk6IIjO4GA@redhat.com>
References: <20260521014220.77955-1-a0987203069@gmail.com>
 <20260521014220.77955-3-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521014220.77955-3-a0987203069@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Thu, May 21, 2026 at 09:42:19AM +0800, Joey Lu wrote:
> PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
> The hardware fractional field occupies bits [31:8] (24 bits), so the
> mask must be GENMASK(31, 8).
> 
> The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
> as the denominator to obtain 2 decimal places.  With the corrected 24-bit
> mask the old divisor is wrong; replace the arithmetic with a proper
> 24-bit fixed-point rounding to 3 decimal places using the kernel's
> DIV_ROUND_CLOSEST_ULL helper:
> 
>   n_frac = n * 1000 + DIV_ROUND_CLOSEST_ULL(x * 1000, 1 << 24)
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

