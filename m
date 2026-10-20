Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479349;
	b=WfwSciZTFynDH0MlGUWtnS9akgNLwwmHqFpynq8QrBFoZpem83vpyuZ8yCuVm9C2WTcB
	 V9axWu8qZ71dvNKJFDWkB+kRkVRHPVuNoXIq1UoKcECZBoHOlpbZ1le1n8hvNHv/FHe9N
	 vOcwYCQ8ZLOdKuyOVSknvijlgWli+OJrW95j5dKAzcIlrj2wJ8bl16rAhHlLSeGNd7LJt
	 Cfbe8BLaXWNtB9JmQ3fWtKx7xINwor5dL9dMblFOg/ycSoQt2cr7S6X+0LIguiJWeYTnU
	 y2R3abXCpVDP1gFuxyy++ziCoHAdp06o6wIeS/jChr6tV9Afm7ksIg3vX5D68MwuwUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
	b=smMGzpvqQ3FWOAiIzDVmDHD0v1GSZHVqWOvVdmYhbBYSupcb5twoJzKe1Q60PkxZPp2h
	 V+xqZHXABYNj1iPXNL41SfS4FbC/dLjF/kYvSGSUmAXS4b+VpG7/oGb8+W4jqggEUXi41
	 HQcogrU9ROUQ4mxBdRNlnhLwhNlCSJ+/OsW9UoWOYViu2xiyI4Ebm07kBkcp+0ScyGoCx
	 QDxxxQtWLYmAPeLLAaM3S3a2ldmL02etjPOQGYWJYN3SYPjGBjrfPf4rY5gPgeJHmuxks
	 hcp8K2LGU7Ygu+8PFXSRbEoREp1kk9oqm5etF5PuExERnJO9dvGQjoast4+nKQ2vIhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOXZ77JO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GN94tP+b;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1611606A31B
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1611606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOXZ77JO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GN94tP+b
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tKSc4178122
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=; b=eOXZ77JOS+5qBwf8
	yoW8ccNz6u9NkcR7Ur48gQYnAw6ikuD/RzudVJG5cw9DQmva1MIcE1ziZzmp3XWq
	uBW+/fy8zDWIE9W7y1oPJMv9RwcUCD6UEmd0bz4cbWAv5gBw6XvgemJNgy17z+y/
	y8hwmsT/nHyt3EydGpXFXzgrjbg58hV9ICuRqW3ifduW/gGaaljN/dOXidJiXNKv
	pyIg68slO3S+tYxc01vAbjRpRmkPZxY5D4oCvU2o3dtTxz6td1bAOH/LF/f/WuAH
	Tp5A/fj3W2Ae5/YLvJK7Gfu6nIx2zbRf59hKDkiW26bKWiXEY94Ce+mRVOen0GzY
	6eV1BA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n180v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:55:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53568f05f8bso9158001cf.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 23:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479347; x=1793084147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
        b=GN94tP+bZHBnT3KXoZRkN7W0lt/V33IcJxiDEUjRt4LpIpb+VqBm1bjcyomlAh8wpf
         PtRNEaOuCHWW1r0gdsfOtWAvU9H6oCNetbV3pgHmKOKg1nnB9SGAfb5jA4u4ZsN/TZko
         Rx/l62hmkGXZuF9FDQZOhHnRch5mOxEFHE6sKlAKapXSUf2YuqOneDukIELehFmudWWt
         cGjClQu3bF+CM5+PAiE69q8wcilEGv/Qv9fkuNqJEMz+u8Q8b455sVD/mb2OKLG8YFBF
         VFnwKRp7hTTI0wqzqFKLm++0I76XpvEKwPHYnpgLDNP2/lAN5rFvJvFwXhIsDby6nLoN
         ovZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479347; x=1793084147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
        b=a23bI2ss0cpf5w5oneVyDdEB0AyMTnbxoSXVhrfFXyK27RNxEP/Ft1cruMULFnTp5/
         MWlTDpnlZy9LGJZkbb6h+fKHK+54XxIJbYsamTF3qoSfZwYIajeUFU2Vvd4Sp4HD+RXn
         JdqEHxxnExJxEictet4PClDGE36IIxorNL1QRZ/0Z0zlo8OJsj67i0GNF+UUGEHwUj72
         ct1O7QSWidXWNS6WYOyYtqR/euuf8dF1xGvMaVmg3G49inNNk94CVXVHtegE9/XdxkNu
         TSjFDivxwkFDwqHI+vwNu5Hz6GxhYVu6xHYLJqhxYVQrAgrLp8Az31FMCxS040i52sSe
         pIeQ==
