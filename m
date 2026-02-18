Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85272FE56F
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410666; cv=none; b=I8jkbuGd0eDzhXZYt/TSCFfvjv4zMKToe9BQcX91/ZaJFxVohumKrtlF9bLMXAw1RgMNzanReqYXZn/6qf3XCZB85pBvFEx/G3W+WKFzxX6liht4rl+sIqOnvAkUKqUs++vBSgs7ocFCyUhoocuxV9QqpGShCoQCtw8SeenWR8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410666; c=relaxed/simple;
	bh=auC0xueomOl931O/vRZPwJNkFbOzIwy/JN2zSPgyKrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oThSHktvRYbDazZw7Aosikt50ICT1BRCnv5VNN9Kb10RW9LEpiM9/55F8zsv28cgMg9Gmrr9ie7Ng2Zq7o1XFP19Pdcyzah6brbnCFo1bcwnllIly52cHEm7Atx+01DbKJvu4iISs3Dp2YCnLrGUiBDZjbjWCXCVvtidsI+2DK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=by5wXyGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krexp60q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="by5wXyGD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krexp60q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I7ph9D1942817
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 10:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ceYC3dS1E0sMY+7Me8g8yRAFhnCfYWenXOtaCGhAEgU=; b=by5wXyGDNLBs5+wO
	azx6ljfB4zNb/4aewMncPNuuJ8Gf6Bje2JmaJ36lTKUkI4pkc7I92cu8YrovLq59
	Bty4gWm2DP0Vmb3eJ6X3lLs0XeYA2H7OWnlCdVCFUyUMcROTuiyAX73oFqJjO2Z/
	I9XyoSEDkFj5wv8ALbKNxQBTQp77YJs7rhXNOfgeVZ2ub45wYTfxKrOjb0GTmPi3
	aPcLDDqKxKTWkvyCy9P16cX2Qfg5iN1bHclqlTXxMCQRBXpBoLBtB0sjB1ouQV6S
	w9tCzbuNjEWgLI4D1VSPHp79Rlamx4clml5b2QKii/21kUqhFjGpfaRPEuQRsAnn
	bhsJhQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g3rnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 10:31:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c710279d57so385818385a.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 02:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771410663; x=1772015463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ceYC3dS1E0sMY+7Me8g8yRAFhnCfYWenXOtaCGhAEgU=;
        b=krexp60qWw4iHcAC5EHET1j34dixokPauYNhUdIFzMu5/YiUhRVaKZxUv0okcYdtHM
         qN/ySwscEFcVK1AiuofTLV3U76I+24ZK6jn2RetZoJB6SGCVLDoTWG4aQ9wpeaxlT8pA
         WwpYbj1mT0Myl7QhZfY5A9FwitJnDLhdGWzr0wqXv8Mqfyhh2zWuvldIyjgmlme22Ujv
         SbNlkU2iwCW5BCSIJ1aS3Co8uATNWtTh9qolShLXlzi0mRe47i5Qztd3vv2LP1TmLt1T
         t4KiVx1l4YyrfpOegie1TalnIRRVDJaup66ANJI+mBXdoHNrMuBcas0+1A4D62YsViGZ
         yAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771410663; x=1772015463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ceYC3dS1E0sMY+7Me8g8yRAFhnCfYWenXOtaCGhAEgU=;
        b=inZQLzCeq92PCBFWYZcXxTIp/gHPIoS61JxAP7MAm+PuSoYYuklmffx+v1GgDv22Ln
         vxS7is5ZDhX0zh2Dg8yeA/OqiDAsP/4Hom/yiOcAt8RZuJ+6BXQR2NiN08I3VhKDBijd
         kQqAcf+o/gIF3uT2FRs6LoXGfdhIRbHBEZ4srk+r4cd/yWXucmw0WtGdJGhzLZkH5rS8
         clkZ1yRN0bBq8hUGYocoY5LNcWCVdh8uddwvEA2KS5DFnJb/SeQW2hxPKOHQ3239Ti5k
         Gf+w+P1TjqFyrnuDYjiMZBX9zaU+vsTVBZMxeb+Rxmhvl+cYFtu3TInszIkbiNLrSvYu
         /ZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZx5b1WpuEpZeehxMcy156kln/mfWhPKgxACo1Vmo2YBXch+REESLHr5T/8MjSxsoNueg3MpzNA3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdCh069JcrAwGczyv63lmx2yVUo1tH5KUfz+1wKXlIPeKWYXq8
	5DlKE0sE4Ng5XoqenNzqJNCphYxejsIS6EXylWcaCVei9eMEIahdwKJsQtVuTkoJnebYUKIcp6G
	A1j6JDdMV8tGR2rf9pUphpXlHo+75iucdGmMq5dIw8Kqlic6HWbxk8r4Yi744maw=
