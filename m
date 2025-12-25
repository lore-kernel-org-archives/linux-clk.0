Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EB518872A
	for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 17:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766684823; cv=none; b=FJkf2N6BnDETMPEShc52ZUbkCG64wjjViAz6h0lpnEthT8oTFra0VuH04EQfywQJTbLB9hes35ujgLIZ8ltWQ8C6V/gxm5KiBzr3nxJO79eP0i9GfEoy/CIWQY32cRlwFVceRLGQIYgoNwtBNYaJNPycHPJOeIDQokBgWUXTTf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766684823; c=relaxed/simple;
	bh=Gk9zBLBFdeodBkH9ZpjVPzjbpei1UHJVk5RrILCm9Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osmS9ZBkfKVRs9vMcscEOPkiFPrVe+GQDyuuXS+GScQoNauw1S0n4N5EC+/PBa1qqsBu4c1AdXUisdFMjrzK7B6+ZBRPBPEym1060sV2EoG/CQ5R6p3l9jRFscn/z0J2bBex5G0g6oJtTgsKHqrW2kGg6MOMGZx2bDFU+Ep9HE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CeSYSAyC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PkmbQToP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CeSYSAyC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PkmbQToP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766684821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0kJtkYpkUPuI2JipA1QFCVFw9kslwydenMOjeWpb0No=;
	b=CeSYSAyCOafdgXCq2Urnk9kbLtXI2WYC86KBKbPT376utGH5+FcUp/EG49FU3gbBi1Xu6Q
	QHtU4nWB1HHUtzolZfIagLHTtVUc1FGPy7Gno+Zt7z+1mDaEsLF0oyiESkBKx2SIdSV1Wt
	IoMMbbygJBvdK9Qa6t0C2MQGjd64oys=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7--N4zKESAOK-45DN0-UP_HA-1; Thu, 25 Dec 2025 12:46:59 -0500
X-MC-Unique: -N4zKESAOK-45DN0-UP_HA-1
X-Mimecast-MFC-AGG-ID: -N4zKESAOK-45DN0-UP_HA_1766684819
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2de6600c0so1748936685a.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 09:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766684819; x=1767289619; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kJtkYpkUPuI2JipA1QFCVFw9kslwydenMOjeWpb0No=;
        b=PkmbQToP/fi8vRHdinOrXfkbJj/1gmPVoMpHQhf+4TH4t2M9AVemKbB/3LNiF6A5n2
         WWC8HH23CuLBOrPMN2gz7aozRMqvuYwuOVQ3Ooy/R/UCESjva6JLJRs0FixjrjYugibV
         Oh64N1o6PzrZlVj17FdAGZ30gPtGLqnX0kNbUEEoeDC4ebA4tmbhHtxoMDXF8eoQzLlJ
         N128eJK9SYuQV9/00W6n5BYgBP56yb0qaDb1el2YSDdNvZS0BRdvPEkqsR4Ip01Z5XEj
         XBpKzyIWUBOw0i11lyM6N3ArI8UfjGVtNdKDLn0kBmr8qWyVLVBLYoq+AQsPDPk5iOpW
         vdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766684819; x=1767289619;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0kJtkYpkUPuI2JipA1QFCVFw9kslwydenMOjeWpb0No=;
        b=cvA5gmfGJyh/AxCZi5WXuwZCRxX7qrqjCAqv9EZDYJG4fGiIo8iYs2vFoe7ggKOdnJ
         JsQ6qkqg7Rkq+b0dz4r97DGJFryE1fUZYY94s7buSJk4HRwPdUOA6eg0oEWazLufxQx/
         UzdcjnFiNOC2XJdAlVf/U9lB0aEIPHOYPMBbNTd2AU4ucBDCsT9G275fS0Dby42T9z7M
         AFzMq2O/gNK04zLpAmmsxACCdDaKoaNbNNAEnrCvH3TP1Ph7fjA/SeeElPfljJ0OUZoy
         HE6Cply4Piv1YkIAPVz+XPRltl42DQZl6xHt1Htv5EHybS7PiRKrfTWW1fquykghz0u4
         f6+w==
X-Forwarded-Encrypted: i=1; AJvYcCUpqwBV8DMHNZBNSEF9Qc1VvtsV7xmntLvQMCc5uPv4mq+duU4d7mwr0ino+ltCXCQjazBOgP3Xkdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxynuPLBzg1nAGuy0qiv1PMcesEkigUwZeqnxMund2QFa0dBLaf
	MdfXy0PWZYkit3oOwoAcLw/ZJoNsmtZYNk6IG3MVI0UV7XoON8g3ABkAkNLrvCeHaufMfTyrnWZ
	RQCZyEIxhXz950bDZo2FK4vbWgPoqPNgUkhQEY8rjPeEmNpT5ua71PuLUoGVCEw==
X-Gm-Gg: AY/fxX42eYEvchGCp5Sgtef+ItA8tYVA0FAIjmCP0lsGAllFAIGbgrCjco6kNDNhstj
	/y3JOgMYOcBX2nG5LO0ljGs4Sc0auApyYNdg8F4rVyjv18tAzeruM7bJz4E+3cBOrZsG28fHT6i
	isqbV+y0TXf75OJ7d6DnboSBpShbla/FSu3ShuD5ZD3VNbrz1WcwALEa5ObOS5xJSYZM0vPCv9Y
	p1gWkEBxJ5AQvh5Hkt9gykIBwmH5K1FYT6XhXMdYPwrOKJY23MfmC07khdCqGu+i5NWb5xo29Lx
	XCXmqIsQ6eJcwIHfcC+YWDwg1TSlNXEAIpFmGgIWTDZPbVQ2KUPYeWnqp8DXHWnZM6N/KiknclJ
	DAwP3q/y+MXnYQ2Bkj7ssPoPAFdMJ344TJnrmJW3CCM4s
X-Received: by 2002:a05:620a:4109:b0:8b1:498b:77fc with SMTP id af79cd13be357-8c08f6742f1mr3088094785a.33.1766684819228;
        Thu, 25 Dec 2025 09:46:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7WXmE0cMDSwpEq7NOgN64FHK9QeM+bXc3yG0olFDRDC23yLs0+NqXOH85EiqPqZlaeHq21w==
X-Received: by 2002:a05:620a:4109:b0:8b1:498b:77fc with SMTP id af79cd13be357-8c08f6742f1mr3088093785a.33.1766684818831;
        Thu, 25 Dec 2025 09:46:58 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0971ee247sm1538002385a.27.2025.12.25.09.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 09:46:57 -0800 (PST)
Date: Thu, 25 Dec 2025 12:46:55 -0500
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: zynqmp: divider: Fix
 zynqmp_clk_divider_determine_rate kerneldoc
Message-ID: <aU14j4Xxes1BJLob@redhat.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Dec 24, 2025 at 12:42:11PM +0100, Krzysztof Kozlowski wrote:
> After renaming round_rate->determine, kerneldoc does not match anymore,
> causing W=1 warnings:
> 
>   Warning: drivers/clk/zynqmp/divider.c:122 function parameter 'req' not described in 'zynqmp_clk_divider_determine_rate'
>   Warning: drivers/clk/zynqmp/divider.c:122 expecting prototype for zynqmp_clk_divider_round_rate(). Prototype was for zynqmp_clk_divider_determine_rate() instead
> 
> Fixes: 0f9cf96a01fd ("clk: zynqmp: divider: convert from round_rate() to determine_rate()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for the fixup!

Reviewed-by: Brian Masney <bmasney@redhat.com>

