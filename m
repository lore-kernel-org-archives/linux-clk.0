Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B5368D4D
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773293; cv=none; b=RCg1o27OMfkNd4jplyNxfeZBatJzYrIV/cAzMUUjZCNi9mBFfjFYlu0Fa8G+q0grqzqiDg2LvpDQDBczLtq/yeBrkN3nLOv84HtxZUI9zwnVSToErLFJZT61+cy3MeEl5lkwxXbnn5a6r2K0y7Qm+vcGum0FyK/ze6c7RyYcjTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773293; c=relaxed/simple;
	bh=CE+Rv9tsvaQNBvKMuks5uLhestHFeRNrtIdEPutadWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dV4KgRAlWCx73ByLoEycwsky8NRcUGJ0BrrJp0WQeNgJdKGvoogKDfMZLgPVYJ2jl46fgwDePShQDxeqbgYL+4k8jBKOb03/6BtEFtkmZ53E3D4XSbe62AMaKA6yrz8xQz890I6mxoPeIToI7N0sxu9P7UnyAp2f86Ya9hF6M6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cRCAzXFE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PB/b4Afc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cRCAzXFE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PB/b4Afc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785773288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzNObcpGyl7mZyEhQjY56czCyqHDIauV1aLv/H0dJ3g=;
	b=cRCAzXFEH9SsNghh4gKJiJngvZ7pv+wx12ry/CorCKVQ1ltbVHZNXFZhNE97tvisgnDqdh
	48Fhm0zgo0S1IT3NfA2OLWElUxTrfv6AmQInZQUTjEsNCfuoknbnQFgX8xHbOZEkURaErJ
	cEFHa5kgsPS7PPTVtT1c6C2RxeuMbCw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-o6Pzp8ffNIGV9T9zcBLLNQ-1; Mon, 03 Aug 2026 12:08:07 -0400
X-MC-Unique: o6Pzp8ffNIGV9T9zcBLLNQ-1
X-Mimecast-MFC-AGG-ID: o6Pzp8ffNIGV9T9zcBLLNQ_1785773287
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81f8ba7885eso5151267b3.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 09:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785773287; x=1786378087; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzNObcpGyl7mZyEhQjY56czCyqHDIauV1aLv/H0dJ3g=;
        b=PB/b4Afcvp2ZunYg5yU2mmfWfKsefUJt11tWTyefj9r2+YbEEMLffWJBoZeFCirLmm
         g6zfNf/2Up4yXSzfiJkFqfaskSwGzB2HqdvUnckSV+W7gq5198MeDyv3hH9ab/vm7wEt
         QPThvjEYbhP+67GAyU7/8uBvQ2QFOvQAMzac/PbjLhXrt1NiIuD/jykIuHXqjrJq9mV2
         2IBWMyZjCtUvmRGhIeH2X5ehHD7kRUWxDg47779SgJFgdKaH/hgHLNb4U0XSBwgi5a1F
         wNm5E5hbq+V32VyY8W2FDIp+RXSQxkCXCVDcLx4qo7c0CUHNBu7LooBqKtcyfW4h/QBW
         riXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773287; x=1786378087;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yzNObcpGyl7mZyEhQjY56czCyqHDIauV1aLv/H0dJ3g=;
        b=cqd0nIbmk2H3hTEjx8UGT2N1Kytx6grU11aHb0qCcDOxvcJ1YPNnLclr6WS1lo/MbU
         eWQdfRgBfcvt5/3UHrrg91ETeJQOfESWGBWQ/vPhnOuRd4/OGSSQpucjPMQphomoBib/
         InUPHvXOZmIQo9xKCPst1RP7+ueIEgOwfJIJbl3AvB6X3NFmaodU74BRvTes4QraKUGe
         LLUX8buzh3Q31/52bSxHzVp2Xf5j5lrfaauUEEi2e0W7PyQILnipq2HXQpytUSKr/lcL
         BGL5rPdcLJKDsFZbOIgxkukxN0R43ubCOhJ5u04vcDGhfGicheOqzONejWGg3AlpVUfQ
         40BQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZ4WoT3dnDaQOoQqpVcDeprC1M6J3mlW/Z+dA1gONIwq+ec7TO5R1cctS7QFE+6QjDyBv0uDmTEcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YycWL+LwGv+q8uhbBO0j9b8AtPItTw1u7gy+2CZ6TVHoQVg2k+R
	U6dB9tCmowIZE/MSbcbTwiO3x2MB+bHJ0r1tnj9PQLSbvnowJDyoqv2JQT2Ylg5pVKf0TiXpKUm
	zo5Ysr10WEp3HNjCAo4GMXe0FdNy1Ihcg5WTTMMD7bQnIrDOSPjgQ4IZ6ZSctlQ==
X-Gm-Gg: AR+sD12Jcv6nDe7Ilp4PEbleaxMvcsA1KDcIKb902CLGaZ++wWNf7S37X9441ck0pCx
	aBJuFNK2lgdAvlDFizDkMy1gP/e1pi1AgQNcHV6fwZujfQETjsAY812qDDe5QVVB2LbeO/Fzhm4
	gX9T/vKa13OvJYXxCvyC/JzNovjVcnycPWYb8E4AIl6PhBRJQ1UCyKScZ7uNEZPh6Dwu6HbwPA6
	+DxSprazFuRAbbskQ2jbAdTXrlLP13bclQcHJmz8hFoVc1eOFoGPQ+dhMzXn6ULlDYAPaiTIIow
	Fv+cqotDLxtwypWvz16AHQzn5Af8BVESXiijD3/XxLKDh1Xfs8IJI4qBpyjua0UcljP1BtFzAat
	iwHhObpJDuG98aZBvpad44QVZuaY9tQU2+9A=
X-Received: by 2002:a05:690c:670f:b0:81e:6bd6:39a5 with SMTP id 00721157ae682-81fd49c95f9mr134145287b3.1.1785773286890;
        Mon, 03 Aug 2026 09:08:06 -0700 (PDT)
X-Received: by 2002:a05:690c:670f:b0:81e:6bd6:39a5 with SMTP id 00721157ae682-81fd49c95f9mr134144907b3.1.1785773286508;
        Mon, 03 Aug 2026 09:08:06 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd123dacsm57310617b3.39.2026.08.03.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:08:05 -0700 (PDT)
Date: Mon, 3 Aug 2026 12:08:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 06/12] clk: zte: Add regmap-based clocks
Message-ID: <anC844zWjrph3KlX@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Aug 02, 2026 at 11:33:38PM +0300, Stefan Dösinger wrote:
> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
> 
> I see that numerous clock drivers have their own incarnation of regmap-
> based mux/div/gate clocks. If there is any version of it that is likely
> to be elevated to shared code like clk-gate.c I'll copy that and try to
> use it as unmodified as possible.

This second paragraph doesn't have to go in the commit log and can go
below the ---. Otherwise looks fine.

> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

