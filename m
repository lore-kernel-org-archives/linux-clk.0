Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DC014E2FD
	for <linux-clk@vger.kernel.org>; Sun,  1 Sep 2024 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725187789; cv=none; b=sm1FcgYEu1fBA7DdEeZ2zNNY3uKkSdpPcE5xtLhRxK3gRb3d/QJ5NRC52CixU0p1KxXn7HKpW2xB2yT/0VoHqDIgSFaTcgPzUbFbc3o3oSjTZLFxXDX03INs9/iHEdXRcQkFz833pcoj6deP0nuMEetw2YS7xb8422IFUdXGrWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725187789; c=relaxed/simple;
	bh=4nwnklqqvsAc7MlMb9SGAUN0SLGRpyLpiVNTSWhiEsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+SB+OAxcOVtpR3OqY/96fFyo1lM/RmHBQNAghZkHiX4BTOAUfn9aTo1N29SAOuSIOzhDED5LE3SL02D/Se27MJRngWskzNpPcdqFN+bJKwumYj88D64qVdSP5VQ05FTyjQRmNj0DAWCFQeUwLlFgtBeXifpHj+Xdbg5qDyRiak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=UK7WbqZg; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="UK7WbqZg"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c218866849so3464868a12.0
        for <linux-clk@vger.kernel.org>; Sun, 01 Sep 2024 03:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1725187786; x=1725792586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhlOtzk6ka1oIdqe+onUSXvd3zsuH7hAUMYt+5lHzME=;
        b=UK7WbqZg6gjbhMMQDiu64lCfR1lupvljoKXesMQIP9yiqm+EWGqK0sI8ByX9CeZvgS
         /yIstKVWglrOOkWGJHqVf9glVv4TKBxxxZk3JqeRtaJUWrcto5pYZXZFvGFwj/O7NZJv
         qjaVqWcDO7xfBoj180Z72xc4Wog8xhqhTkmiTrs7Ly4kFHUw5twKBria7FQg18W3m8im
         4PUooQgHpbe+a84sUgXC2m7nC8F15ZnI/pTcEsC7gwnBxqhezJhpEyDeVUMPWVpBoGk6
         Uo3/j+3h7K1Yg5ddQVjtMet+qFIkaVYxTijan/04yM9Y6BitnJdkfneF0EPRumjflnfF
         ZIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725187786; x=1725792586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhlOtzk6ka1oIdqe+onUSXvd3zsuH7hAUMYt+5lHzME=;
        b=hwi7DOwQjLfiF8DexSyf+hz2WcPcStyCuoFeAYoQ/zVXdGrblx23mAkI6TI6HNm2ml
         Zw/vesDGj3NLdmoCZcDQDCgzu8Ssh6LORSWtFwjGt8kh7Wjn18+rX6Mo86jmsYg+0c9q
         Dvh1LImlroHBsfteOkQ+r4kyj5u1xdjF+c1X0yJbyaX/4bW0LUtf9CrmV1mX1OiXBoWI
         IVjvYmFmIr1AlzHWUok9xgAP0ZaQLiytMUexPGhRdnstWUD2xv5CKpyRIAEgzpRetszu
         9CYtWy5g6qXBr26C0sfMc1SqyGfphYX2slvAi+8A6rSBnsECa6sIXC6cEU9QEqZuVBMK
         50RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZN/nxbxKVLCzQPK6iMqHEjmV8Mywg6icsNztYNGQlp3FjsjG+zRcVneso9Jc895pJwJDKdpTvZqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpQ9+iCX9RusNaL/gWwMOBjjv4aakRr0IWtFhm8aX/RoRfCmyG
	yC4pAHnkdVwbOCZk+/11o6srsGymzdXZpALRhtGmuPT1dwmwLiJ0cgR0fyGJuhoPZQi5oCLJ4Fr
	uoHzg0Mh1W63oOelypAPtyyc4AgITZ6jg7773wg==
