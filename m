Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935A73B8D7A
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026179; cv=none; b=gK7LW8CTTL+g2ISnmDausii3Pgn42dSPSENkcCo2xfcA/SAhIa9IR6/qicL+S/5Kifc1DL12TgvrHp5E7Ps+KloStLryK3XOy3dcJCHN4vugwL2iPZ3yPdI+W5+/3G6dvxqqKRGX2rv35YH+wWQHm2eN6GntGktR8AxS2Eth+7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026179; c=relaxed/simple;
	bh=kH6pSAzc7ixvwL56p9UiHb2EASU/2oZ/f+xfxqiwvCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6nsUxf2HTLHVBn4ernhn+Y8BEAbXA415xJmUORQh6iZpOI7qOmPrTUr2kaGakTkJav9qoexlb5t5Ho3QGBHnrJFCdZXp6CHnaaZYYX57ZkmIrNHk/eLWM2gorjO/0ilr4X66b/UF7j2rFahLjo91Ou4T+guZoYAqNWIpai7ZS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F8NcV5Rm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QFdPR5pF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8NcV5Rm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFdPR5pF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772026177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bolAAaL16DQVnJO0fDxqs1CZEsyfX0mApW10uOjI4S8=;
	b=F8NcV5Rm6aGrXK5WwKmrISwmFkOXYSB/jyzqH/r15AHmI3CNoIZ0juXwEX0j25eh0m3s4a
	LdZooL4gmq8JArEVe2zPER12oZLc5NqLmg6Bx5unQ6dJKtRPElO/iIja5KnnUGNUJ6+eNh
	N4lVEO/UX36NDly+BasB0BhTKrkxFxQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-ABZ031iYPYusX8i35HsqlQ-1; Wed, 25 Feb 2026 08:29:34 -0500
X-MC-Unique: ABZ031iYPYusX8i35HsqlQ-1
X-Mimecast-MFC-AGG-ID: ABZ031iYPYusX8i35HsqlQ_1772026174
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506ab115571so631704661cf.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 05:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772026174; x=1772630974; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bolAAaL16DQVnJO0fDxqs1CZEsyfX0mApW10uOjI4S8=;
        b=QFdPR5pFgRzajjax+yNvp0aCxyfIZ6qXZFDUBTtnhIWvUrPIj5eivFqXlp/OHNzi9f
         6nTXU1zPLH2/Tt5T4lZjZsUnjstGjSKyD84DoTIVA6lJHmw5TQKj40irs/oSJdDaRiPG
         NE7v3AambwDwg5OPwBf1VMQahFmIEI2fBcL9vyiHFYJxYoWzJ2fqZ7jjKLIKvuN659fB
         zJG4cpWQm0euirCxWwqZ/vdGMu/ZXUcD6IvCehYY0RfiLRla0YWgN4F+uIbZE5i5pS+C
         NHr4vo6M5zERgHcMWGwbJj1eeio0tFTq0thuwwpCoYR4M9/6gLyKztkiM1sLFrlyhYEP
         rinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772026174; x=1772630974;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bolAAaL16DQVnJO0fDxqs1CZEsyfX0mApW10uOjI4S8=;
        b=KMsfcKkPqFeb2yehqpS/DXkmllIpz3nRRMxhghesGveqmEUIzLu7B2356KYvwzTJjm
         tUcw9XMV/x9MJucS5VxIjgOkinhO2BzvOz+A88J6rg9aFzTbFmuW+IZgjfcevVNQPhIx
         /sCFPHEzRI3Wc2kNRZ0P8nAdPvz79Kdu7YZ9ftLKw5l/QYVGBLC9CQa8M4WNXh9df2hH
         E5PCvfLFcQBtzqtmc3skE9LQ8iu1Sxppq5Mwf72kuENLypJfc8jLkcwhVCUyyVBs6By5
         ulPFWHVejtWt6ojMAZF34uKmWM6cwCBAv+1tpUBdxOOaubalsz6PoqwS4Urd1t9ePl+E
         PYEA==
X-Forwarded-Encrypted: i=1; AJvYcCWfBlG3RAOayS0wICigxVwDfTDwZkTPfnAkRWg21j8DGz8z/3WbyeQxicAWmT7nHiRICVdyNWJs4Eg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrtZt4B2TDZyk/YE9dX9MymDSnD+rvAqM4cPaic6OrwCPm2VJh
	iySJNpabuoqyDnHzCoK2RqK4CBv7ixqZyk1DDGX0pFSTrctxZY/6hAt96mSK+pD1cIF+31ra/6J
	1DoR9XzNmBn2275xWzcde8C3QKZb5OCOd6XmGjFjlnJ6tDuxAKK8kCZxxITSHZw==
