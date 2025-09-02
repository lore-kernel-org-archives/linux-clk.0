Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF3F21254D
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814840; cv=none; b=U0qRhHpuRYcAsQruKJZZ22Mp3Sk/HSNH3sJdVp1AMfXvVqfTd4ecLi/XUGKai1PEVY6oFQA5xAakzAQfw1C0cZ2/+EB+1fu8i2wBSQJnqEZ6zoJQU3fOzFvnQeo/sqqANAJVikVP8Ro3e5ZGoIeLZTdwGg03n3OjKdg6eb1jjTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814840; c=relaxed/simple;
	bh=xt2M/EYFY5LLWVrahB1ctY3E6iHAceS7dO6dEG4T8u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOxliLzY9YAKGLvHnzY+2r8vNV9aSZLAxIpAm8OrQVmdRSwQoSXq6hG9YZIufvZGCCP0uE3P819mS2dX9+TEje+t14uN63/MngGHk9/qyQCNr/sgv2ngaSi1Dtu5NJMBFrUcklTp0QUy6ItQPiUw0UyCBbOyd9/AHIcHEKeRnDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+/dY4wK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+/dY4wK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AnclL016548
	for <linux-clk@vger.kernel.org>; Tue, 2 Sep 2025 12:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooAgjRpTHNP8kFwOiUKb9Yh/50coU4iyP/eWLaeMM00=; b=C+/dY4wK+FzU9XOb
	4osh6w2fl+WAynCdo5SXzupLhtwkiwRNhcT3l6gtaar/Z3+ZahQMR39JtpSBSuG3
	gxQuAdzeJGV+Ju501Y5mEcDtJPK/cHL3vmZ5W1RBIGUEwEbvgI88sOoXcayivoX7
	wh4Z30+NyS1+BBhYBZj/RSmJA2+02EKmu/rZ0SpnDPeaEAZoqts7cXRdEAuPVuaV
	79xq3DTGKMPsbhnCubvOers1owdLoI9touOy0qusIc1eyPTfhfIc9s1wmc0QnigM
	6G37eyGQyuE9MTejZwjgz/pE/p7uYyCAy6OS3K/x42roEsPi54Y3boGKZb17KOSx
	IROvKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyyprq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 12:07:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2d1c2a205so15957591cf.3
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 05:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814836; x=1757419636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooAgjRpTHNP8kFwOiUKb9Yh/50coU4iyP/eWLaeMM00=;
        b=e7nWz9lXcCfx80r+OS9WG1AyhDV7F4xlsg3k3rHipG5/MpgjstUuuOi0veg2EzxlvT
         NGgHKsar6krvMrv6ElD0NKuzj+z6nOnL2z5VkUfx9lj2FwOFz4oVDNwKcKZyJ16QPs3v
         Imrbs9SwIybOKjjLQ07n3k2Oo/rk1+blqkPwlvnKOMihK6xZMbFHkKITqfwPIT7H5icF
         tAvoZIDd1fbOuM2KZdiz+zuN0HcDYR7k6qB11iFnKM9vi9PKZxZlUYgNUeCpPSjFgVyV
         OUBqioAeQrIGwyqN7bElfqCks90zhWAYw2ujmIrArf8qQkWUfaGKmSmr/uQxvaplXPE+
         jSDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7A1yd9bE02j0kc6xQGly2WYv8BoOFkO/nOdqsqH8mT2HvriLZxm3t6U/A1lld3RY3KxBo18p6fak=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZTizSIH6UGGGn8+gXellkf4uSHTvKLzC78I3mW9OOB5OwaJhw
	3ScVCP1dbwSJkAICU3SrbstH2yFReho3Aioa5Ch1nYqDg9l+e/yw4H11R2EiXwYdLNogqerlOxE
	4iOzlQlxgSC8xcozmF5E/+dwuwJj56RHl5QnRJpND/PvlKuecjT9MLTkka962Oag=
X-Gm-Gg: ASbGncu80DCvAYAz0FQX34JOv1nqM/ZmriIrKJ6s59quMwz41sFMKrxl5eOWr7YYfET
	r7p0KaRIxJGsXIePoFkE9WGH1VTNEtLEWl/vCVhueyVa/g0GKuGczJkAjmymJD4Ra5WyV/tu1NR
	0nGJ8/QdULlA/eSly/ezYmSMzyLvEp2fjCnjg7MFgBwTAbrBRFjVi5FRQE+d4V0s/QwWC4zhDZL
	Y7j0lj+itbXfULLSuG1KSFMKnnJHhR/2F8qPONfQs3AmaHnbxhJ5n2NoUaqYMsSrP/Zew889F4U
	ZYz5pWQQTbaQNb4ynZ20+MztYZB30pUQPf+9LPSX+Th58V12hzAflcMXu1FAdp/5/lRN2/kZBMT
	k8ROHRHAXFL5m0vvL/XSz5g==
X-Received: by 2002:a05:622a:164d:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4b313e6f3aamr104880701cf.6.1756814836080;
        Tue, 02 Sep 2025 05:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi7UgyhFAah0VP0bJeUSU1wMpek7APbVlPpwHN7xSB0N6vFLNU7Pjd9+3uvDbCoDIOTsYYeg==
X-Received: by 2002:a05:622a:164d:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4b313e6f3aamr104880181cf.6.1756814835494;
        Tue, 02 Sep 2025 05:07:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc52ae40sm9249215a12.44.2025.09.02.05.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:07:15 -0700 (PDT)
Message-ID: <e9c70483-8538-4f9c-9dd0-b4136b34a667@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:07:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] clk: qcom: gcc-ipq5424: Correct the
 icc_first_node_id
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250828-qcom_ipq5424_nsscc-v4-1-cb913b205bcb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-1-cb913b205bcb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kRUmjIZjtu8d9r9xFuzoWEuQMpKN8Nns
X-Proofpoint-ORIG-GUID: kRUmjIZjtu8d9r9xFuzoWEuQMpKN8Nns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX15vwT2/p09YB
 rVY+YV+Xg9YIxDuouzFyXC/OYot65EeoSg4CBu5aOw9ULn9biPy/Ebxg3hfyV5XiVotbHTkAkgr
 GVmMHIZli4mrfW3CBqMU/JrAKpoB80hDMLemgdjkUKJWfnkI3fy/a+x8wwZC8otJNtzpsgIevmR
 J5I8ISdsAGs6ifzW1CvTR9cWkU3MZQS6HvHzKGNnkpS9zP8YevZQfJPdIiMgj5ESNwu3O01mR+B
 PinJhi83jUdIHZoAC+KhNPnTB3SgzFq5/3jjCXrhMrfnNeBzVoLRMXGFoLr5fkAKsby/MkQ58iw
 1Q5AbXTtxdTz3OA2SYktvQ0oJQFQGHBJon4j3+3qaFPazrSp4p6xjqzPDGO44DNRbo24/iomU+1
 3nTXRf8b
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6ddf5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5e-Oaz1CA7JNmZ_uPyAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 8/28/25 12:32 PM, Luo Jie wrote:
> Update to use the expected icc_first_node_id for registering the icc
> clocks, ensuring correct association of clocks with interconnect nodes.
> 
> Fixes: 170f3d2c065e ("clk: qcom: ipq5424: Use icc-clk for enabling NoC related clocks")
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
