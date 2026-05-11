Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6706D40149A
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510829; cv=none; b=fYtahmH2SyEQlEOSWngpzoAMq8fZTE54zRA6Nu1lxMkGHhlU+0pTtjJkPwznoaQEPztv65r1DDjaqnlyFakJXtOdRs1ojDBmvo6xqwGZImvFSx9uEk40pUFsR+zQNDk5ih6CfYg3nwmJG+Xg57QCfz3xginxxTQuglBwZKWTIfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510829; c=relaxed/simple;
	bh=Tuk6Cpk8cxw0DoMwyejCxEWUJP6eeioUgkg4CQQALUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENckb2lXVTD+UMTFVa5akqFpntr34/pJDZFBmimM0f5pCIPOYt2MCzJOsxk2C7DFTiDtIeJ96S/qkvHmtluCwk4IoYTmWwc+7IKz8saD6fNlOFRObV+h2E052ktfCzBSaAWXGtclsS9Brchle7nRn1M9G6vTvDJ9Fte6271T7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YTXOEBYP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mcTXJhFA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YTXOEBYP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mcTXJhFA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u+Cerdam1U54WBH71GKfZQRR4jeB6y2Uccd1vRw3E2Q=;
	b=YTXOEBYPiqZanRUYMSvkRkNilWamWWZWzaUy68JzmAKIYJfJaSe3e0Zu3wJ2Ufo6iyzeFB
	GhfcXBR5fCjNJ3ycViOSlyh3RI13qCXIuPUYII96O4EY3peVkPM5gf8RaaXxHTEVs03pEM
	ni24s//4CZr09epDW79tNR90Iap/gWE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-T06uEAphONi2LmBjT1mFYw-1; Mon, 11 May 2026 10:47:05 -0400
X-MC-Unique: T06uEAphONi2LmBjT1mFYw-1
X-Mimecast-MFC-AGG-ID: T06uEAphONi2LmBjT1mFYw_1778510825
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b7105dfb5eso96210416d6.2
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778510825; x=1779115625; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+Cerdam1U54WBH71GKfZQRR4jeB6y2Uccd1vRw3E2Q=;
        b=mcTXJhFArO3yOL1MtMNiiU4039GDdYF4BEwR09uFWEI2fBVN+OBbXh8kelIU2FMObH
         hGm/CEcc3662+kvFRk+VxtunuGRgHkyOTQtIx3gndzBJpcsLhWLbLs4LLgEzwtfbEORi
         V/XBZHfl/zdFmGSsR99jpDGCkujf38jH2znO2QFpAykCUE+1aC2YWmgW+Q7OL878zoRa
         UB8sM7JLZ8CCQH/iYqzH/Vx+xxeguEcy0JVSCjDe4fTA9FiXciq3OFIBBUCvnsYounjG
         dod5WFRbZnURdfh+stl86+I6P3u0anjwWXSQGGXELhK9lQYcDjLgFTqwe4R8W97JhaWW
         TWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510825; x=1779115625;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+Cerdam1U54WBH71GKfZQRR4jeB6y2Uccd1vRw3E2Q=;
        b=jiTUySz/Dk3IyJ0AOxqLgPNPXMDoDWWL740zUFe0SD+2/Fx3kvUhStxg2peyVlBXVK
         oMkvj/qYShA50U+KkZuio+L1fXdP6yEvCW5qMIh3ns5SDNAdP8zeoqYTbTymXb+uw+9l
         5JAnF/p7L8FaKPeg/V8x5PLeKqi1mU9ioSGvGSl8uoxPAHCYODQAQDPqDEOF1apltwmK
         DFo7EBbU3NHXlno2vUDaoeTv991QO9B/MUSGi+3RTk8BL017isHVlZXdxPI6s/pVPU6y
         EtZI9ge5L1WIBUumyPumpGOCCRHymdsFptn7MpQKBU9VaTEJ/x1JMc92pmMtbyuc9QAU
         RM5A==
X-Forwarded-Encrypted: i=1; AFNElJ9l+AnOtpuZbeTiMUX7UGGYtaohuFmTkf4NoqfpYuDhMITBu5krCw/ex1RL+Ye4rC69xRukJ/KbkC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrlCfSpk2wjAIvptcrwD8J5GzMrS0KIeBhFS+0bi+IFYkDlIC7
	MlsKbbmbzBIAG12WFl+5D8iygsqHbIPSuOa7H/cusShD23XcPxasGmFhp02Yj41vSYZtDrhrE8K
	bRafxYDDoNMf+SJe6i02SZpGKAWHx1oHlGaY/LkHGVva7xm8ExgxhR07FiUHIZA==
X-Gm-Gg: Acq92OG1AJienO2x/P9iHHrxBfZpBindmr3rExitp/dHmFzILqlTP4vDpmSU0lDtR0q
	A9qYZoAcJs3E3YL/IDPtoItU0XsFjbiFQf+Hf6YlHDInZuA91CbRmkwgm2sYXYSIJSdMMwF+nsY
	SPtud4FG3NLE56BQKooAx6FE7OGRuwdRjfBtS9FRjllp4MgMwimmSN9O79cxVFlVQjQXQqzc5eO
	AHVnMw1XrAHu7hDKUx0tQVYG8oURaKIS2X3l5W2w5GthsHV51mOqmZ8HRynSRI7lAgU7VnjpA0j
	gYIUQxdC6uL0j7n4IXMhxMZk7RpWN07VAM89sKjPI4mMX11mgB1w3SFFLd7wkHdB5D0/yJLhr/a
	lMLfkSSi8h5bZCJECMsgbarD41L74nmXUSChzYzDsZfMaVksFM7DoGGBp
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246563956d6.26.1778510824420;
        Mon, 11 May 2026 07:47:04 -0700 (PDT)
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246562986d6.26.1778510823795;
        Mon, 11 May 2026 07:47:03 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d6442d0sm310791716d6.46.2026.05.11.07.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:47:03 -0700 (PDT)
Date: Mon, 11 May 2026 10:47:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 05/15] clk: scmi: Use new simplified per-clock rate
 properties
Message-ID: <agHr5VZAPvZkSlJQ@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-6-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508153300.2224715-6-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, May 08, 2026 at 04:32:50PM +0100, Cristian Marussi wrote:
> Use the new min_rate and max_rate unified properties that provide the
> proper values without having to consider the clock type.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

