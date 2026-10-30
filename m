Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793321358;
	b=1kl1mlrWBUGzj4AL6xepGGxze3a66PgK/6O1oDvJj38HHUHhUpLibH7XTSHyWI/JCB3Y
	 2qWXN0ZJlkK7JDyj9Qbs/yJQ8pRz8UOqwrG1VeuIiBkIzEcbkWt37aTy65a3oenA47bjh
	 j5cwgcQO2RXA4+I3+HOXowRg8RBz5gqNCgXMkgtlEu4P2az9+pkQH3SDcMh28Z/DwFbpm
	 1RsoFixkz3mBvoGnu0/2rGLII/t+t/SkbQXEf84UACsjiw2YuF5YJImI7ouWZZ40tyq8d
	 DOWvAfBiStBEqAbVD+xQsAJMOGKaWQOueYIiX7Drwpt2Ol4YX+zMUCBciOGAaafwZoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793321358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
	b=yeLu8wzAh60+hn93KiM1QngASd+gugvxMAcJ6DEINdwl5k5bSaFp1fOcaRlyxK1o4d+q
	 P2yFaXhczvGmXmh+kX+liJO2slb92sl7i7kgrrH9elXsJFOysYPbtOybqfByUVlzb/bjM
	 5liSuRaBD7TtgL48CSjdwaH3o/0+xo3CSm9gF83Lw/WciQJ+IuJDYYPtpj7t2nOOskuUL
	 4lbI9PljXyOBhAz2Xip7DWG2KofBcZ6WhmZKjexbDylazkhlC5vJL83GLTX+jhxLXBjOw
	 +KCs5wnhps4L38xLYzkXDmZDlGkxX3PI0HE5GiYs0ea/YkfnBCKYx56anVecYoFBQwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZWFBSCH;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC71606A31F
	for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 00:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC71606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZWFBSCH
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so593875e9.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 17:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793321357; x=1793926157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
        b=mZWFBSCHWfNScv+mYtJo4pPqB5UN/B45yA4fAL4Qu4/Uhye7VATQ3ZO+6aA/fgyzEd
         bHlf0ptiaf7BEgVmFtcro+i4T/7est30ZQTXO2jYCQsylI+GvF3viByEYy7czkDzpc1K
         S3f0AwtY2+KYflq4p4rqEVFYdy7ruIgQM1IShG/+6RJiJ5BL6BG+Q/wUbpGGuNhhq+cY
         b8lMrRNbFUeQxz9txyvJn1UlKW+0rVWC1Q3VvzlpgPqjlVAscmbPCGZCQJL4wDE7HpA5
         BXusZMeV18Td2mVZFuKBXg9HrPyTEMLPYr1cF7x0B3mBF+ZybfWpsFyP6yH3y0ldIcCR
         YWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793321357; x=1793926157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
        b=N8of5jd6mUwyfLLyeRMKpGClxQImlSEP2gwLNl5rJqMfXXBCIISzf0SN0z0RiMyOMc
         fSA4wrohikTAoT3NY3r1zdWIdy9Z4DXdpNktPonQKgMkBWDTVzqnf1tTbx4bZGwBP80C
         olfRb0pgYBnpuHeEK7ROq5YElnPwBurdfzdmLFDYlIt5jsH3bbt2oC5PvfHDQnJIjIBG
         VBuyux2yyt5FHpdHHRDC4ehDfBIeZgD0qMGQzmUCMKFtxw7lX0xGCXWVdZCg+BEbjrsi
         QK0ch9XvWB61VF/MGv9txuVVxzEzlgJxgtKLpFKaXYqbDHvyMD7RdEPr3F8e/X7QdqS6
         Ujvg==
X-Forwarded-Encrypted: i=1; AKwUvByl9aTWiTZ27TpALTjkeBLMVH2vHcWSaUbpaV4CzprXVOjw6WGTtGMb70sEobKe0XMtCXUwa1phFu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXTdjYlgo2BvBkwmzOeBRO8UyLaNgv2/Keg8pzfDfu77d9gEDn
	6zKH3yB+nPTmHMUndeWrW4xOwpmDw1LYhl5AEl/Qn9rn1lOBX0zpb5eQ
