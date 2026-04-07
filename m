Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE6E3A542E
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559532; cv=none; b=hgs/QfCmEgrUhQCcMx6ST4EIR1S0doXC1gm/u0CwFyrwyMOoq9z2VDhY+HLnEoKDnPiuDqfSFjWyYfTMiQxCA1j4MyDxWAOzrgQonJ4WZalVhypEHJ93+FFpzPSXLH0ccqT6vEWp3ixdWQKBnYfxbI9Z7nN7UTYaRRnLzUK+BrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559532; c=relaxed/simple;
	bh=ktd0UMKrWaUcaGo9fGCGeM2xyR0ggRBULf7rZkDfsJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMhJrYL3GcQvAuRk92cPI+mbPk74WD+vSrfQRlUZBF5YIpW8MDZnq9rS+BUmKw2weHATYOrV73bAwh4fSoXfMoxPN7nLuI/fpO7mXuAHQwH53UY/B0AmHqwpEZJbG3xZ54OoT9oyebOmJUqPLcTDBEmjeX9DcpPMg+6Cs4ZKijU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuNfqLdL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQ2V7JzQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuNfqLdL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQ2V7JzQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376nHmc3815757
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 10:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCqoU7bXs+Nx06yOgLyROTLNdQZVS+xm+B7KV7N4LaA=; b=DuNfqLdLPfpY9fuI
	IaW6JM0lfNzRIBGXtDbl3ClI8f8VPe1vhrEd48ub2yIQzfE1zpySKJDUaZDe8vJ4
	v3X04CVzc5/ch07d5Ztp4tyGgN+o6UABKXDkjI+akYJgAAlIhRj7LSJcQ7BKbQUy
	sf9O1gz+ODmSWi2eT26hub6Jjm03lR/iyiuAFXk829LWp9LCd7r4PUO5WxexCqQq
	gacStpQSt3lN9C0pF6geRBqWwH4SaiId+LZetqf0gNc7sYrTKaWr1VpzPCMkOKKb
	RgnuUaKY6NskRp4tNpqEVYe5oEsl7ozZoRCDp9v5mNXkr+s1xrKRkeZovCFrtkHf
	gUqnmQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tdfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 10:58:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5073ed1ec6fso18120651cf.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 03:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559530; x=1776164330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCqoU7bXs+Nx06yOgLyROTLNdQZVS+xm+B7KV7N4LaA=;
        b=RQ2V7JzQyzxNDR1d9hvsfQeEkZSafPoPsP0RSr1IyPm4NoMPgFHQPgYdcg82y8PyTz
         cZ24R7zcMfdKxe98Dkb0Tt8rK6fctaAV8HO6HSCPhozu357CHeYQciDvJ1CSZ8NA1jqV
         oXPI7wZbSbfm42CF2zGKcJpSsDrY1gI4NJXvLxcfPUazdm9ncTKkmMKqn4WfKq0e4G8+
         9PnjjIBiSL2vOVWDwBTFNjMe062mzkOUeS6SNJQQ3Tcdgt89+/owXjp2ciF6dMIV0LXJ
         K6+eVMfdcT5ObmRWvbY3FRrPl/QvZm6aH5sssqqhprUkKsZ9b9M+eID/7G7ZGOHHiAWF
         Uggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559530; x=1776164330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCqoU7bXs+Nx06yOgLyROTLNdQZVS+xm+B7KV7N4LaA=;
        b=SqhGTPASiZIGG2FoGvN9YcOXL7/NRagPYFzd7hkAXamaLsipECyMk99VP6+9L2C2XC
         dgKNk+ufw8kK4p7EgjWPXVrfIX/qvH0FQRkQfBtSlgN3IIp7xTeVwkOZFfoXtIfkxEfd
         IL1uerY8yxA9+gL1B6CHcNPeSZGV/Eco01RM3Zc6y2/5PrcnlIHV+V0c54Fk+1z/MEDs
         ptsBR3ZsgLM5ARyq6YDgGNhYa+bExieoZS0zRQZK51SMHVeefRbhx3lf/KABsvIotsW4
         /PD3xU1785AYfOQzC9G1KGV4pNkRjc7GZ0+gMFk1wOOhwWbYske8KxOZRfXlMEltnW5Z
         qs9A==
