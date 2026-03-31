Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C9D3DC4C7
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 11:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956855; cv=pass; b=Oe60g7h7491iC1XJiGPnM2IWbyzQsPf5DgqoglX8UOckX674Vy1VBhMc0kSorzVyFf4vZy2ncuCg+NgpHPd3K94uw7onoZhYp0xXYYeQB/I5Uz+U0DGX8JHZfL1u3BUMQmrk09xXYA07NIgkb529Jn4er2Xvb+7DFgZKAwGUa/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956855; c=relaxed/simple;
	bh=fvcDsk+Dh9LbyHECz4bnznmrSq+OdCpbbeM5YLbTkds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWxmycp4KkqszM/N8SQPNB+9X3tkjCFynZCU+caumrpTC8Vviq19YnJma9j/hIa2kW54uTA4+R35PCbDWAUm3N+hZMHAs1f/C7+L5CUm2h4d3k1QQmsYNYgiJEUobszHcEm/0zlVZztBNb3thpoei/7zXLgUfC9tFd9XXYkAAHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KeDrD7/y; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KeDrD7/y"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a27b5ad832so6397317e87.2
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 04:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774956852; cv=none;
        d=google.com; s=arc-20240605;
        b=G63sGOZtO2iyD0oH/LzyuZG8bk4w0hWywQmd2SmNwE3nH+l3iraK1MJT9PHtZkTA4N
         hwm/Iv3uBjtgj5lYma1it2PcXiywgnamMluTkaWrh3+0c6MeLHQ9rJKiVjjNtmKCkOUM
         TtlchkkNE9aLiUoZHhIyLJgPSzYQPibrMAF88vFnpnjWmBovIkJ6E1WMAm4unfJ5ys7E
         2k3cYK4mEPAdAoxwHT8K4JUi/451LJZpB19EsCLaxAmcCyGHyXbIkJrpe+AcARjn2uMY
         WVK7Hmx03dl6mLDyEFKNc8Tw/d/RnvOhJjkxJ0zXYcbrjVbsNXE6/Jm6CeJ3sjHNHoUE
         6gOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        fh=reKKXgDS+1BOcLjl2gfW5KFL/cWy7UyW/Z1W8arjQ6w=;
        b=Br03bl8ujYwU1YJzz3B8PKkBD6Zee+yqYpCIhRFGHrqOBhkO5eQsp9x6/ykt+f15kG
         3pp1kSQtf3ucPkNHK8BoUE1sEHCukuIv5+EdwD7em98Cl8beOWmxzsRrzTzCWcXu4uam
         Z00akIC1y0bTyVMGTqWTZGbqwNphDcUMmin89zdCovuZOkD8s1hoCPAKmTdWngaXFcbe
         uYaqrRx259Bn57hgJo+fJ5nIN3K5AfXc70UMJuVAF7tGNYaQqZiFHtDxx1f6H9sOThUP
         pUC2vk8yeD89WpS2EmlI99F8NkzRwLFTFSZe4uD05QAFoUlPQfQ39Bp2ZLd4cZqYX8kW
         dVDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774956852; x=1775561652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        b=KeDrD7/yI3/16ZEeMyZnj78MqSBCa/eNWnPEkeAYhLevO8maetOMhmPI1inSAE0K+j
         PE/CmpJAsbIIGb6mD5jZXCXs6onFAfWtTNpG1XB4E6Db/ppDhoIR0KNIvqC9HW81QAaP
         rJjsi6XhRTS3+eCW0VXhjIK/bj7BEg7wYhkeegw3eu3FNMYiiAKDxpxSFUQwiSRcS6ei
         XfyqZeCSDDVGL9/5nUN81RQpi96adVxov9hulCN/b4xQm2nhzhbE+/jqcXZ5xmEBKXBC
         msWwnM1xSSv53465TfU0cJMV3IutPU1jtY9DKfI1QcygSd2ODudvJc7RIFJ6PEDG8zPR
         bWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956852; x=1775561652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        b=kYscQ0OEj8ZhX9qIRh4/6jhUpqdg5fGanSNjd7Ibt3O2ErJ5tmsTp7PZzX3r06tGUa
         G5HfnHNy6HZ4xTxS9AEscaS0XRxLSv4VndcRDQBXIeohPmeIWaaAzHttfB6vh7Ep8y57
         Qine4e/2KjZMs9i7NtLiphqXuXPa7ig4TbdXFtvKuoqbGOiglG9yy9ZrUa2UGPUHT6JL
         VAaLjIsNSWkuuhkxkoGu2DPTpgBnFagz2X6L8IhoQugBmlG7PvZGoG8aKwprezT+bBi5
         8LBF5gUXwZZXnXaX2cT2z3C5lR2XR+742ZHOJzSdEV2J4ccnBHuEE95x0ejH/i+8sQKi
         n2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXEdwuqOXTARPLN2D+EJ8DBvoF8bGN3lltUDKEJxgxBMB+T1UsNenxQNEy6KoI3e0Q/NGXA9ozvmPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+eztd+KhDH7EzC4kcpIUihyKwbwKveSy+YgNjpwiZ2VdZvnXs
	h5gDpsdKHONk3YjXU+3yhyRxdzJdL3lSNPXbI6t4oCpqnqm9wTTtjVSaH1Fd36sGbr1Frz23f5+
	PBzffoRVBjRYhWgG9onL8Gf96hc4RPMG04qWY1hOw2g==
