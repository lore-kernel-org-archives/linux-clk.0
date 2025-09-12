Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41CD131E49
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685707; cv=none; b=iCpxdZ1Rsl348E3S6jsQN/NjvB4mDIgCf/pjvPkSNnvSG5nUA7K/etLzDN/tTmE/b1vYO89P6lkakOgjulTF/Pr5pgo/Wj+8sSkrv/j6Zu6i6l01vAwq0hSwEl3rq4PMVMhV77L+maNS5PQROTllRvXRUcJv+OB84kMCWbWR6W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685707; c=relaxed/simple;
	bh=PRjCguMUk1s7Xp+w5iYJEY/+KMZLBNSqYFI/vEqfPmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPCXzEDY0s8UAkqLGZ6Yoq9yw5lpULIO4KaFHrdQiWhTQ3ZJiVgNvFnnUnyh5Z/G2Ti4p7TSmEX1BmK35dNswMz35hrdMBjb/0THfZ+y4r36SLQhM8NSbkO2D4QQEFMV7iikHAcnubNlsuxRBd/xavx06qx8VHKCRY4K9v3eHJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ET9COeb5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ET9COeb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757685704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MqqpI2kMloNbQrwtAbrBDd+hBQn+g4T03pkyyFvQVUY=;
	b=ET9COeb5UTSSd69Rk6I5GtlWmpuFAj/FUsy7ecU8ksVljatSchzLu6HQSJiYbOJZO+XcyP
	8rnnr5i9kFfiosGDcOT6N9rNHUZEORJuhCqTF79fSTCyFBgNxB+h1n7D0Mx4t7RHzF4EiS
	jqrVzi0K/vnHTI2k4HCWI0/pZGBPac8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-if_mKmDvNwm4ruk4viyJYA-1; Fri, 12 Sep 2025 10:01:43 -0400
X-MC-Unique: if_mKmDvNwm4ruk4viyJYA-1
X-Mimecast-MFC-AGG-ID: if_mKmDvNwm4ruk4viyJYA_1757685703
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-746d4801fc2so2523816a34.2
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 07:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685703; x=1758290503;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqqpI2kMloNbQrwtAbrBDd+hBQn+g4T03pkyyFvQVUY=;
        b=glLGpZ8OZuHS4UAOJGJfRppxDa8s1Ptk3FmJ7PN9QW32ulkkWaKhJMuGOdOoTBZYpt
         +rj01x/1OqbpWm5RbBgH50GPO8lRx97EySEJCwd2epSodtmsxeu7MtselkpEVSyT0pii
         T5m/WP4rKApEpfx7lSvUouErNCYjiNyYJhdMlEMevE0oxyRYXOKnyMc81w0TJpFu3L4W
         Kq0UHSe75MVK7MPpQbO2xEUKc5PoSUY+4MvmHaarSQUy9q5k/+cVijuXm4N8+jsLKXuU
         yJC3aUunU+tlS1qdbZL1yXUaPnc0gKcwVoEzLwYugXFf/vH8wqppqpOw90Gc+lFVrj/Y
         Yz1A==
X-Forwarded-Encrypted: i=1; AJvYcCW51HNMNnBhhc0F2izlh+s/8ZZqP3DGSIoFeIxlX5QBMoeXigr5QFQCdV9olasd2MRpPq6n2u3WSH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPx52jQugMGw5gM+ZRf8FMFxF22cE+hRXvGlZCdwoM9dZWTEZ1
	WeLmie2S3TusVXsbb9B8NB+Zk6YJFjof1Eg/et32zlpkQWoZ5I1lhCLYqvimRhFwBqPqeI0tAbf
	MdIKcR/QZ0w+IIUpEDBPi42JrGXPcOJScQ2EzLMQsiMXYarqmwP2RXQspnfw/tw==
X-Gm-Gg: ASbGncu+5V/yLnwNtxzUO9ssWdpTtZzPHl58AZVtmND5OneSX8mx5zdUCOYp6WG9jNR
	7go5HMwJDjTxfX6GMizuN+P9PnMquBVlmzmKvqj81hjxWcZtBrIf2JA+c8Vofzi8SX0SYOdhORw
	c8T+kqBXzOkubeupxTwPvN/wKVUFiMJEV0r2tU4XFwymPUfbHbAHD9qTF9wy1xih5Aa/fkK8O9e
	5LRIrex+VuaXEW2pZuwnBgCqLdmN6Rqq/JA+NTEUzgloA1kImeEoJVadSik3j8d/mfvFkfBHouP
	yV9vGLj4t0CpvDjjlKTySf92EbcXUKh+KnY8G4RpHpWirDqOUnNJABalSfNfUPg25rIhaEEkc8x
	2KMuARA++VvcPGLHFRJVK5PLhSXp1uQ==
X-Received: by 2002:a05:6830:921:b0:749:32a:6e79 with SMTP id 46e09a7af769-75355ac0c40mr1629158a34.29.1757685702756;
        Fri, 12 Sep 2025 07:01:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5yxEH3wh5uzqiZ9fHV5ltsysfaNN7LLcUgGKgcfhcmP2GCkP3kLrFAt6qiJu3nESHP/mhlA==
X-Received: by 2002:a05:6830:921:b0:749:32a:6e79 with SMTP id 46e09a7af769-75355ac0c40mr1629088a34.29.1757685702145;
        Fri, 12 Sep 2025 07:01:42 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639de9a69sm24487811cf.46.2025.09.12.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:01:41 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:01:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] clk: Introduce clk_hw_set_spread_spectrum
Message-ID: <aMQnwU3UA5xe-Eou@redhat.com>
References: <20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com>
 <20250912-clk-ssc-version1-v3-2-fd1e07476ba1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-clk-ssc-version1-v3-2-fd1e07476ba1@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Sep 12, 2025 at 11:35:51AM +0800, Peng Fan wrote:
> Add clk_hw_set_spread_spectrum to configure a clock to enable spread
> spectrum feature. set_spread_spectrum ops is added for clk drivers to
> have their own hardware specific implementation.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

