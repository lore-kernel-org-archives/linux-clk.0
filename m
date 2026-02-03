Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F8C1A840A
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770115284; cv=pass; b=tr/ObhyMp63UAIUNPvbqjWiaoroXwflQhLRTmVXLTHyXXAzQrjADeQkQh4IjtW+DazuZHoFIsBhEbcHvqYW9GvIhOVkMHM19pTY2KmCDXDNrXHBkLVrat/6r3elV+miP90B5ewzkFjN8TeZG6izmsDTHBdSLr0UAMATjEDYBB2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770115284; c=relaxed/simple;
	bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdvaOiRN+8TshXPzmLC+XzM2CnI2SLDd0OU4Khtp3a62urqW4tIkjyu+pTHAwW6xe1YsuM81iMzkBt6XxooLdqUG1KKqaXV1zsdwstPzi2Xi9Y5AQyHShsatwrSfJl2ap6AOQ4JF5Vq6b6r/J2Wct+801nwaKcgMj4Z+VAgGZ5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9df9jAd; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9df9jAd"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b834e3d64so5810595e87.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 02:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770115281; cv=none;
        d=google.com; s=arc-20240605;
        b=EJ+XUzyjp8wjaL9CAOS4dfa9nIBl/LS8o0m0yB5ktdqzVoMKB8XVSbxWt55v3ZwZlS
         4n355cNkLLwxwNT/uFoAzsKwAsn6RPn0wuFfLNZBpZsIut0GM2/0G7vDVxKBLO5b+jha
         g5qm/NzjJsIuKPXJNfQ1S6hInmisddjEM5VUwxZQUqA2N3P/p1JSoR+JtFhesRi/oEgF
         DJKVfpLf7newJKyXkQkTrJTORu6S41e/C4cukbhCG8WrJiTnxIL4LHhoNW/N1DdAMhPj
         HBIKMMPazHlVeHsgyH///MZc6kHcUHg98upxtKt0Dsa6UKx+Z78fgPV0wMkusanyTdt8
         /m7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
        fh=8935nbJFo4dNtnvL66RsHw4KJ742e9LaRwSXm4+t+uo=;
        b=Qm/uxqTWLMP6czaB0unhZRU+LAOSdNqwNnEX4T8Q7/iPFweKkDqGQ/vrFrGJZalLGB
         z8DnjpknB0pjDOE2J3vdKKge1G+qbxmvj66/lB/Sgxga8TDfmGuSY9Z6Jg4Y0tS4NLAf
         iRbpdA/31ovaOBJ1DhdphJIjKhli46567Rq2IKLynOhqeRqvAyxQqypx0MfMAeIsb+nI
         B85nOWVkS9ioO5r1PatcOBvAHCDIi22JtMxR6/0aSO++O4U2erQTwCYLDcy3fllPwIfz
         guSwf+ztbZJXQtu7yybPuKkUAb2Hx3QOjkZJtqu6Th8+Oe4/wbPMfENplZmex2V3+aWG
         koDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770115281; x=1770720081; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
        b=u9df9jAd3ocwpNvTkerjq/5EwbpvelscXEhWSwC3ym80s8IjbgyHdQcqBp45X9nu4F
         NYiYPgWEx4f31cBTrYoFs0mdyAasZdSRvrSGXQx6fAsr6ikCHnpvjoQgP/nNWsE2SJwo
         yTfIIy7K2s35FAt3R959t8mjWSPYNXL1u2sMNnKKypKrwfPGRHk9vzGlihZ/vPEqpu8a
         kJzg9L3Xvo49f0c4ypDqDWW4hPmIy6mkoI/NefVKGICLNXwOEmhaapKDgO1AvB2v8d5E
         pRWPz16LCsYRVVFuNtLdietKnxRklo/lTYqOiCEWmeVFsTJ3Z+BFSR87ren4mP988TBd
         7eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770115281; x=1770720081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
        b=s5ns7nMnWmzRy5M2ITziYTQyoy4RQXhC45E6MZ63GEEpDAW1MTIEYYzfArPJ07Z01k
         EETYeaW8PzadCX/vAJGRV8HcYc4k/FG9dKSzwfTHGdY82AyHno7W+PE+nIxl9d0+ReGv
         CgbVULXxrD4NpJOi5BGqpzhMrRRoFQMiL8Y+Oif7cEEOXV3BSvua4lpX1FUXLC0OPBDF
         hsiLi6rw1oaDUPIBt6V6mTT8TxT7vGJEfQfKhZ6wH0CcNmNAV4wZleY+wNvuk3oC6gKy
         vu/uVu/jqW2+PMtl8recQMDyNKlVJZxS1l9feNfd7n1M/ThTGFI6ERYtv0rtduyt3X37
         YZWg==
