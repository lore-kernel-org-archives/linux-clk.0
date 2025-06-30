Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD325224AFB
	for <linux-clk@vger.kernel.org>; Mon, 30 Jun 2025 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270514; cv=none; b=ufnX1cK0EuitDJJBscFs8OutYVivmn7wCos1631LK741AEctfljegz3IRsF87moNc9ZpkaBkF6iEvQXceyhQhi2IIzWgPYnRsCWmd/WltCyL3rjX4nQKk3/hbr5a2tH7048VImuHe04O17xdjnmMq3Md0I9CfyKqe/p28+j9Wgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270514; c=relaxed/simple;
	bh=LpPq0O9dCSq2yJKRTchcrI01CNwc9RMMB1sOdqU8n48=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hi2GuDrEunF+sOENqDH1MPYH9F7CxshA3jdm8Kkhf7js2O3ZWYj1RChRJD0kcpKUOoYHllTgZCvmQyW1TUz+uJilQJKSnrjhCkn3TVnchgC5hyrSoPxRLzx7EntRGkpmBXXKeN+10+PtbtrWdWhTxJ2cELUNXXKn5VFAhykdDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PuMVrUKW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PuMVrUKW"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0b6532345so1004702166b.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Jun 2025 01:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751270511; x=1751875311; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZWXdKZSSjJqVCAXWFGblQxy/2StWwGGDnAv5AzCETw=;
        b=PuMVrUKW32bEa9R7TQw7IHxfIrUhxO4ts7j1kHOE+OvGLv07I/8dBOcDKy5AwkQPsO
         Dm8P+rDqCOUjr1Xr12jvUEnRABphNKJNkYsbylIIe+oKVjipwSrCTDJe8AXHTW/p0PwX
         2fmZNg3f13y8TH7AnQcosPFDBBCNsvRu6q94CEUgt4nvkAU3BUlajfo9vKNbpwOQb1SU
         Q2qptM0wAmFx6VGpEv8a6dcns3XepjI7QEvfKvPQG3XXggWonB9PY6f8IyUt30asd1fl
         Wr5mPCnGzbC0S2BdxJA2rLNzLl0qORehS5OJQuPvOsMRJmJqIp5aR62vA0Bp9l+pI+xY
         kEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270511; x=1751875311;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZWXdKZSSjJqVCAXWFGblQxy/2StWwGGDnAv5AzCETw=;
        b=k54JJnNJVgYrn8svA/VgFOhAy2fwBuMfMtoMiWdiEclxcu4cHDpJp9qafhMHGPM0KW
         KEBWrMrb8zeF3qmh956vMQiwohPBrzNUWflCbnpfVvbFoqG+sX+OnQtMV4VysALnIo1l
         65ZN4/CwAEobX6vQp/y7aMp7gKiLdblT1stk0Qg8qIgXtGJrB9NWcP6HK+AvVASSbPqr
         kwYHABZmPtQNzyDhcCIywEt+w8faCPf1bq9pQbqLmpV94ZAowvvIWqpG85gXZH9oHFbw
         pKngBAYC5cWYFRwNTaIGlrIRcC8slqWKS7JOE7jQtx9ckj0uBY8Nb2JE2Hd+BwvSkd7B
         Bkxg==
X-Forwarded-Encrypted: i=1; AJvYcCVC0+k49Bngj40s3v/S+pPwJSr9JMPeqqchXAjgP+5CbA4iWMF4dqRZEYtOxrLXCStcOlNwwwnj53w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJKnCJqRTzMW9jbZdpma51sp9qoxkLClme7IVvLb+qiOApmT0l
	pmGFBXx27Tspu6vhSSrYqb0pRg7n8ODhFCQqxteLmJ+Zq33/3SpmDDEMFhvfAYLyFx4=
X-Gm-Gg: ASbGncvYcZwRgdfI5t70OAucnDIi1G5ChsbXqj+3YvvuSaTwlvgxpw1td+l6vwqE4nO
	j5X66MElqAyf/qPfHeAgmAVnPM/VBEM9J6vmMxbk1kWP2ixfc9x0a27jtVfv/sBPKVVUSPl2V0u
	pgZVJc+4waxC61uNb2folnk2S96P7O0BTvrTrDiJWvWSWgNbuFc1gLsIf10xJSppuAnfG3d/k2/
	XCRNIjSSyuiU7bPjeETdTg0UcY/RBAjyScULCLLEqvwqXt7z5IX8WCsEhIUwvV4aGorbMWiiaRZ
	RoS5LiIKH//vbJckomM0j1Cjpb32wpSZBZZaSsZvpTOpCLGedq9IrgEyzmU2Tk48u3wiz6nf31N
	IkG+y6OTtkNs7wC5FGZxl5PLO+07iRNE6X5WonpTcbFTrYgnsA29zMS2w2lSlcA2Sm2gzXnyC5/
	RtskAuNA==
X-Google-Smtp-Source: AGHT+IEoVXPzL2X+o6hUB2pvWTzo7iX7ErTJsBfZFxmXtG6Mqo+mQVeD6+zkAYVim486K1lU9hLB1w==
X-Received: by 2002:a17:906:4783:b0:ae0:a464:99d with SMTP id a640c23a62f3a-ae0d27309d1mr1642905366b.17.1751270496717;
        Mon, 30 Jun 2025 01:01:36 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01641sm630119466b.77.2025.06.30.01.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 10:01:35 +0200
Message-Id: <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
 <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
In-Reply-To: <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>

Hi Konrad,

On Fri Jun 27, 2025 at 5:14 PM CEST, Luca Weiss wrote:
> On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
>> On 6/25/25 11:12 AM, Luca Weiss wrote:
>>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
>>> VIDEOCC on the SM7635 SoC.
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Luca Weiss (10):
>>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Contro=
ller
>>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Contro=
ller
>>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
>>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Contr=
oller
>>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM763=
5
>>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controlle=
r
>>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM763=
5
>>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Control=
ler
>>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635
>>
>> We had a massive yak shaving patchset go in this season, please move
>> the magic settings in .probe to qcom_cc_driver_data {}
>
> Okay cool, I found them
> https://lore.kernel.org/linux-arm-msm/174970084192.547582.612305407582982=
706.b4-ty@kernel.org/

For camcc, gpucc and videocc it seems quite simple to follow these
changes.

For dispcc I don't know what to do with this line.

	/* Enable clock gating for MDP clocks */
	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

Do I just keep the regmap references in this probe function and just
move the clk_lucid_ole_pll_configure & qcom_branch_set_clk_en to the
config struct?

And similar for gcc, I can move the qcom_branch_set_clk_en calls there
but the qcom_cc_register_rcg_dfs needs to be kept.

Does that sound okay, or what exactly is the desired outcome of the
requested changes?

Regards
Luca

>
>>
>> Konrad

