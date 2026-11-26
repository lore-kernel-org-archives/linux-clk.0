Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687674;
	b=tuOjUaiW7zcvquYb8FbRwbM+ilEOfel1YkRBmhCaqIpbMaqzcXcl8wjDsLcjbl2GA3he
	 wiBPEMX6mjjgrrZNOu474cQpcVsdDeMKk8k4YQMNZ0GIhJscoolWwVCbEVXGRWYIq28hL
	 fhcoXcYGSpJ67tPgq4zYx7l//QU0eFhO1oOHII+k29/WzMicY6v7z9OCgYNTQKlsPFmyK
	 w8SoDfiHrm8zfBrLNdqyAYbNYrAlyHfEY2UpZKM4ZuX9rJv0pYiZdKxoJ9I4yBInolbBW
	 tvtbKQFxiJSYUHJTlGAMhSIJrSnd6I0vLo5inCoyOdW5HSX3fkxFLHIifz/+tuO+/Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
	b=qrkIyVuPKeOgNGlbRNg+zuExBiM9BijK26jKcdWF6tEDCi2MQQi4Io33wgj/wo1MiFR9
	 EdU1iEYukelKYF3mqLaUovxWtJXCQQaTfMGobMTuit8f/l2DaRrhx9aciBhAEtzSJtsF9
	 hYW1TUjo6oSWtuZZletCuzTaDUdkv3zaxVvdRasVmG+C/Zr5u9o3OEMvX7Hez+qVVMxhO
	 Ps9KHwQb9aQug/WXhr5BYIzafSvvgwQuXHW45aI5KAaLmtoGLQQEDvf3G+2YOJZhKeE5C
	 +1nRLvCJF2aSWjclJ1C6l16wpMJLVb4uTc63gB1dv7IhdbcbZuwQrliHLvcZipRFLxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aB1XSrRG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=izmbP7sQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D70F606A31E
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 10:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D70F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aB1XSrRG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=izmbP7sQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B9BX919560
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 10:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G9iILtelhr8Yu2FohoGwzQk0
	gRPwQeEBjlv06/YSbwE=; b=aB1XSrRG9Tg9EV5Kujh1v5n+6HaPnQH8HSHhBcZB
	DMSIjQjak7kWjuy65DcwYjRRe8EG8HIb/pgErYMbd2yTqRdH8kdfLPWDBP7I74mu
	oAaag5esojBzSIyfydSwLotzVG2E9fxYZH+QbY9TEFZVQkAJ/3HeIKcpFYEEWKO3
	oGClV93Xh4hMwegJtAqsDhBOnZJ3hVZLdcmYJpBN7xpavyJfUNjhiyYOYN7JBKsl
	bQVLQU4xKu/7u2HcFK1513Nw+O53TnM6gj09LynunZ982VnnLYn69kKt9xgaXn9U
	3KetkbIF43Mtywx+0CK+LsFz6k+7qcUOfFHllJAhjgebDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2k4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 10:07:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so970321385a.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 02:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687672; x=1796292472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
        b=izmbP7sQnRp8j/hgbVT803+cl7t52q0d2cB0gPNVgxZnB3meZm0D6p3y5w5/pIQYay
         EnLwSj0ydaEDNf4MKHxcfRHWk4AMsIxOKkXJVHSxqN7tBMRj4aTdX5FM5JN6Y0Kxvs5p
         Z+ozAotWTT6NlWkAi+IlJUHF22Bn8hQ3lF85wnfaH6o+o1bEvSus3QpTpaVr18KWL0k2
         8c3SuY3phs7+DBlP3E3rdrN2pavoEyuD7/q2ujWXR59z/jQE9rp+BI0/EcFcwOzK0zCy
         5eYlvOpwey7mpPN8WjMG6MDZeTbo78o/FiXCCOtTdsvqAwA888CbBromYbW8SnQUqzs+
         vacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687672; x=1796292472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
        b=IHsI3jj1+sWnPe7HrdT4/GQnO+aFECklp8ANHSSsR1GccQgDhnPWHhaUh59mL74Ep8
         xXLnvgBCxUnAu4jdyFW6+Y3t8tZNS4FFn8ucrzmK7XgYokbR9IBuTYw1wo4HY7U1QaK/
         9bHJPMIjmVWf2OmdljbltNPrqv8rxugSLPsjf1o1XM/TEU2Ugg4BvfGbBtSv9gGfNKA2
         MliIYigJXWWZrg4Lzze5vJxZm2FRsgibG5cCysaB8mUUZ/MXwW/k4Wxe4aCnSZaymqPc
         mlKx8yBtNabqKl/d2Bxf+qB2IemPlAs8NBmxC2H0F8l4e7MoSfDDrV3CKAKSZI8eJ9CH
         cjFg==
X-Forwarded-Encrypted: i=1; AL+hErHXV835J61oT8ZA6JZDC6VoY1KUe57HVr8eGIagIuFlJHKrKvcRJiqzf3usx5ErVEF9ojAdSe3oW5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PCfzH5YnllxKJrJGIGbZLIc6i4RlyJ+frGOqyaJ50mGXL2FsN
	/69Euw6LNsn91bomdXkwzwoyzLTsV2C9CwgcOtegw/iQQ571+De8UR0cJRsrfHxVNE0LLAmaVJc
	cWqs4NSsQqdrZTVkDec2VLFOLgXzINGzbiAM4amq0RRf5WE6gc3+HJodmX3L9Sz4Lp3u6lhc=
