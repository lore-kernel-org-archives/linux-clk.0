Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6E413AA34
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706220824; cv=none; b=l4mSyhhhDw7oGKCk/YHSZgt4jNyzN2oAQaRqyE9vEZxsIbMuH3JzaNPGreCuICkvs3msUtxF5oCB0L5zDbdRTi0a4t7Ka3SjufBi0fh/8n7gVsgZU0vxsuBY9sycPN4uBA9cmd/O+aLSqUrROggm6/MEaCHDtDCeR/Ywc1NGsjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706220824; c=relaxed/simple;
	bh=/q+OKPTvjfhtwgZQ3LtD4ypTdtx/UFBmU0i1AagUJwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=du94KN9pexieoVFfRqz2tA6rf71efLOb6IgZEL1aLsVJUORY0khRNf1Nmt8uWpn2sWMaHlyGIpwL/tFA8fcpz0hue9B+54FrsQLCwHVrgpGHFjgRu0odENjdSrUn0QXXNOuiHN/Ts2oqyGekgXeSef/O0Zj8UHHz+iSc02cSKdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bW2gQW2s; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bW2gQW2s"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6001449a2beso37569147b3.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 14:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706220821; x=1706825621; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=slwtZcSfd5oU0OLpt8FDjn7MWT/cYH2TJp6qwy9HSCY=;
        b=bW2gQW2sQmAslc3/bpTtAV5QqH6TAAxFQ7V9JEk58Cq7AkNeKTYBKSir+YX4kZvBfL
         JICtdNL2fOWOOe43hSPVvdmWUjPzsHfuXp08B+scFUSFVk/p9Q41rvQHt7GoTTgfk8kS
         XtVDn8RZ5tbcQsqmZK2/HLNXVhib5iEpvoArs85b/PC407wLmc2QmOPMllWxzqgkHrAZ
         SnoIVQXKpw4KUtAEJP1sEjtPa4+LjnxKltA2WvH9MIqae7ytMawnFPt2olm/H0Giz+2X
         PMH1u87jn0KiQWKtpXmp7jXnrrwYINDo+RDJVUQMi4Xb5fx1INXPKEgWvASiEPRpSKI+
         6mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706220821; x=1706825621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slwtZcSfd5oU0OLpt8FDjn7MWT/cYH2TJp6qwy9HSCY=;
        b=SKSiWJ1+Xgo+cyOfl0DIPE8PcjyqAqIiVSGHydBD+X6vhhCGXI5Dd4yKa/d45EpmtP
         IB9TRpJQembQid+KknlY+mFVpht2a9QRI95e7edXXnTqEOQ2laK74omqGfNQOAfNEUQx
         O9yUhm9QzdlttJ4b/NCvVUcYDTCg1OztUk9625IX0sIx2aw3gujUF53wWRBXneWc3IpB
         zbCvF5JAHCytQdKdq2dB7WNCa4ymiV5ivVZSOpvluzGU+xo3kZY/klw5eVLeDPLFIcUE
         Em3KZlVpZcciiuRdJARcZ4Mr7Q2LQJf0P5jAq5/M43/rEI5xLVHQT4S0/5BRRMgRXHCx
         ahsg==
X-Gm-Message-State: AOJu0YyxIlIdORLek2mbyOy2CBP2LdfI0hTOMjwDNR1/4irjuPu5GeCz
	3a4tJwZ9j1wJJGuAd148ZV0Z8ygmlVgb3nlNbUZANXGsehZo/XYmMsqMCpd3Ypk/1/XSkT2HPnK
	B2f3uipMcN3edMDXnwKKbkC4ZabzW/8VJc1V4Cg==
X-Google-Smtp-Source: AGHT+IE3TWyGHNGHsG2xqF2JXCIF6aVnGmnqe4/3CyA3myFBwqZCxjCHe2OS/OaFjyPxVBpRCKQb3m3/ij+f63iLZtk=
X-Received: by 2002:a81:c441:0:b0:5ff:7cc9:1691 with SMTP id
 s1-20020a81c441000000b005ff7cc91691mr475647ywj.70.1706220821421; Thu, 25 Jan
 2024 14:13:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125-msm8953-mdss-reset-v2-0-fd7824559426@z3ntu.xyz> <20240125-msm8953-mdss-reset-v2-2-fd7824559426@z3ntu.xyz>
In-Reply-To: <20240125-msm8953-mdss-reset-v2-2-fd7824559426@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 00:13:30 +0200
Message-ID: <CAA8EJpqb_FFUzyGR2SYH7wwrDCrC8Wy7QcUFyJgHqAvx42Vgfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-msm8953: add more resets
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Lypak <vladimir.lypak@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 23:36, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
>
> Add new entries in the gcc driver for some more resets found on MSM8953.
>
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [luca: expand commit message, move entry, add more entries]
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/clk/qcom/gcc-msm8953.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
