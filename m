Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AEA17A305
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 01:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771290582; cv=none; b=cbSVP/109SXG1oVIEeOSLFgbn09plgwo9bJnJk48fSgPU2YMQeTrZyGBv6B5AU3RMAYQ+ZoVMpKumqOEccTudZD9CUw6WAIimvKFBkTTMdN4igzvOITjjVNRRFJ6ZNNXD5qOV07kn8WEjFG4biCFmFvfnvXl13P/YYWq/PbCEKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771290582; c=relaxed/simple;
	bh=YnXGBxQb2yQTIsJPsA76f33oYDBAi82tICtV3X+cWVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMvR3mT5xZrkcg1gGEmoGl74snK2E3R6gSW2CXlLsnH5FAI/kKMYZb8FMewclVXk1EOR+M+x62F68Jcu7VdoJBrHku4NeWFlItY0eKs14PG0d6iFyvAgZIWJYQFkcVy+qwQjJMuzMQfJM8BhFOkgRyNRfx0+od8/x1hrrwru5zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M7B0ZpFN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PY5CVkBs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M7B0ZpFN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PY5CVkBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771290580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xPKbRNPHyosMAfxhwpYDOU+GJ6u5P872HLfNECxcQQY=;
	b=M7B0ZpFNDwlf1on8UlJYP6SpRzfxgqHdSR91IXOJZdTjlDOf5wegHYATTtD2f6R26R/SJ7
	hY+X+Hb+CS30VEGmYTsosD+eLcrhn6+RotL+bcCcgxNzwWMvpl6iEeFLKP6AC6H4aJAMlI
	nTxkEfA2tAWynGNg008BtIFf8JfeDVw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-_6-2TO-QP3O0bZDLr9WP5A-1; Mon, 16 Feb 2026 20:09:39 -0500
X-MC-Unique: _6-2TO-QP3O0bZDLr9WP5A-1
X-Mimecast-MFC-AGG-ID: _6-2TO-QP3O0bZDLr9WP5A_1771290579
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896f8dde688so294102736d6.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 17:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771290579; x=1771895379; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPKbRNPHyosMAfxhwpYDOU+GJ6u5P872HLfNECxcQQY=;
        b=PY5CVkBsu8/UXV71RL3KC2tpDkbNDFYdZ3maUldat1Fg5V+4aofKS9KSQ8i7RxsgDp
         yB2yp9k8KFQTTLIqHjB2H+R7zAlZpuNT+4oJE9IZBZOux0gt9WGybcXbV7VtujL03++y
         Ayy6F2TsimNPpA5wEVJQRB+MZaC6IEed0rArTyX7ocqoxB0liip+wssI52TFKcxEDNBd
         BWhwpCD1D+lVS9g+qV4ynCx2lGWQZM4emwTdWv3uPfqVQGxmLs8DBmCIvyDQCnW4Jf1+
         Ax0+iKmA2VIvWedYEtRB9nxICmaxJzuqXg4JZWjTkC2tZFP8CePd1XeIUf4R6YODDKjg
         6q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771290579; x=1771895379;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xPKbRNPHyosMAfxhwpYDOU+GJ6u5P872HLfNECxcQQY=;
        b=qkl9/aN9rqW9N1hVjWpDsFea5HL2mFQAfhhslemix4VTnOjaALAX4+oD/6inAvbbOA
         cR4HqdcUJ8SBYjF7QE5v4XNg9P8bnFswqzUZosq8t8utc/az1Zaef7kk64xOzOT+GXeJ
         qMZquVdax6PKEKgOQMum6rhxw8OTCGPMe7NfqfuSr2LO88QzLS60VIVw67/qicckbVWR
         bOVTpwASJu30AvfQ75nBtPS+7GHqeeKTmc0PJMbN2yU5aHj8xhhEJgAiNwqoxZizaQ93
         VMpAvJHNUMhUjMA/j3Xs2vCOJANigAYWVfqVXs4me6NL0QBuYBV/UMKKYcOJ0Ln07suQ
         zRbg==
