Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE3273816
	for <linux-clk@vger.kernel.org>; Tue,  1 Jul 2025 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370828; cv=none; b=U1ISNEdbBiFGghTyVZBt6o6XiB2my+gG8uhUKkKtjdnehQn+fi+xZntzNr63xfC/kC0sh9CHiWUeG4BtgyKfWDPCd+YLniMKHr6JCd2GaLB7ZytrMyliyPmip9seaISz75nwwtA5E8yGXftEJ5Nt/thg1k1pJW5x0tLUEQMyWWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370828; c=relaxed/simple;
	bh=lfplTRJV/q/OMm+q7mTMyZDq20FwbquibZUlr89u/Vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svZd8i0DygWsTeOOuZCJKR6Gr0s1vnPjL2raDbhkAT9249DcUv+aftWDiYb06In+APtQjT7NsJjk7T3edfVG396mO/q6430N0G51TAPnkiT7deHyzHRwDbLzMIkS6KIZYAkZ7gCKC8c6ntPAfki6/LGWJhVqB+PC1WN6JlrgpFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkpXT2gA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkpXT2gA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619sTrW025364
	for <linux-clk@vger.kernel.org>; Tue, 1 Jul 2025 11:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QpxwNhV8kmBkr08es5SALZ9+EdMkxt7tGYCT2PU2xfs=; b=MkpXT2gAJBzaclE+
	cMg/d8jiIfvjRAaHVctWYlfjKh+MGU3wDkIEooQWfm6OylembSZQCaMQQmQem8rc
	KcuwImmFMo+KciPu2OJwh7AM7PURxWt/y5DfklzwPAlkJp4J+Rv0bSrxUIdpQD/9
	AOfjVBhpXRrvF9/+FvfHoLV2LnvzndRbvXJnlzaWMBcmvjE3XCWA+dwjZR7Ck9Fd
	8JrxZ6McFi8Esqwi4080mE2WA2XGjRtY16DCbsyxAideclbyK6rU8lQzl9TDI2Uh
	q9DaT/q4tRhvh7W3vaghhYX59Fnq2nQjJIBpjVbw2aeH7PtSH9sUTzQ6XjfOKdCg
	Ca30zQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64p0ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 11:53:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5aeebad31so9108571cf.2
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 04:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370825; x=1751975625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpxwNhV8kmBkr08es5SALZ9+EdMkxt7tGYCT2PU2xfs=;
        b=fii4X+f1OUdnTMqnkEJfGec9aN8oN3rz5EhfsDSN95VqaU+ohBsVB9ATGcBM7dY9Bn
         Sr8IPDFQwiwJ5JRCfy2JtISY43vqixHP1Sm4TuUkS8OGuR6CsfVsaLxEhelXQyyAchOz
         f/9336GdVKLJHOdMeJXBrJrl1zdZb0vFf4pmGAzS6GJqOigMRoZObfbY3D82X4WXCa6p
         heVo3iRcIk/ol8408iUpoLgVDQ0ABsL/oEU4Q0znH2kF72V7+Uefm+FkF9dExW/Xvr8/
         LgEocEnUumW9MOubZDNPkK63x1AAVg9H6CGNkTiVgQHsmuoz8JSDLk09uMQ5k37VAn5u
         Qt4w==
X-Forwarded-Encrypted: i=1; AJvYcCV0uqHgNi4+lJJ7R/9ltNqVzZixCbM40fubcp4O/qtXbDy5nEmxGS12ZVsvedKQkBHd5A63zG4NJkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGLeIn4e26WxDQPlfUnFWD+F6m8DBsL/qUshX+eoYv2UzeDolH
	Xn9cDXyIWb0YtPKUTFE4BM+Mi2yac0fnkssWTwFuG1Y8We01An/waLNWV7KQTDlYko72MERBnW6
	iEpbRgkM+qu56o7vHIk5xxMVrwHmGd3jwUkpZ5HCdx/lz6PxrAj6e4ajeTTTHCQs=
