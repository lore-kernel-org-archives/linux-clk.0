Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5670C19644B
	for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2026 00:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124346; cv=none; b=OWPeUXaP5eHI8Tp7ojMajXCCE+q/XllFhcFYohIOwx9XXnBRquD6NJ0OGDcQIyBYcNB7LBO4VxW76uWADxDYPsMSnKmbuebtARb7ObToqM80W0uBY2j5PvEp+x1qXOrUE+nT4Foozj5zDT2wEdTGbcAV7LMDILkYupj7DLiTIiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124346; c=relaxed/simple;
	bh=e7mpsbTHLCb38Oqdm7oyhjplkf+oP/6k/yMNHF9dIXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljG732zYyiSrQcJgc0H7et/w2OdTTycB8bgODkhZykJKZ//Jebj9o7eQh4xxcAkQSXTDY3dHdmgeImiSHpuuNF4s7Mwpuri50ce9LTuGOlLqsNiEUHnwSYBhpJcjhbw/GJxyztePmXuMOGdyh9hN7U4+4MnfYboeomcFLY0qYwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObwIJspu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tm+ktUju; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObwIJspu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tm+ktUju"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPjTp1031220
	for <linux-clk@vger.kernel.org>; Sat, 4 Jul 2026 00:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/om1/hRDw+8Wf0vTsvREt9QL
	5sj54VpR1VfpMd3lQO8=; b=ObwIJspuVRWTzdbZA0ttr5ILy5CIqz6Cys5lHqk6
	BLhcJlvBchibrXm88cUOF1KpyoRRUCzqyDL6jYcBjd2aNX7A3VU3+TcKr+ataNPs
	0xVSgFNVutrOQ7JUmc/eigkMX45twtdfcvgNlUjR5N1J130vR5KtaXuYXi2NxgMg
	M/YylQuqt9x1cHRPVF5uIFW2C+XRKiCEXNPk1Nm9Lds5MYH4OFo69RFMFxpxKPou
	6BhN0TNl//faFlMNES6NI/fXlHDKgw2/4TlyKYJkSDw1PbS4opSAAjpeTZ+AsQQb
	4XRg6VKA6t7vI3yqDRAGIuhxvppTQCXdjJatMy9Qt/1JcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5cata-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2026 00:19:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so114706585a.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 17:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124344; x=1783729144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/om1/hRDw+8Wf0vTsvREt9QL5sj54VpR1VfpMd3lQO8=;
        b=Tm+ktUjuR+QMNHXJxn8qykw8YHhbkSxrzzRLEaX8gmIDLP734V4nw8Bor2TSQlo82x
         jBaBDlnGqhnulm76odA+Zf6x5aGEQew57XnjTPZX2l4nyZosagTgErCHjo2ZoH/zrZdN
         AJ9Zai9jkpm2Fb88nKjyrQuZi6UmtK9l4SErqKvRPkei6chnnB/+s+iv84j4z7K4hu3L
         0hplc+MNSPk2Eil9cS2AvqbbYTdFUHPvfe9S9o2GVklPrMqGogQ5K0ZKlKsnjiCHJqOr
         xLpI2fdA6zVvMTzPRfLYZ2yVHB6pdE/P/WO4k/acn8AkW7ELJdnI/+FFu7vkeS5x742I
         Xb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124344; x=1783729144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/om1/hRDw+8Wf0vTsvREt9QL5sj54VpR1VfpMd3lQO8=;
        b=L0z2gDJzQ7L8xmibs/Ju8NvpQJt2FEeHiUEoK1xMXAJz4kcuMCIfc75C2m6O+ANJ1y
         jIWtGviAECKPow1EKKqx8JsZQERAZsq+VQTgGvZON4zn41G/e1riSTGOk2zJkDhGLeV9
         KahHzW8x9s77mB2TXTHDUORBNHowJSF21+rEpC/Q9qhtj1DtKH5UFGWaFDuSMeZDrt0T
         2MzrBSyetR7hjU8p820Ra3Fy0wT8FYGx66eKuBKhVR32ONQ9OgojNXt460IAcp+M3glS
         VkWWU0XBq6CDWYNjIqqBo9WZ0IoQdClIlNtLudh6L8mY3kM6OkQtUzUiWqbxbeuk5ZTI
         PZgg==
