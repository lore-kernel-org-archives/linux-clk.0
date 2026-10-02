Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AC7233D9E
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955170; cv=none; b=UG5jbCvtR/LUbuYirdYP1/Foxae1wgTPPlqF3U4ugldNl4kfwZqpEBGR60V8k4RJFnFQB0D8rpLPBBRbcqm91u5i3ZnrCEogh1qThjDPLXDOMDVYkS6Qokbmn/Kh136TBFwQZnciY3Tmx5sVF/bnaSMnPDORmpovZ4a31SoXDOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955170; c=relaxed/simple;
	bh=bDGuX94bJ3IG0f5Mime17d62AsTRDc5bEeW6MOLTzL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFT5vP5rwQHzzJWRDmoIaTZZ2p5f/EVbKFnqoDV2Mk/jutu1pBXBAW37fdPVBVjSlelpA8dsxRS+J3CQm+68A3Io0Kubz12YF3b4xgZpGlPx9FWMJ/8lDCE57A9c240D1vXzQiAWpNXgSaE6Sck2P0Jsz3YL/4t8j7Sje6NNPEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RENbdnsE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rRyagslq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RENbdnsE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rRyagslq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790955168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kM3irjUs3GXfAQv16un+h5EqRZdho/ZwJo9GcwW1/Ao=;
	b=RENbdnsEiXQNkvLBA1tXWsmWAxxzD+nLKzcBsPQA4b13sOoqFemXLR7YEzdWxTFI3cmrGN
	ZUK0H6HkEPvLhJrZ5b+JJ1ZZDJzKG+G3mLVvtpvA3vpZTiqRFfE/qm5pr/ff72AZH5sASL
	/yXXUKROg2PEGVr0mcEJHijUqDFwSVs=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-vaxETxV0NOieDqwXsNRUvA-1; Fri, 02 Oct 2026 11:32:46 -0400
X-MC-Unique: vaxETxV0NOieDqwXsNRUvA-1
X-Mimecast-MFC-AGG-ID: vaxETxV0NOieDqwXsNRUvA_1790955166
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8ae5317eaaeso11681617b3.3
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790955166; x=1791559966; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kM3irjUs3GXfAQv16un+h5EqRZdho/ZwJo9GcwW1/Ao=;
        b=rRyagslqbvvBlgFzH5+NDoWjLct5NQgG61cb39eIjEikIKNh2dGfYF8YrZTfXfNaFv
         KAhIdAd3D4i/uSE5hCd+r+foFyKAWUmsHtWuAC5zVJUawUtqFjvmai9RLeY3dSbxJnkB
         wOTDKIp2TErhlMLmmVNs6/lSrBooo8TCx6q5FyQbMkPTQRo3m/lMLJ69tRVbZNmCEDyA
         9KE0xRRY6DESdSU/dKj21fI4bAx7bEZL0TMm11plzu1Rn/XI/N/ZSovIcMqwwhY8meT+
         fXrH5D3f+T/xeN3I/mXIW5SInZ697j4TH91bZhoABu83wlGKETIUIY7id8XVDGmWXILO
         Yfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955166; x=1791559966;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kM3irjUs3GXfAQv16un+h5EqRZdho/ZwJo9GcwW1/Ao=;
        b=Bv17QYeHnk9NCTeJwxco0/Mng/ZKoU6APLld020ByB54WlkWssp9cBbZxR7SiKNAcI
         GeNJx+mnNGuDKqDp8aSojGA5eCdmY7pBmJGG7k36OSPSbRJ94Rf+a0D6GnlWTakIPSXG
         pp+4cNfe1+V65zbcbmU5NwSLT7jVp1/8Vnk5JHUb/QVIEX8KlbKBaY0AQh81MOiSL5W8
         hay1l25wj1JxLbCtTQuq7hS5Sw1wI74HOhhXtccw23rizkC3FZWwGAjsB7tzJ224bVxL
         9xtny1BgKbcHqPaucviyg6xYFEGVYaTXQs6TEQs9VX31NtnNUFLP8jZiZK9AceNAtFEK
         lRbQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+1vKuD7d6lHEry7FmTrs5mQS2IvbGEorn+6mA+5whkMbsYaUOlTfrF3bAVFwG+nbt0rBlh0eJDyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrzP4F22CP1AjgNhIwUuswZeqmhdpN8xsWSLm1FBwLN09xWbFG
	6HIYZFG8pd2MdQ0cNRodxEYKaB9WjMlns64Lfyf95EaY+Mu/6hZnAEj6+YarLr7jsDjSuclDmUi
	8ZHaZBgFh8JB5b3NGzHp6KWk1NWUC5y90j7JMcdbYXHSoqkVu0gyCFCeEKRTXnA==
X-Gm-Gg: AYBFou0ht4KlXpS9SzmjYF98CxxX06/VF3SGmlP238W7sMS1NqDH+F4zEDwSW2p+3QP
	ZK8t/CIEiHCYQ4+OPK5grX7s1hORcL7wvzxhnkSZq2AxAS2PRD35x8vCKqggoM+7Q6KrvZkLJdY
	92iwFd02iIZ23/cEnYbCUkViL+6h1FeOeuhtHLB0HOYos/ekEfstwJZ3C7rCYecJqoXmU+ZUTrA
	5/xiKh4IyuzEAZnzYAd8O6frfl0XCdMNLArcqdfu6y++ieS+2vb+jA4p/BrbQD2W5Pmgjq7k3sC
	xI3epzL7EEO8UIwf26TVHg+1m3cDMZbuG0yPesYAAzVuTlV1nEH3pKE623k1L7cvHr2Yo2A7r01
	9Zx0fgi+7JEUevoY97YemdNBuD+JjjmL4iBU=
X-Received: by 2002:a05:690c:c1d7:b0:8ab:41a5:63c with SMTP id 00721157ae682-8ae3b61c99emr8751107b3.108.1790955166195;
        Fri, 02 Oct 2026 08:32:46 -0700 (PDT)
X-Received: by 2002:a05:690c:c1d7:b0:8ab:41a5:63c with SMTP id 00721157ae682-8ae3b61c99emr8749997b3.108.1790955164570;
        Fri, 02 Oct 2026 08:32:44 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b682dfsm22528436d6.19.2026.10.02.08.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:32:42 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:32:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
Cc: Joel Stanley <jms@oss.tenstorrent.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update RISC-V Tenstorrent SoC entry
Message-ID: <ar_OmdW-3kWo55_A@redhat.com>
References: <20260930-b4-maintainers-tenstorrent-v1-1-bd97694822f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-b4-maintainers-tenstorrent-v1-1-bd97694822f0@kernel.org>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Wed, Sep 30, 2026 at 10:09:36AM -0700, Drew Fustini (Tenstorrent) wrote:
> Add Anirudh Srinivasan as a maintainer. He wrote the Atlantis PRCM
> clock and reset controller drivers and their DT binding.
> 
> Switch my address to kernel.org, which I use for all my upstream
> work, and point T: at the kernel.org tree that the clk and dt pull
> requests are sent from.
> 
> Signed-off-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