X-Gm-Gg: ATEYQzywnMfFYgVTW792KvM/6FUfqrY71wlmZEotdu1wNGRvt0YYlbNYhHOf7lh0FFF
	dYI2YaNhK1ZGb0df4VlzY5GNn0u2w9dcQiBM4+FtXyDmipEsWQs4fB+wm+6lRWencSRv2BX1uip
	Y+InUUJgv6HCbdek8THKfE7/IRGSKJqD7mc/mDA8I8iI6gvmizMm8kYcVI2XPrR3aENcHjO4Q+s
	TAuY+woVTZ0P7FFAEhc9Aw7Mm1NhORyzQ1V+3fuCpc0T00ET+9m3L1zXt/IDdedJmlcDKiVUuND
	1+kxhIxcz/8/0NK5V8BSPxmat8scbFe2iKy3Z2WST1cJXcjjPX3cCswxX0GueLUwhdSCRg/wv4a
	jyewM3kAAdtWtXuRIaiq+AEa0tggfE0AgVxs0LQfNKVk3N/TXAuRKMN5r
X-Received: by 2002:a05:622a:48:b0:4ee:2459:3d6c with SMTP id d75a77b69052e-5070bcb29e2mr204210561cf.58.1772026173802;
        Wed, 25 Feb 2026 05:29:33 -0800 (PST)
X-Received: by 2002:a05:622a:48:b0:4ee:2459:3d6c with SMTP id d75a77b69052e-5070bcb29e2mr204210171cf.58.1772026173289;
        Wed, 25 Feb 2026 05:29:33 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d6dffadsm125621181cf.31.2026.02.25.05.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 05:29:32 -0800 (PST)
Date: Wed, 25 Feb 2026 08:29:30 -0500
From: Brian Masney <bmasney@redhat.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, ganboing@gmail.com,
	marcel@ziswiler.com
Subject: Re: Re: [PATCH v13 2/3] clk: eswin: Add eic7700 clock driver
Message-ID: <aZ75OuPEw7co40J9@redhat.com>
References: <20260214101421.228-1-dongxuyang@eswincomputing.com>
 <20260214101519.341-1-dongxuyang@eswincomputing.com>
 <aZNRFYs_QuGRI8PV@redhat.com>
 <51ff08b4.38e3.19c9394ac61.Coremail.dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51ff08b4.38e3.19c9394ac61.Coremail.dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Feb 25, 2026 at 02:55:20PM +0800, Xuyang Dong wrote:
> > > +
> > > +int eswin_clk_register_divider(struct device *dev,
> > > +			       struct eswin_divider_clock *clks,
> > > +			       int nums, struct eswin_clock_data *data)
> > > +{
> > > +	struct clk_hw *clk_hw;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < nums; i++) {
> > > +		clk_hw = clk_hw_register_divider_parent_data
> > > +				(dev, clks[i].name, clks[i].parent_data,
> > > +				clks[i].flags, data->base + clks[i].offset,
> > > +				clks[i].shift, clks[i].width, clks[i].div_flags,
> > > +				&data->lock);
> > > +
> > > +		if (IS_ERR(clk_hw)) {
> > > +			while (i--)
> > > +				clk_hw_unregister_divider
> > > +					(data->clk_data.hws[clks[i].id]);
> > 
> > All of the other places you are using the devm_ variant to automate the
> > cleanup, such as devm_clk_hw_register_gate_parent_data(),
> > devm_clk_hw_register_mux_parent_data_table(), and 
> > devm_clk_hw_register_divider_parent_hw(). What do you think about adding
> > a devm_clk_hw_register_divider_parent_data() for consistency?
> > 
> 
> Hi Brian and Stephen,
> 
> Thank you for the suggestions. We agree that implementing
> devm_clk_hw_register_divider_parent_data() is a good approach.
> In v14, we'll add this function in clk-provider.h as a separate preparatory patch.
> The ESWIN clock driver will then switch to using
> devm_clk_hw_register_divider_parent_data() instead of
> clk_hw_register_divider_parent_data(), with the driver patch depending on the former.
> Does this approach better align with upstream conventions?

Yes, that sounds good.

> > You can now go out to 100 characters for the line lengths instead of 80, however,
> > I'm not sure how Stephen feels about that. Personally I think it'd make this
> > block, plus some others in this series a bit cleaner. Taking into account the
> > current indentation, this block could become this with 100 characters as the max:
> > 
> >     hw = eswin_register_clkdiv(dev, div->id, div->name, phw,
> >                                div->flags, data->base + div->offset,
> >                                div->shift, div->width, div->div_flags,
> >                                div->priv_flag, &data->lock);
> > 
> 
> Stephen,
> Brian's feedback on line length was very helpful. 
> For v14, we've kept lines within 80 characters wherever possible.
> In a few cases, such as function calls with long parameter lists, we've kept 
> slightly longer lines to preserve readability, 
> but we're happy to rewrap them if preferred.
> Does this approach work for the clk subsystem?

I don't know when Stephen will be able to respond. I recommend just
posting a new version.

I apologize in advance if he asks you to do the opposite later.

Brian

