Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB34B40F8D6
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954664; cv=none; b=GK3t/pKwvPFi/8Imp/8qUafpAtNm3+xcqaJR9T5nskvCnpn30oPxwE6TCmBWf5EGOa0LD8OB924HYQOlgfTYVkPWEpN+rN/G6uB4b5h8xkpxeO4vUlMmj9DoaPB2PMK7/3P4f1NOaGnQQNVHyRBO8U6+lnpysp8hYTMas2X+x+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954664; c=relaxed/simple;
	bh=DIEO8qGvaGNdVs/URq2zTv0E4757w09J3TT0ZkueV+0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lS44Jd+t6668+ziKXZBqKCOjHqijZcdg6jTg2Ol/bRWm5/3dfNhBztxDYMV2XrrRPVgxJiGv9qF3i5fZyi9mi9U68LACXWevee6F8AycLHaAmhpzCkjtMNKqvjJNU3sgBudtTY9VY/QwSAN2DSowM8jD1xREHWP10nuaOv3lajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fkLvVqPz; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fkLvVqPz"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15ea93028dso357565366b.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783954661; x=1784559461; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gSFmMfzjqjEnWlxSIJwQ7RP3S3qUOnt8I0p8wmsKWsc=;
        b=fkLvVqPzaA1lVelq3oB8V77v8AaS+sqe7yU/PAbhQ5O8U2+L1AhMdp9+r4yXxl5RTl
         7K9n4vI7PR//w5GAAKUwCw3As6XxiMi3vUoigQUs9HC7EixZRixuPjjISUfBdBpYDWeM
         jCmtUqfVaUnpyHBcA2DkLTuR3C/yPWnwbErWAfZXWzoGttLNSnDPcKMqKc8t+ekgMOhD
         13Hf1y2umXn6e3KHsyMsLapeHWQGY1+OpvVgIt1YycYECpYpNZEcy/ZKWsK98caSKknx
         MRo86KxG4PhR94toXJpqNNAxUilee6eOALsr2pnbXNCC9+3bFdTg/ahQn6HihH7OIwfT
         I4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954661; x=1784559461;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSFmMfzjqjEnWlxSIJwQ7RP3S3qUOnt8I0p8wmsKWsc=;
        b=HqYCghZGIxiXBvimQN65jYf9pHZUFmRMcP+aKWm56YRvffG4Mrp46mcnSgf/fCwEC0
         zlnzDolxe97l4MVcRf2qlFqghKnauwbAgMlip/j+DF2Q7piRHHfq1VBOaXt4QhFpmnjT
         O8m/m6dHR0ApWnMNQzXkALXRQql1WikJjUxYPlXLBXjQ50Jk3R45QKF6eN+3Ax6SAapO
         QCAgSBnWXbusdiPEl5hRTkmSt0kmCy7dARWSM7+lyz26lhn0WP/rLr0Ov1EOOahKONy/
         KYgChMFwGrxRBS3eujeNjuOr39vTidYXlU3dLXKnu1fO9TgTTtKYJYeibPi8sZVJ3Ls8
         Yg2A==
X-Forwarded-Encrypted: i=1; AFNElJ/HWjB3M8bT903v0GvDzKQmDoGxcj3hN8vWSAlOv4D6Ik/hPFXAYIju1gnC9E3jKBcFrXj5Q7j1wIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKjFDfga/1a9yiYR6+n+4QEDatz/agpWERdpPWE+GUaY+PE1KE
	oKeTaYHsDynKG1uShIq96UDW1q7dIQvUwY6cfuxzHBN2kJMq6vKuoBrZo18zgeNNc58=
X-Gm-Gg: AfdE7ckbZMNN/vdatf4peD72EUv3MWYaSs5m/TEIjXTX58athb8OnzWjcHGPqtaAS3k
	fncwOk6xp83S4Irc59JJIdPvT38p2CKIyxi05fec5jhzGW/gB8P0hb2DxfR6KUwv++1ovcvAkqZ
	0PhtQ0a2SCNtQqzQH7W58DbpPlkxFS42U2ayqltdJcxWrt5aaFwO4DhYW2VSMwJOCP15r9aov4h
	Oz8tzG0OoVkOI2O2HGjVD4VqUzWn/454kz6CWxsiUQHfZwZhBsEpIgSL9az5mvtw0wERJYlczsp
	egg/cAn5twVb8X/u/fG2XnxdWLqZLTFfhnVPl7YvnSPsxBfgwvHzvxoOANCGk1bBHvxofwXBMOI
	CVEhmNesHvFWy3OWKodx1mCljZAAGMsQUyw/jOMAgDMr8CLcJ603TdQKmNItDfAY/4E1LWVBKp6
	p+YOw5c4gAqmmp5iCSpFdZMVwMwByDVBvVHLR3+ZU+juB47P1X64k2b0NwIw==
X-Received: by 2002:a17:907:1b1d:b0:c15:db89:f0a0 with SMTP id a640c23a62f3a-c161f3935d3mr373847566b.50.1783954661073;
        Mon, 13 Jul 2026 07:57:41 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821666sm1005757166b.4.2026.07.13.07.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 16:57:40 +0200
Message-Id: <DJXJ5D2PSY3J.1Y5XS6SXYFRBH@fairphone.com>
Cc: "Ajit Pandey" <ajit.pandey@oss.qualcomm.com>, "Imran Shaik"
 <imran.shaik@oss.qualcomm.com>, "Jagadeesh Kona"
 <jagadeesh.kona@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-3-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-3-4d91bcef50eb@oss.qualcomm.com>

Hi Taniya,

On Mon Jul 13, 2026 at 4:53 PM CEST, Taniya Das wrote:
> The Milos camera and video clock controllers operate on the CX and MX
> power rails, and require these power domains along with their
> associated performance state votes to be specified for accessing the
> clock controller and its GDSC. Add the 'power-domains' and
> 'required-opps' properties to the camcc and videocc nodes.
>
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qc=
om/milos.dtsi
> index 8c92329889538f0d79f7af436898e3ee278e361c..7c42d6c89829e4bf5a2ade640=
18623e49623462c 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1892,6 +1892,11 @@ videocc: clock-controller@aaf0000 {
>  				 <&sleep_clk>,
>  				 <&gcc GCC_VIDEO_AHB_CLK>;
> =20
> +			power-domains =3D <&rpmhpd RPMHPD_CX>,
> +				<&rpmhpd RPMHPD_MX>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>,
> +				<&rpmhpd_opp_low_svs>;
> +
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  			#power-domain-cells =3D <1>;
> @@ -1971,6 +1976,11 @@ camcc: clock-controller@adb0000 {
>  				 <&sleep_clk>,
>  				 <&gcc GCC_CAMERA_AHB_CLK>;
> =20
> +			power-domains =3D <&rpmhpd RPMHPD_CX>,
> +				<&rpmhpd RPMHPD_MX>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>,
> +				<&rpmhpd_opp_low_svs>;

At least looking at downstream drivers (camcc-volcano.c and
videocc-volcano.c), both have

  static DEFINE_VDD_REGULATORS(vdd_cx, VDD_HIGH + 1, 1, vdd_corner);
  static DEFINE_VDD_REGULATORS(vdd_mx, VDD_HIGH + 1, 1, vdd_corner);

so from what I can tell based on that, your change seems correct.

I'm sure you have better documentation than that at hand though!

Regards
Luca