X-Gm-Gg: AYBFou2ar5loGYPuGoG1ko1SOeB2+iF+T4vyjleQidOawPKXH6VELJn6YQHXrTpRig5
	D5t41WBXV4HthDlf0iv6053gTM8r88VoISoYG+DLApEqVyfedVNNUR/9K9vLvuh0ViCidzG65My
	hyEKOQnswRVK5bIMk5uSjpnt53lpnHIPRuYcXDYozheofqIGWdLGBU73zJxvCf04EXoH7Pybpvo
	7naYRJoJ89xy+8RXgTfRR1IHOgDIPiJEn5TXiL0g59BWNAbWcunxC5yxiQ03KbytmHbiyJtu42t
	lPDMI6P8hcY4GWjFMp5HMU4byoMJZOuEdq9w9nfPF1/0Ilt2nkLrj9Fd3KR8sNbgDmVjSs6Lwxh
	HKzQeC/ftXo6sivJptWjFpraSQ8YfhiWyEc+4w9RhdWgVki9YnvZYz0cWXkRmGI+oi1+6m5BoVv
	fMoVsXQwW9AZDxioT4fHD5scmLQwBgRoDm9XVvAMOO9BO6RZf+LJxSu4lSQdwV/R+3DH9zzT7HI
	uyr0dzt9nqtGW7C5DN6yP/T2f4xD1xnVwmXH0dXNktEnOttjo5JkfCRusIFxL2GoLA7ZxQqRHlz
	cLnsLIYje2wjt5LS8IX2iutIhyaWJymH5oTF3x5JCgVMc6qpoSc1+kn2fY2TFg2aIexXRl6wrdF
	5CJ4jQ773L4Ni0y0=
X-Received: by 2002:a5d:5d06:0:b0:48e:2a04:4ea3 with SMTP id ffacd0b85a97d-48e6e2c05e3mr2211332f8f.8.1793321356382;
        Thu, 29 Oct 2026 17:49:16 -0700 (PDT)
Received: from iamyoubutArch (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm158055f8f.9.2026.10.29.17.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:49:15 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: Filippo Falezza <effeffe99@gmail.com>,
	andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v11 0/5] Add initial support for Qualcomm SM7250 SoC
Date: Fri, 30 Oct 2026 00:48:43 +0000
Message-ID: <20261030004903.1068342-1-effeffe99@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Sreeshankar,

I'm bringing up mainline on a Motorola Moto G 5G Plus (XT2075-3,
"nairo", SM7250), and your series is the base of it: I carried v9 and
have now moved to v11, on top of next-20261021. On top of it I have the
rest of what the phone needs at SoC level: TLMM, the apps SMMU, USB 2.0,
UFS, SDHC, the GPU and display, interconnects, IPCC/AOSS, the modem,
Wi-Fi, IPA, TSENS and the ADSP with the LPASS codec macros.

With v11 in place of v9 (only the GCC driver differs), plus the two
sm7250.dtsi changes below, the phone boots with no stuck clocks or GDSC
errors, and the clock messages at boot are the same as with v9. UFS, the
SD card, the USB gadget, the GPU and display, Wi-Fi, the modem with SMS
and calls, and audio all work, and three s2idle cycles resume with USB,
UFS and Wi-Fi intact, as does a wakeup by SMS.

Tested-by: Filippo Falezza <effeffe99@gmail.com> # Motorola Moto G 5G Plus (SM7250)

Two changes to sm7250.dtsi that I carry for the phone:

The cpu-map puts core6 in cluster1 and core7 in cluster2. The kernel
then prints "/cpus/cpu-map/cluster1: empty cluster" and drops the whole
cpu-map, since it looks for core0, core1, ... in each cluster. SM7250
is a single DynamIQ cluster, so I put all eight cores in cluster0, as
sm8250.dtsi does. This is the same thing the review bot raised on 5/5.

The cluster idle states: the downstream lito devicetree uses the modes
0x224 and 0xc24 for the two cluster power-collapse states, which gives
arm,psci-suspend-param = <0x41002244> and <0x4100c244> rather than
<0x41001244> and <0x4100b244>. With those values the RPMh sleep stats
show the SoC reaching CX collapse and AOSS sleep in s2idle. I haven't
checked what the current values do.

I'm happy to send both as patches on top of your series, or you can
fold them into the next version, whichever you prefer.

On 2/5, the bot's point about ftbl_gcc_cpuss_ahb_clk_src looks right to
me: v11 changed its source from P_BI_TCXO to DT_BI_TCXO_AO, but the
table entry needs the parent map's source value, which is P_BI_TCXO.
Nothing sets that rate on the phone, so I can't confirm it at runtime.

Once your series is in, I'd like to send the remaining SoC support and
the board devicetree, so that sm7250.dtsi has a board using it. Are you
working on any of those parts yourself? I'd rather not duplicate your
work, and I can send them as a series that depends on yours in the
meantime.

I did the testing and wrote this note with the help of an AI coding
assistant (Claude Code); the results are from the phone.

Thanks,
Filippo
