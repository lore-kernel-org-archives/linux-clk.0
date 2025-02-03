Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDD62036E1
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585477; cv=none; b=bysjbhhuZe06DAqEF50ZNoQS2NNNVHrvf/5lFT0ZRwkHSuhgqTybQtfHbjVFqJjmUdSJZ+xbnHbuNyf88lj7JHKqxH+RdFupF5tZBp+B/7hGiDNkr5lr0r8ThIz0ebXW7DpdUvGVCdbWNph53sWqFVCkpZe3YO6AN5pazE3wHj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585477; c=relaxed/simple;
	bh=YtbmQWrRsenA3xCb9GNs8QhaBMLEYTDtSq23s95XQKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfNAjm8D4I7oPhoAjHbIbvlrROuIHZLwsziJCBjsc5dRXrUlTWC1Z2yUnkLTjMPVGn2nFogb1MjCYgDaWSt30eGmq7wN7eXVzc8wmjatgIhKdB14+sflvhGjcsxBYAHcOAxajjBZRW1ygiCXARTkf3IpHHI0Ao1qszrp8FFzp/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=oLv++D1A; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="oLv++D1A"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6ea711805so618741785a.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 04:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738585474; x=1739190274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ApUlLTpGY8QIpFfh/w6kk6nMf7s8VLTCzZhJ/61KofQ=;
        b=oLv++D1AXObui7HF6XXnx0Wa37b6G3UJkQOPaI9LrvzLSLL/IphhaLVKH/FdYkWV1h
         bba39Wae7cy27pu68kmOTToixflcnEf3Z6knJOErgBZw/U+n+2oIZRz1afj8SRSkpgKc
         N2sE5c6uz3y0L/5qonYb4e+1oYRkYaStRFSNNuKQWcdqyHMLDo1dJA+dl6dyNXRKZSz6
         1R4j68BAmZYOxjLJXQB1ZIA8U2A3SaNdCFQP8muJJuPvOp7HE05gV8/tpkkUReIEiGxO
         +rSkAjiXIiAtk5cab3qSoGW/6308a1CZ2ByAdtkHYcTegQSkpQw4ATH+DtTti9RP6eL0
         6zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585474; x=1739190274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApUlLTpGY8QIpFfh/w6kk6nMf7s8VLTCzZhJ/61KofQ=;
        b=Om3iJbNP/HzScsMoF/ypq8OQFtuLX/FpIjCzmogc+dwff5rAQD19XvblIb0ylPp+ED
         ph6l2kZmseMVl+791zP31CAouXfHujvqMSGeLSLYBgFCdPazonEHj2rJxTGl7vn03fsR
         D5PRl0rhoa/C2xrfXHiVVBKLqVX3X6G2ZCKE5z/uhWYW1ewxyxmy516NOpVwfLrDnvQZ
         25mk6xQlG3ocuobnSgHdIxdWCQc9NCqeNMIfJHRC5hwPb5Ia3KXm1SruF4xo7gjPd2Zc
         y2+QhX9FwrPrwUXEBrwhji22TFDWpUz9E05rIzwlJ8YIbYJPaGX3PQ8eTifkr9XoF5dD
         cBbg==
X-Forwarded-Encrypted: i=1; AJvYcCVvVv+eH859Kz4q6bkFz9Rt+yRxDN7qNreg2U/80Ozue+m87IlMlC8Rg9NhSzPbSFVOQm6Awdt9aiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1OrjeyIkJtxoSHKKjznV9eU6wmGr4mQ2B8fgqCU5u3UWPW9dN
	KoAhCLsCU3n4lYrRnoIaXNFRd3MRK2CXHbag8xjCNX7vufMR+fYmVBJGZIrF+Mw=
X-Gm-Gg: ASbGncs1TnJk6ChbQKpWicQnwO+98hE1Ki8wUc3qm8AMtdXQrl4wjfiybwLmfMEnda3
	xDTzYelWuczDnLtldsxNDV505PUqLE6vfuEBzxpHZX/7iZ2ghpU6Vxs2FkUBHvnkAlU7kOILixq
	Wqg4Dlzx6F+7+Kaho75syNdQQXpBepGQ6fkokaE8oJjEGVUO5vOzOdwmRW6S3pkrkBR2qjTqz7u
	7qwQ2BJmbnaiDEprFhPLoWvfux0516Ak2zmHCuE7cd73cj2tZ1YILjYJGN6/F9AkQC4Wv1KFXkJ
	uSxygonTBuN3mDszETjUqXM=
X-Google-Smtp-Source: AGHT+IFeBMX4wQkkK1eZgQ8lEKlzFJNSPxCZvzrd8VL8RcDP/uXgxJnPmX9jLerE3byptPWEc3Kg4A==
X-Received: by 2002:a05:620a:2719:b0:7b1:11d9:446e with SMTP id af79cd13be357-7bffccc9b53mr2979634885a.3.1738585474447;
        Mon, 03 Feb 2025 04:24:34 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d02b1sm518627785a.43.2025.02.03.04.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:24:33 -0800 (PST)
Date: Mon, 3 Feb 2025 17:54:18 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop
 in acpi_fwnode_get_reference_args()
Message-ID: <Z6C1cg3cqik8ZxvU@sunil-laptop>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203105840.GH3713119@black.fi.intel.com>

On Mon, Feb 03, 2025 at 12:58:40PM +0200, Mika Westerberg wrote:
> On Mon, Feb 03, 2025 at 11:43:26AM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> > > From: Sunil V L <sunilvl@ventanamicro.com>
> > > 
> > > fwnode_get_reference_args() which is common for both DT and ACPI passes
> > > a property name like #mbox-cells which needs to be fetched from the
> > > reference node to determine the number of arguments needed for the
> > > property. However, the ACPI version of this function doesn't support
> > > this and simply ignores the parameter passed from the wrapper function.
> > > Add support for dynamically finding number of arguments by reading the
> > > nargs property value. Update the callers to pass extra parameter.
> > 
> > I don't like this (implementation).
> 
> Agree.
> 
> > It seems that we basically have two parameters which values are duplicating
> > each other. This is error prone API and confusing in the cases when both are
> > defined. If you want property, add a new API that takes const char *nargs
> > and relies on the property be present.
> 
> Also this is not really needed for ACPI case because it has types so it can
> distinguish references from integer. Having separate property for this just
> makes things more complex than they need to be IMHO.

Thanks! Andy and Mika for your kind feedback. I agree that having both
property name and nargs is confusing and also ACPI would not need
nargs_prop. In fact, I think ACPI doesn't need even nargs integer value
as well from the caller since all integers after the reference are
counted as arguments.  However, the issue is acpi_get_ref_args() assumes
that caller passes valid num_args. But typically the common
fwnode_property_get_reference_args() doesn't usually pass both valid
values. So, should fwnode_property_get_reference_args() pass both
nargs_prop (for DT) and nargs (for ACPI). Or do you mean it is better to
remove the check for num_args in the loop inside acpi_get_ref_args()
function?

Thanks,
Sunil
