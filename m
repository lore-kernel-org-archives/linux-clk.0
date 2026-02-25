Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB28133BBB5
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 22:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058815; cv=none; b=Dbqn4V8aqoVVUK92GvhAWu6XtOF341lg/Ic/KyH9DtchlG95EQh962PXKq4aPJver3eRrS+TDtmyacc9mrzQGJm3leHCL0ObrT19Yb2VNZ+M3VXCdcrU1c6vVjp4zyvXSXPr9CZbZyD6yP1Rj020ePLE9Njk/aFmzfZ4z49yymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058815; c=relaxed/simple;
	bh=GfbTcEn0qUrP8pgBbv1bvBtlWkNnDfoUuQIApJKB3wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3vP5cSWUkXbxnKuOYeNlh9qngd1dwdHiEwDaVwjnnXYq2w705GbsGa19wR6Hi42WZffoyGXpDQ3gAC+/zB0VXW6BWzIT5c5p2zNQfC/cS5NgdWNRASMcTPYJh0sDYPmMilHdTNpkUMXnMkyMhXg3+Es1xtZE8wmHkQQQgxs9oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RjY9k49g; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XN/AhG4W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RjY9k49g";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XN/AhG4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772058813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JgdiubeK8lfwSAp0u5vcGH1Fu308VQqpIDZPkSsKtVU=;
	b=RjY9k49gBVMizNZqBc/Ire9AaPTVsaJmaCBp9cw7odnqgqknxEVJteJuY0ToN8VCkK1XHS
	xP/Cc8oLOfPy5RMpU5V/8yz6U5OKJFk9gEO0g3OESd2BDCoMC1I8q9vy9QLUZfRh05U2wQ
	tGn8Xwu7vr/1/eR5ZgYAt5F2vjzOfmA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-vTUFVyL6OYeabyy-2tkLVg-1; Wed, 25 Feb 2026 17:33:32 -0500
X-MC-Unique: vTUFVyL6OYeabyy-2tkLVg-1
X-Mimecast-MFC-AGG-ID: vTUFVyL6OYeabyy-2tkLVg_1772058812
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7949310b90cso4071697b3.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 14:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772058812; x=1772663612; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgdiubeK8lfwSAp0u5vcGH1Fu308VQqpIDZPkSsKtVU=;
        b=XN/AhG4WsHma0UDtGzezrXKlmiFxQuMJMk0gJzOthqexzfkyB+oVu+r87HT9853SQW
         iXDCL+uxWy0kaH+XUKYxNPefOskPDbwC8bIix7zyPcFK/uzSqUsQsNSCuhUmw5HSVYxQ
         3uVJi4eMX//EBsO6faqdIIxsFSFp726zUdrLAxUtHsvM9vqKoXcoZ9yLp2phRujCiZV1
         qoihhzzIp6xWYxAo8lrK2TXsYvglH0MW1SFz/foY9DvJFus1Dj8bv+s1Ewz5wwxsqozo
         2cPq7Cn16OTb/S1Dv3FqeLqohr2OvHo3Pg6sd3XZ/tQ0e/rlGa9pt1Ny79QSFXFSPLNz
         iiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058812; x=1772663612;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JgdiubeK8lfwSAp0u5vcGH1Fu308VQqpIDZPkSsKtVU=;
        b=alTX8bZ9uWPPnigJmTMG9pr7BTI377S7GCmCVl/hCvXKCorXH0eQpVYKBnOPOgzPcB
         +TqYpHj3ob7KkvpriiSClQ20ifW2ccB/VKQtq8DqU1fjLRGVBRHJ8VjPzTuNiswS2Jkk
         oToWEK9QWhKPOJks75Koal4an68NC2sR4WG8MiRaxAyjsVzXa/ZTCKiTvdRR24Qb+dnm
         r+hgMYQH+8RdjGGtQ1o6i4ueHPRzWXo1bsttVMqbgQqheSlny/mBKCkvn/kxY3Mcxe4O
         SSdAwSrAu+B0vxiVVR3ro4zsuyJI/QaHSedYmm2ILrX35DijRTPQaTdaNzb22GJ982r+
         oBWQ==
X-Gm-Message-State: AOJu0YwC4FFnNwcc+Q/Z/zQ30BfG07m4EJKf/GsSifGEsfK/q/YNNLsq
	e3KMpEmhfKjGOknGzGZEyIivvcIzxg6EEcvtMLx0uIBa1JpTdz8P0qT31TalCdccW4n4cUJxb7m
	gZ4SmpN1lz/01i9Aaxer2KYziK8oz0mjbn+eZEAy5znOUNjhOsoaoMk3EQuq5vw==
X-Gm-Gg: ATEYQzw8HdMcJBIrFRzAkaf9EotZZpcoJ5z94SyAYbZEOmcK6ehlAeKV1BcTkgyOd9q
	yVYEfkfj+7K6WDUkwouSuyouEfvTHXSIiEXHb4cLRqhp66okbCt+50gZmtJzDf2kikDelppVosF
	SCYz6bERlGimLeykzajZ0U6avclOt9q6WXZo1YItpk98jMuB6UAmCsyLo5IMFer9s0xVSMqrKXU
	jgCIo9L0L16Qbt9dCyz+oqhmEUURWbVkY2CX0hzHtBqQa4Hsw3cDouJzZgDhJcdGUhpr9SX/BJx
	MHIsup+BdL77qiV+GbrOAZUDSI3VYfuW/FrhdKF4bULAIYlRTgwoSN0P4mLilvWEUOhLmoMupyb
	eoCTrU9CMQIFxC936cj4=
X-Received: by 2002:a05:690c:4b0e:b0:798:138c:76de with SMTP id 00721157ae682-79876da4cc5mr2001367b3.41.1772058811424;
        Wed, 25 Feb 2026 14:33:31 -0800 (PST)
X-Received: by 2002:a05:690c:4b0e:b0:798:138c:76de with SMTP id 00721157ae682-79876da4cc5mr2001207b3.41.1772058811079;
        Wed, 25 Feb 2026 14:33:31 -0800 (PST)
Received: from redhat.com ([2600:382:811f:bb35:ae9a:1ac7:e1d:86ce])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c862e5sm852057b3.44.2026.02.25.14.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:33:30 -0800 (PST)
Date: Wed, 25 Feb 2026 17:33:28 -0500
From: Brian Masney <bmasney@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 3/3] clk: x86: lpss-atom: Read frequency from the
 property
Message-ID: <aZ94uOb2vClkJIKG@redhat.com>
References: <20260224121159.3503754-1-andriy.shevchenko@linux.intel.com>
 <20260224121159.3503754-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224121159.3503754-4-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Feb 24, 2026 at 01:09:22PM +0100, Andy Shevchenko wrote:
> On the future platforms we might need to have different frequency
> of the free running clock. Allow that to be modified via supplied
> device property.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

