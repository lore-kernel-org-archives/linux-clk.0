Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635913F7A84
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147346; cv=none; b=AvF9z1SB7YgvAwxDOFt/cc9CJpCJJBJQmQTKHeDZF2AOZCPzUD8RT3zZUo08QXrSvifRplM2aTDT4FyrXjafIbfqQPLOUe4SPhySOT7NCwmdUZcQ8OPKO65wOrFCOMRf2v0AdXOkgygNojLNZeAfi8AiGJKvSkNwU9hUesx/jjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147346; c=relaxed/simple;
	bh=7ZL2/7XAgS2B4TY66zRi2gl89g6BBqqcK4ySsTVVchM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5+1CDqvdeVlbshgPpZuk5xx6MePCLZ1Dzyxyvl70i21XOO+0YGY4CTVVcRrX9Iujsmxniztk6R/0QWl294pLyEZ3cpoSGyN6DmknyMYCNjCuaMkcIaUXnWEngDE08dpiGhFC6ZEteMkmvikDauC9Cj5D9oPdZqDvyEKZiUDSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TqIzQIfo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqIzQIfo"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso28354975ad.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 03:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785147344; x=1785752144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QDQyB8vRHvZ09GDkbysJcR4DVdc4heeWzZnU8EgTPAI=;
        b=TqIzQIfoGVOlXTiJK1d7iwkFqryW8gadTYl+H7Gbqg1vEIRJicRyabwPg82X0vs4nM
         DlGgfJTSeG9leyv0WRwrRe/X8vTvS43GJ+07IOHSG4XG5t3RJJ85F4TcCUjlR0hM8THW
         C5t0N7J+HNWb3i3NhPZDl8vgr4EKk+sJ44TeWzEKUp5y8Y1srA5Dx0Q2WfqKsxYgTigC
         tUtos3ETrHeQQq9Z4jUHFZCsAKUyh6kSR4z2r2/f/s+/DG3sVgZmYp2osjVcSK6YRKY5
         bO1VTWlbF1QCymvIxy9NkbwGrk8pjL0fHsklpd829WwOK6G8pao9Z3oCDrgG5kJrHu+h
         s7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785147344; x=1785752144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDQyB8vRHvZ09GDkbysJcR4DVdc4heeWzZnU8EgTPAI=;
        b=E6fKbztIbWaPjk51lIfkahV5j4PG3m4n7ufmRvbhbcgN6SRUcXR6Te4ayCzKDU5s4U
         TGK9CJZlOlZMgndaD5jT3lvVsv7TsW2HkMW1E6HbfVud37vXKe39wY3nwh5RBI23iHzp
         6E1IcKHo9xnfmAwsYBV90R/JF/GlPZ+ikVMu43QBk4UjHLYh/zfr7v9tFj1M4t663Qia
         mHj2Jl87HM5SZOgPxfuXwa2mK/Vk71B/82iMMlA52J5gTCSBYhnjUvwwWETassYkBARh
         eSG0mO2FfSmA4rou4LPyEzI9gegrsPOW7MvUmSPxTtkKCZNdcKEhLR2C2m1sXDIgWyW0
         kofw==
X-Forwarded-Encrypted: i=1; AHgh+RoQpARq+fKG+wHH8KbQBt+DtW+HWkubjEe4z53uMeeDwhsxIVMnPCFCrY9Io7sD52/IH1ZWxfGulQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0wwm05twX2Zza7AN0KjCWiLJvpBMeDO08pcQJ6ogJSmYZ6DvY
	vAISGgCKYopm84JTpUSqMnn+NF4SKhPodWXbpBWJDDl5xP4r4D/nqEzJtXbHc+XhCZA=
X-Gm-Gg: AR+sD12TQcfL1vVmHqTBUR2k7Hnt5JdhyZKmRo1nTbcS/g90uS2ZeUmEczg/f1qBUPU
	hNssTyWces6o+mghgTRYFK/tYPTjSU90N0BugVHfIzCs/xY1WxuVYMG2cHu9DI8EESTJ8QhZqFk
	ld80R311OtYZCewbMbo4R7tD7MLC4z54EHK3f9EdExErb6fkIV+nAO/TsJJdBnh69Je1I5rUX2r
	BA0ls1/xCnsrbjxBvjqi6pmvwOxp93qfG4yFArSx0M9qoV55SUvUjvb/gqTnyDJKOAQMT8aXC/Y
	TIqXdD495M8aRUz/DW/idrzFyugxMzmXxUbcLJ6Qcg7ud6GyLaQoSiZWaPmWWhVYYCCOlxZUWYm
	EheCnYRcpKcamBZeobFeDZ/85XyBJUvf+aQ2FmMb3pIIUvCdcPobdOLnZ4ocsVDgcActLYZKXds
	2VLQ==
X-Received: by 2002:a05:6a21:4c16:b0:3c3:a969:2cf with SMTP id adf61e73a8af0-3c6c26d254fmr78923637.53.1785147343534;
        Mon, 27 Jul 2026 03:15:43 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59434fsm31061551eec.24.2026.07.27.03.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:15:42 -0700 (PDT)
Date: Mon, 27 Jul 2026 15:45:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: bjorn.andersson@oss.qualcomm.com, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, konrad.dybcio@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chandana.chiluveru@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3] opp: Use clk_get_optional() to avoid leaving
 opp_table->clk as an error pointer
Message-ID: <5dcfpfeu4hxvtap5rj5ybioazcejrsdptcdwq553c64snp4wmo@rrkslurmb46x>
References: <20260727-fix_ptr_check_on_clk-v3-1-94629ac7aaae@oss.qualcomm.com>
 <sl7wx7n2bocrfcsqj72vp3snchbgvtkuahq4pjzpor54bg46ek@ar62czwob4j5>
 <f4a3c2a7-0732-4d4c-b252-2ac5ea3db35a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4a3c2a7-0732-4d4c-b252-2ac5ea3db35a@oss.qualcomm.com>

On 27-07-26, 15:11, Praveen Talari wrote:
> I have followed below steps but faced conflict while rebasing it.
> 
> git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> git remote add viresh
> https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git
> git fetch viresh
> git rebase viresh/cpufreq/arm/linux-next
> 
> $git rebase viresh/cpufreq/arm/linux-next
> Auto-merging drivers/gpio/gpio-shared-proxy.c
> CONFLICT (content): Merge conflict in drivers/gpio/gpio-shared-proxy.c
> error: could not apply efecde8a254d... gpio: shared-proxy: always serialize
> with a sleeping mutex
> hint: Resolve all conflicts manually, mark them as resolved with
> hint: "git add/rm <conflicted_files>", then run "git rebase --continue".
> hint: You can instead skip this commit: run "git rebase --skip".
> hint: To abort and get back to the state before "git rebase", run "git
> rebase --abort".
> 
> Could not apply efecde8a254d... gpio: shared-proxy: always serialize with a
> sleeping mutex

Looks like you are trying to rebase Linus's master branch over my
branch ? This commit is already merged in the kernel and you shouldn't
be rebasing it over.

Please apply the $subject patch only over my branch, maybe with git
cherry-pick, and then send me the same.

> How to proceed further?

-- 
viresh
