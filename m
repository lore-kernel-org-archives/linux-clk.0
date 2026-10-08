Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9192748CD41
	for <linux-clk@vger.kernel.org>; Thu,  8 Oct 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460533; cv=none; b=qMv2blGVVKmnRIOiYHHn8VbxjMWE2j3KASQzzUzl+RbdBQN4sMqxdEJZ1GxaLQLxcw99Tasm3q8AmIA6ubx6ddjg1lbfDhehl+qEmKszxu4cnkA8Art0iP/GKea2+B9ikCP1mz/rbaOMdx/U+/YVE+CfY0Jhb7PlnTppKYHCqKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460533; c=relaxed/simple;
	bh=ceEvOrf5v3Z9+vRptPfuj9AfIT5gVhdIWPHKmGd2hmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONoNk6SmZuYtCql24CF1Wlv86ZR5MuuqcUjdDIPKA2jJQIUmREafFuGrljr4I8RJdHtpS5RLmwmEYJclhf0sDr4x3JeQuYakiNz36rw8MPxKZthcrewbptSnPtUdsx1Dic7sSEnLz3+/YLkdHBKtqkdKk0qQDsJnC5sL8xowyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7LLuuPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHClCc6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7LLuuPM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHClCc6z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK8Gk3099343
	for <linux-clk@vger.kernel.org>; Thu, 8 Oct 2026 11:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=; b=h7LLuuPMpWc4vT5r
	iZvWVyFc8SQvml9jkwS10kJDnysIPHx1LisUt/rTKwksSija5xYzyFsJu2ap1My9
	KCkSeNxi4gNWU4zbt0UhJQdA5EHwSjeoCrhHJSvMns4wfsEBoj4WuA9zMnvlMixw
	oO84yDKT/WuDjxtYi4J843ysL3G+8M3mG92nt0V1M4zejd1jM39vEn4sDjOYmHLP
	tU09D6kb9gbRsiFItvFjJGG9YWB+b0vUMLm+e5/8gmAmm/ISVhNeRbLjrjZgtlIT
	xl6c2OjSYCJLgNVIk1oLjSd2I5NrTvQixVTC3j/zwZy/Ze3ud+Xg2iaVYo7rxEs3
	47ZBXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe82pk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 11:55:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e46c120dfso575280785a.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 04:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460531; x=1792065331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=;
        b=FHClCc6zH88Hoj+EyvA8lL96qBnMHMoKpc1nwjTWoLKslD/u2kzkZgF4Nv88V6fd+8
         7FVJFaxyXs/jGMvdQRk2m32PSxpcdGj38owRKAl3s9doSdNSIQhZ5VJxjBtoFd9pTTRv
         bKZepQ+y1zizpECzxqB10TtBTt++1SZ4LgjFmPVwQNo7mye4uXSktUi9lSxn9ksWZCUS
         q+lGWIuscJpkJFcwi8ebciLrMS1tEwSlXFX0/Zk7ix6h/1KIZithpEvb0Awx4wkGekAm
         Cub1Qav8LDUNSMIP5suRCGd7fK+0gYMh+Ja93Jq9ZB+2PicXdg0gInrcmQS81CG/+DpK
         Oj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460531; x=1792065331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=;
        b=WQFVwy7aXiQKHhG0YH2CHyeJHjyG5nnOCWCQZbyzHiuW/BtQGFYCF9aQeqnq8pbHbu
         K/rS1h+m9p2ToQE+Wc0fc770wrM7dlvYx9sKUqBa501QQ2CzYx/ky5nsUcsqDnSpGDFJ
         ey+2vdfpzEHLA5Kf0OomCwmacAHNNLLfWmmErwTjq/YD53sfgD6xu+IWjd2mhx6/N5Ks
         M4sZu/ikRFVSDtoDjO6nXe7AfL+Vz/BTqjkOfTLqRnfO9oo5KywZNQksjyKGkwYnonuD
         5r3rSGstn+/QcPvRrl6y12bjRSWmtqCzQlM3YwNuIetN7l4pkXlGwa9tDdRPcwZj4KxL
         D3+w==
X-Forwarded-Encrypted: i=1; AKwUvBz+qrWJD32+wfGGDdnKqLEdq7N8OwVC5a4am+wsNAEyRmOSs7mWcAe+/V55XNu6g0arH32uEGMDncA=@vger.kernel.org
X-Gm-Message-State: AFuF++kf2XTQxhNgOYqRMLEOIZPq/UaW2q4/+5TPzn0GffDujWhr4Zxx
	vdPWb2DtoONd7RhqQeDfHE089VJehrJCQk1K5BzwIjGXEMavD9pOSOiGwfeBNO1ggXZbSTvE34r
	+CVvYSpoiqNHhijzhXxwMTUzB7BVPMHpJI7BnceWCoIz1iSMTIC9OsuXV7M3DFf0=
