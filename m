Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A5C2EFD95
	for <linux-clk@vger.kernel.org>; Sun, 14 Dec 2025 19:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765740387; cv=none; b=MKAoBUSEGiHBUD5bp9uOL951GjuVifXJfDZ8Q0cAqcF5eSMyFkfLB8Iw13jkQ2MUKBq/Wx+u/YhXY3jpnAgY39LMKSJEhBmc+ey+iBFEnO2ZE9T0NkcOgrXucumpNWbygN6EIYOF5NQysE8wjJVYaDkqvTW8hUJuk0ATb5GbR0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765740387; c=relaxed/simple;
	bh=WVvUVNXHWd1pFmBd40ObioZYv7TFHGnsEnJa5VsJHMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gu0RTI6k0dW2/ND5yVfmrsD3n9x6qdC8BgCVFVV1QlYMIUcOhSu9scl0stltMvrRVS9fcHD5XI98hR9U/KFIK4YSNps2IhTIcW15U0XR8iRKlbfPxalhoJm+xmyviTozL1/cVeIJUic7dCUzACJYZZq78lO2Tbdnl4g7blW1VUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+RPiyEk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+RPiyEk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso11558215e9.0
        for <linux-clk@vger.kernel.org>; Sun, 14 Dec 2025 11:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765740384; x=1766345184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVvUVNXHWd1pFmBd40ObioZYv7TFHGnsEnJa5VsJHMc=;
        b=A+RPiyEkN3Ckk8WLce7h7Sw8AvsBeSFOVBj7oiTnX2XZW8BazLN6/+Tfa/M7Sz0FQK
         2uLSls3YaO18b9J54FUo/0k81MIuZnpHgDUHnxtj7ncXOoumhdU65qpV7l4xtw+KtPJU
         lo/8ibxGdYuJ5iztgHy/E62OjtSfsy1RssuLUeRenSJ61JKycPvvGLLnoBJeFPM1rwPh
         nCh2vVrUHCnS6TIc2sFu2qLoCSjvfdJuQXBXcaxPn0TE/EYtKVgeFr4bGagcIbUFEe8e
         rMu6GERxfVei9HrznipwUzHw3BpyLwe83aWuIjx53MRs2dOoHJGUSZRIQgyxCBVw4ww9
         Dfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765740384; x=1766345184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WVvUVNXHWd1pFmBd40ObioZYv7TFHGnsEnJa5VsJHMc=;
        b=gAfe+aUF9E1JpjAy8mq3C++szRNZ+tQdJo7Q/JXGDEFRPY4kSaY85mvt/7cgkYapXT
         k7HSQbswQN7rMGULfjaRTK8MPhFVg14VoxDoG+zxxIi0Y4djppMioZLxjASn8Gd8j3EH
         evBEIf8JjRirWhAJIC2Qo3DJZEUJD7K8HRUuut1bZnDQv0iYwy2cn4aONtdAH8gG6EUA
         LVOvnJWgPveEPXluCA1Y9OnxzJCyiVecUofrBijkzSRNsbd/B98orniquHR4PZkn1bPW
         wEgEdOotz3JmZpfYxEGc+vEqjCnYUslNqAvjCM2Grool8VgptLfd6h8NJ5qtoGokD1rd
         fwUA==
X-Forwarded-Encrypted: i=1; AJvYcCVX4WX/QgmEN9/JNpDKVm9Y2ZhmQkvC/iC/trcADsyJxnnLSMnOwcmZayfjZgY8WjmUefspHikcm8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9puV2QMVH2xb9GRuZ9BNGwP4CdCa08HsxJYd6ID+muUfgQEPy
	Cv1o7mx2fVuxKx2hdzhTtd0Z6mTAT1XyC/sUFQZoxnOLXU2D8bsYP+THmIX8O2NQ9IpTBfEd5mp
	UI3TxYpH+7TXch+at5NSnyQX9qngbbcUQd5kmyzD9vw==
X-Gm-Gg: AY/fxX4/VkRHIu5COlqJoyPwnBV4p5dJHV4TgSvDTROtFkYILd/Q6EBlHQ3oaShO+Tt
	D3l+qbrV6fezi9qnegSil8jRIPVBvojzlXwWTD5SRNQPy8Nb0bE3KX8YEyqtTCDyIUlgvZpD3/a
	BD0Gjtis6ylxqGHoHFZQmqLCMrS+P9e2TqP2lfPsxZI1aRhflcbaflozOAojVZGfk0H+FWUuDox
	hYiaM7SfAENWqlO9gCvxJvR2/Nz/6rdAon/VSkPgD+KZWbxQ7sC8KMgM+qrGuJ08v65XYUzpBYp
	+gEmMw==
X-Google-Smtp-Source: AGHT+IGp0URZxcEmKzuJnhkovablE+rc5aXkwhLdHAPUclpKC2fkjaTnvENlFOzSKOUjZ6+NbMexq1Gb63+5Gfmk+Q4=
X-Received: by 2002:a5d:5704:0:b0:42f:f627:3a88 with SMTP id
 ffacd0b85a97d-42ff6273cd7mr5138840f8f.4.1765740384249; Sun, 14 Dec 2025
 11:26:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-wip-obbardc-qcom-msm8096-clk-cpu-fix-downclock-v1-1-90208427e6b1@linaro.org>
 <8d769fb3-cd2a-492c-8aa3-064ebbc5eee4@oss.qualcomm.com> <CACr-zFD_Nd=r1Giu2A0h9GHgh-GYPbT1PrwBq7n7JN2AWkXMrw@mail.gmail.com>
In-Reply-To: <CACr-zFD_Nd=r1Giu2A0h9GHgh-GYPbT1PrwBq7n7JN2AWkXMrw@mail.gmail.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 14 Dec 2025 19:26:13 +0000
X-Gm-Features: AQt7F2pFoRVbsgf9gdAd9vkk-xGL6wVZ5NRGI1iTg1jQSI3LzAG1OQ6PvpoNNQM
Message-ID: <CACr-zFA=4_wye-uf3NP6bOGTnV7_Cz3-S3eM_TYrg=HDShbkKg@mail.gmail.com>
Subject: Re: [PATCH] Revert "clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb"
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Mon, 8 Dec 2025 at 22:36, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
> Apologies for the late response, I was in the process of setting some
> more msm8096 boards up again in my new workspace to test this
> properly.
>
>
> > It may be that your board really has a MSM/APQ8x96*SG* which is another
> > name for the PRO SKU, which happens to have a 2 times wider divider, tr=
y
> >
> > `cat /sys/bus/soc/devices/soc0/soc_id`
>
> I read the soc_id from both of the msm8096 boards I have:
>
> Open-Q=E2=84=A2 820 =C2=B5SOM Development Kit (APQ8096)
> ```
> $ cat /sys/bus/soc/devices/soc0/soc_id
> 291
> ```
> (FWIW this board is not in mainline yet; but boots with a DT similar
> enough to the db820c. I have a patch in my upstream backlog enabling
> that board; watch this space)
>
> DragonBoard=E2=84=A2 820c (APQ8096)
> ```
> $ cat /sys/bus/soc/devices/soc0/soc_id
> 291
> ```

Sorry to nag, but are you able to look into this soc_id and see if
it's the PRO SKU ?


Cheers!

Chris
