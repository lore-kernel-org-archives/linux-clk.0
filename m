Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB294262D0B
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521056; cv=none; b=iv25nZque8aq5WZ25J7Gu7sZtqO0ibResOex5c0A2SjLOcInXdSPo4CXoipn3RrVEpvcELU7UqTrjfY8Hlxx8PpQaoAJUTwpwa0ZpjwhUGxHLa+RZV89sg89NRu4GoIid+hSpvFp8vqncA7mSfE43h5cIVYS19lHLxKTtk9dzCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521056; c=relaxed/simple;
	bh=shI0Xzbht7mrZad6P0/ohvAmiPWaDfwIYi7L66k8EZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ft5fGZIr4lkj4/ITY30brId4LPAwSxp9d+CIZiYEtFz570k4argBDXlKu4M9E/lzYMQ5zP2rU8l0klldwcK3xs7Lwa9dKD4f1WTIk38ebaZVN5D3J/iNeVTzo0RAtsHYcV2d4gccs4xZjpfphZLFWMJeDx7nND8StMvLwVJDlc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EMMdUAro; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W5wz5+TK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EMMdUAro";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="W5wz5+TK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783521053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EnO3yEDF4hYIuImMBSPDhGh0xen2iTbirdV5LDk94Ig=;
	b=EMMdUArow5+a5uEkSREwPAVfvmmwfVGbkmQinqrllTnWb5Yyf4jhNbymoQbEE/LTIvynpj
	qnz6oqmWu+Jbzo3r1RK3BYSNlpjIsblLowVdyLy3IQAyxgDqxNiuh6deUJvk6AtguBMp9u
	nGCOuG8DtYLts50ZwwpUkMtKama8goo=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-dQsDnldwPya9AAZukHMLpA-1; Wed, 08 Jul 2026 10:30:52 -0400
X-MC-Unique: dQsDnldwPya9AAZukHMLpA-1
X-Mimecast-MFC-AGG-ID: dQsDnldwPya9AAZukHMLpA_1783521052
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-667aa2049ffso862388d50.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 07:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783521052; x=1784125852; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EnO3yEDF4hYIuImMBSPDhGh0xen2iTbirdV5LDk94Ig=;
        b=W5wz5+TKlp9FESSolg+uq6LjU0EZksLrXiRNbTvSVg2eYCTjRoe1BokZZa5DLecuEf
         Lo7ODNfPPhSpMPIW69viVhDH3PkveZ/xRnX/E6WN7uz5a6bMtlVJoP+FqXEtrJAJcu3Y
         NYMf3prAAcvykH7aFcBI6NIpYVAdmx4amxzVNpwf1d7kX3Cx/HFjck1HFN9SA0xbH94Q
         udHF6/EI59pNd/9HcgkFPL0dYGXEg5jTdhBBcHwWiPg8qtLp4pT2htJ95UG0aDrzkRhX
         mVhF5tNFGF1F64i1S5ZeT08f7NIlWMN3KqI0LdxQlPl3SVcEteDTimn09tWAD4hQUwNu
         gspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521052; x=1784125852;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnO3yEDF4hYIuImMBSPDhGh0xen2iTbirdV5LDk94Ig=;
        b=bcjDDIAXfPq+TtKF9hZKvnHAvfmIFEWrUiohIlGwQ8zugJKp+qZmckbeK/c72UMCJy
         lu6PsHTmXU1APWQRlyY6I5crKcYV9PQhGov86AkbT32ldGR69hNNwmOQsbjPYjESJoKy
         aZUeUXBLs5akWlfk9GxYJbPwMPPgelZ6axrLl/uExbRwh7PUrh3L6XuCu6IIkCOZHFuz
         vogqeqgzJg6QpJ6qPbsgFBy/oZKYNKrk4wZdP7v4BKQePpDF3H75R88RX56qnRDsKmYx
         A0jYWyX+rDIgRSYT8tn8LJUR8D9fpvZKBamSwNlPxi1ZSTkc7aNbg4MYvhcjnobmWLZs
         fNQg==
