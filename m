Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07B443B6D5
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352198; cv=none; b=grp+7DzRKD8r04TbYbetYWf9Czr63hm8ScsrmD1U01eOYqwS6Lmg9lY69b5ksvorTp4X7S56rRMKatMY434WRSKk9C3paCA3sthSHUnZ/kn1c7j8VEnEClqPHkryvHHQOcAHGShnxD6JuNCEVt2eaU8KJeyo9yDFKY+VM8zEmsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352198; c=relaxed/simple;
	bh=wVbr2DHZpsrDLnip0gND0doGgeZzZfvqxIEQvpI30Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNorDdL/lc90EoAZTFPZPwMZqNLWqfPecgtlqIIjh5o9+4bQAaLy3BVcZD/Kbk6cjAFvgc3TYFeK+iqVyvcBMV/3GrXz+yvdUATHpwnustB5Nf4a7Gcotn2/wnWMsVHsvuuooA/3f3YNnWZZxu2AeTpxrvleBbnaajCK9G3P+ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jBOmh2Ba; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CYVs8xTK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jBOmh2Ba";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CYVs8xTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/lpTu6aBahDmOXbfz6cfxVmcBkiFNtxLGTXawIRGXSc=;
	b=jBOmh2BaRWQu4K4juolYLenyJuADDQCT0x1GPfbefjgdkkCWqZk5N01R1Wnxmju4aI/MG7
	fgjYtcb6JEPUDEYS9evqkmm/kkOY+7ixngsPYylCGAkxHzaz9C18ComqPDjx7vw7lk8DLP
	mTVxJnomp/PMv7sQj05cCCqnWYUy4a4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-gFrdiPk9MN-wnED85W7oyw-1; Mon, 06 Jul 2026 11:36:33 -0400
X-MC-Unique: gFrdiPk9MN-wnED85W7oyw-1
X-Mimecast-MFC-AGG-ID: gFrdiPk9MN-wnED85W7oyw_1783352193
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8068416764bso96748727b3.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783352193; x=1783956993; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/lpTu6aBahDmOXbfz6cfxVmcBkiFNtxLGTXawIRGXSc=;
        b=CYVs8xTKB/uPVQnHRL+HHpJ2ETMXqO5iP4omR4kmWhuJNXIBhjoFc12b3v8Finz01g
         9E18UvvAwrap79QYfXfNZVFoFRJMamHJTbCUbdMqyG2dOwh4b7BYBTyZKJajyOiWn+RH
         7ruwVDjqjbE3VNIiqWio107tPhfkRsFL7ekDEwPczpPp4P0idtEjBnsa8hjggKHKay68
         dq+Vai/iJyKV1GXBvcWSNfJPIoxrbUWkoLYh05T2YsXe02CmMVkmjFqUBvBmQX6WicM9
         v2p0YX4uElImAfdPDgmrRmHlWNcogN0uY/Dg6kPG/62gIhTu8F3NM3jURCbRGs1kqQxP
         NWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352193; x=1783956993;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lpTu6aBahDmOXbfz6cfxVmcBkiFNtxLGTXawIRGXSc=;
        b=MSCqKCtmA8h7OqNPTcwCeNIVvuJsBQidrE8/aTsccO6WHpXm/c2HHgY92HD+JTuxER
         siY4KcWpm57WC0rFKWunlINTDQ5oZbL9sX9yWkSLUmAtxrCm5PPNBK9IQd07KyCTyije
         AAUW5y/AyAwqx9eTtuqGoGCKbzUTG/LL56h8ehN7Yf5lXUvjekjC9NsEslbxnctOWNTJ
         OKs9nC29aNEoUzepqDRC0+VLxIQjbInb7aanIDxC6Sm9jo48MX79OkvVdkLPZom0/ghz
         oPbZC1H+avw4GEhrJjkb2/D1HdlMQZdhdhXvhTL9lVDTElq+Xx0F0Y2nITNBcnYLw22J
         /nSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0qwlDRw67vPIAvdNc52jYaWRz427OsyOB2TXVYFm1AzTBKS5tgt2Xn7qv63xrkivSRWnoPw3SdBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlkzitPr20TJqkq0O/nPSIXn/iZNFI89MU+HjpzB3qEGFmepHu
	Fj3jvSyCyCj0ONzyqGaYbJbfWUTvuxYVifW82YO3eEKMQ/19XsiLbijO6sg9jdniQ+jSC+Iqjsl
	gktjhC+Jn+9t2M82BeNAVQ2/k4NNK7fcepIKOCmSD0pKI9Su+ajaote1wCAOxLQ==
X-Gm-Gg: AfdE7cmSglqDz7S+jRxlw5+3L28hqGzYa3mwox05oPLUExwyLm9gJsDYOPGdeKktsD+
	VpftX6ctrkY8cgXxy5bSVTrlOEc5rlaHz1jFwplHyS3AXYYuLhY/AaouFrY8Q7zltSaeK6momFv
	NT5tvYTG3zQ0FulR/AArikMjSKv4na54fK5IvT0NXvUwcsKXJweBClShJQ7JAi3SGRHgc+Vyrr3
	OOaCoyzt5WXhA89pGidA5ebFAtFi9VtvsNO9eLQ67UB0eGLg2g3UrbOLdwy9WJFbfhRJMUcxM71
	f29fJrbe+IwXmnDf5EvD8WY6aOMBfugMGv6fSX3DNuKqqlcdhctITzQfa6bLcAe9sUEeHFd7oq8
	Ew8n/D6VSOEPqLGalF+ohcVcQG+u6XVXyT9R4R3YD2Esatg==
X-Received: by 2002:a05:690c:660c:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81be153e0d2mr6745457b3.17.1783352193012;
        Mon, 06 Jul 2026 08:36:33 -0700 (PDT)
X-Received: by 2002:a05:690c:660c:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81be153e0d2mr6745247b3.17.1783352192647;
        Mon, 06 Jul 2026 08:36:32 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144840568esm59088637b3.17.2026.07.06.08.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:36:31 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:36:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
Message-ID: <akvLfrL2TkhEnxbQ@redhat.com>
References: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Sun, Jul 05, 2026 at 08:17:05AM +0800, Pengpeng Hou wrote:
> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

