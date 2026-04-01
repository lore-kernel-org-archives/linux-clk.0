Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517323B584A
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 10:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040404; cv=pass; b=N/gxCVe9kk7K4Ynec9wilTeWqCUduoEc8l63SHRWvEQTBs5plJn7331zJZETiamNf/yczni6RfZ7yzl2OW+GGGPd83xBfPtPDm87LmCjpjcEZjXgWjZYECl8Yz6V47pT60Mj6hjk5AwsH5wloKx6fwIlyPp4tN+8PBOuqcMX5T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040404; c=relaxed/simple;
	bh=40aqi1I55Vmq2m60iYFNVNuV+Shkhm9O7nHBPNLlR0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBvyGkiPQQH957BRNGM3PO5HkCv4+88qt6jc5s3dr2cv8bXgaOy+63yBIt9/kCbNhCEIyBDAKQNXBC5zZsXdWzh+IIyqHPH41piosSD679InyVeL0YOQ4BVJh1VtfGrzaSUy3wn9h1ODxqLf5U6POue+/qGoLcF2rR2dLU4s3qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tDwU2Klc; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tDwU2Klc"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2beddab48so1693515e87.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 03:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775040399; cv=none;
        d=google.com; s=arc-20240605;
        b=OE2u60MMNPUVUZ+2wy+KO0iiWpxiI1Fli0+nJeF7k2R5vHJ8yw0dZFqIYIxMxaWwlV
         LfCmOw/tThEi+NgWG1NIBr7arJ+kr3Ot+kY9AO51b3JJMfj976p4LWJNf5LNO4E59+2G
         6pkR2coyasT4wi7EGMQHHjLjxk//luoJgGkQCIt//IRVGNTTcU9MI5qwThZdhyeSp1Mb
         s5jaQIRr5nznnGhtlBFYUqtO/gSGv9fAo084qC+LiXXmmJpLfcMZxgvU8+fGm98fEQZE
         OV0aLLrrBpkWiErFMJq33dQPVOk4hRKxnq2dfkxEnYPbBNw4F3I105STx6fr+kyNVsmk
         BqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        fh=zHLqOQMRXSIo4t5mIce3kUzJqiXAkJhuxuu5jovOLZk=;
        b=XtmHHAcysj2isShks2XrtN+sLcMgxEiP/87oUwBC9TUUodM+n3l+LcyHUuXm47CIpp
         Y7Yv4PXZ5qGY+JCKLAfOLzV2Y2HUtKvUtXtH655I29o9wVTrhPJhrEgCrMw1wx5Q4DqO
         8Q3V02s/6zvyCw39XU71XG7QLIfc72XPKQz7rnWh0hPqePeNP0jIY9BRG6xlDR1gcUB6
         a0l1XInQofEYiAbnmUpVON/T6rJzjmax2XW+Kn9oAux9yXa413LXgrhqTHY6ZzgmhOvI
         DsOthqDIYknYf+EX6C3RWJW0lZwhA40VaYi7+kPfkFfpGsZ3BRU20COafQ9qfoAUwiV/
         zLpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775040399; x=1775645199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        b=tDwU2Klczjeswt3JZOCJdAb4ppUU2FgHlJ3G8BN7cg1KQVAdn8a6RGAiZTad8Hj54h
         UshE8EO1u/xawob2C5zy8Bns+lqRft06+8xCcPLqbaw1lVCV1/38ueWYgccdVbcO2Jrb
         02xfL1tmcjm/kTVLRs/CHFYI2hjYs2BWsG9ROLJ1lCkhgFUt1l6ut3xDUPOBSNs4NVWa
         tz7kR/7Uh5w67D7fMVwzGKw/+RsQnycPoGfA/ocd2cJtPAwDCEEap94XRR8JN5hTmeaP
         nlRW/a2qEEvcZ410a84IJiFDu2QhZPc7Q6ECyo5Akaq1Vg6zpqwR+KggJKkhFNNdA7qr
         U5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775040399; x=1775645199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        b=n6cgKkoQkvDIcxRfmT72YS9nQSDFlj1j4RT95VeDrXBJXY6AbpKNUBzqMakcX392h8
         ZYfRDdDas1lvDehVJfpeGO6V7gXWiYObGB/fEgd9HL70T08RmCpmvMx8Pnonds4FewIT
         /JU/6JoR06r+68MdWQsDxk1D8oPhF8ANyQa61Rj8if+hkIjwpUOMnC2rq0ZC0vWfHu2r
         WLQ+CizHVWDthosUGuIpf51J5G+CQ37bGbm/YqaRpfBATbfCv01HCmiGl3pV7T3FlLCJ
         z2uUeMXJQ8+OHHNp0AKnQ++eNXGc4rxLV3MRLyqHu8BO2BfTmickig+oAf0z7RhxdVwJ
         wnAw==
