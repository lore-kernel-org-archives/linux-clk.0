Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2542EC55C
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 18:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755801284; cv=none; b=ZzH1tX9H2LcWyrDlwrJ9Ovv3EoahuZJ9mgnHHkG1XwWa6oIGC3IDrxPx3rxb4AOK9toYSRMpA9uAthe6i3ypgvNjQUwAtDx/8cB6Mxr8AWZLh8+WWc6JKwlAHQPyOAiNGXm5EhYc/boWKLgmCwi4MP6USr9jZBq0vYDILu6AX3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755801284; c=relaxed/simple;
	bh=XcXSdUzKD1mwXL/9Can636iXduhuHzRkLnWqXVqBSRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTgsFaqoM1IfbtiL/43GtQF0aZCtdrg36RQlaYRgJZlJCSlwX8oZoayTvKAePmU0mqFJOJ4dF5szltNLchfwMkhqoOXy0SbPlqpEGO2KwMJPQ52Yct5bLtrH0mptop4+ewKqnlchqkJhHHIWrMiftTLIhs+4JzyAPYHgcL4afGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X1SJh49E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X1SJh49E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755801281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8IdtsQzzrEsnVQCR1m8AsOo08J6mLd4OylRDhAWo4nw=;
	b=X1SJh49EieKn7wpGo9WV1tMSAiMrPmlo0W6Hg2unUFvBzKtUi3QUkjQ2sLgEyxaluxL6nN
	EPnmsAokTcGdLr7BU37KPIDiXenF+lqvq34DcOq+W56YzZ4IgHScDbJGmsxxJGgxyOxHPV
	HjH7iXBfmmYdUeafA5NIhqeBs/X31KE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-XibR_VaeOYuBWbn00h7qCA-1; Thu, 21 Aug 2025 14:34:38 -0400
X-MC-Unique: XibR_VaeOYuBWbn00h7qCA-1
X-Mimecast-MFC-AGG-ID: XibR_VaeOYuBWbn00h7qCA_1755801278
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d7c7e972fso18490186d6.3
        for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 11:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755801278; x=1756406078;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IdtsQzzrEsnVQCR1m8AsOo08J6mLd4OylRDhAWo4nw=;
        b=qQkIgzgxqz4k6ecIlZRfeszxgr+6Stc3WROyUW2lvmGseKKl0nnb7ljbvQ+FnuAYoe
         7uH9q/htRoiUo8dJq8Jq2xS11t62bHNw+JNzB0EA/QHTdegE7hEsBLFvUwhi9k2vxMua
         SZ4NoTSXhtQkCXrsrOzSxvABW5nATpT3s155cyWhyuQNFM06gQesStmEVfud6Xm2K9W4
         kluA4i5+wX1D9TCMGrhg9l+ugnpwtyAonpFxbuWGXuWjs0xMmW9xwXAmoAEYJ5MnxHWb
         fwmPdZdoRu0ziLngQR0Fem7gSIKM5EXlh6TYc5ed417NQWunnwEg6Gc0RVgbAsH1Xc+e
         h/QA==
X-Forwarded-Encrypted: i=1; AJvYcCXBJBkuwOIIXYQuUPcQ1IabgoAS1Du0ED8Q9RnNyj5lYICLJXekMh7GW/KyIPlH08lnOTgvJyWuX0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy88hf5pilKH01/XM07X5MozFsyz/kDru/de0g7mG1DB5h7Yg0t
	HbOe32Ex8T3+MokgN9rBw4Y9BKUFas5QKlLqICNcralZ+V6oCwm5LJhPwZ+TX1/waaSQE0SDPB5
	OujN+ZvyW8KqXUZXTKD287mgUhW5i/SXQ3bavhJtKJRfaFjwL+IzaKWrgJyiAMA==
X-Gm-Gg: ASbGncvzoov6qlfBdtCmii7CVMf2EXL9xCdJ0Hp4J9suouFW6bQ4UHm6Zl9FJ247eGC
	yGtZclqH7wWVxUe3AKiI1EbUHgL1Wbuq5fP6WGSfCdRX9hsx/Uf1gAMxQsoryoshI+W/7ZP+JrF
	cT7pa7hN95wMQs6mpZuVRoDXKpCQVC3cA7JGdyjsckvsIZwedW5dYO6I9XDDtQJrSZdfHBjUp4m
	1ZnsqU5M8dRfptHa+Cz3kTknx1UUGrCBrPDUU7qHdqixkO88boI/r0uMgCc1fbu9qY0YkVjfE+V
	8YWHYhsJBY47Fwk//dWt0piKJMDwbvQ+a4gAL/HDp8hO+7VlK+kSeGh4g8zR3zQ=
X-Received: by 2002:a05:6214:627:b0:70d:86ab:6f95 with SMTP id 6a1803df08f44-70d9738f7f7mr6593516d6.36.1755801277414;
        Thu, 21 Aug 2025 11:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGhBCfL4CK1vaEmXkCImS1C3Q00vXihd0Pi1g9BmtPkaC8+Yz1YnsuRpshrKZpYpvvdxsepA==
X-Received: by 2002:a05:6214:627:b0:70d:86ab:6f95 with SMTP id 6a1803df08f44-70d9738f7f7mr6593076d6.36.1755801276990;
        Thu, 21 Aug 2025 11:34:36 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba937390dsm110337596d6.60.2025.08.21.11.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:34:36 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:34:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
Message-ID: <aKdmurrT1pFtLSI8@x1>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Tudor,

On Tue, Aug 19, 2025 at 11:45:38AM +0000, Tudor Ambarus wrote:
> +static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long *parent_rate)
> +{
> +	/*
> +	 * We can't figure out what rate it will be, so just return the
> +	 * rate back to the caller. acpm_clk_recalc_rate() will be called
> +	 * after the rate is set and we'll know what rate the clock is
> +	 * running at then.
> +	 */
> +	return rate;
> +}

...

> +
> +static const struct clk_ops acpm_clk_ops = {
> +	.recalc_rate = acpm_clk_recalc_rate,
> +	.round_rate = acpm_clk_round_rate,
> +	.set_rate = acpm_clk_set_rate,
> +};

The round_rate clk op is deprecated. Please convert this over to use
determine_rate.

Brian

