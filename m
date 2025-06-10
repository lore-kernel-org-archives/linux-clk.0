Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8203D28A73B
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547645; cv=none; b=qHbbKJzTFYDOPrv8BV+WK8CazNGKhJVr2aC+VSmLiW/v4ztbOsqHSv70SKN+sBd6b8AMmlrFbQzQQ6ATguaXnju32wotwPEOwz0frJKHo2yJjV4xsdNp1Rcw7GyYvscsR7HTpJv4iAwfi0u7brayNkD4Bvaf9J28Mj28raFBZxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547645; c=relaxed/simple;
	bh=P4qNKYMYQd7qLMstPICfugAtikYCJruU0i37lwRR5YY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=invJtdXM9oAygtov0Qzz4G4xo9apR+Ls4LGulKAhRoLTTw1b0OVfzK1BlqUjZKtAaDIp2jjVHs5xGgQpVBAY3H6XpWbgCR83PGLLCUK632IAhCK3HgImdTVS28q9A2z5NGQkH1LQ1MPVYajKnu9iIgIZTqExt94dMTrcL+YBAdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PAahuwat; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PAahuwat"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-ad574992fcaso783335366b.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 02:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1749547641; x=1750152441; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeEbp6Gm80Y2xA4U7p4NRH2uge9EsjQvg8tgeLtWScE=;
        b=PAahuwatiXN1E+75I9XGdQvUHRQ5pYtaYdcsR8KqCFsv470QkvRsmIiF/B9/nPre8q
         fG02JrO4YWdOhcXQWpezDcrdpULGIxZBIK2K66tZxkwOjTmXhpUM/kNGcOkrheKWoOo7
         vVmZGuQqoCvhntiiCOKQiXiksRuK8kQjUK8Wj6F4lvXUL/t++GwakCA7/dW8viQqt6u2
         ZFnOJzEKmcYzDrE6+v+ztbXzHHlBJAy9Jq3m6kHfoIg1YLRJGJmGmKVU5xMNvQeWnN3d
         lGAzQLqyPlP/7AQlpMg9oN4Nwo3RxwVbtP8mIlvrO965zZeQ9f49wu1FVLJ61K6mie5d
         JKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547641; x=1750152441;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AeEbp6Gm80Y2xA4U7p4NRH2uge9EsjQvg8tgeLtWScE=;
        b=baJqHHaOnhNuWoRyPzbKhDC9QIcEJs+Eq5EFapsNpOS2o8qRtJ1y2v4DvKpkOjvDnx
         xfh4d9GVuEGXHauXH/EWd04dTQ1N5q3ZzfanQRqpvpi8jrcIH6C0Xdq/UYG8AwzKNOD2
         /+uPMzig9yXeO+rjP0pWr6ch3AsflFV3GIG2Zr40XKsxgmaKEhJxh+PRTgaDamv+hZT0
         H99B5vqZpSWRAnKU3TlI/wRRQ6Bb07wdX/lR8nUgQd5UwvXX2qVPtU01duXhlxl0XAZb
         kwSLxCCM6WPV8kOuFSz35ZoKfHxtz3VFN6wV6gYuqVXV2zItwtQMbJJ5vS7dxCeBC2Zg
         Da8g==
X-Forwarded-Encrypted: i=1; AJvYcCV9o826mOqAlqWF5BEeC7YEXbc3IuQUmfzHXM8Z4/j2alfRFulvXjFU33mcT+a+UGld0axcUYH7pEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/GUFFeeM2Jk5zAiMV6uBwq2hDSDuB4WHIbsP71TkWx6nAuwd/
	oikQzawXNKTzsZs1JuOXWHJNgsm0PIsO5GdbO1fGuejdtswzFKETtdJlD/0qUrhxACmnED4VczC
	5i4AygIlBzw==
X-Gm-Gg: ASbGncsd9cix5bwP1CHVCC4Hn622dI1HOc+ao4TskpOvsWFiXgQ0tHZ0lt44mWR2W5S
	qWzkiMZMQvHzy41OekNg9bXNLbCoV3ssREAqL5uunq5DsalTzbSUKTYf6d0tpHPvpmNWOeR8+SS
	cnaWxuwCSPAJJRqEEC03BodQTRnqskwiLZ1v+W/V6i0pFybMhlP/uij6m6eiRPhGTc8WM8fFldy
	yCfS8Z71DdHrMN+FPu6fW9f5xDhyxyoRcb3kHGH4nEimB7PaNsk4C45Gs1Az6RVIzW/NmXXi7ms
	hnbXnV846pRaIeDZamXnnurCJOyG/ovu0iNtTDGcsvX6Jnme39iiaUWG/5rwPYI04D+eVfJyeXY
	UoYJ2TsgM2zamTZn1ndNRARXbGGpKSEE=
