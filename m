Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774D43F39E8
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352158; cv=none; b=m1h15i6NBTgEn30ou34lGAHPdspA0Ss5ap5LLcIHk99l621TAHQzjRU9pUvEQZtm/MWNEMIS047QhOBLG7rU5u0X6q+nkpgUwudpBnhdw2el/pho30zVccLxCVsx8DFZdIS0DB85wJF60kuVeJ3Ur7wB8ES21S/xHcVPWZDoXV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352158; c=relaxed/simple;
	bh=qk+GUd9+oCZThaSs7ulFYB6A0mtTpHIt9Yh3huaz0BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAPqLndS53qdEampxMj3lci7OS43+qAYmkJJryPodSsj/FLskt7y3IVIvTJ0t0YyXwKrM+c9thKEZoHkP+q4ejszNPoHdFCpljPH7V98h7Vm2YHU9BKtvCYHEDw95EwEjYlmliqvi6VkODn+JW9rCS+isRwRuNIwLULaIF0nOf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ixZGPLSR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=drEdqkdJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ixZGPLSR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="drEdqkdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxinGIhcu4WQR6Nqj/llYdJ3OsXvQAMFrn41RWNE9p4=;
	b=ixZGPLSRoIfUizJuNk6KpMT/4nK/SE5QJ6iNmeLDX50KcTs+azumykJEVIpsLUP2Koow0u
	n8Pupinm+OSFaSPyjZ/Dhxoch3SoxGw+FVEoUO6aKKrTbSUdFvzAD6O/+0sRBCmmPxekeT
	Gf2dUK/FLBGi+0l8BAA2qnz7Vo7KBwk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-vh21ql1zMKGe4y9iWabLXg-1; Mon, 06 Jul 2026 11:35:55 -0400
X-MC-Unique: vh21ql1zMKGe4y9iWabLXg-1
X-Mimecast-MFC-AGG-ID: vh21ql1zMKGe4y9iWabLXg_1783352155
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f73fso70765636d6.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783352155; x=1783956955; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxinGIhcu4WQR6Nqj/llYdJ3OsXvQAMFrn41RWNE9p4=;
        b=drEdqkdJPAcCbUCze/l1z2ENET6luFIk/FR9yL46JSVupfZ33LmsrEyDhOZ0yZ4jWv
         9Q25LELJxX67c4cI7wdM4VZ88mZEh0xhmBJs1G2mIxFcEF5/+sxGIWeejxMrQQGqV2Dx
         qlXia3qLnes/i3Tv/5jD6QMpn2jEcI5APIr7WODb27rKd2+VdibC59NdmKpNYJrkPHsb
         Ycc1GkN+o/C8BgSvymozsDzSOQysLif+/daMforLe8UhCRP7on4F2bAgMPTXypAjMxpW
         N/twgyAyJvdDKbKFKiFE7FBYLbJ7Wb3nIJ7K0KOO6RrlEsS6TaV/CTcaKOYfkzvo1pYd
         8l/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352155; x=1783956955;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxinGIhcu4WQR6Nqj/llYdJ3OsXvQAMFrn41RWNE9p4=;
        b=jdAGk32hRFXY+Q5FeOGSs/kbh77r8YrMNcbXA7pvgTF/j6CSM8wYLC5kJSSsFV9MKy
         uTrQbjKeOJbHTFNEA6RTtx6jAVIe1QIooHRql/nKQiHkk2grDhsNJBVvRzA9lxvfztTg
         j/bOt3GVvlgCdgDk+PL8FxxPHsfz8XpYmxNcuMwEHaM539ax3MGrjc69+63qxyZHNIX2
         tHsPlYJa8RT/6pTca5nsh2+iqdIsXQPni2mFWulA/t2N7S1zmrsqrkkzx9ZggCr7hqwi
         /h6rvicrJtEBt2wIhDw5KfFauqJIaBH0h5Si6hFVYpupx/OsflmjUAOw6Y1mSwXb1axg
         X2pw==
X-Forwarded-Encrypted: i=1; AHgh+RqSfMwxvB6nNNr8H8kE+BxgYMJkgKbWfDzApmWIfhGiNdK7giG6fLwY8K08hBKZ/U//Dj7ZYJOQ6zc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt0wyekKEqkNboouvJ44+Dl0QBiHXNsAptlsYH0hV/5VHaH337
	5GoTPL1VW13vC4Xy6ZxJV6yuZG1VyBSVDFjRQ7+h+CxzMAaCwCzDQ63OMK7R2pDds2TMqwppiK2
	4aUnGyLTkECG1yqoIa8FjzF91SC2hJ8e6gkg5pR1vyk8M/bs0X8hR5L8Qf8o28g==
X-Gm-Gg: AfdE7cmCFiEezhKUrFWA1M2C1XpyqkrdRemX0oQ/5GTEoaaujihyZ4VsbPxwHjrZJ90
	5u2QhOCVKC43WEKCWdH+VoYH9vdu+afI3UlL9WdgSmP4dq5KVNlVg1KZiLeX7Q9E6vopFf+kr5J
	ctAST4faT7szL6twAaF9/3VIy0UlHNITlKgsHfgLksWQ49RVIwIbl7+Pv252h7i6VmsyVdWM024
	25NJq/9NrU4zGvofXE5pypjEenwVdwQi/lDNXkfco9SBPZ38eerdTdI908zHrBnya80XpmPhFc7
	RxWEr2bMqdWwIk663aCSskK8bW/NaEmwygNRGQ18pJhHMum1ZdA8JvIrLcTC7rulcfVHflJo09i
	w60hVtw0oQtV/hgvfwruVe2UsF5T89THrirKOXm1p1chACg==
X-Received: by 2002:a05:620a:4606:b0:915:afa5:725 with SMTP id af79cd13be357-92ebb4b48d2mr159858085a.6.1783352154839;
        Mon, 06 Jul 2026 08:35:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4606:b0:915:afa5:725 with SMTP id af79cd13be357-92ebb4b48d2mr159850985a.6.1783352154257;
        Mon, 06 Jul 2026 08:35:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b800fasm939411685a.6.2026.07.06.08.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:35:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:35:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: mt6735-vencsys: add missing
 MODULE_DEVICE_TABLE()
Message-ID: <akvLV114MsiXu7Wf@redhat.com>
References: <20260704124808.19916-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704124808.19916-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Sat, Jul 04, 2026 at 08:48:08PM +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

