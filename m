Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71482FD681
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882213; cv=none; b=G+y0ABlR2n51X3TN6uZ2ewPgPZE/2MF4yaFMX7CfTYNiXcTebm2bv/8NPmfBrhgPVl8pN3IUjfTL9pWbGkVRbrfJQtU8Bwi1do+1Z0MX9FbtH+sZqO/Y19SSb78Q4lvHK4cabN4GKsB2XW4D7KbsSMXkqw/l23RCjz0+1FvQqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882213; c=relaxed/simple;
	bh=i55soKzyISPt6SeH7DsGUlC8BZVaYjKOR1DJ+cOhbME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/9rwkXbbXg2yJ8mncBMSTK+tBwC19dxcnzCSKbQ+/e6Dpjlr37437JG1128DFDgsz50C7mfjBn03aAJ11nmoGk1gXFuSQPUkOywINr7LzqHZMI5j+F2nEOTffyKq3sUncOl87S/r+Pmb4xHRm0XStwyT8LRolt6c2sg50vvcZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z02kSmB6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g2v8UYLc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z02kSmB6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g2v8UYLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774882209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ViefYB5GshkeJmDcmhUA4DB9x0JbvREJG28E0kRCIFY=;
	b=Z02kSmB6KITe+kVHeUWoWHI4eKyVfgNu7vaj3kh2U5HTnfwwbkHLo/SKTtwPnmo+1Ida58
	CGUcCQvJhkNsr6icY8Ig+X5eYNCI+J4cgkO/HlVMIzyU9o8M7BwNsC4HexRxusGuXsfh5h
	37VSurN36SpoET6nzXO5Hnfr8D3/j8E=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-pb3ag2ghMzeH5jxlV-YVCg-1; Mon, 30 Mar 2026 10:50:08 -0400
X-MC-Unique: pb3ag2ghMzeH5jxlV-YVCg-1
X-Mimecast-MFC-AGG-ID: pb3ag2ghMzeH5jxlV-YVCg_1774882208
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso57113011cf.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774882208; x=1775487008; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViefYB5GshkeJmDcmhUA4DB9x0JbvREJG28E0kRCIFY=;
        b=g2v8UYLc+5lUZCbeGy+3NZsYH3sOytXJMQ2BqC71X0KlpwQqOxvncJN2bH0EruVysw
         pyhHNYkzghXlYdI+hm8+GSFgMDGQaoiKLxPP0SjpKwqBZkMBSijkStHADsoiSzxcXuuD
         5VOSaFjOgdcqMBJFOcrywA0p8Oj+D9TSerTqHgkvjg+px1UZJLeynPaRE7HT+v/fA61E
         55WUkjRq8oZjxQ9ch+HAwvhuC1u932bN6sMwcyxVyXBUcVN0aL4AtddDhJZ+EEMUIBFJ
         4tzjfAk7fQuRLaHYDPwFt6wdKn1Jo7Ngz2hbtHq29Bg7l4oYGQBbkek0jG7J7WB/+Y85
         Im/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882208; x=1775487008;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ViefYB5GshkeJmDcmhUA4DB9x0JbvREJG28E0kRCIFY=;
        b=f8Pq5wEBDk9MycFONY84A0SHC7CBD4Spp060dxrDiiB8mukOYKnfrwmErdzyIFqEcH
         WGW4vTcEX5OaVa3DCBsAkpsVPp75ypBLF2tqdwHek4S3q0RKgNPnYW6vse+N+bjL3sO7
         LR8vOGqIe5bDtX5Q9dgxAYjuokm4cempxWyNEEkSW1r0bZqkx/ujk7qOEOfA1hAJOxZ3
         hg3Dr3ZdFRAJDELowDkD4tLjl6l7BvgBse9swQ8vH9uoISvtTLxaytM8Z7FDBHIUtMt+
         jnvT3jq5rs/RCK3KTuyGxL+rokWVd7z1hWpbtjPjj3Axs2374nofBnlixIMCpvq3B0GP
         3v+w==
X-Forwarded-Encrypted: i=1; AJvYcCW4oU2xqq7Exo0/cl7NYWa+ghtt7FHwlSaxoepRqMqcvp6BP9WDmJ9vOwvRNYB+KppOwfMOIV2xIJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXQFJLa87QAQvzYNg2no4uv3ZSJ4h6zF5Zt7wjNyvUp3KiaBNb
	+lNrTy7Kl8pgb9IOp8Ll7Y4Vg0vilR07etVa8SwrW52VnGwjN+vN6OHDdFkOcPTkINNyDmotqX+
	8XpevPrH8jqHN5ySe8zhaXfDHOHCFzSzmjMQwRvkXOj+g4wNa0lN/CQJOvKHl5g==
X-Gm-Gg: ATEYQzxsbXmcTlnLmMhbNyKp9SXpQZjtzWYptLP3+tVBUigSvp4wB+QiRzUSaEx/28k
	5LZtknMYgIxUIVa0s5eBQhfGyeNwI/zDw6NgBkl/zJGG36h/EWqvlITP1Gwlrzxz5UxSUsUwz6Z
	xtMIeR6NVYC4sdZLdE4YrUpK7A7KyXAD1TjwrEB6FSFc5SJYDrIrU6yIWvDYrn0RdKDUV/E5aJj
	UNGZGfXLlGL+yBw+RSCktd18sL9mUPPXHWELEkvtvGdx/wP6GkJbb2YKWhjSnkYqeWGQwJ5gxKT
	Ly8x7OPm8L9COdERAmkZqIVeQc0B6+M+FYjM+kVFZP6OuLfxE6m/z4VsTXGbDpXrF2NlVuxbk3z
	gxqYUmBJfdmRSayJAq7YegZuSvBYErHfe7do3+UwnZzGD3lmo+IKbgMHt
X-Received: by 2002:ac8:5744:0:b0:509:45fc:c88c with SMTP id d75a77b69052e-50ba3836f51mr188099611cf.19.1774882207687;
        Mon, 30 Mar 2026 07:50:07 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:509:45fc:c88c with SMTP id d75a77b69052e-50ba3836f51mr188098161cf.19.1774882206754;
        Mon, 30 Mar 2026 07:50:06 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2e3ed5csm72731181cf.27.2026.03.30.07.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:50:06 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:50:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 08/16] clk: Improve a couple of comments
Message-ID: <acqNnIJl2PxEcxj3@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-8-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-8-5e6ff7853994@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Fri, Mar 27, 2026 at 09:09:30PM +0100, Miquel Raynal (Schneider Electric) wrote:
> Avoid mentioning the function names directly in the comments, it makes
> them easily out of sync with the rest of the code. Use a more generic
> wording.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

