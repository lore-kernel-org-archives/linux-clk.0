Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52939440630
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279732; cv=pass; b=CGNDMUsFDa6QtX/cyhMkp9iOMa5GH8hjYe9vapsKmITixnMSFaZ2IqcARdI0qMsO/rrF5KJK/NC6d3HKXKa6TRUb7og7Vq/L7PHiM2c+EGmLBWXq5W/T9v5PrMKpOBcR8gqLu/SAuG+TCDZtKoNmuLPES/Ndp1u9Xap14YN8WbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279732; c=relaxed/simple;
	bh=Zh9Qo22DVdgyIWE9/JgEgDmjV2v+axogH4c+ynR+9BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brf66rXj26MkXFr7lkuHcI4Ht4v5pvPuIiRAwWW1rvpbRddS9AgYaRxbq6rX7i2H6k2WMR2xXO8ACOBcQQi58BoN1M7ojFyyXruuHQt4cOf7KrqZn6f0+o21p1EbmxrxSRg3eQrJCiGrGIyuJgnWhH6Sg4aBf1d46IPiwjdsv9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVrFmLqc; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVrFmLqc"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2530cabcf4so769825266b.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 09:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788279729; cv=none;
        d=google.com; s=arc-20260327;
        b=HpqrLYvnUKMaH08jOFdcQENhMDfuBAp/ken2Um31qlYI2l1wfE8V+//ut53Duj979C
         Oc1BrMHGfiqaXAWExRTnOn0wIQeZyqIa9R4EbLjCht7rkIBUcVSQS1xFq4jTzE+wDtdH
         S5XQbMeDuMFxGOgDXZis4GFRu/c4NTYaK4o2EsfIVJFydxzaYppPDGD8boTYiSUcp92b
         6G6j+40+XCPhgjucyAG8tuZ/MCxfAXi6Dwzd2gj/lsUtRC2kpntEa0Q9G8YFewAdqDWW
         1Bq4YVS3f+qR62sIbODZYO5ItMURBEvKi8n/1xmo468a/ZmVTl9MlTWzcF4oDWyozMQX
         VuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        fh=9WuHLKgiEAcePOCAtmy2rERIZjmtSfHfwPaFqvUGjPg=;
        b=MqntTxT/FIdAqJU9fRLNeTG+koFMJYU+q8PfyDbdHrrmrPoiusQSeghTpSs+nlULtx
         dVuvhJ0Ja2IkJC1TC8nrw9w1UkMQDVr/nl3AtEspXw0AX/4VGFdklWROBklQnPOY0oPg
         vRFJXIbvVKstGfRKN8AjREXT1w7fHKzcXWE2Q+EZyJ/+yFTjrmiV81Lq1dW7o9IOXTyV
         ZHrm3gi8EWQNuKJHCy2AQywYbjMEFyOzWrTLSxD4MnzEO+yVmF3OPj1cjNZlC2dPWoSP
         e7B9Fa1USIN+EPHUGtfkJANExrctqU7YMmv2fJ+mhJ9z+SUETvN1gsoHJ3vU0CreKe0i
         jAtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788279729; x=1788884529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        b=rVrFmLqcP/25rlRoRXtjiedV7T4N4hODM2cU6Ep1ojhMUJDRoEyu/7YGgTeF6sfrfw
         2ihIUl6g6LSTR59t2HrqEEeBpT/JdkSyWio265iHlpmFu3UPy8Lt4X4VjxsO3w24ZrTY
         2w8AMtpbh8k/PGr1huQsXYbENZtS29q/7dQ8FWqheoyWfYrChkGWMGWGJj2gSAdwhKiF
         TjfJ8/1VtG50+CBNY9umIUarJqMywld3MHG0ECsWY70eYtgcp4jDHg+lZUVglRPjO6aJ
         ktlbJ1SVHw9TdZkIm06pDrhx+m05zs2LGDURPL76lXdUDXSSEen1n9wAoa/ap71VPymu
         eIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279729; x=1788884529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        b=oBSWe+UywwX0INndFrBW9ro2LtKVuB3GCnamvLvNcG7E53GiW9Eif2IEpqyeQ1j0JW
         QY6SUhpSLHHySRVQFWStcFN/VhvCym2u/DqOgMIcaiGoczSeEliFqmUAHgm3gLpQ3QCJ
         OuNZc/SFed4Fdafc0yd8QS7t4GEZqqhZp0uhBcLlneSzIy30af8LIwEWinjA4kvhHmcY
         C5NzG7hfQ+zZS3BlcIPmlf0v83Nataczx9AlrqvuuI6Ftms+bPZ+EVfcIz6JQJZk29fK
         T0cUw8Mv1cKVdaG238/34V3CwATklnKv3Y8QKaqhzcTPwOky5oFpoXDojB1CT0CFKU1k
         B1cA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7KVetlsvvFW39Qyy2LMS3CUPWxxiweqBQaHQksHuXJ7hcpUwN4W+dIkamkt4db/dkfkUYUyGnpSc=@vger.kernel.org
