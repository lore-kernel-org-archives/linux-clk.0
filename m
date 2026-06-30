Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1711D86E4
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817387; cv=pass; b=baBaO21L3cPJ8Fewmb9fLwzz3W3dU4LkxtRYKwLjtrLvW76mH9YcTVW7sftCCXinDvfChgivgnFPZj6jHyw5woP8odX3U81nGDdYYO9fD9Prw2pH/oWROxYJ8NqjvRMxdi7rvSJsYiJ2NUbNN+PfyG+STY3EkZ0TK42sGaRvEvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817387; c=relaxed/simple;
	bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2yPV5NbcTzIzrXM3QZkOtN8KJj2j8YmpKiImqMyD1RaYiQvw/ch/ggXFH7JE+qr4ry3k68fkcBKKP60arVDRcsJsq43uX1aZmOWOs2TesZQ8q5P6JS7ZFdVVRy2pJoiMXP29VNttPFBpPjUjgal1aenD4ghT1y7OiNKnsiWt/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FI8Mm/CC; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FI8Mm/CC"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6983f8b0aebso721371a12.1
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 04:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782817384; cv=none;
        d=google.com; s=arc-20260327;
        b=a3+hLvPdezn9oxoSznf+2/vlZHlkh4X37mXP4UvsEOuQT+a7Dl4WZJENKOnNgzCrmO
         /O94XVEJXmmdbQj5S+uAz07CK4v/CMsicvjiYEc9ifYLr8HSszXlB9ubQySQdj/6RKKL
         QkwaF5C9bEyzO5JUdU+IFYYCrdSb4Uxhq661a4hiQnOXfuLp825wt/bly+336Aa7G+TR
         XelslStoSW4BsIkeYCL19qp25FIr7LUb0z43jGg3my77TryIfGxKPK+vrkNRBBPutSP6
         dJPKn1XBr6BS+UKvQiySje3jnSwQ6W155GmY9XdK1Sc1ale/rn2D6cJzpn0c3pu6XQUZ
         zxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        fh=QH0cjqy2I61mWSfeJWL+/s8f274gnvuoE2wTRLl3EFE=;
        b=QMhlX3gytZbngj400zQPHDU2YYI0UM9K7Q0GGbSkxO7tqHGh19RdupS4iwIZ6fwSMh
         2cHFwJxxmF2QKJQwErA1SvEVmsk/rBjHInB+82frm52zxCUcdYYtZuNnpugfXXolDd+9
         +A47pzrVDxmcrqUM+YHh9vfIBDf8q5XKovOWR0Ngxd1p4nJhdtlAtCzVxhT+fhbcGmGE
         fJPfZzW3VzWz1y/HH+sxdLjmFPeMcNs4yYu0VDMLO0nxqDVvmkqmGlLL4Is17ZvRBlhF
         NbzhNzgkuhAR2lp82xiTlYM72zNGUnkU6amYvQaWilzTrkNJVteQTMwu/Jr4f5He3vHC
         Uv2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782817384; x=1783422184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        b=FI8Mm/CCqhCN5gcgXwiyaPrReLZg2XBTJl4ZBvTdsTX7PhNxJs00V6wYnKXAYxxWnX
         FX4gLOzWpeTqYp7exZk0PkPyvxeGbAwHEGHunoHT3vDYpu2UscNwjV3mt1ws22WwkNmX
         2pLmtNtVTJilFBX3JGGI6dtJgSCid7bPHoll31MGB1Z2ZilMfFxMtV5OQs4AthXUnjVp
         evxDZVYjI1bxzDvCov5PVDzdOhWEFqmcC7z/knhMJZF5SNBiMLA+7LcrMiENw5+G5iTj
         ly6aob1L79tjfy/fd8mgxTgbU4+4mpktN1sU+74tivnd1xbZeXy/wiHdRbHneJ39SUPs
         2UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817384; x=1783422184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        b=oKwzi/51KoFbBoKxm/nyFx/PaWomELcG7UCfpRM+d9liVeoKtcxQRa4iAbcC671TF+
         9gnjgL8C+EKqP9NCpQq2KN0oyllx7tilFH+dSafmlYxgd4f1nRSGC6q57pm0wJsJLZpP
         C4ZcdVLtCqM3YvWQaP8Vz58pTdLpXcCERYtAPrK5eAsP3es/atFHdbGKkIDzhTrwWhZ/
         bSJU3AaQwFYRTZPQDp3vWFNbHATzx1kfiMOQpiSfyKNkVpbjw/c5lptOCfVdsV98PGAJ
         LKVSfQIrADcAEALsUa6cpowryiwIt2Wom2MUsnFopb6mWMap/8fsNDNL+kAcpI78tsWa
         rNRg==