X-Gm-Gg: AZFdTZfmkPkyez8bD9R9V8SZB+gHFo1ETN005iyyDf1ZEqy5bmSJhfk6urabLPlAjy0
	IxW5izI3mv/8Mtddf+gdj/kTrQzQW2AO4zl4PWb6e7NgEt4X18undBHCsfeN/ZwFcwBFhcAmq2d
	ro4h96TmKpSt1yyfqGLBPtj/VES4Ft9NCANAmN0a/5hMCyn2W7pzdc57FRaGi9VKGalNAVsX193
	rH+aLCmjxV3Iwu8S+uw6qM/Mw5Bb/oc5vLebWbUApRm7r3YzxYWMHXCKAGoq73FvNmq+bWvy3MT
	hTQPj/93CRINeBBdHtH1GtjHpwJM42hzOqtQGEj0aqsJz6olkmcXkcl5BqWr3ngn26CkXVRjT0R
	4fhPxhwBFUh3tIkg6YlVJP5gPjLS4AU5q00d4OPrUq2qIHOy77PscdiOOO3UxThU=
X-Received: by 2002:a05:620a:4488:b0:949:91c6:973e with SMTP id af79cd13be357-949bab66f99mr3618198085a.65.1795687672336;
        Thu, 26 Nov 2026 02:07:52 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr3557251685a.68.1795687266480;
        Thu, 26 Nov 2026 02:01:06 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm38799609f8f.40.2026.11.26.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:01:05 -0800 (PST)
Date: Thu, 26 Nov 2026 11:01:04 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org,
        abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
        fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
        marex@nabladev.com, changhuang.liang@starfivetech.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564
 clock node
Message-ID: <awgDYC5NDhrtYcVW@lore-desk>
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-4-elder@riscstar.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fAwCp9gELKVaB6R"
Content-Disposition: inline
In-Reply-To: <20261125202141.1288493-4-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfX9js5+zo2Z6ns
 Js9aUrg95nuvmyq4xKapHri5jZDt/2MkuHDF0CfBBce/6iCBOjET/Er3Ob3nkONyT8DEgjWIMYV
 G0Mu3yYHBbCV15IFJ5pzNPfB3qLbcT/86yRwtTJRe9we5hkl6x9V7jUEQQXkl0QFMVgJLoEJav3
 Ez2QsghHb8rH+VuJd43n6H53jKIVy3llfOAnedDhS6t+Ve7KXH+B63b7H+r2QMVEl8+QwAezyFy
 q+RU0bysmC0NiEdXLWpaiPMucembNJDJTcLSuCi0OAwYaO8/LIrPSI+MA5Z3nOaPfq3OgTIS1AP
 vQk2G9DPLFEsYiohvT1Q694SZBYm//3t1njGXaRbjXsmXTc2pB8lGd+4GVdk7gjit3LjsQJoXO1
 8nJP7VqT0vCnHCTRclc/0hDX+IQ6RR5o61h8f7ntgjR2BpzGSdgZVQL+dJNOlsgrWTpOHFMRVF7
 Dz6lrl/CUR5kL8B7HBQ==
X-Proofpoint-GUID: GW_Jk7pqALQL27yUVzEz3RibeprY4zC2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfX+sdSAZWy3qJE
 bK0Gh5SWAAZtsWz5wTmCGh/iXiHVFQrCREpyIc+ETvTF/dBIJqE9Z8YtcV0buTgfMJWsad4vgtP
 m0tF3x2KN7BRN+XJkGeD+BJuPF6JSR0=
X-Proofpoint-ORIG-GUID: GW_Jk7pqALQL27yUVzEz3RibeprY4zC2
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b0804f9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=DTxt4SQFiI5XT4Iyg4UA:9 a=CjuIK1q_8ugA:10
 a=1mOaCQywVTqKKdqfoSYA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260039

--2fAwCp9gELKVaB6R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add a node for the clock and reset controller found within the
> Toshiba TC9564 SoC.  Also add a node representing the fixed
> rate 25 MHz crystal that supplies the chip.
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - This patch was previously not included in the series
>=20
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

>=20
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/bo=
ot/dts/qcom/qcs6490-rb3gen2.dts
> index 682bcbc0b466b..b327f64885ef2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -890,6 +890,13 @@ pcie@0,0 {
>  		pinctrl-0 =3D <&tc9563_resx_n>;
>  		pinctrl-names =3D "default";
> =20
> +		tc9564_xo_board: clock-25000000 {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <25000000>;
> +			clock-output-names =3D "tc9564_xo_board";
> +		};
> +
>  		pcie1_switch0_dsp1: pcie@1,0 {
>  			reg =3D <0x20800 0x0 0x0 0x0 0x0>;
>  			#address-cells =3D <3>;
> @@ -969,6 +976,14 @@ pci-ep-bus@4 {
>  					#size-cells =3D <1>;
>  					/* Map 0x0-0x1fffff to BAR 4 */
>  					ranges =3D <0x0  0x4 0x0 0x0  0x200000>;
> +
> +					clock-controller@1004 {
> +						compatible =3D "toshiba,tc9564-clock";
> +						reg =3D <0x1004 0x10>;
> +						clocks =3D <&tc9564_xo_board>;
> +						#clock-cells =3D <1>;
> +						#reset-cells =3D <1>;
> +					};
>  				};
>  			};
> =20
> --=20
> 2.53.0
>=20

--2fAwCp9gELKVaB6R
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawgDYAAKCRA6cBh0uS2t
rDJeAP0Q6+VXzDX3T4Mxc0he53zTGBAW5n6sPUtB0OuXRO2TaAEAk4D3UlGDtfnO
vcLGfSBOqjIkzTbgYiQdQ6pQ0DDeQAE=
=e1Ov
-----END PGP SIGNATURE-----

--2fAwCp9gELKVaB6R--