X-Forwarded-Encrypted: i=1; AJvYcCXZfJffE00r2nTebN8QtzaF+woFXVE8uVbhXljAq5GH6lrhBDK0fq6rRCmv+OYtVeG6ErQL4yHgdsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu8G3sKGj0llQsXNGni0HNnevq8M5uRyx3M4nR6YsAm8BXYjDc
	pMPANO4HKiS5knJnNHAzqM/Sg9M5XaS2AhPXmP2hYe7Hzs7KwtuiQlK286T44xzNfwiTKtrDS2h
	QGXX9whBLapMa2KUhQAfAJVnVPeHNYLlH56lF0Xypjg==
X-Gm-Gg: AZuq6aLgjddpJgM13wZyXkXUuLPxzLE5NIRZU219m+9nnpl61gkdMaLh0lT9g/+vaHX
	2stmdNGSXmv774rPBVP8Emna/GHDGnRQT09ck5sE9lfm7fJPo8S9pxjkMCGTuZUFiX8t+7FK8TL
	nYXnJsjx0X3Yy0o71YTvQ9V3MJ045EkDtou2AlzE3ORIkoFeAYYdtrGd9sZbTjfBWXheDQHALh5
	Qk8nokxPHXyVoKkl1K4cy4ZQphK/PeIZ0F13G+5mI5b/9iHCQ2/BP15siuN6T4b0nzqSehP
X-Received: by 2002:a05:6512:615:10b0:59e:1704:e0d3 with SMTP id
 2adb3069b0e04-59e1704e0edmr3493618e87.14.1770115281299; Tue, 03 Feb 2026
 02:41:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
 <CAO9ioeXkhxjghtGVGsOH=1hwC5FvS_4LEXt3hmAEuAbwVjct3g@mail.gmail.com> <l6o4lv2sy7x4g33mjigeh6sb6cmrfyz3xshhmbc3el6qvw3oep@okwpfykypawa>
In-Reply-To: <l6o4lv2sy7x4g33mjigeh6sb6cmrfyz3xshhmbc3el6qvw3oep@okwpfykypawa>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Feb 2026 11:40:45 +0100
X-Gm-Features: AZwV_Qi-wgYVrdRqK589mxNzs1gxGV1Oudp9yxPTCOEtASkncTUH7LC0VHPXYJs
Message-ID: <CAPDyKFrX7NieYszgEZXFyQJr+PA266MJZTvJcGFmrQ2oy7Mj3A@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain handling
 on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Feb 2026 at 20:22, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Feb 02, 2026 at 05:51:16PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 2 Feb 2026 at 16:46, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > As pointed out by Konrad during the review of SM8350 / SC8280XP
> > > > patchset, Iris aka Venus description has several flows. It doesn't scale
> > > > MMCX, the frequencies in the OPP table are wrong, etc.
> > > >
> > > > Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> > > > stopping it from being overclocked).
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >
> > > Do you want me to pick up patch2 for v7.0 - or what do you suggest at
> > > this point?
> >
> > I'd prefer it if it is picked through the immutable tag/branch.
>
> Another option would be to ack merging it through the media tree.

I didn't think the series was considered as material for v7.0 as it's
getting late for that.

Anyway, I have queued patch2 to v7.0 and the patch is also available
to pull in via an immutable "core" branch in my pmdomain tree.

Kind regards
Uffe