X-Gm-Message-State: AFuF++mfVkNSnty0mWpMQK7rnyWQ4WC2aVZ0Dhx1mFEVCR1GJZrpuZJW
	h+kzjCRXiW6wSVpC9LttG8rlulA8un2+Oq5u49o2vuT3PijnVtfmFDjyCqWq56kycvDTJYRKhjy
	1wzcfLDzowX1p+BY6Wi3va2ZZcmEZJ6E=
X-Gm-Gg: AR+sD12/7MA+AXfqNqaBoz1e0QVS+lfpzOXD4lkTWimCZinNdj7U/MZ0IzntTOWDSMJ
	dNWSIAC6fpS3YbirN5q7rPidjpnBvOHax6qZZO3xSHNQGSBLXfxOtBsSWASLB/vgEtQEnAMnKHE
	K+hkkuwBafEUx1f8nd5PrtL3Lyjy07iDguSTgNTtBKGk/m8L3a/HgKAb6Ajzjx6X1p/ko0aUHS+
	fF87jwq9/gHuXZ07SF2RyOGcKXMjJqSYdvYEyBNWpeWtW+/fUD47zSZikzZ1bxq0S0v4lXudIIx
	m/yZ9DlGAeWlbqdzi2K2BjuQsNYtj88gwyB+SppVRwztkXUo9aike7E6REZTPeY4OegIGjO9UX/
	vHwWq1GOTyVlrDcKHGe3P/qwJJXX1hE2rBSo=
X-Received: by 2002:a17:906:c108:b0:c25:c979:e76a with SMTP id
 a640c23a62f3a-c25c979e7fdmr216147466b.22.1788279729382; Tue, 01 Sep 2026
 09:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com> <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
In-Reply-To: <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 21:51:57 +0530
X-Gm-Features: AcwNN1UgmlzLO2QtgDmTIhpoG6ElFAFHl1rN8oIvI-bmMKMW8f6_U29Z1lRdz4I
Message-ID: <CAA-+ukLdb_98Fx8PCNesvg_-4BmCcU3jxy8QTL1-a46MCJu2ZQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, taniya.das@oss.qualcomm.com, 
	danila@mainlining.org, davidwronek@gmail.com, mani@kernel.org, 
	robimarko@gmail.com, linux@gurudas.dev, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sept 2026 at 21:16, Ulf Hansson <ulf.hansson@oss.qualcomm.com> wr=
ote:
>
> On Tue, Sep 1, 2026 at 11:25=E2=80=AFAM Sreeshankar K <sreeshankar0910@gm=
ail.com> wrote:
> >
> > This patchset introduces foundational upstream support for the Qualcomm=
 SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featurin=
g an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cort=
ex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > This patchset is organized as follows:
> > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, P=
DC,
> > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > interrupt controllers, clock providers, power domains, and reserved mem=
ory.
> >
> > Dependencies:
> > This patchset depends on the following patch:
> > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-kr=
zysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > Changelog [v9]:
> > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver=
 for SM7250
> >   Make all clk_init_data instances const across the driver.
> >
>
> [...]
>
> Patch 7 and 8 applied for next, thanks!
>
> Kind regards
> Uffe

Thanks,
Sreeshankar K
