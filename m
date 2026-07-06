Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85983DC4AB
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 20:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783369651; cv=none; b=sY+Pvz6Rvu9nm2DdU25TNraRU2heoVVaP4HcBBGbIPbkIaA0v2vTnnyoR5MX4WvL/tED12qtl0wF6dyjuQqxC1F+BEYsiZVv5kSAwCYuv/tpms8WX9lvZsOqtY/9LJRdecT5kQvVI2PuMRz2ga+48ZdK/YW2ZW47d/GaO1iw1xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783369651; c=relaxed/simple;
	bh=hb9Ap554Ki+u2dGlJ7DNW+pGcNvhjajDhiB1roXBXoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=da5llaaEg2CjG9C0h5kena2uwR7NLgqLsOr8xm8IEzYWMlXrcQd1OzfTFXIZIbFmZ02CDfKnOK6zVQ4/kRYMKk6m6DgL+HeVlvq2U5STRciDEzY9xWWjjXKc6U7z76482EbNbfzsdgFkzhRyF6LlhygO8qiz6RsWWkhwgYR0eNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GvZbnqv6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aXlRx4iJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GvZbnqv6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aXlRx4iJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783369648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZL/DegmvXGzHdZTvgWnc7Fc8nL2OkgclVE6j97WTc4=;
	b=GvZbnqv6BZNIC4P2QXk1dRJZNqHNMSmBWNeRMCCWT3nEumFuEaH/d7M7PynTFU1T+nQZu5
	SccgQBwutM/4uuJgr8jA/iOX9l/cqazE/tSbcxuOqSfDh4nmr2JKehl+/SRPHczSNJqBZK
	HfQaG2eCyO9rzFi1q4D+zo4WTCB3a2A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-UEOm4dC4OIaCBlQplDTAhg-1; Mon, 06 Jul 2026 16:27:27 -0400
X-MC-Unique: UEOm4dC4OIaCBlQplDTAhg-1
X-Mimecast-MFC-AGG-ID: UEOm4dC4OIaCBlQplDTAhg_1783369647
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso34965041cf.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 13:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783369647; x=1783974447; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8ZL/DegmvXGzHdZTvgWnc7Fc8nL2OkgclVE6j97WTc4=;
        b=aXlRx4iJURvbr28lmMlCgoOt09xk+1BjtQ/OPfz+Vl6gZpJjITMY+hQAGbd0lQeMfZ
         nSbkYeIfJPZ6N/M/LdEVfMhXEEMtjh7c/JkBjdI3jEXtcvpSvDF03hHtKTZlaR/garE8
         pBIF8mp6W7v45TO+EOn2AZ0FK4SZxaAESwSA3lIYmTH29pMX2dI21vvHyG4YALmKM2Xm
         1pFn2UJvqCFLWrB6C5xNiKIZVZpVFbh+ciZIq9X3aAY+sUIUhJLYzQneP1944CgvX0ED
         PpfbyuNLcvFxMSfcFyDOhWT07GePJzT7o8X5XG9uj/piu53FImeEGwkLRzV8zQg12VQN
         3UFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783369647; x=1783974447;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZL/DegmvXGzHdZTvgWnc7Fc8nL2OkgclVE6j97WTc4=;
        b=sIv5WG+o8hFJNswzckmHgEtFkXQYDEdoZC6fs1mlJZlYODz+1pOTxXNxaaZi2j1T0M
         nM8BX465B59j3iQbyvQWdzYRoyllouLaRDtjqC9FPN18nOXHEK3X/V+/QSMlif3nCEmu
         TtTjVyL7cHNSxU/zp3wS/wv+fHxrkZv88ea7t+8mIEazqtaG2XuPDAv6GMYqa+FTclyn
         NqowxCczT579bc274N6IhvyU4DMRc2aKLNTOXlwJrbO/or5eh0h0saeVN5AEjzyKGGmg
         mmIdyUxM6K0NBJhwiYYFQg7X3etiMDJuXlsRa3F6h/Gg8qq6z00cT+dCR6q074ARTV97
         6cxg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1DCqrzGrBnh5cXei99a9aMwiWAlv4bG0SwFqMabBl+nqCsbCZJZXWF5GuoO9lb4rEo/2KsaxvaS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMtuqnShC4AxRgRG9QDyiETqm6lGh8kPoyKZPhQGRhfaxpb110
	CtiBwTrcnSBwwTAofHpdz9NnUDfSlHh61QIXS+rlmDhdOi1NaAdt5v8EODwiYjoRUgcP4TMV8DW
	bvsjLCwnzbE5LRmN8R40R44VxVmq90spxjAAZUVfIo0DhXcTxoQ6KDXI/FXTLRQ==
X-Gm-Gg: AfdE7cm4ZhopBmblQ8Flq5CmOc9ArKqqYk6Y8AB7yMy4AKiT3tCybTW8GIErW5Z0R3L
	oQeAGAxSiOiIn7ev2pA8v9bJwAMKlhqNnNPIEruaojFUhOsMgecGJo3I08Irwp7ydKF81rsp0DC
	yoOWvrK40WTxrrIhG5Uoano0H/kVXqO4QuyN2tQIAeqyNj698Tsa+jtI6RLnrwRs4OxgJcyN12A
	azyb4IN4diYElsY5zGy/0jn4IhzBE/xP+JhqhG4Oqh1XtaZpQufmwlHtbmjlTVE5fU8mYVygwqz
	ID934VxRhIU0zqYsZUCYkxNtSItoJHe4tougL+ZjmF8TfwD8gaj8Mb1yGGGkU+1wydVueJq4InY
	KUipqXoso7LJf0bFJgxGtm00Ru+WmIInOqz/HwkjY1guXmA==
X-Received: by 2002:ac8:7c4f:0:b0:519:51b1:e764 with SMTP id d75a77b69052e-51c7485370amr25568761cf.47.1783369646969;
        Mon, 06 Jul 2026 13:27:26 -0700 (PDT)
X-Received: by 2002:ac8:7c4f:0:b0:519:51b1:e764 with SMTP id d75a77b69052e-51c7485370amr25568441cf.47.1783369646512;
        Mon, 06 Jul 2026 13:27:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e371f44sm152788386d6.2.2026.07.06.13.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:27:25 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:27:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v2] clk: mediatek: mt6735: Unregister PLLs on probe
 failure
Message-ID: <akwPq7TlOnu2ExKk@redhat.com>
References: <20260624062409.45678-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624062409.45678-1-mhun512@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Wed, Jun 24, 2026 at 03:23:55PM +0900, Myeonghun Pak wrote:
> mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, while
> clk_mt6735_apmixed_remove() unregisters them on driver removal.
> 
> If devm_of_clk_add_hw_provider() fails after the PLL registration succeeds,
> probe returns the error directly and the remove callback is not run. This
> leaves the registered PLL clocks behind on the probe failure path.
> 
> Unregister the PLLs in that failure branch before returning the error.
> 
> Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

