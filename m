Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B658F1465B1
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 22:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720649443; cv=none; b=erKLJEsY4tRPIwOKWf0OACalCEWWQQsyYoNfUr1Kk6c1oD2+VI3WoxzSmwpGBQfJYVy1LCtOe+JVfULYT41bZ9fJH2sctDTMsxtc7RCv+3PFAdk+d2CS9hdq+x7ZQVCMjaPufRVpEnl+AoJQiNoRKy4FSrKdUjvIqFmkkVm10DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720649443; c=relaxed/simple;
	bh=QSjudhWjMHfYwAzqj8EyrEeW6mzfRI1kgAT7G1vdLmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ao9wYPAmXc/88srZgFepU/XOx40nGFJ81jhMYlCzYSnomUSwW9PxhoUTGS467l6odR8H9Rk6hFbhpLyc40IlkeHopKnnOxtm17Xktap/fblCX6rEPv6BFKDa0zCia8Pyu6sVoSmEdxzOWXvpRXaOnuxR0q61yTSdewZqxv1M7pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yl6FgUvE; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yl6FgUvE"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e057ae1adbeso144775276.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 15:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720649441; x=1721254241; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ox3wZ5g8bv9fqPTyD5GfHZ00QVFUls5piDZiFLdQ1k=;
        b=yl6FgUvEMJfy6AUNwwgvM0HeQTK1mhABzcA9vuB2s6lFpH7v/kYJ7n0hYAU4e1u2wi
         V+MXs/FHicf9jtmHCupRlpCL8rFFzsktj2Fu/U0KuMEfcrYrUzJjltSGkjqUYSCIWbqA
         DFn03VjIDEOTnCbejnJRi2H7pdsi9yIADfQIuXU+rT1K2TbaXsfzoDosvnlMBsXVx2II
         OjGHdNG6yob+wEXoOYxJmEGjROwhUNUPhXeziXuA85PLjoI8aHehQlyIxC/ZFBJaVOsW
         QHfWZLc6R/eKemGHhhbiZfM3WY5tfz94WHn8Ufg11YWNB/9uchZDqdebxaiHEqnk5LPx
         d1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720649441; x=1721254241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ox3wZ5g8bv9fqPTyD5GfHZ00QVFUls5piDZiFLdQ1k=;
        b=Y5VAF3JYiqSZu2NNCUTQhfLZAZEHLiRRMNYUEIiYyLcW7lX8ULN79NvXIKKGkVMcXI
         dSYgI1ImrszCez11LfQrs3vTMZ99Eht7mYRi6UpPBZZdWjQqPa9Eo7+hQ4UMffoHyxWw
         CNxYBfX43P5Qh+ucUgSD9RolG2YkBQPPCfL6OD1RTPnS5KDqgyPvsc53PZllUQCC3a4w
         545z3cAs75a6cgm7Jqe/yyz2+yM8Qackl4a3ShCbi3ONfCxXVMlihSR4ZdepB0t5BzAh
         Xtqxl4PWvqWIZZ8e7brRzlCAjl0NZVhJg82mI3cpVRskeqq4OSBfv8wegk9Ywu6DM3Dc
         H3YA==
X-Forwarded-Encrypted: i=1; AJvYcCVxIIBT22DxHMdjh4PiHrYJS0TrTWD5Vp6D8NQ9gUBHyNcIL1Ac14GGk2oM/9gfv/3MP3PYc5vLQpZ/ZElomjFGkUjXQlAyZDZ9
X-Gm-Message-State: AOJu0Yxm+YO4dQXDLb84ZTk4LQj/mAZvDNi+JZBTUekngUfRsxrZyITE
	TRsyiX/Sxs7ggul/rQO2V5eMYnBU/JGSUBZzmw42wy05nbPnSiLeRWUGHzFdG4vxzqk3YCNQVQa
	aveqaSHEVwg6ZVOPLz0D0QuJxvl/1i8LvQaOBzg==
X-Google-Smtp-Source: AGHT+IG0R5rzOV7flXxv6z3tSdIvsh4oviHpRGXOo1mdeRmN1wkXxXA08BN2y+b7jDF2NxFpUF/ZmeV0mPTMfy3ddQ4=
X-Received: by 2002:a0d:c885:0:b0:62c:f782:ee1e with SMTP id
 00721157ae682-65ca1c27372mr9042047b3.11.1720649440675; Wed, 10 Jul 2024
 15:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-5-4baf54ec7333@quicinc.com>
 <xbe7kmaxhfwy26qzxrmwgiijaaiap4kdkruaxjs6ymihaw5taf@hvj57wyncfea> <cc1957af-17bc-cd71-e6da-013e3a740014@quicinc.com>
In-Reply-To: <cc1957af-17bc-cd71-e6da-013e3a740014@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jul 2024 01:10:29 +0300
Message-ID: <CAA8EJpqmJZJfd2famarx-FKFb1_+-nZM3N+FwK_hiOurG8n9=A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] clk: qcom: Add camera clock controller driver for SM8150
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2024 at 13:53, Satya Priya Kakitapalli (Temp)
<quic_skakitap@quicinc.com> wrote:
>
>
> On 7/3/2024 3:50 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 02, 2024 at 09:20:43PM GMT, Satya Priya Kakitapalli wrote:
> >> Add support for the camera clock controller for camera clients
> >> to be able to request for camcc clocks on SM8150 platform.
> >>
> >> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> >> ---
> >>   drivers/clk/qcom/Kconfig        |    9 +
> >>   drivers/clk/qcom/Makefile       |    1 +
> >>   drivers/clk/qcom/camcc-sm8150.c | 2159 +++++++++++++++++++++++++++++++++++++++
> >>   3 files changed, 2169 insertions(+)
> > The patch mostly LGTM, several quesitons:
> >
> > - There are no cam_cc_sleep_clk and no cam_cc_xo_clk_src. Why?
>
>
> These are not required for camcc sm8150 hence not modelled.
>
>
> > - Why is cam_cc_gdsc_clk not modelled in the clock framework?
>
>
> This clock is kept enabled from probe, hence not required to be modelled
> explicitly.

Yes, I'm asking why it's kept up enabled from probe rather than via
clock framework?

> > - I see that most if not all RCG clocks use rcg2_shared ops instead of
> >    using simple rcg2 ops, could you please clarify that?
>
>
> As per the HW design recommendation, RCG needs to be parked at a safe
> clock source(XO) in the disable path, shared_ops is used to achieve the
> same.

Does it apply to SM8150? For example, on SM8250 RCG2s are not parked.

>
>
> > - RETAIN_FF_ENABLE has been used for GDSCs for sc7280, sc8280xp, sm8550,
> >    sm8650 and x1e8 platforms. Should it really be set for sm8150? If so,
> >    should it also be added to other camcc drivers (if so, for which
> >    platforms)?
>
>
> I have rechecked this in downstream and seems it is not really needed
> for sm8150, I'll drop in next post.
>


-- 
With best wishes
Dmitry