X-Forwarded-Encrypted: i=1; AJvYcCVy5KcoyPIcHH2TSqJyYB+GXJPg9DgclsgTEsx/ZVA1FJuXYGv0LOBcakoLSz7C27JTluEdKzyAZm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYwyecAo7qVEEZ1wEzVg7dEsvDYOHCHM85+IgnG8M9RS5L5tD6
	O//5ZQLo9mASfunk7kj1dMzTYoqn3GO1Y6pcKV3/c160s3xVv0v7mICY17eD8bMt3xDfM4BpQkv
	xBfmkM0/UoQYWHbWliYQBQIdMl3z/pQCwVqUhK3WT4w==
X-Gm-Gg: ATEYQzyfPh+IJP29a0kuZcinBBZfso4x5Ffw8fUpnGU7aZ6WXx+YdV2FwO4lamU/i19
	R+1+26oWY1eQ6AQ3A3GW8VzbcJYpqaz9vTHFcVdbf/i3Fctx3iGFg1eRfhePK30Fa5vapXDfLRu
	RraNEKi9j2W2qMQovPl4TnsqVG2/YCIYvYxHt9R9OF9dEUnuOdG5tpf0FDM9lHavTBn6EwK3yDQ
	uv3h/F/JnBX9el9gpnWVnWy7HVOqlS24TpjWNmHvArlZAGG5rSymBMF4/g7Zwz+qm/N6JYkOt19
	ui3neuOH
X-Received: by 2002:a05:6512:1254:b0:5a2:c0b6:729e with SMTP id
 2adb3069b0e04-5a2c1ee82b3mr1132629e87.4.1775040399387; Wed, 01 Apr 2026
 03:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com> <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
In-Reply-To: <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 1 Apr 2026 12:46:01 +0200
X-Gm-Features: AQROBzANxupbHHkAqu8GJiUFFGG603SVUVTYVg4H2FBCM1h61nXzlIOx_SK4W6w
Message-ID: <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 31 Mar 2026 at 20:46, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Mar 31, 2026 at 01:33:35PM +0200, Ulf Hansson wrote:
> > On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
> > <dikshita.agarwal@oss.qualcomm.com> wrote:
> > >
> > >
> > >
> > > On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> > > >>
> > > >>
> > > >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> > > >>> On SM8250 most of the video clocks are powered by the MMCX domain=
, while
> > > >>> the PLL is powered on by the MX domain. Extend the driver to supp=
ort
> > > >>> scaling both power domains, while keeping compatibility with the
> > > >>> existing DTs, which define only the MX domain.
> > > >>>
> > > >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of S=
M8250 SoC")
> > > >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.co=
m>
> > > >>> ---
> > > >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> > > >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 ++++++=
+
> > > >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> > > >>>
> > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.=
c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> index df8e6bf9430e..aa71f7f53ee3 100644
> > > >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_d=
ec[] =3D {
> > > >>>
> > > >>>  static const char * const sm8250_pmdomain_table[] =3D { "venus",=
 "vcodec0" };
> > > >>>
> > > >>> -static const char * const sm8250_opp_pd_table[] =3D { "mx" };
> > > >>> +static const char * const sm8250_opp_pd_table[] =3D { "mx", "mmc=
x" };
> > > >>>
> > > >>>  static const struct platform_clk_data sm8250_clk_table[] =3D {
> > > >>>     {IRIS_AXI_CLK,  "iface"        },
> > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/driv=
ers/media/platform/qcom/iris/iris_probe.c
> > > >>> index 7b612ad37e4f..74ec81e3d622 100644
> > > >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > > >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > > >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris=
_core *core)
> > > >>>             return ret;
> > > >>>
> > > >>>     ret =3D  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_d=
ata, &core->opp_pmdomain_tbl);
> > > >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> > > >>> +   if (ret =3D=3D -ENODEV &&
> > > >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-=
venus")) {
> > > >>> +           iris_opp_pd_data.num_pd_names--;
> > > >>> +           ret =3D devm_pm_domain_attach_list(core->dev, &iris_o=
pp_pd_data,
> > > >>> +                                            &core->opp_pmdomain_=
tbl);
> > > >>> +   }
> > > >>>     if (ret < 0)
> > > >>>             return ret;
> > > >>>
> > > >>>
> > > >>
> > > >> Hitting below compilation error on latest kernel
> > > >>
> > > >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> > > >> =E2=80=98iris_init_power_domains=E2=80=99:
> > > >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrem=
ent of
> > > >> read-only member =E2=80=98num_pd_names=E2=80=99
> > > >>    71 |                 iris_opp_pd_data.num_pd_names--;
> > > >
> > > > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > > > dev_pm_domain_attach_data")
> >
> > The intent was for this patch to be part of v7.0-rc1, but I failed
> > with my pull-request to Linus.
> >
> > Instead this will be part of v7.1-rc1, assuming everything goes as expe=
cted.
> >
> > Is it possible to drop/defer these changes until v7.2?
>
> It would be very sad.

Right.

Since it's my mistake, let me reconsider. If I rebase my branch and
share the necessary commit through an immutable branch that you can
pull in. Would that work for you?

Kind regards
Uffe
