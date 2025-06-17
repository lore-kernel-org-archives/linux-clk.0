Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DABD24EABC
	for <linux-clk@vger.kernel.org>; Tue, 17 Jun 2025 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190626; cv=none; b=S6LfJeWebAXNUSU/Qv1tFh3cGOlMdft9VyjpfGm2CaloS1Ahxh/LdcUYggZpqAa1+YD27teeCRJe+eyX+XMVag4h23mafiyy+YAclvleyNwTnG4mHbG7leBGnyUpsURw4k8RVPgUvjOBQE7Ab5Z6KwyBl+pKleQsLHQ++Avovd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190626; c=relaxed/simple;
	bh=+SZWp0yWZXIEP9hozJgVkbTK7MVZxQPu1JyEvegG34Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFMrCO1HwZF/9OS7LhRKXiRh5EnO1bzUxpE4HlQBBOmFV4Xe8d7yMSfjmUT9D0eRSPDZofHwtqPbL5+nQUDGmLiLJQfOcf7cFn7SxnKfMIDt6hNFYCyIbOJuaModBALAx5oYEgrVBAOWaZ2hM7gmPNeNyd/a8YtDkn3KcOB8j88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cRj9oGaT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cRj9oGaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750190624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8324I6pJOAdXJVtS3tvokmcUAhG9rUL2oHwZTNfmFm8=;
	b=cRj9oGaThNyK+0T5xPGgsJYvEEPjyFX29XIWAOXDoWpRLc0CNKyFfYRaBpEMgK/1Qkm/4P
	8F1CQHve2wbyZaxgUWSNHNAd+yRs6sG7sp498OoQ+namOau0K2Op3cP5XOdhZQsNSDFkrF
	rYp3Ww9x7/aOKiwt7s54ynArMVvwISU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-_5znFDfEM56BnGm6Prrm9A-1; Tue, 17 Jun 2025 16:03:42 -0400
X-MC-Unique: _5znFDfEM56BnGm6Prrm9A-1
X-Mimecast-MFC-AGG-ID: _5znFDfEM56BnGm6Prrm9A_1750190622
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d099c1779dso1044015985a.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Jun 2025 13:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190622; x=1750795422;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8324I6pJOAdXJVtS3tvokmcUAhG9rUL2oHwZTNfmFm8=;
        b=sVvECBcvo4HdpLJtJ89y/HhhoLXRC7DFeBkm4fkQBhXk+caPSlOUEp24LZYB2i64ev
         fkAP7JrgBFnUNQsU/geu3aEJ/ES1JISqZ9aR2ZE6AS9C6kgubzPMlUPAaotLtfZgxk4q
         lce4LNoFddEXMcb3DZRm6PQDc5f9J5WMfA5Umu57TnlSg6x5c/3AfHpyoCKZhvSSqiPH
         +NfbsxyLaZMIRYumlWHrx4GV+alysLmeSq7lwuW4l2NpxIshIAp3lyXeztbRjm6nbeFW
         CqCGJwx4RGvv0Loc6VtxjYxYXnpH0wChnAne97mcqDjoiJj8HLrijIxnMXlmEy1DQRe3
         kntw==
X-Forwarded-Encrypted: i=1; AJvYcCU0CqcjMgbkTnF4dH9aEerOFROnK43xO0tD7VsNoAqnwQrB7a2L7LSAdOj+Vm55fi2AVF+35VyhKuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLs/toE0kguM+xBNgKfGLunxxvETkRu3IUzS2fpYwK4/ibK7vW
	Fi2cH3DAItwNt5Yyfum4AUIMxHLRn1oH+CUPr+dC+P6f3PNmNyWZvActExOU3xtl5yxfjm2ohbR
	OCREKJPPjk8JSUmHbze6rnlXSzfNVhyJeN+r1T4ZmJiu29QqUronZEyvgrl0PwQ==
X-Gm-Gg: ASbGnct4blQPTWiLhU3vgNHRtAQjJJ6P2U0YpWXA934QIVrMZTHFMntX0xeoi679q1Q
	Jij2vNeA49WjxEzsXFRXPzpwZi0b+Iph9G0+HvQ7g1RypaYEeIOOkTMVPUqzVUpL5VvcQlQ1p4+
	j3EQoVwGSZnkkkQerCs/iPl63ny3Cc9PDLGje4B4fepT+NNRiLWQNe8kw2ku3LgZDuE5m4SMx/f
	NxKF7iKNAtTsWLt28P6nmkYgSdhW080A1M2JJzaaN5SfgsPT0QA5ztlrud1ElAmQv2pdTtebUa6
	sScFXepP1meatzaFwysP86dHayGs+wSPEErzH42iRcUblQ==
X-Received: by 2002:a05:620a:25d1:b0:7c5:cd94:adc with SMTP id af79cd13be357-7d3c6c1f5e7mr1993680685a.21.1750190621788;
        Tue, 17 Jun 2025 13:03:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0hO0kmJUNiG8VP+Z83zSUCQkaNcGSMd2Z9D69EwCHqPR9pgESyvh8M5fvF1+LPf7+Mr6DWw==
X-Received: by 2002:a05:620a:25d1:b0:7c5:cd94:adc with SMTP id af79cd13be357-7d3c6c1f5e7mr1993675285a.21.1750190621341;
        Tue, 17 Jun 2025 13:03:41 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8e28623sm687342985a.51.2025.06.17.13.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:03:40 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:03:38 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux@armlinux.org.uk,
	linux-clk@vger.kernel.org, devarsht@ti.com,
	linux-kernel@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] clk: Add clk_determine_rate function call
Message-ID: <aFHKGvHlXP-cdC7d@x1>
References: <20250616103527.509999-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616103527.509999-1-j-choudhary@ti.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Jun 16, 2025 at 04:05:27PM +0530, Jayesh Choudhary wrote:
> Add a function to determine if a particular rate can be set for a clock
> with its argument being the clock and the desired rate so that it could
> be exposed to other peripherals.
> For example, the display controllers typically has to perform multiple
> checks for supported display resolutions including those related to
> clock rates. The controller has to check this way before it actually
> enables the clock and has to do it multiple times (typically for each
> mode), and therefore using the clk_set_rate when its not needed, does
> not make sense.
> 
> The driver does have "__clk_determine_rate()" but this cannot be used
> by other subsystems because of the function arguments used.
> "clk_hw" is not accessible to other peripherals due to clk and clk_core
> structure definition in driver instead of include file, so we cannot use
> already exisiting "__clk_determine_rate()" in other drivers.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Do you have a link to how this will be used within the DRM subsystem? If
not, could you post a new series to include the user of this new API so
that we can see specifically how it will be used.

Thanks,

Brian