X-Forwarded-Encrypted: i=1; AHgh+RrbZkYwsV8ymKHXGCtHDiS5kWb/o6NVmg58Km9GBnrDeB7xvwAtwG7Xcxnqm/UMQ0GqzohVzLNEKxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXyWDTCb2h0ynRJQNYSFdnGTaYgvKNWODWOpf+HTC7usdced+q
	LQ/6Z4LNGY08icpKX9qVqPTwnrF5DJtuad4ZvCiErUatR085R2Z6HWHnVPw72L5BnjUoT7Krd8X
	QpKPSd/1ojF2X0d77pbQwLe7d1p6hsdeZ6Mogies9zQ==
X-Gm-Gg: AfdE7clJhYsp7HR+7Fp+G+egT+ixUoDUohOMA2gCCLMgHIJKiVgXnO89Y8/OgI1CeyQ
	T2QJU/1Avn5Nt83G1oweO8BBCFMqLkhOx/KKcgw06PJw8xxdi3D/LYW3IJY9ljZvVFGueUHQbKe
	stFSPY7jYy+vkeEa2QT6s8ANrEsFw7wpYve5CUdFzzpVuzKUVsOi/2pTuhkGc93LRwMJHUcui3L
	pnWl4PMSKXDccrcvvj2v6LQerxz+zr+wb+1Uo3xz1DEaDgeaQfUeWR55JFUjV+tA2WVtiYmApra
	weY9iHBqJoPW6SPnbB50zKz926H+jQ==
X-Received: by 2002:a05:6402:2695:b0:697:fbe7:2028 with SMTP id
 4fb4d7f45d1cf-698819d524fmr695334a12.13.1782817384224; Tue, 30 Jun 2026
 04:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
 <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
 <CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
 <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com> <0f1e01dd0844$01190c40$034b24c0$@samsung.com>
In-Reply-To: <0f1e01dd0844$01190c40$034b24c0$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Jun 2026 12:02:52 +0100
X-Gm-Features: AVVi8CcnyhJ8d9gnBSRZyCKu3M5tPQ4ftaBlF7F7oCbmkRZx4xm5fGDGZptwHa0
Message-ID: <CADrjBPoZ4G09WGC_b59YWq3_EfTaPFyp0dD7VizKLYBW_eFk+A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

On Tue, 30 Jun 2026 at 04:53, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Monday, June 29, 2026 6:02 PM
> > To: Denzeel Oliva <wachiturroxd150@gmail.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> > <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
> > Alim Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> > <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> > Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
> > clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
> > parents
> >
> > Hi Krysztof & Denzeel,
> >
> > On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com>
> > wrote:
> > >
> > > Correct eight PERIS gate clock parents to match the hardware clock
> > > tree and reorder the GIC mux parents so mout_peris_bus_user is the
> > > default source.
> > >
> > > Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> > > ---
> >
> > Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> >
> > @Krysztof: I was thinking, maybe we should establish a new rule/best
> > practice for Samsung clock upstream submissions whereby patch
> > contributors should link to the downstream cal-if code for the SoC after the --
> > - line. That would make reviewing the patches' correctness a bit easier, as the
> > downstream cal-if code would be readily available to the reviewer.
> >
> We can leave this choice to the reviewer if they want to refer to downstream cal-if code.

Generally I would like to, but I also don't have time to hunt around
the internet for a downstream kernel tree. My rationale was that the
submitter is most likely to know where the downstream code is, and is
likely using it for the upstream clock implementation. So, linking to
it as part of the submission should hopefully be fairly easy.

If it is a Samsung SoC for which no public code is available that's
fine. I didn't intend this to be a hard requirement: "you can't
upstream x,y,z unless you link to the cal-if code". I meant it more as
"best practice/guidance"; if the cal-if code is publicly available,
linking to it would be a useful reference for reviewers.

Thanks,

Peter
