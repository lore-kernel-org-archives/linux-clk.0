Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5782D34A795
	for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 19:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766173745; cv=none; b=HigZTIrisz56X2uuZSObCzpzrSULDJoKfUl834c/OfGhtQJ7n32SSD2MwZixwrkKwkatFFU4hSfqSd5OHmVN+NIzqiUhfpcOkLIq3slQf5aUiUbFK+25s42zlboNgyGlvDphr4EXX6fzppw5KsAp74KLUeBgY88wnNUNWXfSQ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766173745; c=relaxed/simple;
	bh=7QHParoqmwM/fv693piLNFSOhOcM5vYfUKurXmOY6eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJ58Q1AyBdk/lEGI/Cw1GU1ZH5bA3HzfrwFYWOxiLgtDH0W97iKg9TtEImZ3kd1seJftacbHAWQ8MjjdjzslrA85PgzuDWYMmB2eCP+DwEkSDuLGTUTLTQT/DC2TKojmrBYRPu6iG9UnK8r12aC/rezXLIbOF1OU/++9MXnPjac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KAqaGfMJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Po8y2tHI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KAqaGfMJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Po8y2tHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766173743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7QHParoqmwM/fv693piLNFSOhOcM5vYfUKurXmOY6eg=;
	b=KAqaGfMJVNLAaVtN0ua6ijH2K2pMSy+o3HSVnerXsRxOt0HNrTupBwCJgJdXloFPznD20s
	qevHKGSwJBJXo6LZUi3wlHpfBXRTCMI2knSsYSuWLK5MuJsZzU9ZgOYXOfsTdTbNbdIJ7U
	3ajFEcTtRgljnso56mrpH234CUvWLT4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-WJY1YC0nNiG0bAsPIhA1uQ-1; Fri, 19 Dec 2025 14:49:02 -0500
X-MC-Unique: WJY1YC0nNiG0bAsPIhA1uQ-1
X-Mimecast-MFC-AGG-ID: WJY1YC0nNiG0bAsPIhA1uQ_1766173741
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so551011185a.2
        for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 11:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766173741; x=1766778541; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QHParoqmwM/fv693piLNFSOhOcM5vYfUKurXmOY6eg=;
        b=Po8y2tHIcg6lj3E6SRnKYYH7Qbuf817Caezk27chUeAy28/3Oi61amy2cYywhCua8n
         wnx3flgmsBDGYM1yhNNCT0RHdTWmF5ow0v8OGosXzeDOGqIn6gPjmQpvEShUTYEQ7zTr
         VoHW73GXELOu005QGpEb7yT6oYGgIHsGyMi7iqjNP5L5LXmySzg23PXtnSNqCKmIBd3l
         WyTWDNcTZAwg+B7A4g2gPWSB8H1UX+Hsoo1G6kbNF/h7ezvoFYr1gd2KsAmN2wG2bQ9s
         SVpgSnQ0uD1+hMJa+z6OZO0oLFFGuW6wccxvVp27UkW/2o6/ULnVutA2owIfBwj97WHD
         uhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766173741; x=1766778541;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QHParoqmwM/fv693piLNFSOhOcM5vYfUKurXmOY6eg=;
        b=jA9jMm6pcwLrEl86SBILUh6oq05sVuXkl3N8oadRUcVgxwiD1+UEwp0RWIg0v8hLRH
         WByEpAs90Zxc2ONmsgoybCbTAFaDn4tsSQtCd6FkAJtw9de/NarxaUt1V+NK5k2MlwrN
         61wl1vWjif7kD0wqDgBbLhU7afStjJu50MOcTALLV6kd1N4f5nljx9Y32CzLC8hwS0ua
         m15aQl/luvbNtBbYNAw1Fk0YJoTLr/AmYu8oK5f894ePmmIHfRPesrjG7dM36MBYOmTE
         B0y4B8G3WNkeiHA5jB+LfoQZr//DOstIGXefkRgvtSjP64ibBGOVjzR/tmGBPaDrSDMF
         9L7w==
X-Forwarded-Encrypted: i=1; AJvYcCWK0s2Z/4V5dRhl8n8nMStyJ3RMMZ4i1z3aY1h6YB4G3hoXMPSeMEb/xYDFsHe1N1kBdT2R7GryPGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfwN16+wctHvmqZ4IHcIZAl4KBKxR84NwvO5bRKqD52eA/Qu3o
	CuGTMcrrtD1yE9pWnZJii0LcBMe5/zq81Zsob+LHKW7IIxw/x140362uRZHLW0EwGux0wjC9JU4
	SRB1bO+ziioEF4c0Y/7YfZAwBpCldpe7DIgQB67PUQ09hdT3OlYOQTNxvq46otg==
X-Gm-Gg: AY/fxX5G0U8GnPadjno0osfOwuSvHactG5rXdpB/9v2BpMH/O2YyulW7L2SIWctALX+
	pyhMHd2637It/eIo/X/vwfgG27xEV1Rj+F1LD33zKM9uGQCf0GQLGGkTri0aWKGxdr5W+LfEudq
	nLqfMEcAJLqS81DjttdhPIGKQ2iIi1leuDKaW/LENxA96Vgnfzir/MNOSyss/HhsUklYpa/G+46
	zFRKao4BxjUNWKGGlNnW1aRLnPoI0DhPkAgMbQ9WEE4fW89b4kB/gKgKfAz1Sqww7tm8mp9wnrd
	/EHZ0DArMQSJJZbmPuHOiLRa2kaazKy2KH27GCfyv2h2QqMUu/7MnLzjWMfZh0IV+URuDe8XjDZ
	DtQkk5d9N
X-Received: by 2002:a05:620a:2915:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c08fbde546mr650957085a.26.1766173741575;
        Fri, 19 Dec 2025 11:49:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhmkU84dkGCcwT8u/xbGrBML5VLUNpWzlUIRhCANoKaN5hf3mFDRW42eqFLJM185p9R9rh3A==
X-Received: by 2002:a05:620a:2915:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c08fbde546mr650953885a.26.1766173741234;
        Fri, 19 Dec 2025 11:49:01 -0800 (PST)
Received: from redhat.com ([2600:382:8519:53fe:9d9a:13fe:abf1:fb80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783a81sm248019585a.9.2025.12.19.11.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 11:49:00 -0800 (PST)
Date: Fri, 19 Dec 2025 14:48:56 -0500
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/6] clk: Support spread spectrum and use it in
 clk-scmi
Message-ID: <aUWsKAMDm9_5jxsg@redhat.com>
References: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
 <aTvpmQAPE6HfIy+r@shlinux89>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTvpmQAPE6HfIy+r@shlinux89>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Dec 12, 2025 at 06:08:25PM +0800, Peng Fan wrote:
> Sorry for top-posting. There is only one comment from Krzysztof regarding
> cleanup API usage. Since 6.19 rc1 still not out, I will wait two more weeks
> to collect comments, then post v7. Hopefully, you are ok with current
> clk-scmi-oem stuff.

I can't speak to the SCMI OEM extensions, however the other clk patches
look good to me FWIW. My Reviewed-by tags still apply.

Brian

