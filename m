Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCAE74299
	for <linux-clk@vger.kernel.org>; Sun, 18 Feb 2024 22:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708294268; cv=none; b=RRfyHf7QmH8cVhgYiVCHbpFF5qemL56iT3126sgM0CsR/Q1Dk78I8aDronX8EkDi3MXT6BEKfLLfw9Z2PNbIE7YNgonFcn1Yl8bJEEqv7169Yfih6brGCkqxsNghoVyidT5Uuob9aOlxUoCKK2A6hMplDP4IjDu+fvsXyc57zq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708294268; c=relaxed/simple;
	bh=tvvDncg1WI0//tRyUMP3lqwcPgPfZh9W8WMZ0iFU1aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FD0tJgH4nV6xkAblSCf708sMIEf5JcO860nQ+g7pNijEYJRyjm9WtVGWbRTelYMsQm8/6DfisVjkvjpGRLv6NXnVEfkg1OWoe0JyUdzfTbbHwp5X7S95Hz77CnV3b8fioq0XKpmMnGaQ+nLyvP0ApBW+oeKQz3QTLUhNWo/BMkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ArnORYKH; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ArnORYKH"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607f8894550so16784387b3.1
        for <linux-clk@vger.kernel.org>; Sun, 18 Feb 2024 14:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708294264; x=1708899064; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+AD8w89s+gvj0mKYSTbVikH3rVbe83iTAnvtx9TnsS0=;
        b=ArnORYKHXrzaDsxMqqx5jIlOb8lvmgFQ8BKGJdwK30BLj/bJ+ic3X7Lf5mj7SjN2oa
         bAr8nRDPLTdCCL/GJLHMLSZ0XbYm57Tl8hzGkrXmlJjLWdy1uTpQ97DQ5kzVLBDu4K4Y
         /coNYyFv2/d4cRtP4XtcCOSOsNY5HIbzsnGcnlnV/hSnw2YEMKTyV7AjyeLi0zr7WApa
         EwYd8jbAT9pdP8/axTwlJJu/c2oD5ePgG62AmELCmsVsF0ZaltSfDltXbhQS2bqqyqa6
         TLqrrvsHoDAadG7Bsopw245mOtQ4tuDEoYPDIggAscpRNjZVgHI4SIqj0u2qncC9lFdX
         gtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708294264; x=1708899064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AD8w89s+gvj0mKYSTbVikH3rVbe83iTAnvtx9TnsS0=;
        b=UysTLihJ+B0OMDgoo270pvTRR42Bvoi7fidxvJRUvfJOqlJ8X+vA9ebxG+7J3RERvb
         JqgBjpoRR2CPRyxe5NsCsooH6A36ClEQfr3+tntofT6o8MFQfZvbBTHR52ofVTDO2Jxu
         FT2CIDC4tAhCgKFK+vYYarRHa7owXTmddtXvhSzyGPnSxGoG+K/65WBEs8RnMidBuQXz
         roV/ULgOMjMx+E7gWuybB5UIUPLtWmDs7EPeVTAWOZCSwkag9u6fB/4sjDpvK/QGVKcd
         dFrgmNHu3EMbqQ9UViRVX1fiRcTGsNjLKY0HU6DvkNt85eOySeN4eomrZ5+9482xuMRs
         evjw==
X-Forwarded-Encrypted: i=1; AJvYcCXvcRkRLCh4yhSVTu/F9D/NxO2EYd+QS8Q0ZjzhZiG1xF7OwbUaoZwbQUJZdrsAUPaLxIaMU0/wyMWl/G6LVSF4jtV4mYY3ftzW
X-Gm-Message-State: AOJu0Yw785MIG7DY3fBQgFM6fEt5P/IbM/4or/ZzFeCV5KUGdqnoOVoo
	wyCuDCpF6ZdIhrh+YxkQZRLrZntWWkw0PsymOg1dyvALQgpE7HkVX8JbuVc/8pNmIOYb/+NFuGR
	T/ZlwepwOW6swEuE7TxHLJEADBMGx2H2b1cnfaw==
X-Google-Smtp-Source: AGHT+IEgg0E5u1X5ebuYXnJ++SELErkiGN+TuPyNky9IKq31ECZO7bB1+ZtCKqmUvcixZwfyK121qgFIcMfvjQlbF9Y=
X-Received: by 2002:a05:690c:fd0:b0:608:d1d:d8ce with SMTP id
 dg16-20020a05690c0fd000b006080d1dd8cemr4935951ywb.12.1708294264190; Sun, 18
 Feb 2024 14:11:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240218-hfpll-yaml-v2-0-31543e0d6261@z3ntu.xyz> <20240218-hfpll-yaml-v2-3-31543e0d6261@z3ntu.xyz>
In-Reply-To: <20240218-hfpll-yaml-v2-3-31543e0d6261@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 00:10:53 +0200
Message-ID: <CAA8EJppEyibLz3z4UQbTdR08332w0OoegbOWTz0QnD9rcRb2DA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs404: Use qcs404-hfpll
 compatible for hfpll
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Feb 2024 at 22:58, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Follow the updated bindings and use a QCS404-specific compatible for the
> HFPLL on this SoC.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Please note that this patch should only land after the patch for the
> clock driver.
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
