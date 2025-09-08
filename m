Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2FE30BBBF
	for <linux-clk@vger.kernel.org>; Mon,  8 Sep 2025 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351617; cv=none; b=KbWTpvXrUTyKVbZtnOPmH+vH4qFmFyvV49QTD20MkZd7EIP8vwJAMeVzeyAKnpHmJI0hROxLeHX3AciPGb5LFFLBqKwexdS6Lb5tInh8w8f7V4gAi/mUuKL5RF+EOLLhsT100TEb48KLFofw2LwMPNfB0wVaUXtAgBUdP92y7Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351617; c=relaxed/simple;
	bh=Ary2qEdINuj3SFVzWL6vHBjiROpx9PRgOxSO6BA+PFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9i5C/lxyE3yWPmv8sQhVD1fG/yx0Q4ziirR9igS0+0UF8jMThnFmKwZs32GxXGFkTYra6TjXt0Yv0k4nxzISV//ew1dtLe4b7n/1ZFLCoEBilLA5NRkNgUzEpb2lJzgTHvAcDfgpSk72mfmsJv3dw+lfqQhwz+y0dnXcDpEwcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TfJQxYHB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TfJQxYHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f5u862f+33I0ToIg9z8vAxXZhZpYtuEC4meBODLVdsg=;
	b=TfJQxYHB7l7KDDURxBPpIH30XGO4ymo6MB3/92HdIeoAoZEtg4U/I2UWM6lwrP4l2BTnK2
	wcOBRjMSQwp2hKut/wNjnyWUR9dtKzgBF2EwHMouImHATmOHilKmJZkOxo4p5nQr3BcWx0
	YBKoI83gPpamAmV2iwvyI6JspTs1Jew=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-n0rIwxViM5ydHq_Tgb4pEw-1; Mon, 08 Sep 2025 13:13:33 -0400
X-MC-Unique: n0rIwxViM5ydHq_Tgb4pEw-1
X-Mimecast-MFC-AGG-ID: n0rIwxViM5ydHq_Tgb4pEw_1757351613
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-812ae9acaecso719045485a.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Sep 2025 10:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351613; x=1757956413;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5u862f+33I0ToIg9z8vAxXZhZpYtuEC4meBODLVdsg=;
        b=cSRWmFBSg9vfhk2bU9RQzmJJ7BxedIGHAMiz2gPj/TqNtm4EqujK2dMi3FwXxCAowT
         9ICAGrDLNDMWl5eFNmiXGJa4rx7JlA4Kl/0w+UCXkLojeSYvNTXzBO+nhG0QgjFyfFXu
         K1KxYzFayS4JY6r1fSeVz+xozjPGyIzaAaPlnrNGoPFzgZhLGhN42kbax9U3IICG7pfp
         v5KkKPTxYA3eV9uBXUL1w1BSanNJbpOZ0QgCaQ/9E2KWC1mGt+Wdk5qBH9YqL3IJF5y+
         7S3SjJKe37SNY7DWVLYjx0bG4LBAnrEBaZdGptJIM66mUdzCPJRUoHyTxrSK8ZNpaSoe
         KUig==
X-Gm-Message-State: AOJu0YxWzhQU9aoBuhUgkjjVShaEiH0SXf5s2SdJQs7YcwpfwBbs8Sz2
	wTNjSElVwl8+EBUDYQyXG3Rf67XKsHfP0pZb6ArFA9/uNZ9mOGfhi2CjD9SYj9EuIl0KCeAi7gH
	EyKp7v3BeCa7Z2jOTrerOi+An1oOV1T6sFsZ+eL3l4BdB0pAKplX+2CpxHBJ0lQ==
X-Gm-Gg: ASbGnctKB1L7w1WQQRanIIgfH3CnLDUvETGKxjhs8evdQeKW70JpMRCOhsfsHpVTIUf
	KKFPEclJ3OdvhLZDQVp8BHQfViyolns5WmRWFzCsUJ1AH4OhtUSfnJTo6+rdRZQR0ph3HWKQEnO
	E+fcLDABX0CQ+XjOSA5gJCeQVa1ieBMggl5zK4oNjUtBTCx2Wzl4XRvBigQ7SLF4Qevvj6nloU7
	O7HxHzL0ZHj6PnVKdBigINzNYgsscWjGZlrcahwvSuHP7VonPJAaWH5dKDPnONpr9pwNNx7Sqwm
	hLiIdGzoazuPAilQcdDCpKY6MeB3pKjBOKUH0Fx7actRZ8N1pl3bLcRdnOw=
X-Received: by 2002:a05:620a:4589:b0:7e8:1d4b:b00e with SMTP id af79cd13be357-813c31ef062mr818167585a.30.1757351613100;
        Mon, 08 Sep 2025 10:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjCX6nGjgyfHMIgtZhE/2SgJwH/cNIdfnPyghhVtQtsXFicJtDPEijNhBgIwhV/6KVPSFsmg==
X-Received: by 2002:a05:620a:4589:b0:7e8:1d4b:b00e with SMTP id af79cd13be357-813c31ef062mr818162785a.30.1757351612499;
        Mon, 08 Sep 2025 10:13:32 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aabf586c5sm1108360485a.60.2025.09.08.10.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:13:31 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:13:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/8] clk: convert drivers from deprecated round_rate() to
 determine_rate()
Message-ID: <aL8OuWjlswr95xcB@x1>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Aug 28, 2025 at 08:38:19PM -0400, Brian Masney wrote:
> Here's a minor v2 to my larger 114 patch series at
> https://lore.kernel.org/linux-clk/20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com/
> that only includes 8 patches where a v2 was needed. To reduce the noise
> in everyone's mailboxes I'm not including the other 106 patches that are
> still valid. I will supply a 'b4 am --cherry-pick xxx' command on the
> other cover letter to exclude the patches in this series.
> 
> This series has no dependencies and can be applied in any order.

I included a subset of these patches in this pull request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian

