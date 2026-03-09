Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FAE377EC6
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 15:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070803; cv=none; b=C6htQhfWhQZVvjUa7ScVipDB3M6G/Jy+H7dt78cHBTgHvqJtxfZu2pd+e4Kx6LAQGU/Y2LjuiG2ff2/pxdvGz7NH83b2KizhfTigzZgh/XfKNLBNm4ZCDj7f0LOq4KfY1+dDMY6JS6RdK3KioAKFc82tiel/4pHPho5iP20DUMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070803; c=relaxed/simple;
	bh=sfB6dzF2hJxL+xZn1sg2gRT//rlMnhqnULg42U5nZi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOt9p9ODyjttWNVMIcp4LMvYTA3PZ2KiY8766tnOL/jUcmbUUn+LbAwVwzDd1OA92ITXVd2fic0jeS9+2KmpIHHoewMG+iL/0LAoaIIqm+gUb14c5SUdjO9wYFpFqiHw429ozVkZ3jFCozTL2R2I8YxO9yengSrzMqEARSimEQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KrrzPB13; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eiB9tMU2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KrrzPB13";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eiB9tMU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773070799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e0jqr9O5Qe+QOiK/NfYBlUp6xE1Lwly1Kq1xM3BGau4=;
	b=KrrzPB13T2D69UhOKCoxVS7Zm2tGJQNQNohdqfWArR2CYzFH+Qd6fOMUdF3Jb/pJmP1OvA
	ijuiYe0HI0vopIDLNwRjXjpJarw9yV51sFqhnxpYxfzZnBWFz/+oWzJixkx6QCZvsWXJ4j
	PGpJVDIMnqPU4Ms0Hs4bdnGy+JgpFKM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-nKMpa1SLN8-RkUORmm3C3g-1; Mon, 09 Mar 2026 11:39:58 -0400
X-MC-Unique: nKMpa1SLN8-RkUORmm3C3g-1
X-Mimecast-MFC-AGG-ID: nKMpa1SLN8-RkUORmm3C3g_1773070798
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8b37d4b2so590571885a.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 08:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773070798; x=1773675598; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0jqr9O5Qe+QOiK/NfYBlUp6xE1Lwly1Kq1xM3BGau4=;
        b=eiB9tMU2KN0Uhp/dNeR9bzJDQWR7oaqW3l2lutomZ4oohyLELJ3e98DcAlxTQUXmqk
         5yKGVQTOkQcypYt1MNxaD2G84s6DLkgXVR7fMIoH4RJ5pRIIqj2m1UvCccfQyBrzFZtK
         GeyqhfYyAvFe9sLeVpKKWW+Iv7l2UQjQPMNAAw4lUOYkQ+xZOdx3nlfPPJBlg0xsXN2v
         Bv7Z6AJAV8WeyWyw74Gy9F9Gpbf4X4cpLvCRz8bANmHBphHufpqilRhwrj6V2vDCA6h+
         BI9gtD8mBrWV3LTMsyGCe/A4BSdwLujzVt/p2hNy5tSAHYKMQLzD7Gz68xaNN64nrhGN
         QBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070798; x=1773675598;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0jqr9O5Qe+QOiK/NfYBlUp6xE1Lwly1Kq1xM3BGau4=;
        b=BrIGsuRbcfLeEAuOnpBGCWflcz7/jC9vXThpws/yOKZ6WzujtJ0BcuRAsbolDDZWNn
         DbtdE8CWnoXZKzeiQuHICRFh0EGFW3dmho6xc7wxdmjLJkbDpcAWrLd5EvO2QaIV4y+m
         bMgNwxPJJHsbsTFHHrVTfldJgVCskswkXis5QOm919HooFnVYJcNmU6+QGZAKsSRinLW
         YacvH6qLlRUoVcasqKBkwING4ILEE8EopWlhTOiiir6AG6iLgJJW5RrM3wWiMlAZmu0V
         zOT/o/O8yM0AdlcDS2X0Ephf5G57xd3YYPVe6Xw3aTbGduQkhWv9yWPFOUFbVciOpck+
         mdQw==
X-Forwarded-Encrypted: i=1; AJvYcCUbsMssBZ2zhI0X6nWXFkAZr708SAmuTDlCwhnArDGUL99o+gT5MWLYwdiXmpEBWCKP+VmIkSype04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLe4crU58xcRN/P5ggduYN0tB51hkBYfVX8HoKNdNiJwzMS4Dx
	YYl7zR86CgSYq40mTJjCH0x0sUC5iVPhHfEqn39SSCxNJOJ0QWuLlLPAIy58W4+GeWEtORbUsbd
	CnlZ1km+8ySZTV9hZdzkcO5LsLekdJaCw/L5qAos+Bv4s5JkYHyW30p2+0xX1hw==
X-Gm-Gg: ATEYQzzNmCo4Y8f4SYKesbgt+uRx3euh+/1j/UxztZH0R98Kw4Ix2v1YIHfbzau3dbl
	9OqgPTAWkkbobWGRr9nvz6H1FT6U99Yn0M4y5YLllTJQOzdtcP6b7dLCEVinqKqF/+qzaP0vq5/
	ijxMtYiIxppzmudWiy3cKDoZoZ9ns8tMTp3l++hQcbzgrIlTjFeZW8DHtx7ZxaHre3rJrjob/Sl
	llplwuIvbH6FC1nsksBMH2tMEaBsyPc++nydCgU37U+zkzNkE9sg7B9m4pAYZ2H82g4w+OEsl4D
	LJrk1LA9VVOy6pEh5zqYpr2JnygxHOiB77UVxUfit1KX9OhFtIEfoa9IP8wxJkn86uLc//r6UfK
	X3yL70EUFka0qwZ7+4i+3XqvaadjMzstKKuCFaFhwK1xLCO16Qmk94ROJ
X-Received: by 2002:a05:620a:290a:b0:8cd:8f18:d1c0 with SMTP id af79cd13be357-8cd8f18d44dmr228536685a.27.1773070798144;
        Mon, 09 Mar 2026 08:39:58 -0700 (PDT)
X-Received: by 2002:a05:620a:290a:b0:8cd:8f18:d1c0 with SMTP id af79cd13be357-8cd8f18d44dmr228531285a.27.1773070797673;
        Mon, 09 Mar 2026 08:39:57 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd90aae418sm84839885a.26.2026.03.09.08.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:39:57 -0700 (PDT)
Date: Mon, 9 Mar 2026 11:39:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aa7pywbaB7rxLWwX@redhat.com>
References: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
 <20260306-atlantis-clocks-v8-3-6c9b14a4aa8e@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-atlantis-clocks-v8-3-6c9b14a4aa8e@oss.tenstorrent.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Mar 06, 2026 at 11:12:19AM -0600, Anirudh Srinivasan wrote:
> Add driver for clock controller in Tenstorrent Atlantis SoC. This version
> of the driver covers clocks from RCPU subsystem.
> 
> 5 types of clocks generated by this controller: PLLs (PLLs
> with bypass functionality and an additional Gate clk at output), Shared
> Gates (Multiple Gate clks that share an enable bit), standard Muxes,
> Dividers and Gates. All clocks are implemented using custom clk ops and
> use the regmap interface associated with the syscon. All clocks are derived
> from a 24 Mhz oscillator.
> 
> The reset controller is also setup as an auxiliary device of the clock
> controller.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

