Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7013ACF0E
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809169; cv=none; b=qLubcfqJ/DTJMNhNxKlSlyEIPCvudjNGVi3PhKh0o6tylPzHu7OiroiP8F5n+jtP+uWUYvkrt8di/YAFbz67FXPI1o3PAVGO8ACxu1qsJkQyzS+sm1N5U6mqZ6rub8Goq0js8jFB4A8k88n31picvHqeNiT6ju5oD3VNUP2bfHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809169; c=relaxed/simple;
	bh=Qf5SN8oBB6sk6mfEymupZxaOogkh5lbZYQn14d4RDwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sf2CdWPKI7RYarWZJSoHUmqdiqYFlXcnogd3PKuL2fTnlIgpq/qy+qFEgF45ZdX4UtW2D0hhy4MjG7Su4TWRwT+34hgqlxDZweB6N0t3nFOlHAbxUK4Mpkxk3mQEtQ6i3wtOPgX44GRULN/r/rPWq8C0NXY4P/z2GUN1/EgpNVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I751G9oK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BA2YF/XT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I751G9oK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BA2YF/XT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb2PJ865033
	for <linux-clk@vger.kernel.org>; Fri, 6 Mar 2026 14:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NjEZs01B4NI8XD+SfdF4XpRw3Cnculfs18u066w5K7U=; b=I751G9oKPcEcCL3n
	9HPArKCTVpJsoovLhEd4jsXch/XMZdPrGMZDdnxd6lclkdsP99SyOZJkzGNm4o5w
	mIg2r28qZIOLofFFC2QNInxN75Kv0KNiFomNWlmguXsCpZ9/JjMiZbbKGzKG+CMP
	Dq0vAJ8zZfx0uuiNW0ORnH0FzsQ5jQGgk7fgpaakSXQ3xB+DfO7l13V7R+1NOTmW
	83Jkonm0zfNj5NJ1Jimne7/srGBNqZgZohv4DP6PaOpO/WyJGCCh17rajy3T0rf7
	RSo1ASHuN4myBByeid+V1XR/TfQ2Y3uu++JA5seQ0DVfyTCuyc3SvvB/JIUwS86S
	iPcpkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5sunf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 14:59:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae669a8ff1so165280775ad.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 06:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772809167; x=1773413967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NjEZs01B4NI8XD+SfdF4XpRw3Cnculfs18u066w5K7U=;
        b=BA2YF/XTkITDlobp7D4fhQANhp9aD80RVaI3xWSzY80p9U5mAurmyJYJvsxmQxESkZ
         zVK1aT1fLh+7KKU1xt2bVWY15KERAYqiVBuijbgZRyoXcR5zoDyIDFWyWZLv2PXJahp3
         2I8ghgmEon0vCoe3yABme7ml9jxkqdRbuDmBFZmcMcWiVNfRTR1jY7h2V7vVasfL6Icv
         QYCEqoM0n36O/TH3DQ8AaxN7t21GBDepDaLMpfoyiH/BCkIH/D7zH3qAbYDfuO+qjYtR
         BWRimGiIW8YGqnRch8iEBwy6ZQEBiieNtQVnRpjCzrkDiayK6+qIvsGkvB+oVqndTy77
         5pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809167; x=1773413967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjEZs01B4NI8XD+SfdF4XpRw3Cnculfs18u066w5K7U=;
        b=CE7+NeLIBF6YBEU8ZL6XuMssIXy9ZaiOnFTqXONP4b95rlJhYb2ifQ1AKv1yZLAhFF
         1gqXQEyG60PsbibUsz2ZZeirqBfTxkVsSOmaWFcMk3E4Y1ThtxrKxkBdWSyagAqh/TEs
         4TabR/EcmdN5drpWGfF+2za2L1N39fAM81aFMRMK4wDjN0aMQzHEVt2Br16Z9q0+DVaO
         MzegyzdvT4+XmLWm0X4lwbhqCPvuZr1eXYm3cbzaQuENoXwibSDJtKUzJiIEuJZiIi3M
         2bjVVjKtFjrgDim2MEFxuZl3KWcV3ci9IY43962QWNkGVRnjn62GkbFtjq1WjqyATDUr
         APFA==
X-Forwarded-Encrypted: i=1; AJvYcCUy3/CrsuWM90zlVVZF80jq8IijtGSoPL/IWRLIBe77PdS+fOE3cGRWD5ohs85HGPkEep4zrfQ2K14=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5egKU4XFAWewVElpfSLUJWvpPwPwgJMVYzuGx6JPiBQuxg2KD
	SRGtgHeLYm0+9qfWVTG2I5ttIrAvHyX+LDvE4hstZBBwbFC4dEKpMvKw1ry6aR2uahY7Rz+MnLs
	t5KPvkwDp3YudHpzDLqTu+C+QD8l2p7IDe9LFUPIOBH8DgRvp83GJyFXBUNEjNCw=
