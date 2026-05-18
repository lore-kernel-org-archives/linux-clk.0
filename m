Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E7248AE2B
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119627; cv=none; b=QS8hd+qveAO9HbSTuhrN3dzr5LHWRbkUSlg9eh1c0fEVtkDidjX7KIjNcT9OkLEXNQkmQBREkMazT9AfvMQI23CYS33It4YqORWkqvOMWO7wB6p6PcHlY/zBK0ZPCESFLYHFPlB3Fd3ZCymzOxrdVBhFTQeJ8DOPwIqqBHV8nC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119627; c=relaxed/simple;
	bh=S6SVBqmcAvHY5nTiiDj99x5B0CqWbX8RSys9dvTwzVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxoJNSJh90dXKxlLpPg1fsklg9zjxFXkx6BNAU2/wwNBQ38AUeGvBKln7p52mZUQeZn3GQWVdEAlJjuskA6sXqHsO14KvvnveMOaUTs8iFZc8G50rrXfVM78u8h5uyFkrWqJ5SYS5a+tbF37IVm6ld9AyQBhseY05hrRuLt/0w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQ7bh+mo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tgzJw+j2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQ7bh+mo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tgzJw+j2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779119611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZCyUkEWRjyv2fKKDGGvW1Vl+jU51oCsDzDIRpAen0g=;
	b=RQ7bh+moMkw53Zp6BGT83GdRXXX+ylEzPm5FFrcD3GId7y5cGoFy4mgTWUNMNjSV6Zxjzn
	bMzJOmwr3SGTqZjpjBGKa1nSItRspyLcgtSnsaFXnN1vm5s0fzBVLpyyeBX1PMxgNYJFSP
	w7kBN6XMcxsGIQJim/b83AAEC4dD7lw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-j2gClpqaMyKuYrsjLc8bTA-1; Mon, 18 May 2026 11:53:28 -0400
X-MC-Unique: j2gClpqaMyKuYrsjLc8bTA-1
X-Mimecast-MFC-AGG-ID: j2gClpqaMyKuYrsjLc8bTA_1779119608
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8baa173eacbso39897146d6.0
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779119608; x=1779724408; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZCyUkEWRjyv2fKKDGGvW1Vl+jU51oCsDzDIRpAen0g=;
        b=tgzJw+j2vhZNqmMa3hG500Ea43o4/yQMZlOHrwfG6AEthEPZRsLiP8xp3s2EbpM7O2
         1L2jqMfsC7LeCWMfE0gekaQdqnBPjdzx0pCZtYFOM9qvdbbRPPB8qFe1WHZuY66VZV2y
         UlcfuuDAPsj0+84QLv2U3m5wcm8XhMFmGnf2nLVlO1msMhFXuI1c2F0rJR8JSIRz+UCp
         iJ+lkW41M+nwLAcw89pzD7x0RZkWH5nAhduKDCwmSOdQasxNlbblmaoFdXp2e1wWWXRw
         F3jeP2RZC8WRoWHBUIXxmzdQNvmoNgGboNvlVnXALoKRUfd0ghyzJt040F/czwDKCgc6
         z0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119608; x=1779724408;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wZCyUkEWRjyv2fKKDGGvW1Vl+jU51oCsDzDIRpAen0g=;
        b=h92H/DgAw9jJKnQpW0NjnjR2AOYh8ol75yMqPNR9r7M/36y2rWOFRHpQPV8MAOXxP4
         xMry2ou/BnP+tc1az97UEXwC4nRFYMDlyd8eIFEcc1ZwrLbAWPDomFR09x3Z/nSvviVX
         /o1wjvnAbKqQ0U+Y54tirUGO6QXqi4hmvwVtqZ4HQERn0lfIk4s8MyPsy48LcYISC8Bk
         +Dx1H/njYE22FnJnocyDHw13BjQ8YrvhiVZMIOIb499xosVb3MoQZXBqFyazM2wPotvS
         2bcHQbNKui8/aOF0wdtrR0uE+VaXVHysxCRHX01rAJeHrbZ/uvwcQYmDsW/Y7hX5SRCo
         zqSg==
X-Forwarded-Encrypted: i=1; AFNElJ+tKbKE5Ij5NSKWZ6jWxx0Dk5gTGL+ethYXEvDE10jjNMIUUtpdU0pDFB6HkOhFUk7cN8AV9wJXYwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcS3R/jIxje9D9UQ8K5QGm3ennRD1nEo6uFDaMbUxjH+4aj7+
	JrQKCy+4n1aoIHvRrzxlVGVNgXcW8oE854kA2w+7My0iRwsmVEIUgtskJXHk9B9ew0ZzT4eo7q+
	rZUBP4qEq14BBQIOrAidcI24go6eno+IhJi94/7AUi3CUBzImy/ORcNyQKsZT+w==
X-Gm-Gg: Acq92OHj+ORFZs9EvP+ZSRLALwG6gFMcb9rRHxsQZwKkIsLucBkjWxLVNI44IHPWfwJ
	BNJxf4occJTiLsCgFYB/m72Dwab1k/DqaBA2qb5yjP/ZaUW8XW/6MX7TFfK/HB6wINknx3XFyfc
	4cXJJPNGH5NUEcOUDfz3uUmVu9anAg1HvvMSgYpdx5CjMJKwCl5ASSyZwQCY91ExqJcCYXdeMhh
	d5WTC0m6+BEI5mRf0FRpxIW9RKINkIE5kf+fk1tXsbhCD36lgjen2/uzd1iNWzPfLrPMBkvNOn0
	fn/hYFcDLTJVq774J7ctPJawe4vvE+9yLojG+fEKiq5RnNT1AesCwkV+SwLsKmuIXIk2bUIu5gY
	HXZFXIWP/gHwhJBFJ1i8sg706JitqDcS8Dj3fctWXg09XrHG+q9CEFSwb
X-Received: by 2002:a05:620a:4006:b0:8c9:fb69:e708 with SMTP id af79cd13be357-911cc6aeac9mr2295180485a.25.1779119607770;
        Mon, 18 May 2026 08:53:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4006:b0:8c9:fb69:e708 with SMTP id af79cd13be357-911cc6aeac9mr2295176185a.25.1779119607260;
        Mon, 18 May 2026 08:53:27 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910baf2236fsm1529569185a.20.2026.05.18.08.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:53:26 -0700 (PDT)
Date: Mon, 18 May 2026 11:53:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v5 1/6] clk: correct clk_div_mask() return value for
 width == 32
Message-ID: <ags19ABMNAgtao-k@redhat.com>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
 <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Thu, May 14, 2026 at 05:27:17PM +0800, Junhui Liu wrote:
> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
> 
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
> 
> Fix this by using the standard GENMASK() macro. This safely resolves the
> undefined behavior on both 32-bit and 64-bit architectures, while also
> benefiting from the built-in compile-time type and bounds checking
> provided by the GENMASK() macro.
> 
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Brian Masney <bmasney@redhat.com>