X-Forwarded-Encrypted: i=1; AKwUvByGlk+qPzZfSbwJ4y7dKGoICEEmLod2j7/22w6TnP8IKfmLicj4fVKmVtowBzqpgu+30sqqhUE4+MA=@vger.kernel.org
X-Gm-Message-State: AFq9FYINF2h1Ty6hhNpwZzsTlU7ECm+NIhEinudoS5YOtI8FbmcoNhQc
	p5LidrVzZcbdrWe/8SzjaeRRG20PswbSPFr+kS4Ta9JhkwteJklSP2c+7NHdlkVN2m6+jnZU4Hv
	gVg2PH9rfCgMryRfLxYkuMX2ylIGRyHH9cxn/6oMnpWwp0f7GSBxGqjJ9wKidGvM=
X-Gm-Gg: AYBFou0DiqJRAcZC4VIyp/iFOWM+/IekDxQdXHSovo1CRSxJZEe/Iy5/PgjzjQLG0EC
	8SSryoiCp0I3m9G4v6U9KVVAch9/IZSwooxDsv6Olq9gluHsodiSmjdFD06M0msuUVZ/81c5RtO
	zGJsp9med9CRKwDTk9P9tP8ySEl3H2LmAaKG1LDsKuMwXLP02RxZmmvMu6ldSlwkIr1xZsxnJxe
	Jakb+lysMO75hx/s/t3pK4bV0Ze8g8NCc6qKvMKJ/H+8wMa1+LvZqnJs8hUNe9NBtLE+1HmPlJ9
	gbU7VvD0uX0SNB51PPfLvvTRC5cf9+I0z6OoD5C1TlkGRapxcHXFLom5YfIzLb/iwhChepB0cg6
	VEPAeHLkrlK6CAaggr8dmVQ==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169672801cf.3.1792479347235;
        Mon, 19 Oct 2026 23:55:47 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169672411cf.3.1792479346744;
        Mon, 19 Oct 2026 23:55:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eae235sm462296566b.67.2026.10.19.23.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:55:45 -0700 (PDT)
Message-ID: <4df039eb-f89d-4a82-9f2a-dc90e31548d8@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:55:42 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: qcom: msm8996pro: use the MSM8996 Pro
 CPU clock compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-10-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-10-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Vr-h7nFFgIOp_bAuk8uUOHBeF7c1oa6D
X-Proofpoint-ORIG-GUID: Vr-h7nFFgIOp_bAuk8uUOHBeF7c1oa6D
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad71073 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2OWSJv1YRWKtX4VDGZoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX3ckF5SEhTrED
 GVNmCRye1UsfuJcKLCVIhQaJyS8LOwDfdoW+WtZcvsBj8gamN9YymToYIZxZTHgj48tIXMeQnkY
 SqrywTW/00FXh8DHK+n8ZkZ0njfIAzG4JbyZ9vkdsUwAjWvjlvV/KWm//k9AQwJ76DeuMUMo1SO
 da7jawr6pBCCV+z5Ja9c3+RVZ4MxtbTJpQdoQaLclpG7mL9TsCDBO4czLCFzJcHizyXAveNruLg
 KvJjUchEZ/GQd9y2yS2t7XZ/HCl+8pSgCL5XLNgOBWMIOuRr2FWEWvwFNJLkKnL6xn10ERLL6r+
 tU0rTZVnd+tlH+wy/ZttnfIL3MmhWWCJhhL8eRWRfEj7JnrihkZVjlL9ibTNwv7d8Ski3O/U8QF
 utJXfvQTz61Q5+h+D6CikI9Mxngt+SWnEjgaVbrpkSRFCDTZhvdX4cAbPm/jQOgjALYDE8M+TKw
 dOqiRQzzr3H+MDjrJVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfXzASDVAehxl1c
 s4vsZvePXtGQ2w2PPL4LK3we1yKZglrr+N/6JgKSOah55ZuuTuUXiaN21nggIn8rlWuybx3vGQM
 dE59edZb0zunZg6r+dWt3S/F4xwlIQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> The CPU clock controller of MSM8996 Pro needs its own setup, which the
> driver can only apply when the DT tells it the SoC is the Pro one.
> 
> Use the MSM8996 Pro compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
