Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE919331EC4
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 14:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607052; cv=none; b=HqNkKzkN3IvTkGQ2a7aGxc4nz9EYGuc/L+hCqri+SNca8VSLXowdxXl6dsfu9BKypAF47SW3EexOqRUxL6J/MUTC+5kKNYg5qZRCe+IkakJA+S4l6sIHVoDrToLKhIDE9O0UmuFSowIs5nv05kchIqmXkRqQ0R0XWP6iu32N7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607052; c=relaxed/simple;
	bh=H/58S8xtc3DqTmrpTgSLBSpHd4+F0iyFIRuxJ/sA9tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moUiAayn36ybPqgtc8GNfHeJDVxTgWVbGgB9P08Dn+rHkjDddV0VVYv9Ibm0vZX7f/2g/I6srDfLJJKgLjO0wdYnw0a0qT+ZX7D1y6//u0g7I6O2TFCK6hVdNwwXNWgaZ5WjUQOgdhXOj1yOZrBU7yDqYSK5RxlUPee1VwG+x5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fUanHYy7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=l1lnFmSl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fUanHYy7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="l1lnFmSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783607050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1C0dXpz7AWQiPJGGV2R39/aRuB5qt1XtWGhBi3VmSQ=;
	b=fUanHYy7e3iqvxZcgOmxD4QNZgxOG3mWJm5j/d0MpA2sy6qgR1UG2boNq7ambwlJbegd2i
	MVBCPVbJ9JPO9VH+yPHZDMG4P+2CP8IF5E9kZk0tzbzstqMJnUiAzhVAN7FpyFCm/jI9s7
	S8tDTbGxctwRdAxHBmAtjmULmMVbgbE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-UhrRl5oKMpmKtTk4nQx_qg-1; Thu, 09 Jul 2026 10:24:08 -0400
X-MC-Unique: UhrRl5oKMpmKtTk4nQx_qg-1
X-Mimecast-MFC-AGG-ID: UhrRl5oKMpmKtTk4nQx_qg_1783607048
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7fec7afc9d1so28377467b3.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783607048; x=1784211848; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y1C0dXpz7AWQiPJGGV2R39/aRuB5qt1XtWGhBi3VmSQ=;
        b=l1lnFmSlcVJoFL58ciwvQ9LbFDrRkeKNyVBgh0VSuEkVChR1iTI6HGnOMjw606MCQm
         i3atJaK+kTNsaELRvbMr+X/eNr+nxhrUIxRyl3qgOOAYI93pf4u6SnSYrR4bwiFGgEKu
         uPR0pf6cTQtDt5ys9ES4U9rIyIPTD6IvjXWLCHion4mLGhlxez5V/zWWHNgBiIdZH8e7
         wQA7f+yKeMoESZ4Dgjv3BpUvCKa6jXG4x1hQIuu9wCA/MV1f/OKOEHqKO1rUfHMFT30o
         jFnlQoqpFDZHQOJlKPPZbddUnQ91eegTMV14+M6Z6bSLzfY9+j2yvQSDe3tbDBrwGWps
         r1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607048; x=1784211848;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1C0dXpz7AWQiPJGGV2R39/aRuB5qt1XtWGhBi3VmSQ=;
        b=ABZTpGayurVrATakhONT4D7R/YsJlNx0EI2niYnFgFnk6pWB6qRngXLdZ0Gn+6G3qX
         PudXzq6yYwfzojsbx8VtGArfQI2cS0MDw4YQgFb35tOzyE9zHENewhLe+io855Xu3dDY
         WPYmmjM0k1v1soNY5zqgKTX8EV+syo3KF+Wi9RBFDyGe/MbInY1azrLSwF6HfinZuCkY
         caT5LIF6xevi+J6Dmur2ZLhqN9o+0iZIrXCUB+6pR4aiCrfYDogbkVV48jHvDr+pYhAf
         D+cR+mhA2YP5N/T1xoMEV2oWq243kgaw6OIp+4tUgQ/xAAnHZgk1AzdmzrRF1r0wm6FT
         7qlw==
X-Forwarded-Encrypted: i=1; AHgh+RppnbUYbkmTNM4B+AqIIDFrx/WLr9piZqDo4tDYdLqA6uGXnf7d+nqPUTuMJ/DBuKZJf5vmVamENoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlqbfmG5HXUpLgWg5nQCaLEr1hcDN3MM/+TVdja52hZ6e/hOfe
	CwvyHnHw3AkEJXy8fdNJpm7TbOQU5hhmjWGABciKGqB7K3a+xSO4E7w8VDsi5txJXuc/aQcEg+K
	6jbMPR4mJWlWFtpA4SZ2XO49oQGF3rKCK30T+paBdBVckDj8pzEnxB3dshxgk/Q==
