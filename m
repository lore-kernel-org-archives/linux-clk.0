Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17AE3F5BFA
	for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2026 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912098; cv=pass; b=TuUqohzHYhd9o8GPZObZyTfzDvSNCyovD5MFFpTSde/BKUi4RcuZ37zSJiX5YBwh2tYx/XamYWphdImGEISN6V1QvrRYKJ5DvhjzwMwwsJfoUENXcETxiGgS4ANHbvpP6yinexQrlYuX2Fz6N2Acq8F8eUkKtJebEZBaSQ+NlQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912098; c=relaxed/simple;
	bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcd09BktUnhDPm+AcywNRRlL4nsvkZ4SzcZwt8kpEUQI0MKDvklakWLFL0Jv5S6RPcjGQ3921PuD4Bwrfflv4xko+h2pP6sk0u6ZrfE9XuD/3uLOIcWlTwXKK0UZoo0r2ih9we45yoYnj7gNeFrv7HySZH+q91lzoXqeybf5LuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=no6m/T5B; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="no6m/T5B"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso1374545a12.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2026 03:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787912095; cv=none;
        d=google.com; s=arc-20260327;
        b=I1pJWKQXwXTzrEV3INNhanknrDqxFIhcChvLVr8idLKY3xjSnvfjqIw2FC3mnZXaow
         zi0ZHnAQRXFXLzp4C9wlBtWka19t4QTNdiP0bndvNlpzx1SIYo91+qDpu+LyB6v1fTWZ
         C5qsjqVC0uvbFKvCxsryZz5VX72FgzTjojqKjwGG60BAwIxx85U1Z0Xh9VLJ3KMCMAjL
         NuxWFKk0Fr5Cnl5ub+Wsh6fQBQq4+IMMbs13LTFkKt2oCENN9jViyI8KAuYlmsqiE3Kg
         WMuVgvbblCMaXlfDTCfpIdhE2rMljjQLlB0HWwVI3N/PZePzU2gDcLV+0GVYZVGVvZSj
         JIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        fh=wgcDDGcqf8cpWom2CVN/YDNNjLp6q3HaShqcrhN8rBM=;
        b=aOmFqj8v2GWnhO4j8whnuS704YvFOk8W8C6kDPQ93Ydx+rUcgV8ywGZsr16pmuxJ2y
         5I08+FWz4qt8jHYx/CiGRbc4XjLt9Id0oxYglkjIRhW74EWRCDC9PoXzzzvWUtUC141s
         b0iAYJOmI/y3FCMim1cn6g2mXNJy9OiWHNqnH+4H0E+KWjMUrY6u6fEtjrMVFacpYFGx
         QdcygtPJgJd3gnxH0Sfd/2KX1PKBZk9oiC1dmk8qNe1mfxzS6ysh1GjHbE/EJgWlWXLz
         0dQtvI6BqODV24N9FtpSNq941215Hj9ljxRFE2UG2JnNLLnSVr2YQ/R/T6VqEqTRBD7R
         +dxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787912095; x=1788516895; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        b=no6m/T5Bw8c0DLSeM5A22ornHVbSjgkRZwqR3U2HtV6WyaEpB6lcmVAz8OpqsWQn6n
         k0UFY2zZ+AAFgBlq19ptPsX5aS9Ed+lv5FaV0kFkHNi6ULX9Gz7jhCFDC8vZBR19Km12
         gosgw/9brnv0PsIRROiroFwImYB7XEyZnDc9Eo2ietqRa6WkoLoRLBBn1TrzWQYL9y5n
         7hJyzBgQsJbv87gqIiQjdo4yHX+TCZ3xBEN7KehsnhAq37TCpJK2KOuJ0NOnVsnKynq0
         zdQZ42ESzDOPfyH58UrNlbXf/pokJRApl5inRFNmWRWZJP/gF+LHckYfMy3wyAwuzNQ6
         SPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912095; x=1788516895;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        b=NhJak4X0uBpSsJUENkUimmdQpsDeL5tUICbCxEixwiomREaNPOpw3nFlRGobuxQkGd
         Ae710eD2T8i5QatmfQB9J9Ij4U+lOkQKyIRc0VrXt9D5abJQFmwlHsBFztLHJc10EDOg
         we3P3RiBqZq3FkVdOyJSohs+JvGR6G/wczBrse9TJpfv1nt14NL5lo2RiOTvyzaDesoP
         FycM3AGXrDyKYn4Uf2onp7YQu7gIM91BoqxGSuFDfbgDs9BJSWR+gq3ZmChF9hb61HtW
         8n6/WgA+Wu1VYhla0pnxJ/cJQOHM4JPyT/gHbC9m8K70AYRZ4LKqtb2tdbyLvf+SXiEF
         0qPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7+2nGMvFItDjjynOHeVEldAuF6b5Jkn2KCJLr54MlAJHRxZ+cfPSvW2sdR2rhWszZtraAQjxShyM=@vger.kernel.org
