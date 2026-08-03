Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A86340EB81
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768014; cv=none; b=ryeQ9VFZRqgMDkdU7yUt18DGCIcWU1cPQ3eHcNWHbE4fbYFEPhP/v2h36J+ffU0khag1Hp1oyIBqN8XtKEs+JRq0ZjdAtqCwCQ4e5sutE2OSBtt5vYF2gYDZnWBFHJuvtFrv4dXPzZiy3eu0UIjbixMP9DXo2e/moUTu3kCdnoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768014; c=relaxed/simple;
	bh=yRItg3rDqLQ6YBYhIhF8iPn7fPEpjv7eS82GGOPWVH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzkTNuvvm/FeXNoWRaVclcQCWv0HaSbqpmorrEbfW1MpE5vjMLksAJyu2/299ngw+C44d93dnwMZXXeSf0Ko44PssE+Wd6DZDZvM5jSHrEYskP222KD2Mjg33c4Mc70LwzpgQrmgCOg9EZBt6t31tuctQ8VZ0T40unGVexKMsh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L9jy7a5J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GaCPVV2C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L9jy7a5J";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GaCPVV2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=;
	b=L9jy7a5JitMCnDsHZ9XhV3aZLKwB3z/ivO3RurUXMHWWuS4UgXybCzPQrrRuh5PCZIjQkM
	qMutxPlt8+y3Zlmf8wNfaL7NPGOvH154pzWl1rfQkjta+nqt8wnE5Tr5Upa8bzJNobeaPq
	vGcdMfhUGw0iFnIwTbTdOuO+IPfiIMM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-axJbtL4xO-qMtZgaEvozKA-1; Mon, 03 Aug 2026 10:40:05 -0400
X-MC-Unique: axJbtL4xO-qMtZgaEvozKA-1
X-Mimecast-MFC-AGG-ID: axJbtL4xO-qMtZgaEvozKA_1785768005
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e7b95cd84so58249867b3.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785768005; x=1786372805; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=;
        b=GaCPVV2C6EiEsAPf32UL1SA6BBsZ7S8GnmY3MeGjMgGxUI/AJ/RyV/kTFgxVVa4H+Q
         Vc+nr7dgrPD2C5BNy/hCHzb+ReMBg+ecv14vBNi7QsWbWpA9dpzv+xoHJx+p6lvACXpi
         EMF5f8jLBmzhBQEvpdRdag7uwy1mHxMpAT4sUx/SVSCqdTV9FrEcYWpp2QO2VhhFqSEg
         G6TXsbOL7uKsWvWA18oeMzT6kWy8TAnm5VCufww1E0oVl1GaAHhZhxB8hPWZb2LttA5b
         BIRnWWVJbxRyQvZHqIM9XwNrxhlhfcw7y1AWl1Y2xpu87Y4zfby/pre2qoZQa6FJpk4Y
         gW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768005; x=1786372805;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=;
        b=m30MwkeTpk0sXgGZvnt5/rZeylvD1eJ4BXUjn4zpxcMSqZcXM/QNaWK1olo0P6P4n3
         4upv7cCvKssiUHP1PWXQfr+PVN14nVXEATjuNR4mYzq/rjYvYJ+lOzEOG4iVIlmO31K+
         ETHwH80ScrfSKzE0vpFl4yW2TVkxl3WfqYHmMEfDSuTr6/t+nvjfc1YYfa+fq2QpTSno
         VTp8yxal6TAzxUJK/kl0ARUVad1vdqV6TrO6LUTqy6JYr+Jc8Y3chHt7qxVKQbTBo5zQ
         r2YiNQuoE+eQ/Vt/ZLB2SOBoeKGS2Wjt2Igj3CErvi33aHMPOsMEaHHd68SXyn3DqrQd
         5xKg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2iKpO0WuT8vZPw+sGqDfC8rcVflVLI/JgUiPuuEpRc3mYo5v4n98xCE7wbZ1iRz6LzSfBlsOA1hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVE21NIS0R9whXxdko8ibzuOLbfZTsS/rpFVYLc8xU6vLgjBQB
	/PaaP41zf2Q2WFLh8bSAwRQv+w2gxccTvSfTTDAfA9neudCfdwR3iZP2DEX+kS2jh92/v34JYmk
	4mnZpG8RZH7WFpAKcrda0rYv+FNgIqUMSRDJ8gTUAaO6FhiJ5X/pkPAJzysEu/Q==
X-Gm-Gg: AR+sD13ZAYFfkKpCL7qoDQ/KQD6Yw0gGGd0jpGDqKgWpNb5ik3q5oNR7csfBqOIZOs7
	YMxcY9OaojCkx7ZcfLvrs5bjh9gzLCAj+GcgJnXJcsqXFW88tl+bMMaUpX/8f1FFoldklhki5fu
	HodyDrZuC3ENkFOL+zI1Bo5C2cU+h1BpT3DHbejjnwAifCMEGl5VzGImFqqoAHQ6xxeX505ds1Z
	A6ACjCSyQpBDrCH/vHPiX7rp0pwvW2YmkC5072hUlcGwPvB0CAFOuujyDg42T/6ygkkzyeSguhS
	4v16US5UFfGwOmLqgBQPtKKKfjL/73sdcdjJJQiADFlT1evlMpkieIKs+N33QKmcKvpyI+vfxRz
	bVXwAH+w+SJ8NZBIENUTGN1X79qHA6ws41Dc=
X-Received: by 2002:a05:690c:6b0b:b0:81e:5a57:b8ad with SMTP id 00721157ae682-81fd4b51df0mr122408227b3.21.1785768005016;
        Mon, 03 Aug 2026 07:40:05 -0700 (PDT)
X-Received: by 2002:a05:690c:6b0b:b0:81e:5a57:b8ad with SMTP id 00721157ae682-81fd4b51df0mr122407797b3.21.1785768004486;
        Mon, 03 Aug 2026 07:40:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d6fbbsm55781147b3.25.2026.08.03.07.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:40:03 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:40:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 12/25] clk: mediatek: pll: Add PLL stabilization delay
 definition
Message-ID: <anCoQeS2OoucB0mO@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-12-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-12-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:20:58PM +0200, Louis-Alexis Eyraud wrote:
> Several functions uses a hardcoded value (20), to represent the
> needed delay to stabilize a PLL.
> Add a common define for this value.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

