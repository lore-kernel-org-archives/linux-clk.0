Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B23B1B4138
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 06:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781245927; cv=none; b=e1S74ok+gy5bFrHhsEP9XA9E8wV8NF7qLdkIuxnL4iC/+wrgDEqLLH07v5ZIFrM+UJqFQFr/AGkRxr+fg3+UAcBqjg+1bZD4zqis+/zfCXVDGUk8gHVZw/nAbgzI+y2DApp71kG2KSvIDtSvC9U/MgasJjrxo5s+1y3CN8uJRNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781245927; c=relaxed/simple;
	bh=mb7tWdKfsGUfdPHeTYpqc1X64RTpGWOLTtT45E4caUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioh9NwkuQr9G2Qyh9i/WO4upQXaSDwx9GE/PH7lIrll2tTLrGCBELTaqanzeWG/Ig3TW9/VBpPeTVEQ2+VR+Iprk5ZMN20UzRQk1Uo25JzPikgDSaWyAkfm3y2kmk1OZvJ8lSMT9Nc0Ia+H6nvOAZ8ql2xM0KvdaV4oWLjTUdgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpe6NC6L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dj+W//k2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpe6NC6L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dj+W//k2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BlYm2534319
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 06:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dCxCpUJ9uOvzWEit/S9cKtrq1+bIKVK0gCosCHYI8M=; b=dpe6NC6LegZCEKLf
	huINWtyLIGvqGFM+SJ1aZsLP+XN4z0DT0wjE2uFEFnG55Z+NYNs9a0l6ld2UNbgM
	S3jIs2zI1uPmlagBhgglUgKKFZp7tOCpsl6J2nceZbq4CuzYbUu05R91CB4STALQ
	MDdWMXeylw7tGty1G1OCp1VolZDP4t8VKvTjMlPUHOsAnwsdNv78Ywh+VfPyRfFw
	O4cK5E8iyPE4At/eG5vPFnk7gekjUHNOXBpZBmKqdr6BkhDAl8MjHDBedrZFGmjK
	7rRSlfQFgu9RTTpP57OV5N95bBDphPYJvq6tVpKUMQDDKBIU74O0KY+9VK/1esGb
	unWI3w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76egwj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 06:32:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c89de84f33so682660137.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 23:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781245924; x=1781850724; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9dCxCpUJ9uOvzWEit/S9cKtrq1+bIKVK0gCosCHYI8M=;
        b=Dj+W//k2wtY6mX4eEwBVgAVBjmEGsB0AA7ZHIsC+IGRmU6/jb3Lp4M96wgf56kRjOU
         gQQUDx5cHLhcwnnSTX9zLSYjExLsmQX6Q3gWjZ/q8fYKPrXYQpcjsdNUB134aWA4V25j
         /qydBpeP4YTl/6vq1BTZuyLv7anEtK6xZEhVKwnmUUYh3uH1kCMwWxk0853MxV8d3Xy4
         R4NoqUOnUuVCUE+g02o1n+u4VTmhyHGYHMviDSmecoJm7kWW12JogUkbJHUvVxm1Phtu
         M0qwMLfeedqkplkstXjvxTNxleZAmeoPGHmvoB8YIbUqED7CWh32QrBb3yliHw+QwWl1
         80fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781245924; x=1781850724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dCxCpUJ9uOvzWEit/S9cKtrq1+bIKVK0gCosCHYI8M=;
        b=pbZCuW2MltIbxnuiyC/xl4D2Q4mz/gTWqM2sADqpg/q3LD6h2IYtRSn4QwuFil/Exv
         cNcgqbcuwlGDpuMlEepmqUnB2YYAC32/TvUyitvAEd6sXJnht9teFmHmBTdN4kJWAmRU
         y5osnlAgU4LtQltoiyPyQd5Q10JAlZS497s7F80uQpLreW9GEJRlWCrwtIVhx7/5VO59
         Yv5+NX3sDc9F5mqdj+dDof7SnfGcIRvJprOhiZ89J3f1jktGqo2dD7F7VOvwMK5xagSH
         i8A8nyAGBcA/ylL14s6RK00HfugB7MxjZXfTijpaJHT87cStIYHdjt/Oz41Phw0B87kN
         9wxg==
X-Forwarded-Encrypted: i=1; AFNElJ/DKqKj3pPwrI5Px37xFMSsfVqHGWXzevDbQiu6NzOF5ziXVYdrGlK2++Bq8bvE6xj9XXbjoIry4Es=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeQjQOSZlIswYCk2XsDgcmxQuIELRfIeML8HFnHy82E4PL2Rrb
	2Kp33lfS3v+5U2eBIM2BsYJxvbVzep/edIDgFVf5Bk9J3LevwlIGevfFkBWu96ckqaagW1aAaWs
	SBBXQPtp+XGhJU2imLUqacJb9SMScQg6zQbYBZDocEzw0mJ6cYU548XL10Nl5KvY=
X-Gm-Gg: Acq92OEACN/j7y8wr3FUwcm7LITo7a3lnrXmcUgZ/+XDrE10c+BIj7ikGVR3o7ojc4D
	CSv55ImIChtYjaJKER4ALyd4nPXNO8PS4YD/yCWXavZWlc98gElbXbTjiISM0CvNLaKPM75g1Ix
	5AlCo87XJhZpENsUxx5j73r8K557V5skdSo+Z2Y2N0Fo3Aa8EK4OIkRnzz2B+QJWTztshTnUbaz
	FIw1NFLsy9RiLnXIFShLNPL2OJCMFE0DaaqgH3siW/uF9Vd/craZaWQ4X71OAvdAkpHaQI7nAGY
	mDC8NjSOm7mIHQbnhCDKaOZBu6Rt11vmchEWuoTOeCxeVzl1Pu023lPrWwS96zucnu8D+3+uGYP
	brdfYHtMuiGkqx226DFcv+8eWIZQuKkyypR7r/XjUY+iGkFa1JCBsKAXSNP7lpfVZhAqgoeGFa7
	iX9ROsUwBDE8/TDKnRcueOmHfpXn4tf19Yoso=
