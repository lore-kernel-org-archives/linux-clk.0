Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386F243E9CD
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569537; cv=none; b=BsksfXKU0kPUC3Jay9o5mkPHhsr5e1gLsj7m5emxOObft5T5dvP5o+ULYouFrwFiJoezyZAAnTbm65UC23cYVrpKHn/XIL/QJIORicgSY6A92OL4wps8h8I3X1/Q+TuCxWKHnWrfpElOvKgDcKM7wcb3Kl7ABd43JQodIVNCPkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569537; c=relaxed/simple;
	bh=S1y/611h5F1yDCLY2MwHHiifJrIn907EP4/nio92UgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCWX/szQ8b0LOAGWHBBeEZzu+c188pfdFFPqvBTEuxIUDB1Xg/ONA2OA65/HZqRR6M+sqWdU+FyX93dy8pBD9CPeQWur0R0VLm37lL5k1CXKAF0Z/vdQ6t8/jEZgd+buFgPDB2S7MGn8TzyLzONRV5nmK8X3z0p0QfpsZxuXqYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BK0C75Yv; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BK0C75Yv"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bcc2b199c17so371930866b.3
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 00:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778569530; x=1779174330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+au2wZMjR4hSPfSatgV6boyFWtlvztIAKTjtpXaCIFs=;
        b=BK0C75YvBPrANr+ri1CVo6P8WvyLhqIh/Y8/a0IL6DEoVektjOYyfz7oy7+8++me+/
         wbTTyApThqtCx2Cmgo/qca4BBMIWVbILm9OTbHkQtnoV5zKbe1c2mSpbAQhNLJSb3+UZ
         t48MvJb/QbnP0pTt0MVfCq2bYMDsOtOwcwZpWENRVtAhCpyDKp0qviirwqWltOh/c9Ld
         F7wyLcNcyThyVFqc8QiUQJjWShddmJLDMbdi3e2ZIp+GREcuT5WXkHoCjXqULz1zr4Qy
         VziaOY5j8TvaMu/nAQtf/9+T2DYkrsgIJEYDk/jNo/4MwEgT9Tcbn6EORGPS/N6UNYpY
         4pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569530; x=1779174330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+au2wZMjR4hSPfSatgV6boyFWtlvztIAKTjtpXaCIFs=;
        b=YOQ6Md+irY2v8sQLDYXNTAxcydGrxjGiO+axi31+xAWG52ujbqp19tNiayvOAN8I0Z
         5NvaF3fz3U84Rm4+mjZqfXI2w8QIjwSh6RcUO/3nNoUQele+yB6+c4sLJ31oDnRaxffS
         CWXAcM7WjhyO90/6Cv+Twp8qBFdwwsCkYhm8s+6EoK2J71RIfXrhRTmUqljI33mDiZE1
         nJ7sDUhcOzbhP2x30o3pRTPs/JrK5B5OxoVf1Dn6uJT2Zo+OtgpmYgSXqiwcC88LediW
         jMG+F/nm77uTPxt05tcrRyyv35NrQNpir1XloapHbnJ3QFuW1bJbNrGAerYc/LRNOvwo
         qqDg==
X-Forwarded-Encrypted: i=1; AFNElJ9cseOditosgv10hVaDjcSmZOrGEn0McrxOoLjN6DYqqhTYV1BJepSPGiGFntZTAf9sdoQiJszu7MY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9hHOJ8bCVVReg9jiEPB068JIJ5nAIlnYmQMrOE/QE+SNVQwFf
	RcpYuQcJwlnHV5+rnjxGQ6lnIl0JzgARayl4mJbVHrXsk0Akh/MX1vpz
X-Gm-Gg: Acq92OFBIftK9z8aU+n6pshy5A4C7TGMXI7KSK5AMXDeotdtSA6AMXxj+7VxDdD3ZdW
	NvSQyoVpYxEEfXufQvIrC8O/jm2nYPz3DlK2G87xIkbFB6HYoxilV17xBlrFX/mdkwmLpw6rmLH
	ncqjPqh14acW3ri2e5bBdgUCv8oFnhhrNeec9vE0fjGcyXw118oAUV5Vo6EsusMntG6fnRUnVFh
	8D5uXVLgKk1TAH556sAp7COlZbnw7a0QlaWaigXAqk3djXIWp0UXjE4QHyzhPunOnVT3g0qr4Jh
	eC51bwWWi1roTa8SOrN9hbFw4H4v7Vo54uteEtdcBvy8T6O4ufWI0cpkv5PCHnskTCgxvVGYjH+
	31MHmXgDkXyYtJfx3vHWxB5PnWHyor8qtj5LTqFz0FMRUc8XS81yqtoN3h/v6pTFF7qN+1/vig/
	339D/C/e4Bw5CAk1uxcige1dJn0K4FSjYcmmiZTCnx5YogQB3vWqsUWZ0l4w+jitQonLYT
X-Received: by 2002:a17:907:e113:b0:bd2:27c4:f453 with SMTP id a640c23a62f3a-bd227c4f500mr115768566b.9.1778569529638;
        Tue, 12 May 2026 00:05:29 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:4e2:a099:cad9:2ecd:93de? ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e2c317sm4646281a12.31.2026.05.12.00.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:05:29 -0700 (PDT)
Message-ID: <c99d1b63-b304-4440-9bd5-b119dd0042e5@gmail.com>
Date: Tue, 12 May 2026 10:05:26 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] media: qcom: venus: Add msm8939 resource struct
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
 <0TaxINYCitQd2DsGsbhRviwmrQkaaVMaE9vABS3gSsSPNfrgS3JPTIo_kvTzyEhGOAZuMVq-k-5T8mqDM7dnIw==@protonmail.internalid>
 <20260506-msm8939-venus-rfc-v4-3-994f5eb22acb@gmail.com>
 <108401cb-040a-441c-b463-b69df195378e@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <108401cb-040a-441c-b463-b69df195378e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/6/26 2:33 AM, Bryan O'Donoghue wrote:
> On 05/05/2026 22:44, Erikas Bitovtas wrote:
>> +    .vcodec_clks = { "core0", "core1" },
>> +    .vcodec_clks_num = 2,
> 
> This smells a bit dodgy to me.
> 
> You already have
> 
> struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
> struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
> 
> so why add vcodec_clks and put core0 and core1 into a new array.
> vcodec0_clks and vcodec1_clks seem like a very natural place for core0
> and core1 clocks to live ?
> 
Sashiko found some power management issues in my code, so I'm coming
back to this.
The idea is to call vcodec_clks_get only once for inline cores, thus
avoiding duplicate clock assignment. Attaching to vcodec{0,1}_clks
instead would mean we're adding the same clocks twice. I dropped it in
later revisions, but now I want to re-introduce this, then add them in
core_get_v1 instead of {vdec,venc}_get_v1.> ---
> bod