X-Gm-Gg: AfdE7cne9yZE1HT0VwOS7fPvnXfKNFzjlzh23JehipzdU49x2bMelXHpgL458LUgiyC
	wUwYfpz5x/bE5cflbuKWXvOFsmXtRZDduiu582gWYAiUAga5B9WNmJIZNd30Btwel8+Jd8e3Mzv
	gEHbtww13DrKYeW+21w1kLrgKApn30rmkppsHVE6wL+QrhRtgo6/8k3iGh6Avi4TlQAkGIM9/8R
	qJBwBPS5UXRoo/ZhdrAd8iiZ3WqtQUdcHyGKsZ1B0rjtINnC6X7q7OyvBp54PjEag+Iimn7MOxN
	IAffZgMudvKtdhyYy7Cg8dGJpzuELRfoafSATKnPB5SdWRsM883CIG+Vp2LGSIBpnuc7ILVi3RX
	bnLmhpgqWAUfuLXKQ8+nlpXX6LEVnbcVBohviXXALPKvNxw==
X-Received: by 2002:a05:690c:6c84:b0:81c:8300:f719 with SMTP id 00721157ae682-81dc0ce7f36mr61951587b3.56.1783607048184;
        Thu, 09 Jul 2026 07:24:08 -0700 (PDT)
X-Received: by 2002:a05:690c:6c84:b0:81c:8300:f719 with SMTP id 00721157ae682-81dc0ce7f36mr61951307b3.56.1783607047696;
        Thu, 09 Jul 2026 07:24:07 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1e1d12sm18995437b3.33.2026.07.09.07.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:24:06 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:24:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: en7523: reset PCIE HB on init for AN7581
Message-ID: <ak-vAqKlJ0pFx9J6@redhat.com>
References: <20260708084045.8380-1-ansuelsmth@gmail.com>
 <ak6AYe5ZZrzyf1UB@redhat.com>
 <6a4fa6ab.b2781ae3.385c0f.d696@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a4fa6ab.b2781ae3.385c0f.d696@mx.google.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Thu, Jul 09, 2026 at 03:48:26PM +0200, Christian Marangi wrote:
> On Wed, Jul 08, 2026 at 12:52:49PM -0400, Brian Masney wrote:
> > Hi Christian,
> > 
> > Thanks for the patch.
> > 
> > On Wed, Jul 08, 2026 at 10:40:44AM +0200, Christian Marangi wrote:
> > > It was reported that PCIE HB should be reset for AN7581 or some instability
> > > or link training issue will be present on warm boot scenario.
> > > 
> > > Reset PCIE HB on clk HW init to handle warm boot problem with PCIe.
> > > 
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  drivers/clk/clk-en7523.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > > index 1ab0e2eca5d3..c450d89bfa96 100644
> > > --- a/drivers/clk/clk-en7523.c
> > > +++ b/drivers/clk/clk-en7523.c
> > > @@ -57,6 +57,7 @@
> > >  
> > >  #define REG_RST_CTRL2			0x830
> > >  #define REG_RST_CTRL1			0x834
> > > +#define   REG_PCIE_HB_RST		BIT(29)
> > >  #define EN751221_REG_RST_DMT		0x84
> > >  #define EN751221_REG_RST_USB		0xec
> > >  
> > > @@ -853,6 +854,12 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
> > >  	val = readl(base + REG_NP_SCU_PCIC);
> > >  	writel(val | 3, base + REG_NP_SCU_PCIC);
> > >  
> > > +	val = readl(base + REG_RST_CTRL1);
> > > +	val |= REG_PCIE_HB_RST;
> > > +	writel(val, base + REG_RST_CTRL1);
> > > +	val &= ~REG_PCIE_HB_RST;
> > > +	writel(val, base + REG_RST_CTRL1);
> > > +
> > 
> > Sashiko has a question about whether or not a delay or a flush is needed
> > between the writel() calls?
> > 
> > https://sashiko.dev/#/patchset/20260708084045.8380-1-ansuelsmth%40gmail.com
> >
> 
> Hi Brian, from the test done by me and Airoha with their CI on 10000 test,
> no delay is needed. If we want to be on the save side I can add it anyway
> for consistency with the other code. What do you think?

10,000 test is probably good enough then.

Reviewed-by: Brian Masney <bmasney@redhat.com>