X-Google-Smtp-Source: AGHT+IEdYnXS+bPwfn+SKA9Tzp8XBT0Y+gshkASBWPpQkaRkgexqlj88PwmcmosZG1sajuE1IZOlTg==
X-Received: by 2002:a17:907:fdca:b0:ad5:61fb:265 with SMTP id a640c23a62f3a-ade1aa06c69mr1477466266b.47.1749547640612;
        Tue, 10 Jun 2025 02:27:20 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db557d1sm696297866b.50.2025.06.10.02.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 11:27:19 +0200
Message-Id: <DAIQVM2164NF.35T50MSWTTQWG@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Taniya Das"
 <quic_tdas@quicinc.com>, "Jagadeesh Kona" <quic_jkona@quicinc.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
 <1c09fee5-9626-4540-83fb-6d90db2ce595@oss.qualcomm.com>
 <9eb6dfd7-2716-4150-9392-98e26892d82d@quicinc.com>
 <e3dda8bf-e19e-4dde-83a4-7876ca81e5e6@oss.qualcomm.com>
 <69fba227-ed47-4004-9451-777ca19b687f@quicinc.com>
 <cfa4003c-e8b0-40f6-821d-07f8d44752af@oss.qualcomm.com>
 <0db798bf-04b3-40b5-af90-7dda5b606727@quicinc.com>
 <702ba6b2-b84d-41e0-aedf-747535d6ab32@oss.qualcomm.com>
In-Reply-To: <702ba6b2-b84d-41e0-aedf-747535d6ab32@oss.qualcomm.com>

Hi Konrad and all,

On Tue Apr 15, 2025 at 11:13 AM CEST, Konrad Dybcio wrote:
> On 4/15/25 6:05 AM, Taniya Das wrote:
>>=20
>>=20
>> On 4/12/2025 12:56 AM, Konrad Dybcio wrote:
>>> On 4/11/25 1:37 PM, Jagadeesh Kona wrote:
>>>>
>>>>
>>>> On 4/11/2025 2:42 PM, Konrad Dybcio wrote:
>>>>> On 4/11/25 9:15 AM, Jagadeesh Kona wrote:
>>>>>>
>>>>>>
>>>>>> On 4/1/2025 10:03 PM, Konrad Dybcio wrote:
>>>>>>> On 3/24/25 9:41 AM, Luca Weiss wrote:
>>>>>>>> Add a node for the videocc found on the SM6350 SoC.
>>>>>>>>
>>>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>>>> ---
>>>>>>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>>>>>>>>  1 file changed, 14 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boo=
t/dts/qcom/sm6350.dtsi
>>>>>>>> index 42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0..4498d6dfd61a7e30a0=
50a8654d54dae2d06c220c 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>>>>> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>>>>>>>>  			};
>>>>>>>>  		};
>>>>>>>> =20
>>>>>>>> +		videocc: clock-controller@aaf0000 {
>>>>>>>> +			compatible =3D "qcom,sm6350-videocc";
>>>>>>>> +			reg =3D <0x0 0x0aaf0000 0x0 0x10000>;
>>>>>>>> +			clocks =3D <&gcc GCC_VIDEO_AHB_CLK>,
>>>>>>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>>>>>>> +				 <&sleep_clk>;
>>>>>>>> +			clock-names =3D "iface",
>>>>>>>> +				      "bi_tcxo",
>>>>>>>> +				      "sleep_clk";
>>>>>>>> +			#clock-cells =3D <1>;
>>>>>>>> +			#reset-cells =3D <1>;
>>>>>>>> +			#power-domain-cells =3D <1>;
>>>>>>>> +		};
>>>>>>>
>>>>>>> You'll probably want to hook up some additional power domains here,=
 see
>>>>>>>
>>>>>>> https://lore.kernel.org/linux-arm-msm/20250327-videocc-pll-multi-pd=
-voting-v3-0-895fafd62627@quicinc.com/
>>>>>>>
>>>>>>
>>>>>> On SM6350, videocc doesn't need multiple power domains at HW level, =
it is only on CX rail which would be ON
>>>>>> when system is active, hence power-domains are not mandatory here.
>>>>>
>>>>> 6350 doesn't have either MMCX nor a split MX - shouldn't both normal
>>>>> CX and MX be in there?
>>>>>
>>>>
>>>> All clocks & GDSC's of SM6350 videocc are only on CX rail, so it requi=
res only CX power domain. But when HLOS
>>>> is active, CX rail will be ON and operate at a level above retention, =
which is sufficient for videocc to operate.
>>>> Hence clock driver don't need to explicitly vote on CX rail.
>>>>
>>>> The same is not true for other rails like MMCX and Split MX(MXC), henc=
e clock drivers had to explicitly vote on
>>>> those rails.
>>>
>>> I'm worried about MX being undervolted for higher OPPs
>>>
>>=20
>> From a videocc PoV there is no requirement of Mx on SM6350. The CX
>> levels would be taken care by Video SW driver from their defined OPP. Mx
>> at system level would be catered via the BW votes.
>
> So I'm specifically thinking about the videocc (and other) PLLs, which
> have defined vdd levels downstream - currently we're relying on random
> luck rather than ensuring each one of them has its requirements fulfilled

Any further comments than this? Not sure how to proceed.

Regards
Luca