X-Google-Smtp-Source: AGHT+IFwKp0NUUT00gkpVQ/Lgb5F42y9K4+DR9h8gGYvnQkPv2xwPRh8qm1SYQIv+iTl5XbdqKQgRJgi5DX3dMDLWss=
X-Received: by 2002:a05:6402:1e8c:b0:5c1:6abb:423c with SMTP id
 4fb4d7f45d1cf-5c242350df7mr2935480a12.2.1725187785486; Sun, 01 Sep 2024
 03:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240901093024.18841-1-johan+linaro@kernel.org>
In-Reply-To: <20240901093024.18841-1-johan+linaro@kernel.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Sun, 1 Sep 2024 05:49:33 -0500
Message-ID: <CAKXuJqgZhyyAP2vpSnyygcC0k+BzXU+Gq-O5NnFRWWebfSLD5Q@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: videocc-sm8350: use HW_CTRL_TRIGGER for vcodec GDSCs
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Sun, Sep 1, 2024 at 4:31=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> A recent change in the venus driver results in a stuck clock on the
> Lenovo ThinkPad X13s, for example, when streaming video in firefox:
>
>         video_cc_mvs0_clk status stuck at 'off'
>         WARNING: CPU: 6 PID: 2885 at drivers/clk/qcom/clk-branch.c:87 clk=
_branch_wait+0x144/0x15c
>         ...
>         Call trace:
>          clk_branch_wait+0x144/0x15c
>          clk_branch2_enable+0x30/0x40
>          clk_core_enable+0xd8/0x29c
>          clk_enable+0x2c/0x4c
>          vcodec_clks_enable.isra.0+0x94/0xd8 [venus_core]
>          coreid_power_v4+0x464/0x628 [venus_core]
>          vdec_start_streaming+0xc4/0x510 [venus_dec]
>          vb2_start_streaming+0x6c/0x180 [videobuf2_common]
>          vb2_core_streamon+0x120/0x1dc [videobuf2_common]
>          vb2_streamon+0x1c/0x6c [videobuf2_v4l2]
>          v4l2_m2m_ioctl_streamon+0x30/0x80 [v4l2_mem2mem]
>          v4l_streamon+0x24/0x30 [videodev]
>
> using the out-of-tree sm8350/sc8280xp venus support. [1]
>
> Update also the sm8350/sc8280xp GDSC definitions so that the hw control
> mode can be changed at runtime as the venus driver now requires.
>
> Fixes: ec9a652e5149 ("venus: pm_helpers: Use dev_pm_genpd_set_hwmode to s=
witch GDSC mode on V6")
> Link: https://lore.kernel.org/lkml/20230731-topic-8280_venus-v1-0-8c8bbe1=
983a5@linaro.org/ # [1]
> Cc: Jagadeesh Kona <quic_jkona@quicinc.com>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/clk/qcom/videocc-sm8350.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc=
-sm8350.c
> index 5bd6fe3e1298..874d4da95ff8 100644
> --- a/drivers/clk/qcom/videocc-sm8350.c
> +++ b/drivers/clk/qcom/videocc-sm8350.c
> @@ -452,7 +452,7 @@ static struct gdsc mvs0_gdsc =3D {
>         .pd =3D {
>                 .name =3D "mvs0_gdsc",
>         },
> -       .flags =3D HW_CTRL | RETAIN_FF_ENABLE,
> +       .flags =3D HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
>         .pwrsts =3D PWRSTS_OFF_ON,
>  };
>
> @@ -461,7 +461,7 @@ static struct gdsc mvs1_gdsc =3D {
>         .pd =3D {
>                 .name =3D "mvs1_gdsc",
>         },
> -       .flags =3D HW_CTRL | RETAIN_FF_ENABLE,
> +       .flags =3D HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
>         .pwrsts =3D PWRSTS_OFF_ON,
>  };
>
> --
> 2.44.2
>
>
Being as I saw this as well locally, I've now tested with this patch
on top of 6.11-rc6 and can confirm that I don't see the splat anymore.
Tested-by: Steev Klimaszewski <steev@kali.org>
