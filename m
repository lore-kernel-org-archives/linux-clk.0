Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A39525578
	for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708338196; cv=none; b=CmEspSVyW0ORhQULWXi0VR9svJ24EvlAghp986u7nUhwQnKv7ESFnZ518/KZSbhsF6aURo/pTiNl87IhOR1POItoUzHRaQ+Obh6piNtnyKgYl+L3/JqvJ3uf69SkzKwxMqmrePTxzCVobPwxc0kqRXrfKwv4a5VAGILGcp+cFCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708338196; c=relaxed/simple;
	bh=RWXNHUGEvBUqJCoB+kDBknBCopB3TrSyunf4vw0H9b4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6tVqk5YCEoOcLMRrDTdP5ATfISWwZZvBuVuwwToJbbV9PAS5APAmyA92j3rQb+Az4OZa3oWWdotHZNehwjG79IbLEEAZl9V5cMEakPEWhVac4fusj/FXalFQ3sJ57uC93uiirl+Fcw6GyaaA2+JwkgFq9UkfLEuqPx0wn+5ZbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZ6kbIYt; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZ6kbIYt"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso4599058276.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 02:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708338194; x=1708942994; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P1ZbvUj4g/1dmV9lTG+hpiBDBBa56SEI8So/qgiUsAU=;
        b=kZ6kbIYttBRbtKi6cPWzdZ7AOKnsKuiU+45xK5OibNJaM8rvdWGITOMrZ5JLM2Cf+E
         79AmBdWjmPNqB1wIYLYRJIuyW0O7mrPHqZXYTq/x/MJ3jzzrCK+drSD4OIAD7HIL/1NL
         nwr4iQwIi8NTHnMb+L065r2LJTqK9zpy0/v35hqV6g1xOVCoM8Emhx7fBL0cRJ/L7xo5
         dzUJCzJ5oT72zQaNm2f7go6xPfXiN7WiUedol08PSU7gGPkaer9dF09/u5Px+OFukkkV
         3XtBf8k+zzfzvV3Xa813+x2AQHqjgMlDRWORJ1NpoEK4RaVVgA8YKwu3w7IgzCRB28uS
         t8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708338194; x=1708942994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1ZbvUj4g/1dmV9lTG+hpiBDBBa56SEI8So/qgiUsAU=;
        b=XeD0gInHguTMTwkd7SDJA88Sni89IxL92GwbVn02N8uwJrGidHKtFfthRWMrXlk3G9
         lmabPvAezLUCMS7R8KGkOWPPa2NZdJnsWGiMCPQjL12l8yJbaka9yZ51108BfOv5gPUB
         2gP49tyIDMUILoj9Qy1Lzt+IPKw6sFaS0OOeJlyMXywRftDYUJfQgZl3LXprBZqjKKk5
         LOutYXciY4D92S6DSfDjeHsxQLO7pXgu/iuRktCtfprmcjwItXZSwst2KljmP2Z5owuR
         +80IHJthx2XFEoZD+vCzDpN3BLa/fpFJf6EhAEDW2RocL4ojDvHwGB0rvK/ZTOayt+js
         bhYw==
X-Forwarded-Encrypted: i=1; AJvYcCWSPmeCE+RIPCWEBkjXpldlGQ6NG+g4XW/qAq8MNbDujJliOktRddOiZXu0+8qBtj7k2mHotXmdLte9/e9Ny7O8/RT4aTTmfPyM
X-Gm-Message-State: AOJu0YxeBNWrF4HhFdxf1kcjJvgAmXXcWaW3S1ftI+J7nfMDIVNA0Vfg
	/7HF9hUlHnfPRUt/u5Edpkrhi85xgV+FuEDqU80h6BmDRHVv5BGgmFpYOkM1I5GQ1QgIf7/FJH3
	iNDfi4Hhh7ZtwrFc61/w6f0j1KqjSLtaAcXFj6A==
X-Google-Smtp-Source: AGHT+IH5oIcfK+pzIlzufb2Y2g0Srso+To9j4nOMGd/Wz87mtK+W4F/PAtewgD0Ixr6xM+851B8U0nnEnWifG9DTxEk=
X-Received: by 2002:a25:a348:0:b0:dcd:3663:b5e5 with SMTP id
 d66-20020a25a348000000b00dcd3663b5e5mr9035958ybi.25.1708338194451; Mon, 19
 Feb 2024 02:23:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122-ipq5332-nsscc-v4-0-19fa30019770@quicinc.com>
 <20240122-ipq5332-nsscc-v4-2-19fa30019770@quicinc.com> <7a69a68d-44c2-4589-b286-466d2f2a0809@lunn.ch>
 <11fda059-3d8d-4030-922a-8fef16349a65@quicinc.com> <17e2400e-6881-4e9e-90c2-9c4f77a0d41d@lunn.ch>
 <8c9ee34c-a97b-4acf-a093-9ac2afc28d0e@quicinc.com> <CAA8EJppe6aNf2WJ5BvaX8SPTbuaEwzRm74F8QKyFtbmnGQt=1w@mail.gmail.com>
 <74f585c2-d220-4324-96eb-1a945fef9608@quicinc.com> <CAA8EJppuNRB9fhjimg4SUR2PydX7-KLWSb9H-nC-oSMYVOME-Q@mail.gmail.com>
 <d518dbc1-41aa-46f9-b549-c95a33b06ee0@quicinc.com>
In-Reply-To: <d518dbc1-41aa-46f9-b549-c95a33b06ee0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 12:23:03 +0200
Message-ID: <CAA8EJppP_bAPRH7Upnq8dO7__xQPOJ6F_Lc-fpRAcutKKzk0eA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: qcom: ipq5332: enable few nssnoc clocks in
 driver probe
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Feb 2024 at 06:29, Kathiravan Thirumoorthy
<quic_kathirav@quicinc.com> wrote:
>
>
>
> On 2/17/2024 10:15 PM, Dmitry Baryshkov wrote:
> > On Sat, 17 Feb 2024 at 17:45, Kathiravan Thirumoorthy
> > <quic_kathirav@quicinc.com> wrote:
> >>
> >>
> >> <snip>
> >>
> >>>> Reason being, to access the NSSCC clocks, these GCC clocks
> >>>> (gcc_snoc_nssnoc_clk, gcc_snoc_nssnoc_1_clk, gcc_nssnoc_nsscc_clk)
> >>>> should be turned ON. But CCF disables these clocks as well due to the
> >>>> lack of consumer.
> >>>
> >>> This means that NSSCC is also a consumer of those clocks. Please fix
> >>> both DT and nsscc driver to handle NSSNOC clocks.
> >>
> >>
> >> Thanks Dmitry. I shall include these clocks in the NSSCC DT node and
> >> enable the same in the NSSCC driver probe.
> >
> > Or use them through pm_clk. This might be better, as the system
> > doesn't need these clocks if NSSCC is suspended.
>
>
> IPQ53XX SoC doesn't support the PM(suspend / resume) functionality, so
> that, can I enable these clocks in NSSCC driver probe itself?

There is a difference between PM (suspend/resume) and runtime PM.


-- 
With best wishes
Dmitry
