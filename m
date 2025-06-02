Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414622C3258
	for <linux-clk@vger.kernel.org>; Mon,  2 Jun 2025 16:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748882559; cv=none; b=rakFBpFzvuYOTZ7AWHYx6uN0pI1E8fSBmLqjaVr3ozo90t1cxuZxipGGqRc1ITbBFDVwX6hI1iU3AWhvQLXtjolEw53v+iSNah3uF2Bjk/cHMqYDo1rtrjbiwD8LU0GpL/GlbB6GU52cIozTtdPt6DtpUkIuFvXcBhr8qmrm524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748882559; c=relaxed/simple;
	bh=BgdhpJZ2fQ3foLwOY9NyLQsZlsT3hmvzC90OuJGB8M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXiAEbj1a9EQLmhijQ5sQnSJKaMCp3sj5ALR1/HF0E3DccwLTYwX6k6T6aXwoNzrOC20art1geww7yby0qthzrWbVv82SDG6DXqmX1eM758Rmnpf3lPrfgoM2ulpWKc5zOmuWZPun+bMNJUwDc2wMQiux6E/oyQABGCaworyR+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ur/C6OnL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ur/C6OnL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748882557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RG6vQnTXIdy15ySbkmQBFYuQQUnIkIj2HwDJ/GwA2CY=;
	b=Ur/C6OnLmQd0RjoUMbXKqxdlyvVTwBXbzQvRtCEPwJ9xMS3+sK8sJ25r34Lu+DqA0m8eiR
	Vjq2J9oS857UorfSAAG9Ct3nXo/EK7QcD6nnHs+M1S/XUOG1R9brJVs7t+CTDOWpGXbnEn
	I/aZ7Q4KljeLs5zhmq5Ltjb6vApnRtc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-8bZ23QPCMMOn4dM1EvTaAQ-1; Mon, 02 Jun 2025 12:42:36 -0400
X-MC-Unique: 8bZ23QPCMMOn4dM1EvTaAQ-1
X-Mimecast-MFC-AGG-ID: 8bZ23QPCMMOn4dM1EvTaAQ_1748882555
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09f7052bcso647739285a.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Jun 2025 09:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748882555; x=1749487355;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RG6vQnTXIdy15ySbkmQBFYuQQUnIkIj2HwDJ/GwA2CY=;
        b=VCh9gR1envMWG2MZB8Stgu0LeB49B92Vq1hw2SiC7i6PKFT7lrVdd3ebFAZVQ13Cp6
         AxO4GhjKaZHEopC0Xx/UL/EKwEl11vCC2o/vWqMJn6e7qp9vZ8XfiaQqTiOJxBmtWTqw
         tcAA4rw54l3D2Ib7LWBa3jwGXOjQZNXv6sby9lO1bwHL0jmRpwOCOUC5oEfHKjZbdT1o
         hVISNSXeBzYKA7yrQXQs8rslmNv2RlKVm6cqY5WyiK67AV6VCgdPWAj0fWq6anRbhW8v
         E8Uz5QIgY4bkLLjEc5RscX8ndAPOdecB1PDd2ZMjUDt+ac4gTkAhzGiNbWQnaNZI6yiP
         AE+g==
X-Forwarded-Encrypted: i=1; AJvYcCUshjzbpWFhIT/iMbyglCLxpnyh9HRxgm1her6YBfz6ZPi1qwPRo2mLy4ihK7gKQYkX/ZHY0wM/kgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgECcPt+Xe9+hCwNG2yvRYzfBkpHQNbv7e2Bv671dq2NHDHaxG
	jsTFKHiMrEhzn1JbEQBJDwpKqoZ+zmr1GL3r5vj0jJMufCynPU9XM3GNTQFUGjyM7whA+0YVbw2
	qkIaINNyivrsTE2ew23VZuxAf2TlYnZA2aZVW7PFoK3J0CTku0v63Wd1MqKBezw==
X-Gm-Gg: ASbGncuD6l5nbU8Tq9YrbEPE/iOywmX7bTk3AYcG/Lk5R+8+vnvpM3ndfujcQKIGRRz
	7nVqAxEN9thOaYvT5jaCZ7/KGwZcXQhPYnFInYEkgrs+GNZBvWQsmN3FxpIeVrm+gRgCFHFV8bP
	YAIVEriczZUR6MII2a4G3VJbeL5oCZYqOJVileM8mrfCCWfsyhnRjspK3Lum7Pd73nGlA5zHi8H
	av5oZdb7zzFkXYYEdY/LbMnRoxj1C+zSA8ivnWN9vHI97Wd35eQjkiHeABPNMubB1tt02Isqi9a
	GOTOxYC5iIlqlkV/PRM9BLeSprbYMCFimv0=
X-Received: by 2002:a05:622a:4892:b0:49b:eb1d:18ac with SMTP id d75a77b69052e-4a4400c9d4bmr223613321cf.46.1748882555426;
        Mon, 02 Jun 2025 09:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENRw+QqNZI3Bi5UrA5ie1HB+zDvD2vqTFq+6w3eusJ9qqehySX6Uw9UO8GHHB6rRtWVJmU2A==
X-Received: by 2002:a05:622a:4892:b0:49b:eb1d:18ac with SMTP id d75a77b69052e-4a4400c9d4bmr223613121cf.46.1748882555102;
        Mon, 02 Jun 2025 09:42:35 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a840bdsm57531601cf.77.2025.06.02.09.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:42:34 -0700 (PDT)
Date: Mon, 2 Jun 2025 12:42:32 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: add a clk_hw helpers to get the clock device or
 device_node
Message-ID: <aD3UeFYUngs_hdmg@x1>
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
 <20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Apr 17, 2025 at 03:44:22PM +0200, Jerome Brunet wrote:
> Add helpers to get the device or device_node associated with clk_hw.
> 
> This can be used by clock drivers to access various device related
> functionality such as devres, dev_ prints, etc ...
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