X-Forwarded-Encrypted: i=1; AFNElJ+3s3cCqYmQTZERC3X3AKPG3ds/cF5bE38YgDXIArJXfSZLa6yAhhTrmOkp1kwOM/h3vyJD/hcShPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL40C9j2F/cdb7oezMNKZZzRrRKJj828S/sApM37RWD9YIx47h
	RhLvoLiWOGhE4KGRFAv6KFJhJwWk50Z3OrNkc9CXY4ZsWA4BMaoM3Wpo1fv9sJ7seUrDB2El73J
	busDs659fi6ledDI2ShpiW7c2GZqoLrbp2ZdknqNtyzq449NP7OrioNPpX1TtYWU=
X-Gm-Gg: AfdE7clTmHff3r95nY8dxg+GlgMwT58S3sCjp7SM16Ga6tEmS27d3Z3+Ifhi9qX+kU+
	RkinkUmjyouM2DkO6Su9Snj7CFOvGuYKt7SvLnuMN6rQq64z3+ryYgQQPGEhhoHNNoy/5ve0a91
	TM1QWO1tt2uh0ZK9ow3118zoLMCniF0+Vc+s4h49IbJ/SIbdEUhmnpezF8cEEPK+XjJy5Q9W8Kb
	cSy7OAwtnHa7i9b/AiCCH8b9FonRVgSNAyvPcA8cxHrFC19eZItRW3MS1KZyXCbzYbMFhRnze3o
	yjjI00e5YJvez1PC0PDQj5M/D2f59Y+gxsEiiEJXNSSUqN47gL8drPdvrnGUgWTYD7W8S1DIP6v
	4v4oHJApUZ4DxSRLWJVpXOyAE7+cSHSgp6MhWPzGmy/bLsZbMJ1ZCvEwEOaC6wJFvJrfvQ7APxH
	5qw4Gixel6getUWSZK3m7kd/Wt
X-Received: by 2002:a05:620a:4621:b0:92b:6805:eae7 with SMTP id af79cd13be357-92e9a51eedcmr214074285a.68.1783124343598;
        Fri, 03 Jul 2026 17:19:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4621:b0:92b:6805:eae7 with SMTP id af79cd13be357-92e9a51eedcmr214068985a.68.1783124342979;
        Fri, 03 Jul 2026 17:19:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb75csm864872e87.40.2026.07.03.17.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:19:01 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:19:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/19] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag
 for DISPCC and GPUCC GDSCs
Message-ID: <svxscdqhtkzkyitstli6srm5el4jexgefudrbdyjhvywr6qdzu@h5yjvz4hmmvh>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX2S0fTswZ7ncP
 o5MxPqaWYSfownPj3jtvBCDJP8aAXlUz/on4RkhHuVzufEQfHvIIXRxX/728DaNNAMvSzz//PKp
 xqAPQZQl5X+r5BYDN85Ykx7QZh9ijxQ=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a485178 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=SqtBJEnEN_GFa67D96IA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -FmScODc7GX9szhbNoOIrqYzvGSINJ7X
X-Proofpoint-GUID: -FmScODc7GX9szhbNoOIrqYzvGSINJ7X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX5HQq1lOKeeWq
 jOllNVcsHkIZV2QQDsQfHtJlfLjUb7DxAz66dxLpCSxUSOw7l/R5zIq9ylAY3H2kwUfPfG4wczN
 PX7unpvnRERUwvCVf0OwN2/zWNx0eXZCQRXRZ/+17pETA2jbcv+LHtGtcluotQ1OLpUij/Gbn+x
 uMlB+lguxEvS5fJ7Io0xx8W91cvncR+haeKGNGpl75LBGKXmqx1lpOmOuFlpbGOa0i9do4CwDQB
 lXOyhkfYCAyxonmzMjV977mfx+4eVv6RSVQAtPmL8z8yEOGz4Lag2zD9t27Y1U4Cu7h06es8OeB
 8t4fJvMs/Lok+WAH/N1bHiU6KtJMJ8qOq8xIMlMrcTUj6rL/5IxlfgQfQ+gEmqa/v7R80MSXz6x
 62N3VMkxxiK4EmwRNoLF446J/l1o3zwXWopodTVMqrOnpzFd6L1X1320VTrU5SF1YX4ypxc/d3u
 x5+U3h25KCpL3nA03Ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:32AM +0530, Imran Shaik wrote:
> Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
> the register context across GDSC power collapse.

Fixes? cc:stable?

Also, while we are at it, move all fixes to the top of the series.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>  drivers/clk/qcom/gpucc-qcm2290.c  | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
