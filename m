Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042DC339A8
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415179; cv=none; b=BFR2XO8TnLpjQcSAFfOnaxJCz4IA5wp4EkjXievF7+JBFHXEhFSoo/hFLLPUxLUUGXpK2ldjDmtmwbvVyLzw9oKnfufz1FUYZDdebtKHF6fFtnuryEvSJm3akQH/1+tcvpuh9pHSvZOmYzNzJa/CxVZiv319dJcWbw7RVhJDaYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415179; c=relaxed/simple;
	bh=f0LlhMP1zTgqOM4s2hdfTmDlKmxklAfVmO36hNkZkBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swdd695yuL5f3hS/0NkdwBBM1TMaa4ujtXgM0vEF1e5rEDZ1Udli5HX4gAxSRZv5CjHGUy4Ivm5vXjHUKCCcNKNI8FAKx2KWqlW099yYPXPaUphQakgZV9u5OMSITfng+OchCTE7E0DEMWV6v7GcL6PYJ9uMB5XeFY8VOaAoFcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sn3gscLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sn3gscLE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAIRCr016863
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CzVvCAFn7NPfsPWqPTLJfwY8YHOBJ7V8/Y9zpb3WIbg=; b=Sn3gscLE2KDwm+rH
	HGKMLOTiQHbz2mYKaLRRtu90C45DK5FAu3roDrgmgc0PGrusB1rO2pU+GAw2OOiY
	NQiuEx3H1ZzaGAnUcZtyXcRVfy5BKLinFWvdFG9EeXetbRjrs5yYK8qQiXn4Ckh1
	/1qFh53fhhcF8l2L2PciBFccacHcZsz0Ca8jJ7NtQmQkoAQks5G4qNMNdjgdBzCk
	GFUCr3kf8JtsYD/ftffjkMoGwsfcVeJkKjrAv+uXPdcfzInbxW5vLcEdEeW1fCTN
	nDnGGvJFyeo1lCCdiU5R16d60Rili8GTympINz+PulI0Nj/OdpR52FQral8kYWFy
	lx74KQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh028w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:32:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so62134885a.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 06:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415176; x=1746019976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CzVvCAFn7NPfsPWqPTLJfwY8YHOBJ7V8/Y9zpb3WIbg=;
        b=O8b5GQjRlcwtic9RTYqiPaUr1RWtcALlFzb1GkD0fjGjbxRmFCPDKbgNiTY/K7GgoP
         mbm14OMgyoUf31/7t+aS0koDb0AnnPOlSAq9b6pR3uWOI6fcKTahJepo8iLIkhWLZ5QS
         VgY0G5G1BMzIS+VE0K/GqQpWc37SsV4tmRQ7pvU9cVadpGtSs0zRYRx9YBdh2y62gsBJ
         A7qvcX0cvysaeFuRUnoqrVq8XXgDZ47MJBjnqQO9FEps507LrfTafpJN/8i0mBF+1KPH
         mYzSVFoRZ6KwoWNMVMa8tbHkXOnbdX/RduJKP9GTQKHyiKGnpClxBxc8XqjCX7ZdMt6I
         jv5A==
X-Forwarded-Encrypted: i=1; AJvYcCX+OOZTfNA1022Wk837RDTikSKoUbLGW319B8hmHen5XFFxV/xRZNhPk4a49LKf+i8fUHbZVoX7XXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX7pI0GOk8PyYQGyeani6kk15JntfL2drEPMn5XD5SSolbi0kj
	QFG5hNE+uAogQ+I44+9tYZbA4aorKZ4PochKro5yy5/8AbMiaSIBdEqczB8YgkdKm3Cq5hRCfcO
	GblvBepZ06FYYV91jF0EWx2pI8bdJ1EKBEqshShjCTItg85NjVyqTlvDn3uE=
X-Gm-Gg: ASbGncvcKUa/0syVsw7ysbX3gRYMo2/3HprztzMMG3LL16AnXYhvGOuO84h5NyEmk0s
	RwgQl43Vp7b72iVeOkZF6y8XquJv+3yqI+U2+Scw81a4VWu1oUIulfsiZjljEoxqinSH0Epsae4
	S7O88flo1vpZdFtdH2G7kyAVJ4ojavj6k6UQ00H+QeVzGgT/ttCFLCys5IqyqGDjUO/Y+fNHcGv
	cdiwRU2tUBJmqv5hyILRiRHBIJYaPnqp2aTrYfwOXvEGYnIlYPjnh1Wl44ow4VUd49byqD/H+iJ
	lgLeiV73rSoSnzkBNoC+Zb329mzLG5ks900oPmifs6TWUmOSbDu1xGhjAUbHvp8u3lk=
X-Received: by 2002:a05:620a:2550:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c94d242721mr177991185a.3.1745415176318;
        Wed, 23 Apr 2025 06:32:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSsZ93i//Sk78zRZIql3z4o3BYAs8oVlEvuFZbuWq+7X6SIajLVb3vJpkuS6Qujy/FvIh6EQ==
X-Received: by 2002:a05:620a:2550:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c94d242721mr177988785a.3.1745415175951;
        Wed, 23 Apr 2025 06:32:55 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6258340b8sm7466337a12.56.2025.04.23.06.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:32:54 -0700 (PDT)
Message-ID: <563f1e36-c6af-4bb5-a5cb-91324e0e60b9@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:32:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add camera clock controller for
 sc8180x
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-3-691614d13f06@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250422-sc8180x-camcc-support-v1-3-691614d13f06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfX+k9ZhrMGgDVG KCNU/BBHSNag7Yjw24gez2DE9BPQIzgMi4H2U+z4LAF0wqyPHbCnkNONBhyBO2LJJoe21djkrTt pesymKagZujunWAdvX3xgKz9ID80G6OdIKH/rf2xPx59SxU7Gg5V+gBZn5rcvUUbrW0lx+sTgKx
 2MmI4oTNwEvcQJCi+mcY+LHHn25VY1oglj528MEh6Nu7XDlkZaU/Pej7c4nHDZvadb3G2DNSSV7 2CQeWpce2qIHeraM4c3n96FAtUqXQszjoiUZHV9FBla0Sj48RPhvLypTaYO9ZWP6QZSoZr3EtpR JkxkO28LjixFEsHvHaz1Ri7QQCTInSBtd0UCey6jk11Abtv4xAH1pXkvRN4yhNJUvXceMA4NW4B
 EdoE3GQj9FDpY4O3COttmpIJEGPSUZ16l4BEAx8OsqCgngsrVK8Vmd582sMObx9Eewp2tJMn
X-Proofpoint-GUID: NalFJ5G2WabnkJUq1hxIYcDh4gHLiqHy
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6808ec09 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TyFXSi68Uxypal7PjtQA:9 a=QEXdDO2ut3YA:10
 a=pgX1na8PQfsA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NalFJ5G2WabnkJUq1hxIYcDh4gHLiqHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=776 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On 4/22/25 7:42 AM, Satya Priya Kakitapalli wrote:
> Add device node for camera clock controller on Qualcomm
> SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
