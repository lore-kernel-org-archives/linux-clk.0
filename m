Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A575366DB7
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 17:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473178; cv=none; b=FFTaxtYqFTTir43UgKdFLr+9aJoP+kce5TTQO2APP16ZcaL8TzW+KaQ9xAPcOsAVV126afhDHyQ05wShFkUlC0K9JIB4sXHjta+KCFei9LFuFY9TPZ3a2gVsSaBngQafiF4vSWOiUQpnH/otvKxcGszLTVaUocyvdFU5t1d9EhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473178; c=relaxed/simple;
	bh=RlhAR/BZC1pyEmOhXOp/MJEF9FHwkEjO+EVjdUQtGYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTAeuxgUdm2+VwCu2CpHhG28Ead41FJGBPRytem+Jc/coys2mFpbzZRNcZIDcL2qecbSmtKuIi7p9sFi11PAgUbQC9U1gqnoo7YJf1UezWrkiAU4Sk+IAZfjpYVKSvTEj6s2wh6+cBZIO/78kidZHOZwpYzam6ldQ/iC2AseMUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HQsg8P9h; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YmGai651; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HQsg8P9h";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YmGai651"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772473176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tK1ThM3kH0p8guDfS1aiZA1n9SpN23gvDE45GzQuP3I=;
	b=HQsg8P9hB6/3RyYA8S0FeuZgx5718eO5s8taNhwTZ3jDH0prRtRg7iQ96d4ab6TT4OWHir
	OXZkRs+R1+G+LaZC0koXwj5t405dwvbufnLJtURQnUIp78wG1myLO6NmMab2mVlK74JHbO
	1q0NFETxbHgKfN72OWUPVVNoSuLr6yE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-nHIu3RdmM0eYVzJ4WUdcGQ-1; Mon, 02 Mar 2026 12:39:35 -0500
X-MC-Unique: nHIu3RdmM0eYVzJ4WUdcGQ-1
X-Mimecast-MFC-AGG-ID: nHIu3RdmM0eYVzJ4WUdcGQ_1772473174
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506b839cafaso64440181cf.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772473174; x=1773077974; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tK1ThM3kH0p8guDfS1aiZA1n9SpN23gvDE45GzQuP3I=;
        b=YmGai651nNIVuvwQQ3+1N5wv0XpwOwpDGqMfEM5MQNurWr16WWPBzxbdClHgJK+J0A
         IkoTyg8Rbq8tvj5I53pmBOKalRaFGgj8dvbee4y7xxgzQNJ6XlTMbYgTCOIgTny+Ohqk
         KZst2pxH+G3hJiLBCTmrGMU9WKHhGTvWL2FWXPUO8+8Tnh6J+pBC3WMxXZVZztsZewP2
         bBEDqShpS66xj5NzFfUnfWCeZdGJQu2DOsVzFt/itn8DFlwugUW3uRAyAk1fpyxbn7FL
         /1ytDoScRmvU82IAIfIlqJX6DvrmYJeb9++U8tiIk7Z5cg1qU600R89BnN/vbQmHMjmb
         0pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772473174; x=1773077974;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tK1ThM3kH0p8guDfS1aiZA1n9SpN23gvDE45GzQuP3I=;
        b=qdyifwOWxicYrEbQ9ZlTS87wl1W56OUMuGR+VQVry6vjbGXM7B4vxtb5ktJXwfT7oF
         owSgJZlBXxL07g0AEJD1MQlfR3t9bRjBRZ/jq32JTBB+Oox4dkRRKU0AdY45mAgx9mr5
         zdshYCEppiWuyHeoqAYxHE2/m31tYJuiN2+4hbwlfsMMf0mZQ9AFvKZAO1pz6pGmAKHR
         o0TI3xENsFGQVO998ChLC5/rIap+6LYglUmmo39eXCRZXsUqkHlsp3C2iHT5l1z5UUoA
         B1YWeTbNFIRzCahV34oFYhqS5yoC44JcrWmJCNJfjXoa/AJ8UvRUaRHP07EojKqJmDN5
         RkFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNMWTM1yVmwd4wns5+3WzxBnuuNOSHVRSi14fEtxH1o8ylfgzF2kwGrfV9vCobT4O36Iz1njNr4HE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0FYN9LHCXb1kD0nN2NITw8nQxrj94kLNc7+1+f80eErciCJOK
	0GFwGfMqYEfm4UivC5DGoUfPUKX9TGcXxP9fWA0/Xp8YCASaPsqVjIv8C0FaigdwUHdizSdI11i
	vn2DWPLRuU3oYguOS6KGLOPdA2GRQInvRS6c6pW0ZwAk2D5PvkNfKH8Kf+CnGfw==
X-Gm-Gg: ATEYQzzHaM7+wjR6FCH6DnzsKYrwpzcrHLKtzKrx3aRhFbh29GWB1zBGS7Vs51w/Y3r
	KBInEEbRy/+XBiLgZCsnOGqLdc5/fGY2eHVYzWHAlQHlSf2hwNddeMn2QfX2G+7sakvRhH63XLu
	hyrs1aKDn5/E+/QMatWkd6VKsG1JW3et8moIWNcPrHSiarQnYXx4xbfd7hzxiijV5xUS3p/+SA8
	C8CABlZplYYx9eW6mCqvGCRph4ITLSu2cPbCnjhE5kCbYOwP5oPm9w8VJeFUKLN5Rm7BUzmp2hy
	lMWLE7ICg+UA8jXnP22skUBFJkWbZdvKSE3JTA1nVYekEzeV+fyuitUOYu47NR+RCaw9ji5zDLI
	LJa3C+R+m3TLELCSrlEM/tq1K1XOXw4u0B8bB01A4sVOtLdCRkBwwmwso
X-Received: by 2002:ac8:7fc1:0:b0:506:a624:1939 with SMTP id d75a77b69052e-507529973d5mr181762531cf.51.1772473173838;
        Mon, 02 Mar 2026 09:39:33 -0800 (PST)
X-Received: by 2002:ac8:7fc1:0:b0:506:a624:1939 with SMTP id d75a77b69052e-507529973d5mr181762001cf.51.1772473173392;
        Mon, 02 Mar 2026 09:39:33 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ab3d88sm117733981cf.21.2026.03.02.09.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:39:32 -0800 (PST)
Date: Mon, 2 Mar 2026 12:39:31 -0500
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, ganboing@gmail.com,
	marcel@ziswiler.com
Subject: Re: [PATCH v14 2/4] clk: divider: Add
 devm_clk_hw_register_divider_parent_data
Message-ID: <aaXLU6iuY70Six9H@redhat.com>
References: <20260226090513.1696-1-dongxuyang@eswincomputing.com>
 <20260226090630.1812-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226090630.1812-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Feb 26, 2026 at 05:06:30PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add the devres variant of clk_hw_register_divider_parent_data() for
> registering a divider clock with parent clk data instead of parent
> name.
> 
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

