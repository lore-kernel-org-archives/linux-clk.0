Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7814B155A4D
	for <linux-clk@vger.kernel.org>; Mon,  2 Jun 2025 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748883998; cv=none; b=d8+ydMEt5+3GTxjI1mwTJulbeMxX1jGAhU/SgCwdpJS34p7OmfExC0WjrjhtjnDDVbq9D9pioM2g4WFl9/hKwfMkk70YFG584Uub4Hqah8UUknH/O5dWEGAYfhsd7iaHbh0iOLlZGyboW4zPk6HdOJRyumtN4yGVYFVofE2fjrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748883998; c=relaxed/simple;
	bh=jGHtXSMNYuOS4DBBIsFiHbP+AkxtA8bAuVMP2cZb2Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Houv969ULi+qJzO98E/I1SRxIF+sJnTkniZNES6PXeiijmLcSTc12ZIvt4Nc1dP8s7z/gZvlUBsaoT7y/bL9JRyJioGwovZnCDCgh1Dt1gHfdnwBLvZEVcoxuCnOcQn8kdmwYrIsElK6cM/DN2f3FHI43e5pYXnzppIwTkNVORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CoN5H9JL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CoN5H9JL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748883995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tYcA+9sD/BT6SER7UMB+2zvYQlRmXLTzrbmL5tzdDww=;
	b=CoN5H9JLpY5aoZ3nV4a/Zcn1XOSkfe0JccSgxFOwC8T9luyBehn01Qnfox6ujkKoU9Ckdp
	xM3QFMg4+CAP1888Nq8S4JFIbo4WaWT2RpySpWSM6DHFnmv1606Gj8zpYlRZTESLkg8Tgb
	Dc792jpdYxnrBgfpXxtTjGux9Itcd14=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-7VRiDt5PO1ixGwD_h9MC4Q-1; Mon, 02 Jun 2025 13:06:33 -0400
X-MC-Unique: 7VRiDt5PO1ixGwD_h9MC4Q-1
X-Mimecast-MFC-AGG-ID: 7VRiDt5PO1ixGwD_h9MC4Q_1748883993
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6facb96d553so65725586d6.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Jun 2025 10:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748883993; x=1749488793;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYcA+9sD/BT6SER7UMB+2zvYQlRmXLTzrbmL5tzdDww=;
        b=DDwlAcvltnkkkIBmRPFS8h2gf1byjLT2ukoOECe/k9LXlv8/J4jneoSk7KwKUHhg8U
         q0p0PYJ8jKw7x9WutZAQKnaWZusx5mXaqWtRw+QDwm1pIOX2CR2WA9hZ4VT7ytP+wTBd
         tUHRwy+9we/KfpGWGYRB0ShVPzPsuCd88le7ZNowpXzKBRmbWMdAC6M4lHOPqV7fn+7R
         eKheqBowAwirKJU+VUa5+NfUSUR/h9pD2JLJfJYKU9zwhNZM6+ZcDEPguLC3XDGTaxy+
         inkJ2IiYCvBjIz41ppjcqq5rOejtuJljKgeR5/e+T3YTrty1IrUNLjtqOdwqxZrnaioN
         o/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXu6QH8559+fC/5ZUgadR8fyXz1H///loDHja+hdk10PbkIXmkuyMRh4U8vU/K+vtLGapgj4wJrudw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhaROq0YXuP57UvFjEddViIbRbVTp5t8reGF/WkNPdtI/jlxZz
	jAqOrtVnQ7gQU032cEe0Mwz3oHkAPWTyZ9i79IW6lKs4+hOOMoL5gaz1xvEPXwyd0EyELSB/DP6
	/tP5Df8yrfqy5wq7d7JXlZIdbYeHvV3WQ+WW2GuBxykO7K5P8aCXT2Ri0nGMV4g==
X-Gm-Gg: ASbGncsJpd/CiPuZ1DD22NS/rKEj8xY600oLtO4gyx/npya1eLj6k59w/SReUJXulU7
	s/muhkedTdSj5EFMSznjp07mdr5d0FwPR9IV9jqHQTPFk/y4U4oc+mDbxl4fpTeR3Kn41jbXr5U
	zy5avbBzjNveclcsbzJIBqj4cMPpeDzeYGcoo8YfjHu09hCGg8QGBK4SdyHHobakR4cODiiIvYK
	i/lNtjUwGqm3QFAcIL/hHjjHH5R6tCABj3Cibj51KOtnqZDNC10SrEt6l79atB7xDH91RG2zWbr
	VaTM/nE/i/xpxTsRS4RUiyi1+PWPAEfbs3dGhcq6vaYdQg==
X-Received: by 2002:a05:6214:584d:b0:6fa:b468:caf4 with SMTP id 6a1803df08f44-6faed6cec34mr3581386d6.0.1748883992765;
        Mon, 02 Jun 2025 10:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDIW6J9P2qG1g1rwGHAt0e10YSWO/VaY15tJKPiaekxXAvJTtUGm41gXv6znBsK6TM7kwmtg==
X-Received: by 2002:a05:6214:584d:b0:6fa:b468:caf4 with SMTP id 6a1803df08f44-6faed6cec34mr3581066d6.0.1748883992376;
        Mon, 02 Jun 2025 10:06:32 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d6b6sm63640396d6.44.2025.06.02.10.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 10:06:31 -0700 (PDT)
Date: Mon, 2 Jun 2025 13:06:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: tests: add clk_hw_get_dev() and
 clk_hw_get_of_node() tests
Message-ID: <aD3aFs-hbtYw0PVO@x1>
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
 <20250417-clk-hw-get-helpers-v1-2-7743e509612a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-clk-hw-get-helpers-v1-2-7743e509612a@baylibre.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Apr 17, 2025 at 03:44:23PM +0200, Jerome Brunet wrote:
> Add kunit test suites clk_hw_get_dev() and clk_hw_get_of_node()
> for clocks registered with clk_hw_register() and of_clk_hw_register()
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

I also ran the tests with no issues.

Just a few minor nits below if you happen to spin a v2.

> @@ -3016,7 +3023,7 @@ KUNIT_ARRAY_PARAM(clk_register_clk_parent_data_device_hw_test,
>   */
>  static void clk_register_clk_parent_data_device_hw_test(struct kunit *test)
>  {
> -	struct clk_register_clk_parent_data_device_ctx *ctx;
> +	struct clk_register_device_ctx *ctx;
>  	const struct clk_register_clk_parent_data_test_case *test_param;
>  	struct clk_dummy_context *parent;
>  	struct clk_hw *parent_hw;

Put in reverse Christmas tree where possible.

> +static void clk_hw_register_get_of_node_test(struct kunit *test)
> +{
> +	const struct clk_hw_get_dev_of_node_test_param *test_param = test->param_value;
> +	struct clk_register_device_ctx *ctx = test->priv;
> +	struct device *dev = test_param->has_ref ? ctx->dev : NULL;
> +	struct device_node *np = NULL;
> +
> +	if (dev) {
> +		np = dev_of_node(dev);
> +
> +		if (!np)
> +			np = dev_of_node(dev->parent);

Remove newline before the if().

Brian

