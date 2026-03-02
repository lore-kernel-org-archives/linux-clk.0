Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA3F283FE5
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 17:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471288; cv=none; b=DvdlReEN00I0NGd6M0xH0WuKhJFgJduAsz/orQSvcmP/oivQLUwptApXb9xZDOegF8aJBcXJ0KhualVxylcKZAKrr7hQF9FIGke9i6FY6MeatrRfQZJGYUX3MEcY0aVPGXXH8IVLgNOtkQ4GEFjWS7At7mht1WV34HkVgylqZEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471288; c=relaxed/simple;
	bh=EE7A7r52l/m10LhtXfpLL33RfDMVWAzlQYs9t7L0ma8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpcwSxhFAU6MlLKgI7yWGpHS1q5gbInBG3QMDntVv5kEro0AkpqLNLLWsxO/c3cW9mkT1qwXq+QWh/ZaaYNR+DGX+HkLRLU0Zuk1m4bN3VkoLrB6FA1hjJI8TvmIoiB+I31Ucz1PTEgC/Abis7cm02R40y9DuOHSgtjz21unO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YnHFPXGJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IdiwRi16; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YnHFPXGJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IdiwRi16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772471286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g6brGvw3JACE3nh9BUDtId9Pcx2DeTaNYx1CllHdzjc=;
	b=YnHFPXGJDU9yof+QT6OuSyX10HcSxdrswfe0Z/fs7JGmoAUEQNYKMyI/oRU7VxT/qg0Jqq
	LSvnopkFXWOjPhR0PA3oVNuuUw3+ddCauwcId2ksiomU/8agDx9h/rVCN8jcSRfcNWtfgo
	0SbT1JFI4G1uHz94j0te9tmsFyDvNKE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-qvyVp0opP0a7AyysS_kxUg-1; Mon, 02 Mar 2026 12:08:05 -0500
X-MC-Unique: qvyVp0opP0a7AyysS_kxUg-1
X-Mimecast-MFC-AGG-ID: qvyVp0opP0a7AyysS_kxUg_1772471285
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3ff05c73so3365411485a.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772471285; x=1773076085; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6brGvw3JACE3nh9BUDtId9Pcx2DeTaNYx1CllHdzjc=;
        b=IdiwRi16INKvOFz3Nn39xb3Z3VZ1ugkBwTLGTunzH9lpImcuvPDdOA64U/E6JyR+hL
         P2x5jrFnPtkUdagjBmPyVHXxIJ6qAHA053/zPTN5mHvGfuKlRpGPkSAfLdq1wfi+4vbg
         JjTkNLKp9Gx4sj5Ybqpc7OUOOknGfze8gnk200Iyl5tzsCEZ/AWr7mxLPgHxhsTzZ93G
         l6IFsNPRp0Hp9eLJlDOxcKru3VYFQvROqanD79k//dQBEzzIpEThig/2Z32QKQXgcL9c
         tUwKQbcXT1oo33kMNREzffiQxgSHPyJiPY7M52+6tOhh919W8sZsTBDcUzv8eiwf+0Xx
         Q3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471285; x=1773076085;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g6brGvw3JACE3nh9BUDtId9Pcx2DeTaNYx1CllHdzjc=;
        b=er6x6sdaHCpywvidqgncpGKvc/8wTxzUz2i2MFpCNQnFCPcwWPMe7gNbl+18YaV2wl
         y7isWSRKai5i5V3hhP4GrkuDfkVuKiufYLxKwGDy5BzTPOGrDczbJPkscEUT6tRPSR/m
         tRbYMqdE8CqK+4lam4xYoYYx6r0ULu941n+F4HA1XOfvYboGhYh4WZId2Zcr8rYKwrJS
         xFa8HT24G+WWWtkXfVKExEF2L6+jjSvAWrfxAG5zhfJQG8dE/YgQEotGURcFXBvBvlCT
         kPqgMet9EIXH5rabFts2IwH/MVvSi7aJWIBOn6wqclzYQ6H8u8vfNkIIsHrw3hWrApu0
         swlw==
X-Forwarded-Encrypted: i=1; AJvYcCVv/AWfUpne/8Id98JDGaRlQXFG9U+9wIn1MuO7Z/HvjH0WK2ksYMfKVE0u1hJ14ZFjmYpU1/GSS6s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2lnBzcVzoTIME+d3RrfGqIc4xq0yrZzexszc3OgPu22FhDDM6
	rbJ14+SBfuqL2KSyqh9IM03M9wdnZxobdymkGkJndtVPbiC4nJB3ASZ2rza4cq7Au6Gxq7uus1y
	6tiQqoOee6dp7aV9OcZDWsTbI4DR5wiWGAMdmTnBcHvuCmnNL4+G7FQqafbje+g==
X-Gm-Gg: ATEYQzxCvVpPAJ0ynRSq90GybtCfFgU6g7Sl4c4YXbbwjRdIIKSgY76zA9CczrM+6mY
	XvvkaXsKEYSI/45k8n8Obu1+Qhf1+yjNK1km0paKDjq1+N1La8IdlkMBtpucD4q0GhzWHBM8bW3
	XB9m7Dc3BqUcR9NCne+y14n2khpu3DQIHUB4f1a/VljFsdt2dllmq6dD66xpotEa31Uof1wDSyZ
	lAdU04t3WzEfZUiJkKYue8pUbOSJbeLqs0N5/8MobxhRBCp+aiNnYPP84kk5FPSpG75byolYv72
	y466PpmVg+OC8RheB/2KhfvIXQ05Iu9cj/Oy2F3gU1l12opCG4TVwmAev03BM1sjBiZPaJgbQri
	OkMUiXhqp+816w4V02OgBWsMtWu83P6x9+UKynIvdy/rwioXuLPQ1i4cI
X-Received: by 2002:a05:620a:444e:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cbc8f40abdmr1511585685a.70.1772471284574;
        Mon, 02 Mar 2026 09:08:04 -0800 (PST)
X-Received: by 2002:a05:620a:444e:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cbc8f40abdmr1511579585a.70.1772471284069;
        Mon, 02 Mar 2026 09:08:04 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf65921bsm1178674185a.1.2026.03.02.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:08:03 -0800 (PST)
Date: Mon, 2 Mar 2026 12:08:02 -0500
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Kyunghwan Kim <kenkim@coasia.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: samsung: Use %pe format to simplify
Message-ID: <aaXD8h4cuG8I3Bh2@redhat.com>
References: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260226205445.336839-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226205445.336839-4-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Feb 26, 2026 at 09:54:47PM +0100, Krzysztof Kozlowski wrote:
> Make code printing pointer error value a bit simpler and fix coccinelle
> suggestion:
> 
>   clk.c:363:16-23: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

