Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5111388
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 16:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573740; cv=none; b=t2vVRZaCtgYbIE1kT/tTJwqGsMCY+l/KkOhQ5EdFH0TXtMVZJNHLaHUGo/owPVODTULjwOCtmjEhQA5aOtWs9NbUYuOFm3hoAhF2Z8O0gGIA7AIhTK3caJ0rah/JqT98Jga9sfU7g0KeCHKs20UNihOv+r99oxFgCcfgXbXGtz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573740; c=relaxed/simple;
	bh=Yg6z5/0VXsbi8VLXgUTAQHCScWouUuRNuKl4guK66bY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=HqZBsFbP7jLXhTE+hYk0Latt7nfm7nq6PzGYkd9BFRzV6OhpBhe8rWCRsQrE+mfMD3YhjbBLl/nIF8xnJXf49IW+Q6Pcm6QMSdhW0Rz1Kr7+afa64xmNMlnpxZy/dl3du2M6/s51HGtn2MxevqXO20WnX3Pfq3PdMuvNcjUjop8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5j2g7hnr; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5j2g7hnr"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso370735866b.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 09:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742573736; x=1743178536; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbbmZVCZaVtzsaI8Jyk6RYosHIprj6Z8OLUlilWArmU=;
        b=5j2g7hnr1rysfKwb3nGoPn07azZwl5SMi1Akgx7I+L2LB1GBm/gAhXswFYTRs02aKW
         fhYQ8ykju+pOIKuLUGlikCZqvo9Q7TOc6/iGmj095yNw6/8qbR24aXluf0LQTppd9HXH
         XaAC/5feWCHEe69h2h3nq3eDizRCyQsd2CpucWgEC3f9IUN4pG8JJdtY6DT6HxhCLPtC
         aGl1O0CoPcrvHvVeXekG0Sic3SfjYKJzviXcXIcbiUoOmVCAFcZ0qI1TmoWwDjN03bF4
         /rgeVkmLPo3HPEU/WNLiI80yrl/TOT9Fq01KAKZdbOhSLV0OEaXRykIHU2uX5CtugEqo
         mp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573736; x=1743178536;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rbbmZVCZaVtzsaI8Jyk6RYosHIprj6Z8OLUlilWArmU=;
        b=XnbBx1Sb911g5NZhhesUK0Lh8uwhMLMhgy3SlUfIwcnrOH8GGaEePrOgw9R6AMlaXj
         +GQe9JX+MN3xbnL4ef7egt4ndDre2mKMqtyiq9mypIOgBoEBQDAf3XiuBRRsAgqEwjyO
         rU0MgVu+bHI0k2sEurJrWXmGeZAi079weeOfTZLhyyu2k3NFZfuowGDHWRmve6Kgmjjb
         9bt3PcugVT//myaI18fHIyh0gW4PdxbEGZ8FmnbrcDoFIuibRNOVBctuJW21GMYG5WBA
         CVpI2rPgiVEOPaB3o3Mz2ZVPsoOM8IxVtrq3JMnvLR782ePxRBB6k3GNX/RQ0hskLiJL
         iYiA==
X-Forwarded-Encrypted: i=1; AJvYcCUtCAodFkSSU5HZ89hd9cgtJ/aBVFlg+RM0VBUVeIfAnpiXjnJEtX/aqzcCzdKgn/3UH7lu/lhYX+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2iQmDHz5gzA46YToamHwnpoAbFO2tXYBJtz3fNKJGsWkcMzFE
	8Fr8RfOms23sLcWPSmqAVL3W76K6QK9HxaU/wKCvF2kX9+GB/Uom0nEPiDhozzc=
X-Gm-Gg: ASbGncsBXn7zgFClLN4YA7afXY3Tol2CSM/RTf5b8b6dk5s7GAG3O+niSFHEeySxjFM
	q7itHZ0SE0u/X885tXDZ0q5f7P5wLlc0uzMSqeXPSm6/d38NOvXB+4ZRvnbiBQRNGVaPUVLHr+b
	TWD7Z5hlle4BY5ycm/8QB064fBFUxyWj6xlOqrWcs+//KTFY6rhxGlN5Qf8Dbx0yFe+UNOxG7Im
	Rud6JvH+/kRzGet6M/2sO33gmiSQpaOHNrEbFrpcWjhUmxdFFb3mCrqS9ss+qNTEllz4IcoK6q5
	TPEUECPcF8e1uvPuxEF7kTrJAMPGqBqzlkefuj5Nu2MQ5gC/xOWPmS3xW2+r5XL0jPIuY2Xb7Rc
	MUry5Fv8l/0oIKg==
X-Google-Smtp-Source: AGHT+IGhVIiK6Neh4GkmDHq08vg4cl5Hpi3z1/z97P4bxQ0QIH0uE9xYAf14+3A3z8pwf8oACU20fw==
X-Received: by 2002:a17:907:9688:b0:ac3:3e43:f454 with SMTP id a640c23a62f3a-ac3f24b3d55mr325815166b.39.1742573735620;
        Fri, 21 Mar 2025 09:15:35 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb64952sm174608566b.105.2025.03.21.09.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:15:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Mar 2025 17:15:34 +0100
Message-Id: <D8M2U2EUF169.MWRPXFYRBXMM@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Taniya Das" <quic_tdas@quicinc.com>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add video clock
 controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
 <20250321-sm6350-videocc-v1-3-c5ce1f1483ee@fairphone.com>
 <wjq7sxdc5enfu6zhp4d53mpyevzbuwm6qc73kwiu2v3v5p4zkk@mevxbzosjai5>
In-Reply-To: <wjq7sxdc5enfu6zhp4d53mpyevzbuwm6qc73kwiu2v3v5p4zkk@mevxbzosjai5>

Hi Dmitry,

On Fri Mar 21, 2025 at 4:56 PM CET, Dmitry Baryshkov wrote:
> On Fri, Mar 21, 2025 at 03:45:01PM +0100, Luca Weiss wrote:
>> Add a node for the videocc found on the SM6350 SoC.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/=
qcom/sm6350.dtsi
>> index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..ab7118b4f8f8cea56a3957e9=
df67ee1cd74820a6 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>>  			};
>>  		};
>> =20
>> +		videocc: clock-controller@aaf0000 {
>> +			compatible =3D "qcom,sm6350-videocc";
>> +			reg =3D <0 0x0aaf0000 0 0x10000>;
>
> 0x0, please.

There's currently 80 cases of 0 and 20 of 0x0 in this file, is 0x0
the preferred way nowadays?

If so, shall I also change 0 to 0x0 for reg in a separate patch?

Regards
Luca

>
>> +			clocks =3D <&gcc GCC_VIDEO_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&sleep_clk>;
>> +			clock-names =3D "iface",
>> +				      "bi_tcxo",
>> +				      "sleep_clk";
>> +			#clock-cells =3D <1>;
>> +			#reset-cells =3D <1>;
>> +			#power-domain-cells =3D <1>;
>> +		};
>> +
>>  		cci0: cci@ac4a000 {
>>  			compatible =3D "qcom,sm6350-cci", "qcom,msm8996-cci";
>>  			reg =3D <0 0x0ac4a000 0 0x1000>;
>>=20
>> --=20
>> 2.49.0
>>=20