X-Gm-Gg: ASbGncumYoEiAAyx1wHA5azcys8Q/M70N6Z3md5lY5nEOaGLAX9qC9GKaRKNkiU5q35
	eOTdCxAYrzcXZRAy9VApJjNgOk4nxONYGVPozsEBWjm5dLZbPVEobKkIQX8OXsJ/Zw0xWN0J/fT
	OlS+cWasdXkNv3RRzDOz9elbYDbRbFxp2Xcj77ysohTHj5RP3/b5C/t4886zCzF4Wg9WKgh6Jjd
	X775KPzAz/XWegS9+u3Kwg6cGINaqEkVlFSPUdvjmiDCdclTHy3B/QLqa2hovqWx1/hpjVm4g6/
	QPds/WPWLbFfYXVpPetvgE0UNWDoFyBfZ56F0G3vizUKWkbecnooFGII3BE/DEsuXZHnad1iOYQ
	EVT+CCs94
X-Received: by 2002:ac8:7f12:0:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4a832be2468mr13903971cf.4.1751370824651;
        Tue, 01 Jul 2025 04:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWdgLxpAzuiN8smmXG1hbj+2clhnPsKozIAenNYDlGQFDJbhfROsW++8GbvMW+JJgD+uQTCQ==
X-Received: by 2002:ac8:7f12:0:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4a832be2468mr13903671cf.4.1751370824063;
        Tue, 01 Jul 2025 04:53:44 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8319b155sm7402498a12.52.2025.07.01.04.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:53:43 -0700 (PDT)
Message-ID: <9b6de81e-54d4-4448-87f0-5ca83086fc27@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:53:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com>
 <20250701-sc8180x-videocc-dt-v2-1-b05db66cc1f6@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701-sc8180x-videocc-dt-v2-1-b05db66cc1f6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6863cc49 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=pJjouIxg0UYB63CLVSoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3MyBTYWx0ZWRfX1aTni8qKaDAx
 pK8EqHNIwJ5zmnbILvZOl+f8LTySbPlDhV6AFZLyogOHo5HhKlkOzGLcQB9EQOa+4SdC8t0O+jh
 wpXNdxDXOaH/ydFxHOtc2Zr9dgFLoxeIaQrYrXQY3TgYZBsM38hes1GEtRZ1C1lsd5eXnnmu2wv
 AWS7TU8d+v8ZWnUhylY0o5jFln63Xk0BoqJRl1oYkoj/Zgx6QbEw1ozzNQDJTydi5ZglUtXfaoB
 Na4PTfsWVT1ZuyH1r5HD8whDtEQrtTzo/pVJAVPV35yp2+uoA4Hwl3pXg2g6tlsjfKZ4/lxd2Rq
 PUfCZKljm0yEfGF/JepXnJI/x5JHU3OMZzJhSSUGtyOLzkrlr1ULe4v3xnvwLtJfSs1Poj5lRin
 GOXG9qO7sTRskb9EGQxRlLkXSAGgXqS0oHOpB3HortKqkcI6VhbxSM/MvegK0AyzgKfLDBUB
X-Proofpoint-GUID: YyclEy3vmsItFnuXnH9WKRZI0VgFlRSb
X-Proofpoint-ORIG-GUID: YyclEy3vmsItFnuXnH9WKRZI0VgFlRSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=720
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010073



On 01-Jul-25 13:40, Satya Priya Kakitapalli wrote:
> The sc8180x video clock controller block is identical to that
> of sm8150. Add a new compatible string for sc8180x videocc and
> use sm8150 as fallback.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

The yaml checker throws a warning:

make ARCH=arm64 LLVM=1 -j$(nproc) dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/clock/qcom,videocc.yaml"

  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
./Documentation/devicetree/bindings/clock/qcom,videocc.yaml:28:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/clock/qcom,videocc.yaml:35:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
  DTEX    Documentation/devicetree/bindings/clock/qcom,videocc.example.dts
  DTC [C] Documentation/devicetree/bindings/clock/qcom,videocc.example.dtb

Konrad
