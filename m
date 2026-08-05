Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E84335BDC7
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785971734; cv=none; b=cZnuHkY6wVcw94+gAdK5IdRe6PpaRu4FCuBjdnToBjG632W31KVE/fTjGBa72Yu9xrqlYRcgujubm63tlYqo6UjlFFZ+TCKvd+b1/U8CdzlBdGwYpDNFl6uvcAUerSxoeF4U+iqYxKG0nrOB8bFNllgem3Sf+9Jxeu9ZxzbqW74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785971734; c=relaxed/simple;
	bh=pPy1CLEmf7LQ7+VRVpU1PtPWWfqP1ERTf8ceNSl1ajA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioUpB7L3WodprjJ7Ne5oJWBGZJEkCFvyO48MovNMDGVNIDIzFRsGLYvnqWivBn9Iw9QBRBB/WDJ24v+WmrSJZBrQdsvjzyP6oMQeNMwGBJ5GZ/VAdHjphNKPA4G5m+QzJXlsO2ZTHGF09AB8VXzUO2prvCFTIyMLreR/Y/cv9no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f8zRP19R; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F8Jo17SD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f8zRP19R";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8Jo17SD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785971731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jX93A5wJoAu0JKunu6l9UvEvI322kw4iodDAJblYaVI=;
	b=f8zRP19R33EHL3x7wBbxOdRT04TbEv6JbRD+mj9G6oOTO5zg0C9QZS4qHbJv3hc6HQahM8
	wV6JsaHrnGh8kGppaLiRfkfGHbETSyFsQD90WvXfWiRG1fQfxZ3fz9xH1jsqDuCoJPURVp
	6MT51LE32twP8O8VJ+i0suLCk2TI+A4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-RVt9ND-PP_Cw2i0XTrVduA-1; Wed, 05 Aug 2026 19:15:09 -0400
X-MC-Unique: RVt9ND-PP_Cw2i0XTrVduA-1
X-Mimecast-MFC-AGG-ID: RVt9ND-PP_Cw2i0XTrVduA_1785971708
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6abfca68so29338227b3.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 16:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785971708; x=1786576508; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jX93A5wJoAu0JKunu6l9UvEvI322kw4iodDAJblYaVI=;
        b=F8Jo17SDBJ9LGkb3UFsUAzLadXVbtuk8yVWoTH7FeT2k3a1gvxnyMk5oHOehOsJOxM
         WJ/VQHKueUebSVx/JFRVpNvsbu4iPpAldG5IDpCJX9Q21cb70qW6vn1zNG5Zq/ZWKmQ4
         DrdBB2eJkQfhqEPddS+ZDcYw+2/urpYSp9UerrDTr5651AGmPLiB3gVdkq9IuXWRLJoi
         zCWyZD2swSgyersBHuQ2EJ7bd22Tt4Jw2BFaJ//iWJzDa1NZsq3ussKTHIoc9egR+gvo
         iuJeH9S/48PncBYzzVkxf1kd4FLn5dJwimUN+AgdJSdroqevErY5mOtgExtQVCePKS0F
         dD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785971708; x=1786576508;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jX93A5wJoAu0JKunu6l9UvEvI322kw4iodDAJblYaVI=;
        b=iwWZGM/UjBRpObQrSfNq90oSZuafqkFXYX0bnyptTe+FokvmQi+oOONN9hEf3WJ85I
         Be+5/5dsHNqXJsdn8peFzZ878XXIzDsg2Y7OmS2dwFtK+B7COpLv2YwoifSaGb8ZkvZF
         DatG+8k8+fnXLSmT8Q1K/KMIp9uZNpOo0F4QtBLdvjZU/E2eXVcHNAqQR3A5eXNLpJ31
         tdJ0nXLnOBfxSIfqUGGE9vz24AMRCw5Kn9ztoDt7qaORMvYuOAqNk7hMyUVikK0uOFrQ
         0jvYki8sqg+ZoWpBmR4PVKjL6pxKyt/LE1yJPR3hjQoH7yY+uEDNix/EgmtI4ydGfXKu
         WsxA==
X-Forwarded-Encrypted: i=1; AHgh+RogU4ZZJKXVdvNC77U1XPcLjHveWqyIXCDSv0Zf8aBdqvDulSH6BqGmlwtuSitmCnzyYXjGDGf04Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPlO0+vmxFhPnn5HNqJzAF5DEHGbmTLutmJVRREXoIKU5uNIQX
	XxjFzFtSmStJzUw8wLQfSMpK7TVK9CZ+1U3YapQz5frukmTSFEPIhYYd0a8J1fS5NtOaWveDqsQ
	nAbP9oNd462+Jt2yJtQE1VEeBkAuwcQDt+UCv91LYVd3ggFM1cuXTQDtx4PfaAQ==
X-Gm-Gg: AR+sD12qtYs3wjrfka7Sx8/2OReSdrVvBqhrFqt0ZBEs/+Y4bdc5FCxIOvAq/NpnIdJ
	xhh18Szm8g7CkqBnY3wlPjl3gfe3vI/jG6vOsYKMuxW+H2k0c+wGZjwiWsGSQz5unIn0YB/Ovmy
	uvCqynlBzFmEVcAuBm7v594IvNBQ7AsfgJ4tUPCikw4V7Qf+JlBqpIxIYZUTNESgeFVJUY+CA/e
	RzrrMCnKsyy2pB3tBxfDe0tm32+mjn9W/gO+D3EZlwlqMzXeZGzx2RN/gCpj2IZCOktHa+rbnai
	auAONmvfyX/cJBxswFzxfncOlBmY81lqLDjcvcRhXDEA+w/+uTYvTa1nexM28duzLI8XdM/8X1Y
	vs1/8zKC8UqSPeeLAGYqsbpATGCrztcfEcOw=
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr60602357b3.27.1785971708270;
        Wed, 05 Aug 2026 16:15:08 -0700 (PDT)
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr60601867b3.27.1785971707809;
        Wed, 05 Aug 2026 16:15:07 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-820134a9e21sm29018917b3.42.2026.08.05.16.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 16:15:07 -0700 (PDT)
Date: Wed, 5 Aug 2026 19:15:04 -0400
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
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anPD-I9GDyOZSDO7@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
 <anC72Cf1zKcLYWlC@redhat.com>
 <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Stefan,

On Mon, Aug 03, 2026 at 08:48:18PM +0300, Stefan Dösinger wrote:
> I have a long-standing question about tristate/module support for drivers like 
> this: I don't think the driver can realistically be unloaded. I have been 
> testing driver unloading by removing the UART clocks from the DT (otherwise 
> the clock driver is busy) and marking all clocks critical (otherwise 
> unloading/unbinding will shut down the UART (and more) and lock me out of the 
> system).
> 
> I have made it tristate because from early research into clock driver state of 
> the art I gathered it was desired, even for drivers necessary for fundamental 
> operation [0]. Did I understand this correctly? It also uncovered some linking 
> errors that weren't obvious when compiling the driver into the kernel.

Leave it as a tristate since that's how most clk drivers are built. Also
think about this from the standpoint from the perspective of a generic
distro like Fedora or Debian. Support for lots of SoCs will be enabled
in the kernel configuration. Some SoCs that may be deemed to be not as
popular for that distro may have their clk drivers compiled as modules.
(We at least do that in Fedora -- can't speak to Debian.) That way they
are available if needed, however the generic kernel image doesn't have
a huge number of built in clk drivers. Some more popular SoCs where the
distro may run will have these drivers set to built in to help with boot
speed.

Brian