X-Received: by 2002:a05:6102:cce:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-71e88e25533mr716367137.17.1781245924538;
        Thu, 11 Jun 2026 23:32:04 -0700 (PDT)
X-Received: by 2002:a05:6102:cce:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-71e88e25533mr716350137.17.1781245924088;
        Thu, 11 Jun 2026 23:32:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c29bbdsm3650791fa.8.2026.06.11.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:32:02 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:31:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
Message-ID: <dhwkw73psklj75zjufudenn4zal6w7dxo6boxkusz6b3xmtrzd@xztpsyhu4yjf>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
 <amL4e4IHe75_j1HTIsmqE_GyurvudlyHQCPW14zs7ivHz0UnalN-yoknJwzaVRgHTT6ftSRCqDyCodh6ABCLxw==@protonmail.internalid>
 <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
 <639c94f9-6f62-4502-ad7e-5ae60f5f6d02@kernel.org>
 <10c2e008-74fe-4dac-99bf-194a1767bc16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10c2e008-74fe-4dac-99bf-194a1767bc16@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2ba7e5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=g16n3pgl6Qv7JtVSE6UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: ZaJDk6wk3s9dsYpvK2xjm07bnzpT5MLF
X-Proofpoint-GUID: ZaJDk6wk3s9dsYpvK2xjm07bnzpT5MLF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1NyBTYWx0ZWRfXxjSDKkNwIfKm
 rj631ZSDeg/TOGrfEBUs/f/UwjJBusGT5ulxuFjB1Spmgp7ubFXNlwzp4mphvqlSn6/jY8yXtd/
 KYu1UqTpRQXR/ZORPLnYaa9TtpQ+gxjt5mTaNE7F4xza7/YhXgAvn9LQA8q5HqMgpguDvmzou7j
 6mvlGNTwt1EGEB1vNbTyJ1yukqG7dknYA27YJ1tpfqxD3kMVHqUeZE+RfRQ0xkdeebSANQ7KuMA
 sHzdCdp9dVrFj1gTWUOLs6X8ytWfh8Dwkjtvo8gjaO3XEHdWey6KMRXrz1py10zurun2Lb0DPwN
 Ef2qL+zCdAxy6CaWPdRfjGZTdpziWI4AS6vM8w6IE8qk4TiDwvCWsz9iUN2jW08tlUx+Rc3j+6T
 sake53cFjzNK+NPMcsX5EYDi4qVVTPNcTvLIwmKqLjIEkmLXSptbYE64iwCUfvz43S4hBUWGBLE
 FzjqosAWp8sdC3JoWag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1NyBTYWx0ZWRfX9F0okjUsHz7G
 KK5QVrMoGWrlnJFHHb6QnJ5V0la+5OULftWp8aWs3EzjBzT0D9baoF4zHCJJhW10q/hn4fVTEz6
 tUElCQI41BfSet8YRuIpkNm7HKVeC0E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120057

On Thu, Jun 11, 2026 at 10:51:21AM +0200, Konrad Dybcio wrote:
> On 5/25/26 9:49 AM, Bryan O'Donoghue wrote:
> > On 25/05/2026 08:06, Jagadeesh Kona wrote:
> >>> That's not in your overview letter so generally I'd advise to include things like "did X because Y" - "didn't do Q because Z" anyway, how does it make a difference if the values are static ?
> >>>
> >>> They are no less magic numbers that way.
> >>>
> >>> What exactly is the resistance to defining the bits ?
> >>>
> >>> I'll state again - when a vendor is submitting something upstream where that vendor 100% controls their own documentation - there's no reason at all to be presenting magic hex numbers - even more the case with generated code.
> >>>
> >>> Just update the script to enumerate the bit fields, I honestly don't get the aversion.
> >>>
> >> Hi Bryan,
> >>
> >> There’s no standard interface for these bits, and bit definitions/fields vary across PLL types.
> >> So, common macros aren’t feasible and would need redefinitions per controller. Since these bits
> >> are not reused elsewhere
> > 
> > - Asking for named bits not common macros
> > - Reuse isn't why you name a bit
> > 
> > , IMO directly using values from the hardware documentation keeps the
> >> implementation simpler, avoids unnecessary abstraction, and makes debugging—through direct
> >> comparison with the hardware spec easier.
> > 
> > How are hex values in upstream code easier to debug ?
> > 
> > Without the spec you can't change or understand hex values in upstream code, which is the whole point I'm making here.
> 
> I get the 'understanding' part, but regarding change, as I said
> previously, these must remain as-is - any difference for a PLL
> impacts every single clock downstream of it. Some of them also
> correspond to specific electrical properties, just like with PHY
> init sequences. The existing values are a result of tuning and
> silicon validation across presumably many, many chip units.
> 
> There may be updates (very rarely post the chip going into
> production), but I'd assume these would go through the same
> testing procedures

The discussion makes me wonder, should we drop various _mask and _val
bits from the struct alpha_pll_config and use .user_ctl_val as it's done
for the new PLL types? Using both potentially creates inconsistencies.

-- 
With best wishes
Dmitry
