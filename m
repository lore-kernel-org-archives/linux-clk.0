Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C52E17C64
	for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706089034; cv=none; b=qZFKI0oQKAJfOz/2cM/4BM9ywx/Q037H/TvM6Hgu0X8DYeHNUtI2PYe5t1MwVzXswDyE+xiNj8dJbQWRVlsrXlmGWIjpco7DQAk7VFffhLG4+49eoPmNLbMqmb2oFKy984i4GS4Lqj6E1c3Bus2WjojUDQVOukYvri2btuy+3/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706089034; c=relaxed/simple;
	bh=74BWexleDslxfO8dBlyWk0s685w8ANxALGN8/XQG83I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tx670CU6TLjUR9N20T2s05xUb1c3dNMdPm/4k0WjTN4BW2gEzSgYawIv1+VOOawzyyoEE4EK0HZzgznETW1YjdhS4XPBinfsB6UVyjaLRAHREg4208sK15PIwkBKc4d+JGLHRlCnv1WzD/uthefd3eWp81kb5iSows75hVxAZJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPc9CxS/; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPc9CxS/"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db3fa47c2f7so4677503276.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 01:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706089030; x=1706693830; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fjTkP4swBLhsq4eHueJE3frRRhl3hp33MPQ2ujsHep0=;
        b=tPc9CxS/FVdrHJ3xE8EdLvWCS7t7ImmzFonViPj0AMbOhzkvPI80t4SfFAZ8hVFarw
         VFYw1iFX7DkMJnElpco/griLzK9WUdNgwlJDM2M2yUHwmAGNqaPk8QYQ/lPY2MWGOBNb
         dh1K38Md5I0q0Jyahv7Z4juULSLfnh9DBNfuXShWLiguDxHgpsrWbS8u27sR8zZNxgZi
         xFojpYlQ4zNv1FcKtRvXfftE0HUssva0cHyF1omppjSwtaTcx250AsdZdoDMCGaQ8+lm
         qdAOhWWMhRR44vmo3QlbLGDpyo+Ks+TVlppBvMR1/trCVOnUYuLsZguPFDDenvzmo2HG
         mq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706089030; x=1706693830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjTkP4swBLhsq4eHueJE3frRRhl3hp33MPQ2ujsHep0=;
        b=fJl0HllB5DTziah9bRLWPfCXajisoF6sAVtkDR4G1jd2WwqASVeGYfsmOlfsQcrq1T
         sYwGSxOzpf+5briq85+8eeZZqWk8cPyUh+F9wKh2MzdZv+g8NhrLKW3TWc/ZYdW37tGr
         /svGwwdDyC7ScfF8nI1xNU4isRCZePQcXQahPKuokwjZ2WF7D+8IHxPjHRumbweNM4AI
         38s+ggCkr1LztvKWs85u594q7rBZN7E7XI2LRL5X1UqvKcy6v9Yk6QBS5y5VxI8nOXt9
         aZQCZsx2c5VapUsduLmfdoeEuoM3AgHvdxEHVkBoWmdKULY/TAY6v2pl+ofkMlbnJtPe
         Q0tQ==
X-Gm-Message-State: AOJu0Ywr63bsUPGsSj5sbzbSR0wokXutLPuxyOe6wWf0EyaDAuyT1Dn0
	JiFDtNc+0218Dk8IA6AWiZg+IChB3gKasl/wr0AG9NF6f8jUD2Sj8qKIxxh9uW4ZccIZFz9JhBs
	/pUcSOf5Ir2VlI3OCC0V5u5TJhDdaUo0rqdu/mA==
X-Google-Smtp-Source: AGHT+IGT7Dr1XKf8oGzZ8XM4SENIhbeOtwx/oY4M9y0kQODmrWEYweT1gCGW8TLEagGIsnlvrnQeqUNU36VT6v2c8ss=
X-Received: by 2002:a25:bccb:0:b0:dc2:2edf:ffe5 with SMTP id
 l11-20020a25bccb000000b00dc22edfffe5mr366125ybm.97.1706089030395; Wed, 24 Jan
 2024 01:37:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123-sa8295p-gpu-v3-0-d5b4474c8f33@quicinc.com> <20240123-sa8295p-gpu-v3-4-d5b4474c8f33@quicinc.com>
In-Reply-To: <20240123-sa8295p-gpu-v3-4-d5b4474c8f33@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 24 Jan 2024 10:36:34 +0100
Message-ID: <CAPDyKFqre9Y0XOn5Xig3zbiqR0FQJ+cvK0VXMZRbtt0NsSE4+w@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] soc: qcom: rpmhpd: Drop SA8540P gfx.lvl
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jan 2024 at 05:25, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On SA8295P and SA8540P gfx.lvl is not provdied by rpmh, but rather is
> handled by an external regulator (max20411). Drop gfx.lvl from the list
> of power-domains exposed on this platform.
>
> Fixes: f68f1cb3437d ("soc: qcom: rpmhpd: add sc8280xp & sa8540p rpmh power-domains")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

I assume you are picking this via your tree? If not, please tell me if I should.

Before applying, please amend the prefix of commit message header to
be "pmdomain: ..."

Kind regards
Uffe

> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 3078896b1300..27a73ff72614 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -217,7 +217,6 @@ static struct rpmhpd *sa8540p_rpmhpds[] = {
>         [SC8280XP_CX] = &cx,
>         [SC8280XP_CX_AO] = &cx_ao,
>         [SC8280XP_EBI] = &ebi,
> -       [SC8280XP_GFX] = &gfx,
>         [SC8280XP_LCX] = &lcx,
>         [SC8280XP_LMX] = &lmx,
>         [SC8280XP_MMCX] = &mmcx,
>
> --
> 2.25.1
>