X-Forwarded-Encrypted: i=1; AJvYcCUgY7Vd35m2foO+Xxv+5A4tAPX5ye+rY+1Ze0IvEMBWD4QK/iq41jhpHRRNOnm48SzkPKq7dJEkJ38=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeDOpkG3Pdyz5o63UkywvJSLkoCcKn6f6+YmANNo+Ksln3yFEK
	mcaHLoYycHUn/WtqDj0gmpGydPDESz9PjwlhFRpZazSbmRfUT6yB4EhtV4TmtTYh8sCvd0EQI1f
	gblQy0UBgDWwTzUFoSQXaTkMM2GTMXTkkHMQqtlOGafSmhjpfiu4oqBUT1vxelg==
X-Gm-Gg: AZuq6aJacoa2KVVlQtbL9Kdd24R33ftguJ6wnMMrTV/tbBvkwXr0fwHa9VZEJ5nmzeY
	XpWsvOD0iedlG0m1k4BIREnrhkLQfHdqGKNlIHzZxgzfIAham4sroDCfisXM2NZxMeNJliuMfvX
	9vfiinUQ62euU5IT/GbkIw5+GSvqCWxkboIORLgfHlaRRaM5rEqTgN2iqHtxCoy9BodgqwR7sTl
	LfhpWiylAFZhcEEhOXiS3wofqb/00mEQaGbPf5pAoSxUfDo/iKCn1GzQOYrLDWQZlKbkB8ojvXF
	b7mH9AS9N/L0LIgp9Xcea1MVWgV+HEx+iTXSd+mkTZLW9fB+qouAf2YpsNkHwzdoUj3gNoBNCYV
	wpVXXyuhiIDFWyx7mdzRrEQCvo3J2Y4QP6CSt6KM+k9XaSBRXcFklh5S1
X-Received: by 2002:a05:6214:2588:b0:88f:d216:6fef with SMTP id 6a1803df08f44-8973621458bmr165777276d6.50.1771290573929;
        Mon, 16 Feb 2026 17:09:33 -0800 (PST)
X-Received: by 2002:a05:6214:2588:b0:88f:d216:6fef with SMTP id 6a1803df08f44-8973621458bmr165774616d6.50.1771290568801;
        Mon, 16 Feb 2026 17:09:28 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cd8a5ccsm151660686d6.25.2026.02.16.17.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 17:09:28 -0800 (PST)
Date: Mon, 16 Feb 2026 20:09:26 -0500
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, ganboing@gmail.com,
	marcel@ziswiler.com
Subject: Re: [PATCH v13 2/3] clk: eswin: Add eic7700 clock driver
Message-ID: <aZO_xgoix_SvJRxb@redhat.com>
References: <20260214101421.228-1-dongxuyang@eswincomputing.com>
 <20260214101519.341-1-dongxuyang@eswincomputing.com>
 <aZNRFYs_QuGRI8PV@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZNRFYs_QuGRI8PV@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Feb 16, 2026 at 12:17:09PM -0500, Brian Masney wrote:
> On Sat, Feb 14, 2026 at 06:15:19PM +0800, dongxuyang@eswincomputing.com wrote:
> > +static const struct of_device_id eic7700_clock_dt_ids[] = {
> > +	{ .compatible = "eswin,eic7700-clock", },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, eic7700_clock_dt_ids);
> > +
> > +static struct platform_driver eic7700_clock_driver = {
> > +	.probe	= eic7700_clk_probe,
> > +	.driver = {
> > +		.name	= "eic7700-clock",
> > +		.of_match_table	= eic7700_clock_dt_ids,
> > +	},
> > +};
> > +module_platform_driver(eic7700_clock_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Yifeng Huang<huangyifeng@eswincomputing.com>");
> > +MODULE_AUTHOR("Xuyang Dong<dongxuyang@eswincomputing.com>");
> > +MODULE_DESCRIPTION("ESWIN EIC7700 clock controller driver");
> 
> MODULE_ALIAS("platform:eic7700-clk")

Ignore the MODULE_ALIAS suggestion from me. The list of aliases will be
automatically generated based on what's in MODULE_DEVICE_TABLE(). I
verified this with modinfo.

Brian

