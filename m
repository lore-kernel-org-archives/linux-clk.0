Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6065918BC3D
	for <linux-clk@vger.kernel.org>; Tue,  2 Dec 2025 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764667210; cv=none; b=lUhBFiQU3Efc4IMuLfqwBBrHsgnxHfCNnIkua1OycD2POSKNXlX4TX5TPSZM7LpxX/QwVLpSFd+jXQLiKvR7PC9hBbT86RQMYK9lJSu7/DQsTtGyo95myxhrkJAgG9RtfcO71YcTg1EYQCz19fSceUQL0vtGcHSMrdl/c9iryzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764667210; c=relaxed/simple;
	bh=p810/wFxt30+XMJuBKhOwELVApLhqTRZG35v7mtyi/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6jZcoxZjIPOIFDdbQ0W7pZncvq2BfyL8HdYVBcDc3no10BJIGRV95mfgkiXbjO1b83q/aYFgjVOtsC20hX41jNrxg6x1zazAFRxDpE6F6IF8otid4gHEL8uJ/eNta9YQIQBUFVbYLUJcxoLDsehV2yDjtqJpk1ZIbgmTY1Ak/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ri1ADWAY; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ri1ADWAY"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63fc6d9fde5so4347163d50.3
        for <linux-clk@vger.kernel.org>; Tue, 02 Dec 2025 01:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764667207; x=1765272007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/G1G7V8+zBE1pKIYtM+52VzsDzHzaIGvsTpLD+gMEI=;
        b=ri1ADWAYi2d17eMI8j/nh3hD1RWlbvfTM6l+fbC8huelJ3bWloMWT8G3nqz21W1wft
         fjwKHp0lC5fHx503Yi4wwCw/EdRCGbC+LkbNdsHbd4H+oiBZyr3EzVpIq2m0QDIpIgwK
         IhkRJV7AfHvq9y3pHaII0+zV5uCQY8zcM5N0cdDcW4YnhoDJs+HpboMzYG9nFtps4M4K
         llOq6t61nxMpNY6XVNuFPIdCGjG3Qf780yBeeTCnCLxDCS/T0snfS2RnQRhLmEkKculO
         VJzL4sAMsiLVBah7DC2ikpQAfG/lfoNencTiwiS6kLzwqZjQV+56W3HVCvqJBMDbWJY5
         46rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764667207; x=1765272007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/G1G7V8+zBE1pKIYtM+52VzsDzHzaIGvsTpLD+gMEI=;
        b=AOhAFsC4s2XYdiv5D1LJWVRhftfUipyn3auHq+5AAmje0AAGNPJQ9qHdF44NROlaHQ
         J4Wt7BJThfhFPycE7MazmWH3aNiwkCIqzM1AybJzxL/Ew6iFCP4h8k2n3UC23fDG0wDk
         Aey9XT3BE+AxahcGAkaQxvz10tkrthFZGfd2zmcZMjCjKIp2QQ5DVLmejb8HOxE6Bcoe
         clQXplKxQQ/HPVCuf/BzxjbwYNTYfb3vuwDCnyMscbjHtDaH5Oq1pdNCs5hvNoxMeaN/
         2G7WhnVdIFkay/6oXa6AMo/i3owZkrT9p1usctkfMLep9ikhxL0QrTyVYwmxw6h4Z0Af
         bdfg==
X-Forwarded-Encrypted: i=1; AJvYcCUOPDLzP2DM0PRGKmaT9+gNEeAwr73iRUAr4bD+w0x5SpPSC4oIggQMcVmIjEK4K5XoOCszNXxMl6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgdYKqb2308k8glsSKJ+AcnEkvN0qdX/QIOt1GXFCCmKOW3l9N
	QxNcciwsfk7BhYvTA8o7mcCGa2Swe508od2wz6y+UEpzGA57TKqJL5Fn2pJ3f3+HPbHphPfiSX5
	M5Dtih4syJLAIW6kKPID391xmDo6ijLlCS5UlYmFrvQ==
X-Gm-Gg: ASbGncsprV4A61royozZ+0m98t7TOSrrMYGkNlaN7NOHKh1FhIwfd76X9vTGuTtWY+l
	fA2QVYibS0O+A3CI86IT2oAnlr1049fym//tvon+jWTYpAWcEtAlcULTBGOnMbKeMxHGzgymhxT
	55En95iS9SymNThDhWkrotjFadBJ8u/AzFzwFZ5dqadIpm3zcsAhazJ0NcM3A3CjXJeujNM7w/5
	01Zfz9OY+ClybumE2cXizOnAFk2ulmQQ4DdlMIVC7FAZv0FrNR+tOWlK+qxnmd7mfKXNQqk
X-Google-Smtp-Source: AGHT+IGkuXbyoaToK4qQVOIq1jOXA5nA48QYY8kbFfQjrvu13g6Gdd42PllY5qa8o5Gb82O7qdj6GQJgrMUUbzFAi9U=
X-Received: by 2002:a05:690e:1c5:b0:641:f5bc:699c with SMTP id
 956f58d0204a3-6432938698amr16869251d50.74.1764667207316; Tue, 02 Dec 2025
 01:20:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104-topic-8280_mxc-v1-0-df545af0ef94@oss.qualcomm.com>
 <176418784438.1591314.8587929353938909456.b4-ty@kernel.org> <20251201201440.GA4041208-robh@kernel.org>
In-Reply-To: <20251201201440.GA4041208-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Dec 2025 10:19:30 +0100
X-Gm-Features: AWmQ_blwJAvHgHxPWpmsgj8k232zQrocoHHqDGTT9KF0aRc5ngfB3LfIo4gucIo
Message-ID: <CAPDyKFoGQJA5UY-96HvfoA7WMb5wYFXFFfFREpMmK29GE7-Nag@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/5] Define VDD_MXC for SC8280XP
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Dec 2025 at 21:14, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Nov 26, 2025 at 02:10:41PM -0600, Bjorn Andersson wrote:
> >
> > On Tue, 04 Nov 2025 20:31:05 +0100, Konrad Dybcio wrote:
> > > This has somehow been omitted, leading to potentially stale votes.
> > > On the flip side, the domain will now be powered off, which will
> > > uncover any omissions we've made in the DTs so far.
> > >
> > > Reasonably tested on an x13s without pd_ignore_unused (camera still
> > > works).
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [2/5] dt-bindings: remoteproc: qcom,sc8280xp-pas: Fix CDSP power desc
> >       commit: ca079ec3ebed19a12c1bf080496dacbc6fdfbb39
>
> This has was picked up, but the .dts change was not, so there's a bunch
> of new warnings. What's the plan? I know it's separate trees. Can you
> please take binding and .dts changes like these together if there aren't
> driver changes?

I was planning to pick up the driver (pmdomain) and dt doc changes, as
usual. Although, I was waiting for the discussion to reach consensus
around dts patch (patch5), maybe it did?

Bj=C3=B6rn, perhaps easier if you pick the series via your qc-soc tree and
send them as fixes? If so, feel free to add my ack on patch4 (the
pmdomain patch).

Kind regards
Uffe
