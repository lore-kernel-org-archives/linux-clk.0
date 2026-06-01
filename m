Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FFF37DAA9
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329475; cv=none; b=fzXomSGEbxifY9V6SRA1EKi2ZHMphgVWusZNCs2B4wva0D4X+zLalFJBcl+Zru6T3OP971Pl13ou5JzWN9bhGvsH65SSwv2S6oI6vUE4ysKrumcjUPZz9KV7dCq+q+1yo7JcA7cknpWrIb89KPcqGid7bYUtx47c3kTclsE065s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329475; c=relaxed/simple;
	bh=RQo+r9k86GHV3CVMASpkA/IiIP9D4OuHBrHLEaf/jAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpgYl7QvobPN3x7LBUXYu3P4vOG0MAxgGixsPmfgPVMBiHDNEI6OLGk1zkzGhOsQCdwI6xI9VMDroZdxqfwx0GA0Pru03C7x5PysEbnV85cMDwGnbLaGELcdrhxq5upEiB9gW0dCbumWPnC18jy3xHWl4EK7hRNBG9Ihm9YShFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EHgC3KZc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BBjhGD3b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EHgC3KZc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BBjhGD3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780329473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mtseJwieOp0garRPx7ERfByGEx/k6iWOHlzPlsbXan8=;
	b=EHgC3KZc1tgnE9HXPdCqEAkaE/JoHkR9EhzSFdBeVSO7NmsDttdN2vRsqIYCEZrAwcxj87
	oZnTP2sWxAXOnqqESsegvxxzAKD4JchKua0uwCus2jzYZLVOyuzsQD/rlgT/JYl8l7DB9j
	W674SX9znuVi6PFEpov1R+l5znWkt/M=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-IEm9yUumPVGTh5hcl6OUOQ-1; Mon, 01 Jun 2026 11:57:52 -0400
X-MC-Unique: IEm9yUumPVGTh5hcl6OUOQ-1
X-Mimecast-MFC-AGG-ID: IEm9yUumPVGTh5hcl6OUOQ_1780329472
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cff652cc58so2692477137.3
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780329472; x=1780934272; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtseJwieOp0garRPx7ERfByGEx/k6iWOHlzPlsbXan8=;
        b=BBjhGD3bsZOzxuh5635LV6NgRjxBX8dovLa6fQ7oRU9PQD7k1GhcXDp/ZBmwb/xZsA
         Q2ZHjf3uyEetoR+KPgBRn/sT69c9C6+7+/5mpovQ+ylAUs8z37yU0dTvHvu2P2rWTyqj
         rX7pGZBp/RjPJ+DHOsSCS8hBeeCTgDV1JD2dKuDZfN441XyMXhebCDLuCUut9xaDvx4M
         ubdJw2EaoBNqcq4nq/rUFr/7kSuVKHkJl9k9wKS7gA82Xbci2O37A1KYZrLZIg++sEs2
         sV3/hTakmv9lVU3Ssn27c2mgX6a8NNTH/mf9yhaG4MlNK+I9B1tXbPBUBltjl67IZ2uB
         w3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780329472; x=1780934272;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mtseJwieOp0garRPx7ERfByGEx/k6iWOHlzPlsbXan8=;
        b=I6VnXM1vSlwMtknpBNjCX2e3qGc43gCs5eCYMa3EnzOfMhpeQsrjCgGpwjC/vrmqAH
         AhKt9nbjOWafhQCSsRHxUJjtO8x80GW+7XJview1wdEshAVS6vqwUFVd+mFQ5sg7uBvo
         VYlduIC+OdaaEjMfE5BuJhDRUumD6s/kPsNGz1cLHs4UiizCNJLR9a9ak4N6PhxtTwmd
         s0O72ra4l1nCm+eWrGv6lmFNZyRwHTuLowxp6YBA/1Z9gpnFXR8QZikKYEU6x61x7JwR
         Q7a4dKfH7S1wOwuVeoJYVSHK5RdEk2f4mjm2mAqDw7P/fX0xwYpl5iIeX10r/ZU2x4yX
         Ko2w==
X-Forwarded-Encrypted: i=1; AFNElJ/WMb8WXXQp9k3XYzswn8NVDNVhGMqgvpzV2ETHzhW03MMuPfF+UfoQ43AFy4uHKDsbA55JWrQwarM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzutfK7YRUHs7gJflVIPAEpmGAl6VZTjPhmmsl79dVl0rC4osrC
	0DW+jTtrPZ0bjUYVBSMs9HMfNGxsIBTQOewvv1K4qZUwfTFSFMxSYMlAdknflqPbdDcqZG323If
	HCS4JdIeu2SmfT7/p+gy3f0JM6WiWZ/5P3KmPTJtGlbf4iE1AuadZnkhuMGIHIQ==
X-Gm-Gg: Acq92OGfr5hk+jbTRbQYPv6wmqhd7Oh4SaY8QVNwtH2X0ghMobYnnaL7K0Xn2BzQNw3
	aWBMCesH2Ly0HZ11ioVnTlhYzomg5C2DSgeev7KiY4HoS56MmdSPUN9qS67EYWZFgmV4XsW2JkT
	jUC9xqRubT/9cq66y36YUF4OTHUk/u+8QVC0mF84nvluIVmVUY3OEAnNrlnKhac2fc7L+VDxclB
	ti6gEni1z457gzindruMUcYwZ28KXh9iS+lAdtelGl8+UIIGh8wRwiRv23f8wqKHxJCit8jqUqr
	5Ja5kT6GjvqJyb+Y6VvzztcqX4IQy8XLfUF3YJoR/u+3a3Dmhu/JRzSLQdAEHgPVSYbhlaKklkP
	555CLpSfYKM5Mx41U0zHTVoWgNovFcGZH4dfpszTxmV9yY7lRS+kYFNpPlgFNfrFaKCc=
X-Received: by 2002:a05:6102:f0a:b0:633:1fbe:79c8 with SMTP id ada2fe7eead31-6c6a7b6dee3mr4688420137.23.1780329471814;
        Mon, 01 Jun 2026 08:57:51 -0700 (PDT)
X-Received: by 2002:a05:6102:f0a:b0:633:1fbe:79c8 with SMTP id ada2fe7eead31-6c6a7b6dee3mr4688406137.23.1780329471444;
        Mon, 01 Jun 2026 08:57:51 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea202609sm96262346d6.36.2026.06.01.08.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:57:50 -0700 (PDT)
Date: Mon, 1 Jun 2026 11:57:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	james.tai@realtek.com, cy.huang@realtek.com,
	stanley_chang@realtek.com
Subject: Re: [PATCH] clk: bcm: kona: Stop defaulting to parent index 0 on
 error
Message-ID: <ah2r_afe1RecpOMP@redhat.com>
References: <20260531131825.2468411-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531131825.2468411-1-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Sun, May 31, 2026 at 09:18:25PM +0800, Yu-Chun Lin wrote:
> Stop defaulting to 0 on BAD_CLK_INDEX (U8_MAX). Passing the out-of-bounds
> index directly allows the clk core to fail gracefully during parent
> lookup.
> 
> Link: https://lore.kernel.org/lkml/177431305509.5403.15386021337517970667@lazor/
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