X-Gm-Gg: ATEYQzwj/WHQT2JrQGMVGdB8PSIYorttn8L3/t8i3WYtvo5/vo3XQBdgVYGeKMUvyuW
	tOAxDRs7ENYAB7zJmlyPCCNIMkKrF/Lqvtx+TGU2rhQDQ+K1tGslvR90i9pQ/4oEhNXPQQ1xHYr
	wYBYvnPMUfzlERXQg5I0p+OfAE5VdGcPfqp8SiqViW+Ez/9ip57lp9nwUiC2apLPnB7Tx70dH/P
	xsJFakpfGECbrTCQ4cjI9d/E/drAfUJRTZCamkdhk1AwyS1n6B5F/jDu/VTGnePWchjrx8PF4rE
	USWA3FhWJEV94n0GWXA=
X-Received: by 2002:a05:6512:31d6:b0:5a2:bda5:c4a3 with SMTP id
 2adb3069b0e04-5a2bda5c5cfmr730600e87.11.1774956851831; Tue, 31 Mar 2026
 04:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
In-Reply-To: <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 13:33:35 +0200
X-Gm-Features: AQROBzB4ctl2c0yLSalbIIkWrD6Zd2w8t9cdNUGWWq81ZnkBTRFdQQbrOgG2lXI
Message-ID: <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
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

On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
<dikshita.agarwal@oss.qualcomm.com> wrote:
>
>
>
> On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> >>> On SM8250 most of the video clocks are powered by the MMCX domain, wh=
ile
> >>> the PLL is powered on by the MX domain. Extend the driver to support
> >>> scaling both power domains, while keeping compatibility with the
> >>> existing DTs, which define only the MX domain.
> >>>
> >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM825=
0 SoC")
> >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
> >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/=
drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> index df8e6bf9430e..aa71f7f53ee3 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[]=
 =3D {
> >>>
> >>>  static const char * const sm8250_pmdomain_table[] =3D { "venus", "vc=
odec0" };
> >>>
> >>> -static const char * const sm8250_opp_pd_table[] =3D { "mx" };
> >>> +static const char * const sm8250_opp_pd_table[] =3D { "mx", "mmcx" }=
;
> >>>
> >>>  static const struct platform_clk_data sm8250_clk_table[] =3D {
> >>>     {IRIS_AXI_CLK,  "iface"        },
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/=
media/platform/qcom/iris/iris_probe.c
> >>> index 7b612ad37e4f..74ec81e3d622 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_cor=
e *core)
> >>>             return ret;
> >>>
> >>>     ret =3D  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,=
 &core->opp_pmdomain_tbl);
> >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> >>> +   if (ret =3D=3D -ENODEV &&
> >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venu=
s")) {
> >>> +           iris_opp_pd_data.num_pd_names--;
> >>> +           ret =3D devm_pm_domain_attach_list(core->dev, &iris_opp_p=
d_data,
> >>> +                                            &core->opp_pmdomain_tbl)=
;
> >>> +   }
> >>>     if (ret < 0)
> >>>             return ret;
> >>>
> >>>
> >>
> >> Hitting below compilation error on latest kernel
> >>
> >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> >> =E2=80=98iris_init_power_domains=E2=80=99:
> >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement =
of
> >> read-only member =E2=80=98num_pd_names=E2=80=99
> >>    71 |                 iris_opp_pd_data.num_pd_names--;
> >
> > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > dev_pm_domain_attach_data")

The intent was for this patch to be part of v7.0-rc1, but I failed
with my pull-request to Linus.

Instead this will be part of v7.1-rc1, assuming everything goes as expected=
.

Is it possible to drop/defer these changes until v7.2?

Kind regards
Uffe