X-Forwarded-Encrypted: i=1; AHgh+RoF4si0YfdnzdEXoyGuXFgTz2y7b4qcyDFWop4vGDGkJBlYohat+9xMgMovNbhu9O0RjTedTkQtmT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkbxstjo7XnKirFheVwDPirmqOaU+19QKs2KB4CLHgjcF9CXdk
	nYZexzrUut+yuJMb38LF5Evebx1tf2usJMSVwh8tiyGUpn/tBa3+5FqeKusJuvYBVSlry9KK2ya
	y5KidPZYrRyugEveAKxZIyRbMIx+KlgfDeo409FIVsu2eXYt6BLPcpEuXKsTB8QKYP2YBOw==
X-Gm-Gg: AfdE7cntqPb9jT8xMNgmYnQFSnLkOOIqzx8cpzcPxfgQsh4fAckLPyfGmv2uk1GF/yu
	pQbNIyjdYioANqddUl/k6aCK3kWjrjkCMQPVSHdRzx+0+J9bfErQPAou/3X04y7UtgKwvjYUTVW
	hOdWWtwcocW08KY7U3MZNLx1GHnV4KHGe4IbNeAmF3V03l84/7XQ7Ly9O8vsMJXmkd+c018AgwD
	+gk5wQ/cADSFL0oy0rxpXSYk//JR017Wjaeqxgf6CAefatgUZddc7+TjtktaJY93CNiMUectGfl
	SbJPLikMCno8adMwgXvyAZxg4tsUwSSpNwXAsesfWuP18nQUrfO8qTnHg6spqSQ5inbQtIP6GiP
	tFIoTMtvtNNUabR64pGbBLzNkHH5nbvbyKc4cbHA/EKIJ/Q==
X-Received: by 2002:a53:ac9a:0:b0:664:874c:f54b with SMTP id 956f58d0204a3-6679f01a880mr2057791d50.24.1783521051780;
        Wed, 08 Jul 2026 07:30:51 -0700 (PDT)
X-Received: by 2002:a53:ac9a:0:b0:664:874c:f54b with SMTP id 956f58d0204a3-6679f01a880mr2057732d50.24.1783521051022;
        Wed, 08 Jul 2026 07:30:51 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-667877aaadesm2148668d50.7.2026.07.08.07.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:30:50 -0700 (PDT)
Date: Wed, 8 Jul 2026 10:30:48 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: ultrarisc: add DP1000 clock driver
Message-ID: <ak5fGAp2NMPgW77M@redhat.com>
References: <20260617-ultrarisc-clock-v2-0-9cb16083e15e@ultrarisc.com>
 <20260617-ultrarisc-clock-v2-2-9cb16083e15e@ultrarisc.com>
 <ak1Zc7uSoqx-F_7Q@redhat.com>
 <178349718662.2043299.5991323028483371285.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178349718662.2043299.5991323028483371285.b4-reply@b4>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Wed, Jul 08, 2026 at 03:53:06PM +0800, Jia Wang wrote:
> On 2026-07-07 15:54 -0400, Brian Masney wrote:
> > On Wed, Jun 17, 2026 at 02:02:55PM +0800, Jia Wang wrote:
> > > +static struct clk_hw *
> > > +ultrarisc_clk_hw_register_composite(struct device *dev, const char *name,
> > > +				    const char * const *parent_names,
> > > +				    int num_parents, struct clk_hw *mux_hw,
> > > +				    const struct clk_ops *mux_ops,
> > > +				    struct clk_hw *rate_hw,
> > > +				    const struct clk_ops *rate_ops,
> > > +				    struct clk_hw *gate_hw,
> > > +				    const struct clk_ops *gate_ops,
> > > +				    unsigned long flags)
> > > +{
> > > +	struct clk_hw *hw;
> > > +	int ret;
> > > +
> > > +	hw = clk_hw_register_composite(dev, name, parent_names, num_parents,
> > > +				       mux_hw, mux_ops, rate_hw, rate_ops,
> > > +				       gate_hw, gate_ops, flags);
> > > +	if (IS_ERR(hw))
> > > +		return hw;
> > > +
> > > +	ret = devm_add_action_or_reset(dev, ultrarisc_clk_unregister_composite,
> > > +				       hw);
> > 
> > Use devm_clk_hw_register_composite_pdata()
> > 
> 
> I originally used clk_hw_register_composite() together with
> devm_add_action_or_reset() because devm_clk_hw_register_composite_pdata()
> is not currently exported, while this driver can be built as a module.
> 
> If exporting it is acceptable, I can add a preparatory patch in this series
> to export it and then switch the driver to use that helper.

Yes, I think that exporting this makes sense.

Brian