X-Forwarded-Encrypted: i=1; AJvYcCVeQ3+x5O8FVMViD74App6wYh8xO4X+N7PgGzcPBBTUmhloYB0hsEijc6cCZ7wa5s+RjrX1DN4kzsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/xgQkWoHJ9VzhzGN4jGgTo8/QpM3iD+zGjiGTemMUdu6o0GK
	cWfp56/5bUrowGblwIvj4YexMrKUnJUnY3ha2mub/hvnEDIy38NM1e/ysdE65KDRt76J//ZyhRC
	PvUC+bm7ab9PZQYmbx+f0mw0Op0eR+0HaV0H64Gy5/+L9qasfvWvakCE6QR8EYm8=
X-Gm-Gg: AeBDiev0emqpun98NAN1HbfHh8IP/RsYYDsVWTe4zff77pc6CiWJ7zGMh3cD4P+FMNY
	5DMvbCQW66FtyFRIM6Nu8s6/izxA0Fn37zTlF4fL2m5DceyeIer1f/eNxsh7dVfgTfRuiTT5JtN
	/h4G/oiAo0pqV46nA+Cpf5kzKExTCvyyMGjAsIOhEya1U+rxLSn7IOCFPcyIKqD0QamlIveBCVT
	vbvAQ+oofQcq0aN2wCVr6qg6rqpxUSeqjbJ1902wPXUrfGNf66ejkd+Nt5dJMJJg5Txo5TTARco
	h9rqOiQ2hbZqgW1z4MykOP7Mlnaa2c4OPkI0ODB3MbllDBuG2V+5yR6ylow5hS1KNFIYlL1Aj5S
	paBwbaPldbxlosH9rQZjlWVcu2pvi26+khGkMFRxShm48XslhoEIGS4n34pg7gK4mFxECZIv+IW
	TPnGE=
X-Received: by 2002:a05:622a:2b06:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50d62b13243mr181986971cf.2.1775559529863;
        Tue, 07 Apr 2026 03:58:49 -0700 (PDT)
X-Received: by 2002:a05:622a:2b06:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50d62b13243mr181986691cf.2.1775559529370;
        Tue, 07 Apr 2026 03:58:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec58f1sm552059566b.33.2026.04.07.03.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:58:48 -0700 (PDT)
Message-ID: <c72e02c7-57d8-4353-a6d8-9dbf4f7a7e37@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:58:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4e36a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=B7wDQo7gvYI_MMBIZEwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: yLzMH7sj36zc0nV1xRT0rhNt8dXSDhkH
X-Proofpoint-ORIG-GUID: yLzMH7sj36zc0nV1xRT0rhNt8dXSDhkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMiBTYWx0ZWRfX6ffLuR9dQnri
 xns+eo8Cca4MOABRi4c+duDRPPPYMXMyoRajypi4CU+O4w4wI4KEGEVy6PArU4pdO8SO+HBlNK+
 nw0HDE06C9ZzI7YuWfI/HxhIKlPQmTS+zNVdHOwjkwpoBazLrgbkbrSBs3cK9N4Y8SDj2km6oDj
 9o5evur3kkHDo933d1RstX8fJJjb3JYM311c1wUcA+FcNb/YDkOUZ5I8mn827pf42tkvBNkY7O6
 dqYBFqdXiIv2mkXIy6GZQFBrt3mCgYuO3y4hESY+x3jcNNttzlyM8G1aFoNyNOHwhcUS/q9ivf1
 ohj11QoIUaCPA71ph2ASUSyYTJ+OApmFjy8IzFR0BGTiI75JpgU83raGOeAuZTvPuF6UE/atHJv
 jqrqHpExo1Rx2CNC1wdSvdeMONkK0bHQheS1zsPCH1ryLaTj5S7lK2mxWAohNORyLfZmT23ZEB0
 8yFnzF6f34LNM8j1Jxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070102

On 4/7/26 11:30 AM, Taniya Das wrote:
> When the clock controller is probed with 'use_rpm' enabled, the
> runtime PM reference is currently released using pm_runtime_put(),
> which may return before the runtime suspend has completed. This
> can leave the power domain transition in progress while the probe
> path continues or returns.
> 
> Use pm_runtime_put_sync() instead to ensure the runtime PM “put”
> completes synchronously during probe, guaranteeing the device is
> fully runtime‑suspended before returning.

It's not immediately obvious why that's an issue, is there an
observable problem when the transition doesn't complete in time?

Konrad
