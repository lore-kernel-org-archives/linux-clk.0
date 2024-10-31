Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172B51A303E
	for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730387705; cv=none; b=M9CJdd+BWkqBimzdEamO1SHAdGyfSSKMeLtw4Uy3j5lWT7Z6EVEIY6h6yb3BPuBCJ3nZPmvedZDkMM3/i3dKCWL62+gNeqTSVKOxVGniHav4wGarODIoMveoBk8O+eartVbHTMzaWhoSjhzc7rlNDOZ9l8UAvHMMXZ0ok/jH2PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730387705; c=relaxed/simple;
	bh=CIqgAcLbJbz9DTJFXaDtE7u4mCfu6HFK2Ec4lMCXi2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frKEzvOKI37LOHcVWTevPMa0FoR2DJiP9aWacqwcfksmqAaTZL8POVO/5nYJBxgHwWEcsOPSJzAqE2UOiSDKvUgTynfe7sgiJFfFxDrfc3XRDcWpalz8eeotM1ajIMaV98Z7EdJIQOaKgmtWsI78v6zIQjYh6d/CX7gynW3acgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBryv0aF; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBryv0aF"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ea15a72087so8370677b3.1
        for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730387702; x=1730992502; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PsNfyZkAbUdRy3BMPYsQyztzSUGdi05Vyd/UT3Z4MOk=;
        b=HBryv0aFYb5GtzJOnqslVXR/dnUvcIoz7+UMNrpcEzi5V09oMhgXwj0HhOBNrabF3Y
         P2RaxlpRKRe3QhH/uo2TFSQSODC6y5HZBH8FaKt2oWiR99L5ajwSYGB6VplK8fPCONeW
         Rnb1pWOq0Wl+SrxpKG6g6m+cTZB/hWhA8JRZyeVbdmiNe15frgShLXeIAO8Cuf4GVweJ
         mlMUexdjKxlkD+9eohUj20XVn2ze7NpJAgAqIYvvb6BP3cTPVRo0sECxe7EDQaMFb9kY
         EZk/M4YxmSWPEe/jqjnCcJLzLFJbhj/RO4c3+09xsiv6+No7ZXHbuTgdHBaBU46MRIAn
         gllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730387702; x=1730992502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsNfyZkAbUdRy3BMPYsQyztzSUGdi05Vyd/UT3Z4MOk=;
        b=vwmgWAceT5daGkD0UmmokFtmpgMT1AmX5EcNYHvmli3SMGlpAOO/0vnIt2SU7tgInF
         fzyF1992r7Lus+GWugBgiHjbonZvjPm/UHVPOxPKhgSnPjfvurzhn/Yv5P+D6YgqTiOS
         nY4m1YZyZpUmIYXbnr0JJulgZYN7dIm3xYdznSaKfSgS5W1EKQ6vJYaU8TmKNEwAMI7W
         qZ1Q8rYGR6hSOD1ByA/jGxSCRMahgPzfQw4fZohPqivcQnTlsZT9ubEJYxuywZL1lW7p
         DJSYyen5yrN4o49mRYHKQo+vg4rB+mw3vtKjVnFIUwHiH+pstCCtl5xWt1wQRIUJwmQV
         0U9A==
X-Forwarded-Encrypted: i=1; AJvYcCWVVsWSB944Fvwonmj1I7fEcbLCDkGVpEii0MMMCnRWW0bk9PbSvSpXQyiPif/1Q4Bs+n1qDezq+hE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzemuuOJMHSxQzxjx03g+SQK3mvd/bgPdiFNaYRmYjSRRt3335n
	B9/Vl7I71796VCrUM35nZgwV2Prs5/4e5pi/LBvfaPH0/0drfvcUXIkhzYi8NUKgdWgCK+Eyt/f
	WOZdULpPggsE49b4nqRwE6BCPv1Kou3OGZEKGdw==
X-Google-Smtp-Source: AGHT+IEzbgAkvn+Kbd1W59aqNXrS5kqasKo2UcyReXDn6RNKVnLzNobyJmTaqWwwzBvxE1e6RcSS33ZES6nefnm8xiY=
X-Received: by 2002:a05:690c:3803:b0:6e5:625c:5ad8 with SMTP id
 00721157ae682-6ea52542f0dmr43442727b3.37.1730387701805; Thu, 31 Oct 2024
 08:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-8-4cfb96d779ae@quicinc.com>
 <omn34rwurlxrjckb5d6xb2brg6zwcizonmqyfckvngk5msrfav@b3i2bdjk5vw7> <2aa768a4-b0e9-4b2f-8d74-736a88cf81cd@quicinc.com>
In-Reply-To: <2aa768a4-b0e9-4b2f-8d74-736a88cf81cd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 17:14:57 +0200
Message-ID: <CAA8EJppZyJt_MWrafSKReuCXy0RtEAQ6VE-kt_Fp41eFpsW2SA@mail.gmail.com>
Subject: Re: [PATCH 08/11] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock
 controller driver
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Oct 2024 at 20:04, Taniya Das <quic_tdas@quicinc.com> wrote:
>
>
>
> On 10/19/2024 1:58 AM, Dmitry Baryshkov wrote:
> >> +static struct gdsc gx_gdsc = {
> >> +    .gdscr = 0x100c,
> >> +    .en_rest_wait_val = 0x2,
> >> +    .en_few_wait_val = 0x2,
> >> +    .clk_dis_wait_val = 0x2,
> >> +    .pd = {
> >> +            .name = "gx_gdsc",
> > .power_on = gdsc_gx_do_nothing_enable ? Or is it controlled directly on
> > this platform?
> >
>
> On QCS615 the GPU clocks are directly controlled by high level OS.

Is it one of the gmu-wrapper platforms?

>
> >> +    },
> >> +    .pwrsts = PWRSTS_OFF_ON,
> >> +    .flags = POLL_CFG_GDSCR,
> >> +};
> >> +
>
> --
> Thanks & Regards,
> Taniya Das.



-- 
With best wishes
Dmitry