X-Gm-Message-State: AFuF++mVKWvGHOikzET8jb7tiguafBRaHxl41JGMDgLpAgkUa5Xbnx0H
	csHa/CHbH3F3aaRZ86DAwNjjfMuDs9Pkkp3xrv9NGvxtH4Nl6mP7em9Jb7Z4B6e79EhszBsJxHV
	OllVbG3oRD2h/V5ymQ9bKtGUxq2RzQIE=
X-Gm-Gg: AR+sD12GLKzqZiRYtTpdzTr5R1MxIWwbi5G96KUgYkFthXmaDib8yAILd1A/+NI081f
	XUtTZJpuudWHMBTjOY3mxJybbhvI4GBe1HeqAnpkNdKYU1cFhLmL6mJrKu+dilrqyUMAflv7r6G
	XXPiGcvqRB/Ss0s/eqghu2YgzINYhvtrLozomOTwDaXPcXKdpFUGqhZeNEhHTSzME0ZdK4ref1b
	GoNzfJsQJAQYStfdW0Yo8/pFHbWPLBUyxFx4Bgol50W9IiMyoOBKyjDbiEXS4mQu6BG9zW9/+wX
	tqx4vo98ZR7rjKrEo/KIOiN+3B3lZnvjXheTnNC+oqRRN3FmjTl/d7x1UlT5jctqtTE7L2S0nHk
	L3qLr
X-Received: by 2002:a17:907:d0a:b0:c25:32b0:e56c with SMTP id
 a640c23a62f3a-c2556bc8abfmr482808166b.4.1787912095085; Fri, 28 Aug 2026
 03:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150156.1310-1-sreeshankar0910@gmail.com> <20260828-liberal-jumping-quokka-cff4da@quoll>
In-Reply-To: <20260828-liberal-jumping-quokka-cff4da@quoll>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 28 Aug 2026 15:44:42 +0530
X-Gm-Features: AcwNN1WwE4fV98-9nbf9QfdMe5RP3mFos-H2h5xcNNdmEyy-SXjW6DtC1QoidsA
Message-ID: <CAA-+uk+5zWvmTB5NCbWpBqHSw6MswBAaJHGHw5LnKm4SBhXcLg@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] Add initial support for Qualcomm SM7250 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org, 
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 15:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Aug 24, 2026 at 03:01:43PM +0000, Sreeshankar K wrote:
> > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > This patchset is organized as follows:
> > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > interrupt controllers, clock providers, power domains, and reserved memory.
> >
> > Dependencies:
> > This patchset depends on the following patch:
> > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> > Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > [PATCH v5] Link: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
>
> Please keep the previous changelogs and links.
>
> Best regards,
> Krzysztof
>

I will include changelogs and links of all previous revisions
in future revision.

Thanks,
Sreeshankar K
