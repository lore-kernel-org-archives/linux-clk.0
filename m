Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECC039792A
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393470; cv=none; b=RD0yCgq1ydzjHjKS3glXoFP6GoWutqYDdXNnNO7iFm35YrNzrDP8Rs6V57d/plVqeEE8QFZae2NayT/Ez1Sxg6hxnaoJMrAWRSKKSfBR9lsyOBto4xXohyEiE+PSO63aUlr4Xz7h9JZMGFIBEG1P9IonO/1MWcUWkEZYX5aZQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393470; c=relaxed/simple;
	bh=0iMtyUqd3qePGX0foMGvwlEfIHFwid3TU59h38RyA0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmwWA50iuu6uIt0MQqUwiUHQyx5v2beP1igQXXhrxw07A/hUYWRcNzXbaDf+t9hxBjeJ+z/YaOgiN9OTW8wgPNiw5Fido/yk+JOIyeXPDLetqFbhlIPMeaQJSO30GxK6OSUhVd/EgQpePkzGIdPSnKOri2J/y6Z8hO2o6u7kdcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J9kkwdfB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KwH+6iNY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J9kkwdfB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KwH+6iNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789393467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
	b=J9kkwdfBEJlTC4N/deyDkg/G6X57HIVH0BNYZwuHU8qgx+q4gydEatFoaUuSHk/7uv5bA1
	W4Qyvgl+DDRy+qKPCcslhiq3LuqlPO3BUl3lTkPqTp9qL3w0vnU7DsKuQ9qv0dNyvNR5Xi
	p9o05gFnxonWDqLyvOaP66cEt/PY0NE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-BlORcn7gMU-GZCddJdpWOQ-1; Mon, 14 Sep 2026 09:44:24 -0400
X-MC-Unique: BlORcn7gMU-GZCddJdpWOQ-1
X-Mimecast-MFC-AGG-ID: BlORcn7gMU-GZCddJdpWOQ_1789393464
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so68797021cf.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789393464; x=1789998264; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
        b=KwH+6iNYAoHdlx4EFtHQNjJWw+3RjIpHP/uZHKE0t9cKc9P46KReWho7kuibHgO2hY
         XuZnXZBkP69liEpvRRAOJu7tXPMmX7trSdaucF0iD/H8RQnSXoR8AXbsv5vxaJHAJwSF
         fLoYiHOaa8Pyu97ehElXBCZEiuENG8Xza/b4vZ/tyrhoJWNYjr4dJ3wkqvoJLJvytXgT
         yV7WCJjRD2ZC3pnp1w5qBL9xVdWH9bCNyHFOiHWt9BS46YMpFQBkfwCL69RRKiQd4c8b
         zJ47iW76Hcex7MQ43Mj+BU+080alwlxKJmN+yi4LNLlNYk/KmjBcMzAUAMxz7IIGWR0Q
         ps5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393464; x=1789998264;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
        b=LGYAEfTwRf6wsr6+WYWKiPJRRXSVX8h8i98JhGzrIkEXwAneA0jE83F5TEazsZ+AsO
         a1+vMoDh++b2dRoeLGMOqvJ+/xMjbOrrrQCJ0vz+0lZbMv+ynmmis5YaZTsOLoHKrQ+V
         Vvsl3agS0OV8MAEUFA4vBFFl0fUJkynaLwCfZxwHZcDrk2MtGqjoYTKIvvACtXqL1O/T
         HWXFTnoWAsfMGIP/XN2+MSz8y4om+awDl35sxkjXmh1g8IfGQT7X5X/rFp0qby0HwBPf
         PGELA6DciESo1lS0rQwd7065k1O0b0TGHoHXtQSVhUi1SXpaXmCx/QOMnugTL8YaIXuB
         pzlw==
X-Forwarded-Encrypted: i=1; AKwUvBwa8BtCmOBdvVzLCPZ3wUqo9cQZoCHSwMm5EM8ZDBsEc1Ig0B/ph4b/5UWTkmIK9P0ZlK9k2sNVrGw=@vger.kernel.org
X-Gm-Message-State: AFuF++k4oXnBaR3JGRoeK7lzYppijGzXVIU+gj7mPMMbB8dbwm7ooJ1J
	5qrmcbk5u1x9A75v8hMNmfMtQisOksRGBc51vSXoDpEHzuhE67r2wUy0psgCRgnphPPUaCEcOl4
	/e9kOXA3XUit4ONpghs/zYqFuIu/xhynSWbs4s2kQzEJaIMhfp7I7SXBvw3dxzA==
X-Gm-Gg: AYBFou1tVjqIdmPGwyixO+ZjmjP+xkeaUMEh0Dsavx6BiEpHyVrat9nl9qaLJVuS29P
	uB06IAPNqzuKzkNR2RhtrVfA8Cqf6sQeRRk/OtxGctted3YanozD4j3FDcFtwHcTLe4wOlDtqab
	SvO1KE9IbTTu5dLQk4Rlcrg8D35huHTBwaIqxoTc+71CCzZSSN82ASZ/YuswPr57WjziKEiBBTH
	5+RW77c/dD4t6lwA2jEWGF8ZQtyCD2Hx7afvTngivEPvkrDtN8btAUdUyUNbTW+ppBYiXQkTdrQ
	bcAGF9AIbD5nIrzXFPBwOHsLWk7VC0k5tjF1wmRO1A/gRQwBsM1PtmBdaLprFOC+g3l50dm2Uyt
	4I4UlIB+MxzmFYV6qDD7Ns3QuHZg1J2LIayw=
X-Received: by 2002:a05:622a:1905:b0:530:b2e4:d59d with SMTP id d75a77b69052e-5310d071f0cmr35836451cf.56.1789393464267;
        Mon, 14 Sep 2026 06:44:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1905:b0:530:b2e4:d59d with SMTP id d75a77b69052e-5310d071f0cmr35835751cf.56.1789393463669;
        Mon, 14 Sep 2026 06:44:23 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca309989sm100594471cf.4.2026.09.14.06.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:44:22 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:44:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
Message-ID: <aqf6NH-xrMtCQppv@redhat.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <amuWdRD-TBQtFT_4@redhat.com>
 <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Angelo,

On Fri, Jul 31, 2026 at 12:04:49PM +0200, AngeloGioacchino Del Regno wrote:
> On 7/30/26 20:22, Brian Masney wrote:
> > Should there be a new MAINTAINERS entry added? There's currently 221
> > files under drivers/clk/mediatek/ and there's currently only one
> > mediatek maintainer entry:
> > 
> >      MEDIATEK MT6735 CLOCK & RESET DRIVERS.
> > 
> > Is there anyone from mediatek (or elsewhere) that could act as a clk
> > subsystem maintainer similar to what the other SoC vendors do? Help with
> > reviews, send in pulls, etc?
> > 
> 
> I may be able to step in, but I have to check if it's feasible, time-wise, on
> my side.
> 
> Though, that won't happen until mid-September... because, well, I'm about to go
> on holiday (in a few days from now).

I'm checking in to see if you would be willing to be clk submaintainer
for the MediaTek clk drivers?

Brian