X-Gm-Gg: AYBFou2cMH1MV+AzFCU07yCzGtPomDnhIidtduEWM/6Oulv019QYGegMbdP89ebvUxW
	GprLX87OW1rEFyPlZFehd/N4yAzMgfzm3nJagrpRxKaDkERJ2hSMIh7Sj2wZuA7HPZojtL9FfEi
	EZ4FmxF0NjY4L1Igocf4+CdqX/fhm4Vx5qMAXNzKzTcaH6vTiK/w9Jy2YWPLZRqw29zwR8Jn+zq
	ioi3XPgByqIDdaaOSyhATLEUUvr6/7GURIsMrpIAZvGFKV/zy1zqDEef3isx1r2JjqVCfJLZoL3
	jeVZ7pj3wRhMZeRDxY0p2FDZZf6/hxbjbn/caIWBLjYQ/i1pT443xoFVD4wHUXF7/VZ30EwJfKf
	rz6daRzm0FRyUMXXoq4u+u4sDUh4UHja5NB93dpiShTEfKwZ5
X-Received: by 2002:a05:620a:8807:b0:93e:9808:b9df with SMTP id af79cd13be357-93e9b83bab9mr959307485a.68.1791460530605;
        Thu, 08 Oct 2026 04:55:30 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:93e:9808:b9df with SMTP id af79cd13be357-93e9b83bab9mr959301685a.68.1791460529986;
        Thu, 08 Oct 2026 04:55:29 -0700 (PDT)
Received: from [192.168.137.143] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48c7af26edasm5607062f8f.1.2026.10.08.04.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:55:29 -0700 (PDT)
Message-ID: <59bde1c1-ec5c-4ae3-b3c8-61739f280ce4@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 12:55:27 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: Add LPASSCC reset controller
 for Glymur
To: Rob Herring <robh@kernel.org>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261002194436.1275056-3-srinivas.kandagatla@oss.qualcomm.com>
 <20261007211148.GA312846-robh@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261007211148.GA312846-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX2e1rshmciyQ3
 /JcidYPA0TlVNfY1qAvwimaBfjGZqvvBOxMYFRYcyP/gEPGH0KBUs71DTiUiGkRkmfDL3IKgN8a
 bZDou0VJTIren/N3CJfqKjpKBMCr4gu4/EL2ibnKEKSKr7IhRAlbq6XhU0OgdGuBvPdqKQwO25I
 tK82CkqH/AAactmObhAPbav6o2HOnIX9zOSOBLy0kaFp942+kKb7pZRjURnCnFzoTkwh5kVImt/
 ZoGOnYdFstudxEaQeKhMGAr6KOz7tQ4znVVGJw6bIthtj7urXWZrO0W3BX0RpWtbuyy329Af8bu
 HDKSvQmQLCr2ntHVeHthIuJ3Dl15t6Kdrrwb4G7yCzndAlxi6KFKadD5wkW4Qmm7soX3m1B08Mp
 FNUMlmiIE8XvHf+5Iuz7aiJe+GM6B45RR7ztQeNIsuBELXGKimbjztEeWVhotPZqDYIWcExJQtn
 gGkapUsN4ZlgqzUK4Ow==
X-Proofpoint-GUID: sLYcc_CIncU_9jqzd-00GG0rRUwzqdIx
X-Proofpoint-ORIG-GUID: sLYcc_CIncU_9jqzd-00GG0rRUwzqdIx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfXz9ysjjfukzNq
 45TZwvLRVWKmyu/OmO++VLSSY3RVxeHv0ipree3Gh2efKDrxh6N+R9IPEy1fRV+MiYQ5JAseicF
 wFQOAsyrmEM6qtd/3LdYS4NiCGFI3dM=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac784b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=V9EgoYKVrGpsH2p6L30A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047

On 10/7/26 10:11 PM, Rob Herring wrote:
> On Fri, Oct 02, 2026 at 08:44:33PM +0100, Srinivas Kandagatla wrote:
>> The LPASS (Low Power Audio Subsystem) clock controller on Glymur
>> provides reset support for the SoundWire TX master when LPASS is under
>> the control of Q6DSP.
> 
> The subject on these should probably have "QCom" in it somewhere...
Ack, Will change this in v4,
--Srini

