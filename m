Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FC73DEAC3
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078075; cv=none; b=IAJQ3IjQxNqEBL5q5arSkyvWHxwS0FzkFJmIzuqimHa3w0WUdG497OUnCYLzcXDGJ+iRcIq7IDEWQaSzUD4VGDgzMhTp0E7jY8MZejk99ZpQkmKvbx3+KpBhUHIvfVL41AoA/0dEpQVGIgkEGIMQXveuuubMCVIavZcP00OTw8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078075; c=relaxed/simple;
	bh=pk0SQXMIBv323itTlK6HI/JmGOOs4oiVdYUA/gYIil0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDknRv9sin6a3XGVM6vNlXUDEuBoAr+9rbFbIaB8fbS31o/Fq0r6B//zDMmdioJCBEgxlxDG6J8pSE7i9RNDX7IOiYSJ/DXTV8mselosJgmjcMvOoluaDGBFBz/HmAQB+8JRznnd1yMNifeIGgeLr1PzGhOicUAvPipOBhgDTgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HJjcLYIl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e3aFkl/o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HJjcLYIl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e3aFkl/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778078072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WcZHEpBYmvivsHWsr27bIi5qRmMv5umj0vIx0hIYymo=;
	b=HJjcLYIlR++1xLi0Gt6zUULZhFAwn1INymoqgsYbVNZkCgs7baHK0/V+kxUAlEtQP3zbB1
	73MN1ey7OOc6q57RcUnS4xkCRblI4OTbdTAMt1WZIMhOYf6lovbQ0ZGJSP+zMeC7OAHuI/
	U649JOalgV/ff+K4V6uGLqoK5cgWrrc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-v0xAhSt4O42jkl1IpTc_yA-1; Wed, 06 May 2026 10:34:31 -0400
X-MC-Unique: v0xAhSt4O42jkl1IpTc_yA-1
X-Mimecast-MFC-AGG-ID: v0xAhSt4O42jkl1IpTc_yA_1778078071
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bcd5d5cd00so130844787b3.3
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 07:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778078071; x=1778682871; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcZHEpBYmvivsHWsr27bIi5qRmMv5umj0vIx0hIYymo=;
        b=e3aFkl/oG839JZehdYHQ3RHqBzLCbMYoH5x2o6MyH5hmJGv+TYsYNc4lTL3feydZLF
         8+uSyuH3uwUPO0UyGPwy8eWYJ2oUGzR0gXFd7NoBgCEvHLVoPLHjD/RlF0Ct+LBsJDBy
         jMAZftaic/ruH9Xjr73KB73Mjixtmhp4RRWzGeA/G4xTpWPzEaB2Jjd9e+6AW6TkytjG
         ZkyqmIoTP1KO2++ZbF7LsFLQzgjW+XJI1pDKS5ubbuv4qgW7ZfJVAoNx6cxUfnjBtHc5
         /HW237rpRCLPf6ewpGP1BWz+yVHSdkwpgs5LNN8nmUvfLkwppMJkWRAdVM+vnL2EBn2F
         vOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078071; x=1778682871;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WcZHEpBYmvivsHWsr27bIi5qRmMv5umj0vIx0hIYymo=;
        b=O86lC27m0kGL8VOhUDmvIDqnuEX6SGcSyhHoFDHqskRT3Rq84hICvtusBaCTY2ZBBK
         0qWS3HUKAPn2C9ik1zM3TQR+EEkbeGUxxl7cW4Xkl4qGab9UzzJ/vKoYB3U9BKbBgu6m
         3kayaZajOcUjISRNPIukTzpQjNrNbgJX9LRzX+lLqOzuyk1nk7yJPYhCoyc6iOoCyY4f
         4xXQws3zortJj8LKYxTNDd5dDkQw/BU2Tfy+amxnk1W0HESbGm+bPZUk4ohxdUyvka0u
         KcQcz7W8Woa1QwgcWcPUnalqGqFEFyJgi/azyy9Pa71pY7klGyOEDvH/Gj5CHeqLKS50
         pSgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uba5BRuYEGVFeu6aGdiXNB3I4zMXopeI0x0OY5qejXm8maZaL7tEMs6m48A9V6Ee/xhZtHac+21g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzjPuMh9rZ+Jx59LJQU+qm2QBAsgLMXQt9K8gmUFUn4oMPIYTc
	NyzShnAzTj0yXzPjrzLGNrdINvoczfzgCr49rKjIBqJtb1paaVvS2Q4E/Skdek6LwBoQsiiQ72y
	eu9hrrS6wfxiVWPCTkhhi99WF4LMXJyChCSzOv4uz2WRfzeSANmlPtqBYbHvRvg==
X-Gm-Gg: AeBDieuZ4gdYMPD4U30OmMt92XBBPROe/jRjHyEDaoXlWNttwVX0IB6yM+Ttmj5fD2Y
	M7WxFGx/KtevAOaopZLKfQx2yLhEROkCLm+RziTKFJtn8k9xwDB1MDBWL15FDeojvQfgsu/rD2J
	PMgAhi1IwC2daCl6/NwuRtl/gXAUoLLk4MIFp7+SRATf7f6d5y6fxeb4lSm3h1MNRbAQTG7I8FW
	nQRwVkPDmbH6ls5k2oqLgj14Yrj2t7iuIeCV98eIGRji7cwp0FKruo6O5oRyDAl1hk0RWSX1nCj
	ovxFuc7e+GaEj2TcLmkYDX1FjmgFOwKYkuG6BtUcyKZ6Do7x8VslSM99RpFmixKwgbDGiqIECiS
	Js01+WqBqY/JDg+X3xwXvikmUfaIG/VYhqA2H/x4If2DZQHEDBoOh3f7hOETu9hArdsI=
X-Received: by 2002:a05:690c:4b87:b0:79f:7972:f89a with SMTP id 00721157ae682-7bdf5e7fc11mr45199917b3.28.1778078070959;
        Wed, 06 May 2026 07:34:30 -0700 (PDT)
X-Received: by 2002:a05:690c:4b87:b0:79f:7972:f89a with SMTP id 00721157ae682-7bdf5e7fc11mr45199337b3.28.1778078070442;
        Wed, 06 May 2026 07:34:30 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b5391e344fsm201219216d6.12.2026.05.06.07.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 07:34:29 -0700 (PDT)
Date: Wed, 6 May 2026 10:34:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 10/15] clk: samsung: acpm: use
 clk_determine_rate_noop()
Message-ID: <aftRc6JOTHAKbt4C@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-10-f3f829fbacdf@redhat.com>
 <abd89f01-f079-4ffb-9719-575ea5e30add@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abd89f01-f079-4ffb-9719-575ea5e30add@kernel.org>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Krzysztof,

On Wed, May 06, 2026 at 03:47:33PM +0200, Krzysztof Kozlowski wrote:
> On 06/05/2026 02:49, Brian Masney wrote:
> > Drop the driver-specific empty determine_rate() function and use the new
> > shared clk_determine_rate_noop() helper.
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> ...
> 
> If a tag was not added on purpose, please state in the patch changelog
> or cover letter why and what changed.
> </form letter>
> 
> Last part is important.

Sorry I didn't mention that I dropped the existing tags on the cover letter.
I felt that it changed enough in this version that I didn't feel
comfortable preserving the existing tags. The overall change is very simple,
but I didn't want to misrepresent the new work was reviewed by folks.

Brian

