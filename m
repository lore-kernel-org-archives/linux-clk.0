Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4CE279DCD
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796290; cv=none; b=H4SqAjFNo6M/3JKVndaStoZHCGL79Svx0d96K7XkdqMZZS2UrzSqyFM3k3UnRRXnx+VRnYTrl8EhqyeDK8EL8kxr2v/8gG13nansy1i1xttjl9br/sbpOMJOxeTu+XAVwIwVAFrBVLrqYaIw5GiDM2WKB/uHt4w1XeL980TqO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796290; c=relaxed/simple;
	bh=fQAAEa0IEdGGZklTEH1aa3BIFmCLu/CkQamKj+rGm1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSOSlBc+bSZjs9bl+f2pu9bq+l8Bsd5mpMm8CVrH+bLtXVH9qQXcsNKZ67aSCKpL5Wk2uQ5aXluZwNTQylQ2W0z9qQvUdnr5zKCTiqT7NCBkutbXhdYvIsFQ1x8pAETYLSLmRC8Lxe6svXkrPn1rqWKLbZ71mha6VX8enfie5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CsiyItoE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CsiyItoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758796288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fQAAEa0IEdGGZklTEH1aa3BIFmCLu/CkQamKj+rGm1g=;
	b=CsiyItoEUbzA/bQtZfvzedZZz1TdD1F4XaLaWIBDUxczPrkhLkRERZpOzvauNCoqlRRa74
	txyiPfKxvUeSPgBedjFvLYcl0gmIFCRazmoFT++X6FGlDys78tz1rvW3x/wr9m1PSfQTbL
	36K95ehm20DN3rb85VpwNrnA10Su9ao=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-TAEFFku5MBO_vFfwM2dnRg-1; Thu, 25 Sep 2025 06:31:27 -0400
X-MC-Unique: TAEFFku5MBO_vFfwM2dnRg-1
X-Mimecast-MFC-AGG-ID: TAEFFku5MBO_vFfwM2dnRg_1758796286
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d91b91b6f8so13286551cf.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 03:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758796286; x=1759401086;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQAAEa0IEdGGZklTEH1aa3BIFmCLu/CkQamKj+rGm1g=;
        b=SzLsZqDZiq4Ee6/VsrZAvnQw3046C46Z0xS2tf7bsb1+KHfOTtaRLcI0MSIfxlqxbg
         1SVe5jKx0pyvVVqnBIjTNRdnw4akd9OVYMATyoLDnpa3l0vOVzsvjg3Hbnh/ZLQ9twgl
         5fjaAEqwwiFmoCiXMSajex9hwPfj813qsbsyHwN6NxwNwy2J8nKMvQPTE0ljMYa8XFb4
         fIqY4AsraoT4Nc469OS3jR8DCC+sBuA4P8a0w7wtLscCwqugJIERSW0ZrbzZdnDBP5kd
         rY5wVcH4KaGlDxrKgT7AMPf3qoCH2XhqVddoLEzqi9lpnHQ0xrzly+nWRs5loKqn7nOQ
         AEPw==
X-Gm-Message-State: AOJu0YyE0SVdufOSs6Lpk/C5/2LTjvEe7iaPf7HHIsNWJTMuWjDPkiaU
	pOAQQx1jEuD7Ie6AHJfMcXNRWFWLgTNUAgGth0dhQEfoQ2yTYDVxqygmj0V/9QfQzHz5Jk6IuL8
	0EL0CiO0KDKtK+Yk/+5IFXjt5PVBY5+brISrYtHtmiIxj0tkkxzfUP/Lzg5t7HA==
X-Gm-Gg: ASbGncvWkv2NytP6EYOBth1TDYv5t6XNnDO+56xFkQvVzx4DrRaNxSR9ppTVj07zxAu
	n6ln1wP8qn6BIh5yE+JPPppUvhq+7PYliXsL0UNRjfXuv5Rph4qb4z+r6QTjMmPKOLeIH1/f7c6
	qv3k1eidi1OfolcpyePzP86+ZjIA6x/2U+Bsf41OL3HtpNG+4q6weIKdDeg8SAoz89PNZKc7l7w
	Rt6sqL6oUq1SQCcGvUo09d5S2mwkf4a8UFBzEqKAgUi1WEp5DKc5E9wFQ/FG0KgohdyZTMV3PPU
	H3N+EwUXfZZnrebZA1h8h1UFDZVRJZy7FOffxAfxx+sGAiTq/4/Ym/yGyvtz+ULDpl54FtDhhIQ
	YMEdC4zeApf7uVjahIKfYH4ZlAVIpdog=
X-Received: by 2002:ac8:5987:0:b0:4ce:497b:73c5 with SMTP id d75a77b69052e-4da488a66eamr33623181cf.32.1758796286445;
        Thu, 25 Sep 2025 03:31:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdd4mLS42QGKg3aD+HeSL+9y036a9Bge78MNLawf+XLw4VnS4GelLpXVjg/ksNKMa8zAcU+w==
X-Received: by 2002:ac8:5987:0:b0:4ce:497b:73c5 with SMTP id d75a77b69052e-4da488a66eamr33622951cf.32.1758796286037;
        Thu, 25 Sep 2025 03:31:26 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c34ac3a81sm86618585a.67.2025.09.25.03.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:31:25 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:31:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v4 00/12] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
Message-ID: <aNUZ-9wJkhsJXi_n@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Sep 23, 2025 at 10:39:19AM -0400, Brian Masney wrote:
> I marked this as a RFC since Stephen asked me in a video call to not
> add a new member to struct clk_core, however I don't see how to do this
> any other way.

Correction: Stephen asked me to not add a new member to struct clk_ops.

Brian

