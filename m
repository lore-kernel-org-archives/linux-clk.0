Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44753164C5
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 17:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473195; cv=none; b=PQensk49rBgV7xzlOIrs1XIrwYkhLUexJcYXWxz2K6MvJi0HARR/rZQ2xnyuMnH5uYuhWizgqdhUa/h2iP1S4QmJb5Z6VrOb3Jx+/NeZWNwk82ad/+HoQJDnPRJo9T4tRbPmQO3cS9a9KV6YtqS1zij99GK+39ceS0T87NT8HK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473195; c=relaxed/simple;
	bh=LkqzEv5GwI2vJW4ZcZ4mnZnF1u/RJgaOFUVjmvhOjjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MECAt2uvdvoxDB6fo4yU8X4ohM4ZTnjdFPcDhU6d/XHW83/F1tE9i5r69b0wMj9ltOye7LKZthnJimJeP5N6drnK6yH0tt+BW/2QQhaTcxCX7XRdy/e4x0LBwBLCKtWn/w7qluIepD+ZV+2WvxHTM+GUCOpgs7P2IjlOLo7I7JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LNjNhG8g; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QFDFEh1s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LNjNhG8g";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFDFEh1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772473192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ttdWgxDo7GHEMv1uiR0nwTA2j+HTNDLbVV3DlRs7m5I=;
	b=LNjNhG8gJso/q7StPtId4omAkDK5pWwOhrs8W0RWRcxudg0pHySpFQuKKC9RlWQpADYDdL
	cRATTXdJu9E7XvIiMwwtUvBOlK9vMZ5eTKotFmreQGK24Rh4bT+FoCD6Jyc3cnEwQgdha5
	m1mJ6UpmBXHCUuMLOGaabSjRFrgE1kU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-5gmaime7NzKbeGX6bDiAJQ-1; Mon, 02 Mar 2026 12:39:51 -0500
X-MC-Unique: 5gmaime7NzKbeGX6bDiAJQ-1
X-Mimecast-MFC-AGG-ID: 5gmaime7NzKbeGX6bDiAJQ_1772473191
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5061d1ef1f3so559626301cf.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 09:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772473191; x=1773077991; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttdWgxDo7GHEMv1uiR0nwTA2j+HTNDLbVV3DlRs7m5I=;
        b=QFDFEh1sHw91aS3NyZs5GsFyhDE2kQ4nfxZGOIk0DjXJsURHvzFDaqaJUWT+QVEp7+
         Y6MzVitLIhSsV6HA6atP8mcnoC5GABZrs3FELZdf59Q3FL5dWsxtfz/Og9wOgWF0yjn7
         u8zOX+ACtL2FTqq/cB0RD4ojAU4qnx9ctaWlWSutqRcSL/g8AriVbtNcGPOofGYOH2KC
         1Lc38BsLmY1vlii+gBFHtCr+nDfTvSo4jMSiZcczP64ejDGLQBklCYX0RLSbhDhCPWpM
         TTVdiePJ7AcPMOBfHRn2FtHdY7pxQmd6bXEF6K7hTTd1eXedvirEVrfrcm7Jj9KIhJZN
         WXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772473191; x=1773077991;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ttdWgxDo7GHEMv1uiR0nwTA2j+HTNDLbVV3DlRs7m5I=;
        b=fSs5O1PVlKV5T3p3jLzf4xsbzHEyenwUQndBfg9gBkv/eSsj4L0Y291W5C+8h8rLXq
         wRPqy+46qRflPBMuTMpAtSwoAQunrhUQ+mWMoAEJrXkEbQCOQ6sA9kZROh0xnshnFG6B
         JBt2M5Wu9l86Ok1EjYFjFdcJvXdHWx3phjpGqyFs79VdApZplersTSgc8pAMQR8wtjry
         2T0k0+leTxQ6ri16DfLavwHzt9Pu+Tksl7Nf8+sLFaaWTpUFF3bSF4lWfga0x0pba3QO
         U1HsEm5OI/ogn56nDTFAto+rJXGlG4Hj5JfWy9X49SakeSSeY9AKFqi1gTibYyxYumVE
         Av2A==
X-Forwarded-Encrypted: i=1; AJvYcCVpX7lCS+KW6qMTsj6m1V0cYn9uM+QjiXzYbli0piT8rMQuALw1cwLmGBm+dYlzgSqv1LdlwhnfVoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh5h/2nx5fZ5gJGiEyRRmVFsTJwb03d4HaJiJwFX6Ox8EhAbGh
	jpK3wwuma30t3BIsZySod/wy5VJ+Z/xo3X1Pdr0XQ16OOhC+x4JVWtfQrjSTC++lzA3zdriRmxe
	v01dFckyDeH36o00/8RMkO17/nCXVNC6wc2QupNt/5G8upcO1NYOJ/CQhJ2gNU0uTrK4hXg==
X-Gm-Gg: ATEYQzzykAeQ+pJD2n4SPyjVWMO1PIHK6vuIO7ucSmpP+YW3U94e5QOi0G2eCIoR7Nq
	pp3bRNWEl6aEuaWBWgdEtuAgbt2uNaoJ7FI8o5wAZori1J+Wii99RE33mr1yM5t0NYYfd7z48tL
	cB06dBBbMnfqLtXnJ5tr0JMrsWSF7LdFauQgoNFGuxwcasuMNis+ufsflBqtk5wzewZaWgsTJWt
	fARp/1Lv/GuhsxGV+0P8GK0WOB2yS4CpN6UCKBB4FDJQ9Nj51ljWI2Qfi4knATonTwky2YmltJ9
	8cjNQ6Z7sZs9mXPtDpUTy35bzPKDbsI8MnEHEUbJieKPXuddLlbJpO//1Mp+qJoP7xUK2KmwiiM
	stOOxPB6PJsv/yOQD2gfDPXFe7PSLktH0hghgn83wCvRqaCTb39LOhofb
X-Received: by 2002:a05:622a:11c9:b0:507:3d1:433d with SMTP id d75a77b69052e-50752957d21mr151765531cf.57.1772473191260;
        Mon, 02 Mar 2026 09:39:51 -0800 (PST)
X-Received: by 2002:a05:622a:11c9:b0:507:3d1:433d with SMTP id d75a77b69052e-50752957d21mr151765121cf.57.1772473190825;
        Mon, 02 Mar 2026 09:39:50 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e7627b69sm55195036d6.41.2026.03.02.09.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:39:50 -0800 (PST)
Date: Mon, 2 Mar 2026 12:39:48 -0500
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, ganboing@gmail.com,
	marcel@ziswiler.com
Subject: Re: [PATCH v14 4/4] MAINTAINERS: Add entry for ESWIN EIC7700 clock
 driver
Message-ID: <aaXLZLcpMMckerpL@redhat.com>
References: <20260226090513.1696-1-dongxuyang@eswincomputing.com>
 <20260226090702.1922-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226090702.1922-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Feb 26, 2026 at 05:07:02PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add myself as maintainer of ESWIN EIC7700 clock driver
> 
> Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