X-Gm-Gg: ATEYQzwwHqZXiZIAswBhLyPnCVL2b1Mq31tllAEQxOPMWvTzCaRCf+5ohBP507yd8Ug
	JMxk/pVkPPDKo+GjRmyXHSPYuoP3B3F5+5PSmvm6K58fHjVCQtzUEeIDuKpbcWzUtSqnYTSC7PC
	tYQiPvLLxGFdjwIbECQsRnCuOvsUvZQk5EEF9SLT+79HjB8lcDtqAWIT3c77yHFbX5brJ6RjF0D
	J4xV4AS7D94M7CLponekjPXHgHY5PHoG/5e2UAMY+aWSrjb0ylnSVI7QXYSL2v80MIAu5Qvdnav
	u+J4ICs3+wcJuqDbV7fU+WsTJ4dTwd7wP7tYnhxUuuPoHYGbDpFuEo5FWV3/zpu6nSd2kG5vfwr
	I6zbVCoXQ3TIwEIkDZ0dsxffOoHi5PwC+kctaLbURsY3qwF7oYna7Zz/CHubpPtEhzAcXRbsemD
	tNfKiDNElEFjI=
X-Received: by 2002:a17:903:f86:b0:2ae:4029:2196 with SMTP id d9443c01a7336-2ae82481fa6mr24068585ad.47.1772809166554;
        Fri, 06 Mar 2026 06:59:26 -0800 (PST)
X-Received: by 2002:a17:903:f86:b0:2ae:4029:2196 with SMTP id d9443c01a7336-2ae82481fa6mr24068195ad.47.1772809166059;
        Fri, 06 Mar 2026 06:59:26 -0800 (PST)
Received: from ?IPV6:2401:4900:88f5:81:e13b:ce78:7823:d9c3? ([2401:4900:88f5:81:e13b:ce78:7823:d9c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9b9c6sm27652635ad.29.2026.03.06.06.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:59:25 -0800 (PST)
Message-ID: <706678c5-254f-4856-869e-2e54761a1686@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:29:18 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-4-dbbd2d258bd6@oss.qualcomm.com>
 <47049136-db4a-4ffd-8cbe-9d1362b783ad@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <47049136-db4a-4ffd-8cbe-9d1362b783ad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6NL6kSqQjmn7mZPgc51hWLwSQ-7PkOyS
X-Proofpoint-GUID: 6NL6kSqQjmn7mZPgc51hWLwSQ-7PkOyS
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aaebcf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=ev7iudrIffBU41L7XcUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0MyBTYWx0ZWRfX6cz43WUugGH7
 fhpoYo9yvhWbkB8w6EEtngK1KmFLpBSoCVrQ0c7QgS+dUzIjPdMENQEg1qboTmatnDuy2s3VJph
 icslInQPpYaIQ1o0sc38QveO6pOnS4wjNEl60iH6N86M39gRYLHcvGL36HFyGFyVHQ2+a/++Q0Q
 whKZpYqF9m8s15okJjmYkap5kbY0LIz0i7xPTNqG2T7w7iuewSXxON8B6NT+ueo4oEtXbZDVpmc
 S0ev4yKeLFEQNn3bJ2Fci9zx7kF44Cnd8AR+9Re6wWeNyhu0rLQQisAOG+vexrDL50FkT9vj1+j
 rB0BW7GCrFS/sOoM6GqpvdDwhutXzlJqgd3J+7+9lwnKrZ0laUcgIUaAsXRc7AFGrR/n6lSYbER
 cw9+xU/4p4kqxunb+5kJQtJyU4KqAbb7XBcUomFojM0P7viRR+amM5GYJyDnrHItg/EfjaqqJX+
 JiTIHE+GYhTx6DkGPtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060143



On 3/5/2026 5:28 PM, Krzysztof Kozlowski wrote:
> On 04/03/2026 18:40, Jagadeesh Kona wrote:
>> Add support for camera QDSS debug clocks on X1E80100 platform which
>> are required to be voted for camera icp and cpas usecases.
>>
>> Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")
> 
> NAK, not a fix or describe user-observable bug.
> 

There isn't any user observable bug. Since these clocks are not added
in initial camcc change, there is a comment on v1 to add fixes tag, so I
added it. I will drop fixes tag in the next series.

Thanks,
Jagadeesh
