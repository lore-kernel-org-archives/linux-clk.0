Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330993EBF14
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756795; cv=none; b=hTbDn1a+2S3Si2q8ZXcCWrA9Ihh1eLn9437lCh54FewzsKPHGOTnrKr4l1BtTPkr8qXj5g8N5ojIDSQpUJ9EMt7PZxjprtDyXvJz1vMFGiHYIxrv0n884ftLvf4NDvVTkuwu5MguwgOnueFbQKwsAvuETFJ6VZssJ2u0+I+EpzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756795; c=relaxed/simple;
	bh=91BKEugAixdxcjS7gsISaPOceXdhb9ubhvIKgagWg70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roGQKq3TLSEZyM7oCX4zDu34m+Gu5jmFJZ/VW4qolN0CZcmEeLMVZVuJnikVYIAIPtDe12HfrECaMCrlUCn/415OCjuuVDi7YDCDawIV/8fg0dhQuQSqlygP6Rw5fsNPjuDQ4bjF0Zishy7pu2UIpvBmk3X2LA9iYhXh4cqBJyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7Iv96k1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CMU9Xxi6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7Iv96k1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CMU9Xxi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773756793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91BKEugAixdxcjS7gsISaPOceXdhb9ubhvIKgagWg70=;
	b=P7Iv96k1HFlDwAeuNcJtuj0CdyXvZM5XgsE0chJvJjm/34dT8ogsZOOjS+HqMIZiDkXnO6
	xoYCiC++ZguHBehzJhgklDbBI0enWVKsGfpLI/BvBXdr7SCrWqDFwvML515bJUm5Plj0gN
	NPoaW7Rbwud3p7i0g3LuPIN3DU29rBs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-uct37gCANLy5Jtq9NtCpzg-1; Tue, 17 Mar 2026 10:13:12 -0400
X-MC-Unique: uct37gCANLy5Jtq9NtCpzg-1
X-Mimecast-MFC-AGG-ID: uct37gCANLy5Jtq9NtCpzg_1773756792
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a0684d05dso52025696d6.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773756792; x=1774361592; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91BKEugAixdxcjS7gsISaPOceXdhb9ubhvIKgagWg70=;
        b=CMU9Xxi66Y2KWbcs7/D/+TUvxSSZjT1svwLcxNx3PCPtCuXh2UPA2HCSY3g9VeyF0p
         KtMfoGdZ05yl+PuRi77yABP7/VJpB/wIgY09k2yrlPgSyfLCEln0jr7JMd6imMTP3Ww/
         8Y0ThCaCQRfJw+4tTWrXB7sPd1ywmU273p0QVX3Grbik2/0q6g/xMtGCbIK0digSm9mS
         cSP4iLCE6I3ZgCWLZkjpvJstVX9qxbH+hQnw7NspIQQrie6tJr8KBWIb5SiGe1jVm0M7
         dvDvfymZVYHHUqfHMp/4pOlSvOC8Rf0R6MrUZoMlwR+JHsWyO8YxqUh3Gur7XhYQWGyC
         3kOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756792; x=1774361592;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=91BKEugAixdxcjS7gsISaPOceXdhb9ubhvIKgagWg70=;
        b=JzCGmlz35VzYUhH36xp/tS+LCap+ss9BhPX+iS6KTQal/b3Qh5LBNwhs6wrxxFMHmx
         31l8+axXmvXApwijokfPkyEYvhTgNZb+KMAQxbUIzNyXML3HBksm/PjvmWj3iDN3pCAE
         VIyItl+wBuCmGtUOTObtepasi9qWeoQ2yjbFixu7blDMb6bPDxOmgRibHodDU2vn0+DS
         WPV6gQGQZon/k2EGicrM/loShums+yN1naWHiL9iXYKZQiY4NEy6Mo50G1eyfGj8sM9k
         aAjeieUVO+MxJybiAkvzdWlcidanViSi+Khq0dKvtSV2GGLw6H3ciacpHiFATuYy6834
         PMUw==
X-Forwarded-Encrypted: i=1; AJvYcCWTTCNGZx5QV9BRXaT0MJEYtWkN2L0xfm0CYxrIBGVaham3mvNt6uZt6MNJ9k7SIzS6sUp/UKkpCsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyumOKfslJwnxWGaFjPsuW57/6CuaW733l6uPQs0PkCY2gePZUY
	gqRJMznGM+ZkDDSFcFPCFTPzUH9kJmwDo20UrBLEk9IPXt20+DSIDWSDNiZrzDE6mYAErZWVGTW
	QotYx76tCF2hgKPxte2FbnfKCb2JaO2iVyOr9dzVgi6NPFR0Un867pL4mF7UBuw==
X-Gm-Gg: ATEYQzx3LLbsyfT3OviYuQE68b3k00tZwRjRw/MgH9HzQV6OFkBxRN86RqMVjyoXUeI
	dXGzofgHbJG6ji/Gy1Jd1GC1KtSXTjfVwoahc6YBbewi5PE1jxB6XNHr/vNHHOZ1m6bW5ZFYVun
	dHbvOKwzYK58j/hkHIfOTqe/hlGGvQjCblleHzMOXULYMHhWMw77Mdwd11VLkhYWLi3tvNr1V3A
	MBJHZR5mjlVpnIKtKnS+KaAjs9O51UMVMRliwAV18hSDpYV1ZATC1vG4zGR7Ro0eH4OIRqRULBy
	O9prpn8lq7Zb6jgn4KpeHkzqJGhZRirVYDS0XynYkllaLQHmTTriJrjP/VNNhohPEwhZAI/pB2q
	v6CcUOQYpRgbE4D+Uuyhak4NAKZJ6i+4Ats1qlXrthQo2dRO0UIx7kwVV
X-Received: by 2002:a05:6214:c2f:b0:89c:5bbe:1e73 with SMTP id 6a1803df08f44-89c5e3f07e5mr52990466d6.32.1773756791611;
        Tue, 17 Mar 2026 07:13:11 -0700 (PDT)
X-Received: by 2002:a05:6214:c2f:b0:89c:5bbe:1e73 with SMTP id 6a1803df08f44-89c5e3f07e5mr52989886d6.32.1773756791055;
        Tue, 17 Mar 2026 07:13:11 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c4feaaedbsm47275346d6.40.2026.03.17.07.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:13:10 -0700 (PDT)
Date: Tue, 17 Mar 2026 10:13:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <ablhdKJgEhU8KmtO@redhat.com>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <20260317-notorious-classic-sunfish-d016d5@houat>
 <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Tue, Mar 17, 2026 at 03:21:17PM +0200, Abel Vesa wrote:
> The solution has been already discussed for a long time now and it is:
> drop the clk_ignore_unused late_initcall entirely and then make a
> generic sync_state callback that the clock providers can use (or they
> could implement one themselves). This way, until sync_state is reached
> for a specific clock provider driver, all unused clocks remain as is.

I'm willing to work on the sync state support once my clk scaling
series [1] lands upstream. I believe that Saravana posted a series
related to clk sync state, and I need to look at that.

FWIW, the only reason I posted this patch is because at the end of
Stephen's LPC talk I got the impression that this was also an acceptable
change. I'm fine with dropping this change.

[1] https://lore.kernel.org/linux-clk/20260313-clk-scaling-v6-0-ce89968c5247@redhat.com/

Brian

