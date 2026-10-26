Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992609;
	b=kU92D0YKY+tqOQ0t39fQ8sjVrM4MsuINE7jnaOReM527mTMqSQ4Bud6ccrndaarIrDZb
	 EzgH+8thDH3gvPfBJ4xuMNh/vbUZ4AFlsW00NX9vU6dredbaCWYfuPbzkluFglqA7eMmV
	 a0lNpOGb6eG/AuWc7LFYjuMRIgRDqn5159joDQHOvzU3H8Qvvwh7iSrCPsda7tf9WkP7B
	 ikQKsOcCMQv8hj9AFNKDqurJgkVDOMLVgiy+i8c6XZbZf2y/NH7icse3MCdU+QIh1+5Tf
	 AWc+/P1nkRXGJTw5oZ2FsxBFKvsM3lVUlms6+NFZc3UqijqOO3gZmJnNivHF8amTYVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=;
	b=W+LMJ4C+ikRH4joRqSyAcXggoghdbreR0/4TEisZw1mMHJz3oYPo/zfiGJALAXGIcwDZ
	 +dopENb6q2AZqWnuNb4/YOdb7mKxT7WGnWjeTqrX2M6Kqs1PlWuYCvn6KRYavv5rt6moz
	 +BMZLblYRx8AdIOw4IYQJPsV0Kfof2+Re924lc7iXvRTpbSRfYxB8WuVK6Mi+iWq2LGLE
	 ZYytaKSQPQK/88/p+4luUiekH0TbJ9i90hWdUhr5LCUcXdS+Y9gGzrns0THbKeZ+MPWrE
	 k+E+D4WYKNRSMwsi2TNm8zz24b0H0ESQK1euVOIf/CWGdWo3Tibw2u0hJ5IwfFM0YQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gthIh1AK;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B02606A320
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 05:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B02606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gthIh1AK
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35d0be18c71so4428055eec.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Oct 2026 22:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792992608; x=1793597408; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=;
        b=gthIh1AKAU0A3AJJG069Cbtlgxlem6fGpkULCLsWK1TM7qt0L32vkm4SwAPpsVLD1a
         Zk8fsxIyOoL0yXA8LNGkT+UWyitP8Hdh3MUB2nhVWvwvTVwYxyfVMdGfYMdqf3Dz+EAl
         KyCQZM94tCvzVrcKCvLOvEEblmzKBU1nMInRbR4lFBmO3lXdK2Tn3/6U/HxOOm1TMQLp
         LSoS8W4imx/fQzIYVzdXoML4S/clFhy6X66qFSWkazQ/eFXqIZgWWWFJACbmdvCpl6to
         RDu0QmQB5lIHpCjEl0QCv1WQmBbWZkSqeD2c4QBmLATFw08ZlqSHWoSpHJ7R+tvJLnIQ
         SKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992608; x=1793597408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=;
        b=fEVRCOZdG2DicskdB6v7wWgKkXJ5xVGytPdGSftRQHoWYN8aYu4Nn1T92CRn010R+W
         GXuTuvhKbHa3hcc6Fjpw0lOR9NHBnOud8Skw5IUDaZrj3oeEExMxVN9iSlhSuw/d017/
         bMWzWFfZDa6zCBzPWnYvFCFt3+SzOKNeGyhh8fCS0OHOhsRY+1os8X0i83KUQEaPRtM6
         kN4KHrUl0P8YJMYdR4ZfhQSQVm2YOmkEP8ggSUdb1lbd17jWC9Y9JIESExelAzLcXd26
         6uR/29JbOL+dKPG4FV1cKO0mrjrYZ2wrEyGMvnJhdeD2KYPDqBU0q6AE17eq7vk4/pmB
         fUsg==
X-Forwarded-Encrypted: i=1; AKwUvBxXpkgpEiX/665IjJdBdWqE97rdzQNLUrKTkUk482bUIMlNcvnkEXzJ3ioo4B9zEdcxll/KFLQvmT0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrMt4Ij2E2SyhjbVsSMTSO41gPT+uZf/Q8SlAfTLl1cj6eIAHF
	vDFAbZ72ewIPgZiEL7YiaHNyTdpLNkOjrZxQ/yNjobhhSMiDtbdMpDEfDDF4PsRMoGI=
X-Gm-Gg: AYBFou0uX/UOCdxziG0l8QDEZUHxJ/wz7crijhoDBUbtMjalY90hR4Hi9KYsXac4Cfa
	m2d1Sg0JElKMyz+7IHsKawdmP8PrdywzpPouafF6MtTlKu/Xj497OPplSN/s332c3PaBa6n9RSo
	IIXQokxi7rJQGPCBMCzjOcG9UgPL9CJIFaTxZ4NN+DwMT/fs6n/1gBg1kSqL+IzkLrC/zIk7W0z
	Y48Ib3UPAOekV5x31uetrTNRN3zpsGuha36QgBrYKCcl3GbuPyL+CUC3fLlyqfS7eil/KAesKOV
	ShC5uT+BuPuGdFRKhVIVtgkhxIkzNERMEGpe5zE9lhcmZZrenB5DNXuF+1DuajSP0GyhTPVw1yZ
	o+bqE5GR/8a8wEnERuMcy4ugSe1CM6YfFd+YW73Bzr5gSJPxur//Cu/kL5FlgLNQdbAcZK1ewOQ
	nO86bGTlvIv+PxTBJYcn9GXP51PjTitbqrvskgxyY8ZhFY8pA+uLdSykJBktDOxGVhjRgpljzG4
	BWCQebXw2Nd5T3DFM5MoRL/3ai8ORcQ5Fvx0OyjkwjllPjUSLSREBeVIg==
X-Received: by 2002:a05:7300:c8c7:b0:369:f231:b98f with SMTP id 5a478bee46e88-369f231be73mr5481082eec.4.1792992607224;
        Sun, 25 Oct 2026 22:30:07 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm7075259eec.14.2026.10.25.22.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:30:06 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:00:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>

On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> Every S4 speed bin runs the same CPU frequencies but needs its own
> voltage curve, and the bin can only be read through the secure monitor.
> 
> Read the bin from the firmware, select the matching
> "opp-microvolt-speed<bin>" property for all CPUs, then register
> cpufreq-dt. Bins outside the known range fall back to bin 0, which
> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
> on the SoC compatible and needs no node of its own, and S4 is added to
> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
> the bin has been applied.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>  MAINTAINERS                          |   1 +
>  drivers/cpufreq/Kconfig.arm          |  14 ++
>  drivers/cpufreq/Makefile             |   1 +
>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>  5 files changed, 202 insertions(+)
>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c

Is it safe to apply just this one ? I can take this via the PM tree then.

-- 
viresh