X-Gm-Gg: AZuq6aK79a+0Ks6wcpDQm8Wt+kkV+0KNWq/XiNS2hs0iFGOKfSt2ZStatvYpVB90sk4
	LRrklcGspiqxSstLotN3PgKCjJ4qsPSBC61WanhdbTMRIWz3mYGemDvkWAhPGseW4Swag0r9Nyj
	k/u25gWrYIH9nrb50emb2FckcmLazYjM8W6cl5vv9EyPBgstrIY9C+ngBx5fir1L90YpI5ZtvOG
	SsZCX7SuUzpY7Usd6pXx3CEZFePPjuThfzac1hMbkc/dPlGSc/tOhy1kbQ8FdUS9pxyexvOaemK
	+f1N8u1gtmve7aGfyLwGnP2/kNn+7titA8EFy7wYnXC62jOWJ0ZWL0Rz6p0cpF4jchUClc5oGdA
	cuxz3pWa73AaczeB65PVbx2bCNNpSDeBLW7Gd0SvAJG59pMNOdI9JsRUMzmPWbFIngh8eBc0FKO
	+CsvE=
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1548289885a.7.1771410663111;
        Wed, 18 Feb 2026 02:31:03 -0800 (PST)
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1548288485a.7.1771410662668;
        Wed, 18 Feb 2026 02:31:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7c24sm446322266b.30.2026.02.18.02.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 02:31:01 -0800 (PST)
Message-ID: <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 11:30:59 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5MyBTYWx0ZWRfX3+mlppIPZvOc
 OnTRDZ/4CNIn6IwgRVK6U3ZrpvOn4Sqj7Aqq1otQ+NpLl271O3Z1rCDahWMag/UBQyiPgULvSbV
 XpyOpq/HWhrGj00U7vAVoJk3hECc3cs/UFWSPRUbkR46oGu1t3BpvV8Kk8EtBpJJKLTWQZFD6vb
 lztwuM2MSLRlH7Y2TPs9aDXREXX62waloSlqYKGUG3otuWkwwFoob3sE/zQEhOEGtJbFPBdAjb6
 IJCSjHwK0F0xQexrQi230GDbTEFyTSoJNmoieUe7N3dE0nVs5UWGbuyYI/rD6x76iwqezg5mMC/
 w/YIKyPDM1K9pVNWaLnOPewmkHbFkJ2ddxmASIQKYXzfsc3m0xdq6gtY8jnkD1je2hjyp2dC0wV
 LX1Ln/u+AeCmfd8P986Rj/Q10CUvTvdpGHpvjQm8E9TbqXcSG/JTlBh9RI+9R+fOYi/sYYwmRqK
 inGrg9elT4oLWM0ehAg==
X-Proofpoint-ORIG-GUID: AjO8CfhGvQHiZuH32Is-NYsWbhM5zbJK
X-Proofpoint-GUID: AjO8CfhGvQHiZuH32Is-NYsWbhM5zbJK
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=699594e7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=SvsOOShjqf7P06K1ulcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180093

On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> If the OS does not support recovering the state left by the
> bootloader it needs a way to reset display hardware, so that it can
> start from a clean state. Add a reference to the relevant reset.

This is not the relevant reset

You want MDSS_CORE_BCR @ 0xaf0_2000

Konrad

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---


>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index bf2f9c04adba..75c192eddc57 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4550,6 +4550,7 @@ mdss: display-subsystem@ae00000 {
>  			reg-names = "mdss";
>  
>  			power-domains = <&dispcc MDSS_GDSC>;
> +			resets = <&dispcc DISP_CC_MDSS_RSCC_BCR>;
>  
>  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> 
